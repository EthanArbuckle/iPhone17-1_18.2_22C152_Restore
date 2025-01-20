void sub_1CA9AF9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_1CA9B0AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

void sub_1CA9B1868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B23D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B2598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B3C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
}

id getAFPreferencesClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_1E65DC058;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CA9B49A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B4D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B509C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0()
{
  return [v0 (SEL)(v1 + 1688)];
}

id OUTLINED_FUNCTION_1(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, 3);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 - 144), *(void *)(v0 - 120));
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_allocObject();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void sub_1CA9B5458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B5720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B5960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B5E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B5EF0(_Unwind_Exception *a1)
{
}

void sub_1CA9B5F10(void *a1)
{
}

void sub_1CA9B60C8(_Unwind_Exception *a1)
{
}

void sub_1CA9B60E8(void *a1)
{
}

void sub_1CA9B6298(_Unwind_Exception *a1)
{
}

void sub_1CA9B62B8(void *a1)
{
}

void sub_1CA9B65CC(_Unwind_Exception *a1)
{
}

void sub_1CA9B69A4(void *a1)
{
}

void sub_1CA9B69B0(_Unwind_Exception *a1)
{
}

void sub_1CA9B7400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))
{
  return sub_1CA9CCA98(a1, a2, 1, a4, a5);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_1CAB4E310();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id OUTLINED_FUNCTION_0_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v21 = *(void *)(v18 - 96);
  uint64_t v20 = *(void *)(v18 - 88);
  return sub_1CA9D12D4(v20, v15, v21, v17, v14, v16, v13, v12, a9, a10, a11, a12);
}

void sub_1CA9B8044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9B8B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9BA8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CA9BAB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9BAFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CA9BC6B0(void *a1)
{
}

void sub_1CA9BC6D8(_Unwind_Exception *a1)
{
}

void sub_1CA9BC8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9BD1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1CA9BE41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1CA9BF720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9BF7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9BFEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void sub_1CA9C02D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C0CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C2370(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 160));
  _Unwind_Resume(a1);
}

id procNameForPid(int a1, int *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  *__error() = 0;
  unsigned int v4 = proc_name(a1, buffer, 0x400u);
  if (a2) {
    *a2 = *__error();
  }
  if ((v4 & 0x80000000) != 0) {
    v5 = 0;
  }
  else {
    v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v4 encoding:4];
  }
  return v5;
}

void sub_1CA9C2D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C3EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

id blockNotifyQueue()
{
  if (blockNotifyQueue__pasOnceToken2 != -1) {
    dispatch_once(&blockNotifyQueue__pasOnceToken2, &__block_literal_global_72_15057);
  }
  uint64_t v0 = (void *)blockNotifyQueue__pasExprOnceResult;
  return v0;
}

void sub_1CA9C4EBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C5248(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C582C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C5CCC(void *a1)
{
}

void sub_1CA9C5CDC(_Unwind_Exception *a1)
{
}

void sub_1CA9C5E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C61B4(void *a1)
{
}

void sub_1CA9C61C4(_Unwind_Exception *a1)
{
}

void sub_1CA9C65BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C6708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C6D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C71E8(void *a1)
{
}

void sub_1CA9C71F8(_Unwind_Exception *a1)
{
}

void sub_1CA9C748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C7704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C7914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C7C8C(void *exc_buf)
{
}

void sub_1CA9C7CBC(_Unwind_Exception *a1)
{
}

void sub_1CA9C7DC4(void *a1)
{
}

void sub_1CA9C7DD4(_Unwind_Exception *a1)
{
}

void sub_1CA9C7FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA9C99B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_1CA9CB058()
{
  type metadata accessor for RealTimeTextConsumer();
  id result = sub_1CA9CB07C();
  qword_1EBCBAB00 = (uint64_t)result;
  return result;
}

id sub_1CA9CB07C()
{
  id v0 = objc_msgSend(self, sel_defaultStore);
  id v1 = objc_msgSend(self, sel_defaultStore);
  id v2 = objc_msgSend(self, sel_defaultStore);
  id v3 = objc_allocWithZone((Class)type metadata accessor for RealTimeTextConsumer());
  return sub_1CA9CB124(v0, v1, v2);
}

id sub_1CA9CB124(void *a1, void *a2, void *a3)
{
  id v6 = objc_allocWithZone((Class)PPSpotlightWritebackDissector);
  id v7 = a3;
  id v8 = a1;
  id v9 = a2;
  id v10 = objc_msgSend(v6, sel_init);
  id v11 = objc_msgSend(self, sel_sharedInstance);
  id v12 = objc_msgSend(self, sel_sharedInstance);
  id v13 = sub_1CA9D97B0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);
  self;
  id v14 = v13;
  id v15 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v15, sel_registerMessagesConsumer_levelOfService_);

  id v16 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v16, sel_registerSafariConsumer_levelOfService_);

  id v17 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v17, sel_registerRemindersConsumer_levelOfService_);

  id v18 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v18, sel_registerInteractionConsumer_levelOfService_);

  return v14;
}

uint64_t sub_1CA9CB2BC(void *a1)
{
  return sub_1CA9CB38C(a1, (uint64_t)&unk_1F25387A0, 2, (uint64_t)sub_1CA9CB82C, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D2314);
}

uint64_t sub_1CA9CB354(void *a1)
{
  return sub_1CA9CB38C(a1, (uint64_t)&unk_1F2538778, 0, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D2D18);
}

uint64_t sub_1CA9CB38C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))
{
  id v10 = objc_msgSend(a1, sel_content);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  id v12 = objc_msgSend(a1, sel_contentProtection);
  uint64_t v13 = a5(v10, 1, a3, a4, v11, v12, 0, v5);

  swift_release();
  return v13;
}

uint64_t sub_1CA9CB4C0(void *a1)
{
  return sub_1CA9CB4F4(a1, (uint64_t)&unk_1F2538750, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, void, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D371C);
}

uint64_t sub_1CA9CB4F4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(id, void, uint64_t, uint64_t, uint64_t, id, void, uint64_t))
{
  id v8 = objc_msgSend(a1, sel_content);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  id v10 = objc_msgSend(a1, sel_contentProtection);
  uint64_t v11 = a4(v8, 0, 2, a3, v9, v10, 0, v4);

  swift_release();
  return v11;
}

uint64_t sub_1CA9CB61C(void *a1)
{
  return sub_1CA9CB4F4(a1, (uint64_t)&unk_1F2538728, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, void, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D4120);
}

unint64_t sub_1CA9CB6B0()
{
  return 0xD000000000000040;
}

id sub_1CA9CB784()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RealTimeTextConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of StringDonation.source()
{
  return 0;
}

uint64_t variable initialization expression of StringDonation.shouldConsume()
{
  return 1;
}

uint64_t type metadata accessor for RealTimeTextConsumer()
{
  return self;
}

uint64_t sub_1CA9CB7F4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1CA9CB82C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_shouldContinue);
}

uint64_t sub_1CA9CB860()
{
  uint64_t v0 = sub_1CAB4E270();
  __swift_allocate_value_buffer(v0, qword_1EBCBAAE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBCBAAE8);
  return sub_1CAB4E260();
}

uint64_t sub_1CA9CB8DC()
{
  return sub_1CAB4E650();
}

uint64_t sub_1CA9CB904()
{
  return sub_1CAB4E660();
}

uint64_t sub_1CA9CB948()
{
  return 1;
}

uint64_t sub_1CA9CB958()
{
  return sub_1CAB4E660();
}

void sub_1CA9CB9A8(void *a1, void *a2, void *a3)
{
  v52[4] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(v3, sel_topics);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6D0);
  unint64_t v7 = sub_1CAB4E380();

  if (v7 >> 62)
  {
    OUTLINED_FUNCTION_0_0();
    uint64_t v8 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 && a1)
  {
    id v9 = objc_msgSend(v3, sel_topics);
    if (!v9)
    {
      sub_1CAB4E380();
      id v9 = (id)sub_1CAB4E360();
      swift_bridgeObjectRelease();
    }
    id v10 = objc_msgSend(v3, sel_source);
    id v11 = objc_msgSend(v3, sel_topicAlgorithm);
    unint64_t v12 = (unint64_t)objc_msgSend(v3, sel_cloudSync);
    objc_msgSend(v3, sel_sentimentScore);
    double v14 = v13;
    id v15 = objc_msgSend(v3, sel_topicsExactMatchesInSourceText);
    if (v15)
    {
      v52[0] = 0;
      sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
      sub_1CAB4E370();

      id v15 = 0;
      unint64_t v12 = v12;
    }
    v52[0] = 0;
    unsigned int v16 = objc_msgSend(a1, sel_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error_, v9, v10, v11, v12, v15, v52, v14);

    id v17 = v52[0];
    if (!v16) {
      goto LABEL_34;
    }
    id v18 = v52[0];
  }
  id v19 = objc_msgSend(v3, sel_entities);
  unint64_t v20 = sub_1CAB4E380();

  if (v20 >> 62)
  {
    OUTLINED_FUNCTION_0_0();
    uint64_t v21 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v21 && a2)
  {
    id v22 = objc_msgSend(v3, sel_entities);
    if (!v22)
    {
      sub_1CAB4E380();
      id v22 = (id)sub_1CAB4E360();
      swift_bridgeObjectRelease();
    }
    id v23 = objc_msgSend(v3, sel_source);
    id v24 = objc_msgSend(v3, sel_entityAlgorithm);
    id v25 = objc_msgSend(v3, sel_cloudSync);
    objc_msgSend(v3, sel_sentimentScore);
    v52[0] = 0;
    LODWORD(v24) = objc_msgSend(a2, sel_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error_, v22, v23, v24, v25, v52);

    id v17 = v52[0];
    if (v24)
    {
      id v26 = v52[0];
      goto LABEL_19;
    }
LABEL_34:
    id v46 = v17;
    sub_1CAB4E190();

LABEL_41:
    swift_willThrow();
    return;
  }
LABEL_19:
  uint64_t v27 = &selRef_isEnabled;
  id v28 = objc_msgSend(v3, sel_locations);
  id v29 = objc_msgSend(v28, sel_count);

  if (v29)
  {
    id v30 = objc_msgSend(v3, sel_locations);
    id v31 = objc_msgSend(v30, sel_allKeys);

    uint64_t v32 = sub_1CAB4E380();
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      uint64_t v34 = v32 + 32;
      while (1)
      {
        sub_1CA9CC0AC(v34, (uint64_t)v52);
        sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_38;
        }
        uint64_t v49 = v33;
        v35 = *(void **)&v51[0];
        id v36 = [v3 v27[163]];
        id v37 = v35;
        id v38 = objc_msgSend(v36, sel_objectForKeyedSubscript_, v37);

        if (v38)
        {
          sub_1CAB4E4B0();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v51, 0, sizeof(v51));
        }
        sub_1CA9CC154((uint64_t)v51, (uint64_t)v52);
        if (!v52[3]) {
          break;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7F0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          swift_bridgeObjectRelease();

          goto LABEL_40;
        }
        unsigned int v39 = objc_msgSend(v37, sel_unsignedShortValue);
        if (a3)
        {
          v40 = v27;
          unsigned int v48 = v39;
          sub_1CA9CC21C(0, &qword_1EBCBA810);
          v41 = (void *)sub_1CAB4E360();
          swift_bridgeObjectRelease();
          id v42 = objc_msgSend(v3, sel_source);
          id v43 = objc_msgSend(v3, sel_cloudSync);
          v52[0] = 0;
          unsigned int v44 = objc_msgSend(a3, sel_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error_, v41, v42, 0, v48, v43, v52);

          if (!v44)
          {
            id v47 = v52[0];
            swift_bridgeObjectRelease();
            sub_1CAB4E190();

            swift_willThrow();
            return;
          }
          id v45 = v52[0];
          uint64_t v27 = v40;
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        v34 += 32;
        uint64_t v33 = v49 - 1;
        if (v49 == 1) {
          goto LABEL_35;
        }
      }

      sub_1CA9CC1BC((uint64_t)v52);
LABEL_38:
      swift_bridgeObjectRelease();
LABEL_40:
      sub_1CA9CC108();
      swift_allocError();
      goto LABEL_41;
    }
LABEL_35:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1CA9CC0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1CA9CC108()
{
  unint64_t result = qword_1EA60F670;
  if (!qword_1EA60F670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA60F670);
  }
  return result;
}

uint64_t sub_1CA9CC154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CA9CC1BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CA9CC21C(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for HarvestingError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for HarvestingError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1CA9CC3B0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1CA9CC3D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for HarvestingError()
{
  return &type metadata for HarvestingError;
}

unint64_t sub_1CA9CC3F4()
{
  unint64_t result = qword_1EA60F678;
  if (!qword_1EA60F678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA60F678);
  }
  return result;
}

id sub_1CA9CC440()
{
  type metadata accessor for BackgroundTextConsumer();
  id result = sub_1CA9CC464();
  qword_1EBCBAB08 = (uint64_t)result;
  return result;
}

id sub_1CA9CC464()
{
  id v0 = objc_msgSend(self, sel_defaultStore);
  id v1 = objc_msgSend(self, sel_defaultStore);
  id v2 = objc_msgSend(self, sel_defaultStore);
  id v3 = objc_allocWithZone((Class)type metadata accessor for BackgroundTextConsumer());
  return sub_1CA9CC50C(v0, v1, v2);
}

id sub_1CA9CC50C(void *a1, void *a2, void *a3)
{
  id v6 = objc_allocWithZone((Class)PPSpotlightWritebackDissector);
  id v7 = a3;
  id v8 = a1;
  id v9 = a2;
  id v10 = objc_msgSend(v6, sel_init);
  id v11 = objc_msgSend(self, sel_sharedInstance);
  id v12 = objc_msgSend(self, sel_sharedInstance);
  id v13 = sub_1CA9D97B0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);
  self;
  id v14 = v13;
  id v15 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(v15, sel_registerNewsConsumer_levelOfService_);

  id v16 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(v16, sel_registerNotesConsumer_levelOfService_);

  id v17 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(v17, sel_registerSafariConsumer_levelOfService_);

  id v18 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(v18, sel_registerThirdPartyAppConsumer_levelOfService_);

  id v19 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(v19, sel_registerMailConsumer_levelOfService_);

  return v14;
}

uint64_t sub_1CA9CC6C4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_content);
  *(void *)(swift_allocObject() + 16) = a1;
  id v3 = a1;
  id v4 = objc_msgSend(v3, sel_contentProtection);
  id v5 = objc_msgSend(v3, sel_htmlParser);
  sub_1CA9D4B24();
  uint64_t v7 = v6;

  swift_release();
  return v7;
}

uint64_t sub_1CA9CC814(void *a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_0_1(a1, (uint64_t)&unk_1F25388D0, a3, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D5528);
}

uint64_t sub_1CA9CC8A8(void *a1)
{
  return sub_1CA9CCA98(a1, (uint64_t)&unk_1F25388A8, 0, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D5F2C);
}

uint64_t sub_1CA9CC940(void *a1)
{
  id v2 = objc_msgSend(a1, sel_content);
  *(void *)(swift_allocObject() + 16) = a1;
  id v3 = objc_msgSend(a1, sel_contentProtection);
  sub_1CA9D2D18();
  uint64_t v5 = v4;

  swift_release();
  return v5;
}

uint64_t sub_1CA9CCA64(void *a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_0_1(a1, (uint64_t)&unk_1F2538858, a3, (uint64_t)sub_1CA9CB85C, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))sub_1CA9D6930);
}

uint64_t sub_1CA9CCA98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, void, uint64_t))
{
  id v10 = objc_msgSend(a1, sel_content);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  id v12 = objc_msgSend(a1, sel_contentProtection);
  uint64_t v13 = a5(v10, a3, 2, a4, v11, v12, 0, v5);

  swift_release();
  return v13;
}

unint64_t sub_1CA9CCBCC()
{
  return 0xD000000000000042;
}

id sub_1CA9CCC98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundTextConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BackgroundTextConsumer()
{
  return self;
}

uint64_t sub_1CA9CCCF4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id OUTLINED_FUNCTION_2(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, 1);
}

void sub_1CA9CCD54()
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(self, sel_defaultStore);
  id v1 = objc_msgSend(v0, sel_meCard);

  if (v1)
  {
    v10[0] = 0;
    id v2 = objc_msgSend(v1, sel_contactsContactIdentifierWithError_, v10);

    id v3 = v10[0];
    if (v2)
    {
      uint64_t v4 = sub_1CAB4E2B0();
      uint64_t v6 = v5;
      id v7 = v3;

      qword_1EBCBA788 = v4;
      qword_1EBCBA790 = v6;
      return;
    }
    id v8 = v10[0];
    id v9 = (void *)sub_1CAB4E190();

    swift_willThrow();
  }
  qword_1EBCBA788 = 0;
  qword_1EBCBA790 = 0;
}

uint64_t sub_1CA9CCE7C()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_donationBlockedApps);

  uint64_t v2 = sub_1CAB4E380();
  uint64_t result = sub_1CA9CCF00(v2);
  qword_1EBCBA7A0 = result;
  return result;
}

uint64_t sub_1CA9CCF00(uint64_t a1)
{
  uint64_t v2 = sub_1CAB4E400();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1CA9CE6F4(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1CA9CCFB4(void *a1)
{
  if (a1)
  {
    id v4 = a1;
    id v5 = objc_msgSend(v1, sel_subject);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_17();
    sub_1CAB4E310();
    id v6 = objc_msgSend(v4, sel_textContent, v2, v3);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_7();
    swift_bridgeObjectRelease();
    uint64_t v7 = OUTLINED_FUNCTION_3();
    MEMORY[0x1CB79C070](v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CA9CF360(v1, (SEL *)&selRef_textContent);
    if (v8)
    {
      id v9 = objc_msgSend(v1, sel_subject);
      sub_1CAB4E2B0();

      OUTLINED_FUNCTION_0_2();
      sub_1CAB4E310();
      swift_bridgeObjectRelease();
      uint64_t v10 = OUTLINED_FUNCTION_3();
      MEMORY[0x1CB79C070](v10);
      OUTLINED_FUNCTION_4();
      return OUTLINED_FUNCTION_9();
    }
    id v4 = objc_msgSend(v1, sel_subject);
    sub_1CAB4E2B0();
  }

  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CD128@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  sub_1CAB4E240();
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  id v12 = (char *)&v30 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  id v15 = (char *)&v30 - v14;
  MEMORY[0x1F4188790](v13);
  if (a1)
  {
    id v16 = a1;
    id v17 = objc_msgSend(v16, sel_textContent);
    sub_1CAB4E2B0();

    uint64_t v18 = sub_1CAB4E330();
    uint64_t result = swift_bridgeObjectRelease();
    if (v18 < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1CAB4E210();
      id v20 = objc_msgSend(v16, sel_quotedRegions);
      id v30 = v15;
      sub_1CAB4E230();

      sub_1CA9CD3EC((uint64_t)v15, (uint64_t)v12);
      uint64_t v21 = *(void (**)(void))(v5 + 8);
      OUTLINED_FUNCTION_5();
      v21();
      id v22 = *(void (**)(uint64_t))(v5 + 32);
      uint64_t v23 = OUTLINED_FUNCTION_8();
      v22(v23);
      id v24 = objc_msgSend(v16, sel_tabularRegions);
      sub_1CAB4E230();

      sub_1CA9CD3EC((uint64_t)v9, (uint64_t)v12);
      OUTLINED_FUNCTION_5();
      v21();
      OUTLINED_FUNCTION_5();
      v21();
      uint64_t v25 = OUTLINED_FUNCTION_8();
      v22(v25);
      id v26 = objc_msgSend(v16, sel_signatureRegions);
      sub_1CAB4E230();

      sub_1CA9CD3EC((uint64_t)v9, (uint64_t)v12);
      OUTLINED_FUNCTION_5();
      v21();
      OUTLINED_FUNCTION_5();
      v21();
      OUTLINED_FUNCTION_5();
      v21();
      uint64_t v27 = v31;
      uint64_t v28 = OUTLINED_FUNCTION_8();
      v22(v28);
      return __swift_storeEnumTagSinglePayload(v27, 0, 1, v2);
    }
  }
  else
  {
    uint64_t v29 = v31;
    return __swift_storeEnumTagSinglePayload(v29, 1, 1, v2);
  }
  return result;
}

uint64_t sub_1CA9CD3EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  v19[1] = a2;
  uint64_t v5 = sub_1CAB4E240();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  id v12 = (char *)v19 - v11;
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  id v15 = (char *)v19 - v14;
  MEMORY[0x1F4188790](v13);
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v16((char *)v19 - v17, v3, v5);
  v16(v12, v3, v5);
  v16(v9, a1, v5);
  sub_1CA9CF754();
  sub_1CAB4E4D0();
  sub_1CAB4E4C0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v15, v5);
}

uint64_t sub_1CA9CD5B4()
{
  sub_1CAB4E200();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  id v6 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v7 = objc_msgSend(v6, sel_isMultilingual);

  if (v7
    && (id v8 = objc_msgSend(v1, sel_subject),
        sub_1CAB4E2B0(),
        v8,
        uint64_t v9 = sub_1CAB4E2F0(),
        swift_bridgeObjectRelease(),
        v9 >= 51))
  {
    uint64_t v10 = self;
    id v11 = objc_msgSend(v1, sel_subject);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_17();
    uint64_t v16 = v2;
    sub_1CAB4E340();
    id v12 = (void *)sub_1CAB4E2A0();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v10, sel_detectLanguageFromTextHeuristically_, v12, v16, v9);

    if (v13)
    {
      uint64_t v14 = sub_1CAB4E2B0();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_1CAB4E1F0();
    uint64_t v14 = sub_1CAB4E1E0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v0);
  }
  return v14;
}

id sub_1CA9CD7A0()
{
  uint64_t v1 = sub_1CA9E01BC(v0);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = v1;
    if (qword_1EBCBA6C0 != -1) {
      swift_once();
    }
    sub_1CA9DBF2C(v4, (uint64_t)v3, qword_1EBCBA7A0);
    if (v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      id v6 = objc_msgSend(self, sel_defaultPolicy);
      unsigned int v7 = (void *)sub_1CAB4E2A0();
      swift_bridgeObjectRelease();
      id v3 = objc_msgSend(v6, sel_bundleIdentifierIsAllowedForSearchableItems_, v7);
    }
  }
  return v3;
}

char *sub_1CA9CD890()
{
  id v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA830);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAB7B3A0;
  *(void *)(inited + 32) = objc_msgSend(v3, sel_fromHandle);
  unint64_t v18 = inited;
  sub_1CAB4E390();
  unint64_t v5 = sub_1CA9CF304(v3, (SEL *)&selRef_toHandles);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  OUTLINED_FUNCTION_6(v5);
  unint64_t v7 = sub_1CA9CF304(v3, (SEL *)&selRef_ccHandles);
  OUTLINED_FUNCTION_6(v7);
  unint64_t v8 = sub_1CA9CF304(v3, (SEL *)&selRef_bccHandles);
  OUTLINED_FUNCTION_6(v8);
  unint64_t v9 = inited;
  if (!(inited >> 62))
  {
    uint64_t v10 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x1E4FBC860];
  }
  OUTLINED_FUNCTION_15();
  uint64_t v10 = sub_1CAB4E5B0();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t result = OUTLINED_FUNCTION_11();
  if ((v10 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_18();
    do
    {
      if (v1) {
        id v12 = (id)MEMORY[0x1CB79C2C0](v6, v9);
      }
      else {
        id v12 = *(id *)(v9 + 8 * v6 + 32);
      }
      id v13 = v12;
      id v14 = objc_msgSend(v12, (SEL)(v2 + 2456), v18);
      sub_1CAB4E2B0();

      OUTLINED_FUNCTION_16();
      if (v16)
      {
        OUTLINED_FUNCTION_13(v15);
        unint64_t inited = v18;
      }
      OUTLINED_FUNCTION_14();
    }
    while (!v17);
    swift_bridgeObjectRelease();
    return (char *)inited;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CA9CDA44()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1CAB4E1D0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  if (qword_1EBCBA6B8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1EBCBA790;
  if (qword_1EBCBA790)
  {
    uint64_t v7 = qword_1EBCBA788;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1CA9CF29C(objc_msgSend(v0, sel_fromHandle), (SEL *)&selRef_contactIdentifier);
    if (v9)
    {
      if (v7 == v8 && v6 == v9) {
        char v11 = 1;
      }
      else {
        char v11 = sub_1CAB4E5D0();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  id v12 = sub_1CA9CD890();
  uint64_t v13 = sub_1CA9E01BC(v0);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v15 = v14;
  uint64_t v34 = v13;
  if ((objc_msgSend(v0, sel_respondsToSelector_, sel_domainId) & 1) != 0
    && (id v16 = objc_msgSend(v0, sel_domainId)) != 0)
  {
    char v17 = v16;
    uint64_t v18 = sub_1CAB4E2B0();
    uint64_t v32 = v19;
    uint64_t v33 = v18;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  if (*((void *)v12 + 2) < 0x10000uLL)
  {
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, 0, 0, (unsigned __int16)*((void *)v12 + 2), v11 & 1);
    id v21 = objc_msgSend(v0, sel_uniqueId);
    uint64_t v22 = sub_1CAB4E2B0();
    uint64_t v24 = v23;

    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1CA9CD5B4();
    uint64_t v27 = v26;
    id v28 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    id v29 = sub_1CA9D12D4(v34, v15, v33, v32, v22, v24, v1, (uint64_t)v4, (uint64_t)v12, v25, v27, v20);
    swift_bridgeObjectRelease();
    return (uint64_t)v29;
  }
  uint64_t result = sub_1CAB4E5A0();
  __break(1u);
  return result;
}

uint64_t sub_1CA9CDDA0(void *a1)
{
  return sub_1CA9CCFB4(a1);
}

uint64_t sub_1CA9CDDC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CA9CD128(a1, a2);
}

uint64_t sub_1CA9CDDDC()
{
  uint64_t v1 = sub_1CA9CF360(v0, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_2_0(v1, v2);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  id v3 = objc_msgSend(v0, sel_summary, 0, 0xE000000000000000);
  sub_1CAB4E2B0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  id v4 = objc_msgSend(v0, sel_content);
  sub_1CAB4E2B0();

  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRelease();
  uint64_t v5 = OUTLINED_FUNCTION_3();
  MEMORY[0x1CB79C070](v5);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CDEBC()
{
  return sub_1CA9CDDDC();
}

uint64_t sub_1CA9CDEE0()
{
  uint64_t v1 = sub_1CA9CF360(v0, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_2_0(v1, v2);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  id v3 = objc_msgSend(v0, sel_content, 0, 0xE000000000000000);
  sub_1CAB4E2B0();

  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRelease();
  uint64_t v4 = OUTLINED_FUNCTION_3();
  MEMORY[0x1CB79C070](v4);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CDF8C()
{
  return sub_1CA9CDEE0();
}

uint64_t sub_1CA9CDFB0()
{
  uint64_t v1 = sub_1CA9CF360(v0, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_2_0(v1, v2);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = sub_1CA9CF360(v0, (SEL *)&selRef_notes);
  OUTLINED_FUNCTION_2_0(v3, v4);
  sub_1CAB4E310();
  swift_bridgeObjectRelease();
  uint64_t v5 = OUTLINED_FUNCTION_3();
  MEMORY[0x1CB79C070](v5);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CE050()
{
  return sub_1CA9CDFB0();
}

uint64_t sub_1CA9CE074()
{
  uint64_t v1 = sub_1CA9CF360(v0, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_2_0(v1, v2);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = sub_1CA9CF360(v0, (SEL *)&selRef_desc);
  OUTLINED_FUNCTION_2_0(v3, v4);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = sub_1CA9CF360(v0, (SEL *)&selRef_comment);
  OUTLINED_FUNCTION_2_0(v5, v6);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
  uint64_t v7 = sub_1CA9CF360(v0, (SEL *)&selRef_content);
  OUTLINED_FUNCTION_2_0(v7, v8);
  sub_1CAB4E310();
  swift_bridgeObjectRelease();
  uint64_t v9 = OUTLINED_FUNCTION_3();
  MEMORY[0x1CB79C070](v9);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CE164()
{
  return sub_1CA9CE074();
}

uint64_t sub_1CA9CE188()
{
  id v1 = objc_msgSend(v0, sel_interaction);
  id v2 = objc_msgSend(v1, sel_intent);

  uint64_t v3 = sub_1CA9CF29C(v2, (SEL *)&selRef_intentDescription);
  return OUTLINED_FUNCTION_2_0(v3, v4);
}

uint64_t sub_1CA9CE1F8()
{
  return sub_1CA9CE188();
}

uint64_t sub_1CA9CE21C()
{
  return sub_1CA9CE3DC((SEL *)&selRef_title);
}

uint64_t sub_1CA9CE248()
{
  uint64_t v1 = sub_1CA9CF29C(objc_msgSend(v0, sel_userActivity), (SEL *)&selRef_title);
  return OUTLINED_FUNCTION_2_0(v1, v2);
}

uint64_t sub_1CA9CE28C()
{
  return sub_1CA9CE248();
}

uint64_t sub_1CA9CE2B0()
{
  if (objc_msgSend(v0, sel_contentIsReaderText))
  {
    uint64_t v1 = sub_1CA9CF360(v0, (SEL *)&selRef_title);
    OUTLINED_FUNCTION_2_0(v1, v2);
    OUTLINED_FUNCTION_10();
    swift_bridgeObjectRelease();
    sub_1CAB4E310();
    id v3 = objc_msgSend(v0, sel_content, 0, 0xE000000000000000);
    sub_1CAB4E2B0();

    OUTLINED_FUNCTION_7();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CA9CF360(v0, (SEL *)&selRef_title);
  }
  uint64_t v4 = sub_1CA9DC608(819200);
  MEMORY[0x1CB79C070](v4);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CE3B8()
{
  return sub_1CA9CE2B0();
}

uint64_t sub_1CA9CE3DC(SEL *a1)
{
  id v2 = [v1 *a1];
  sub_1CAB4E2B0();

  return OUTLINED_FUNCTION_9();
}

char *sub_1CA9CE42C()
{
  id v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA830);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAB7B3A0;
  *(void *)(inited + 32) = objc_msgSend(v3, sel_fromHandle);
  unint64_t v16 = inited;
  sub_1CAB4E390();
  unint64_t v5 = sub_1CA9CF304(v3, (SEL *)&selRef_toHandles);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  OUTLINED_FUNCTION_6(v5);
  unint64_t v7 = inited;
  if (!(inited >> 62))
  {
    uint64_t v8 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x1E4FBC860];
  }
  OUTLINED_FUNCTION_15();
  uint64_t v8 = sub_1CAB4E5B0();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t result = OUTLINED_FUNCTION_11();
  if ((v8 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_18();
    do
    {
      if (v1) {
        id v10 = (id)MEMORY[0x1CB79C2C0](v6, v7);
      }
      else {
        id v10 = *(id *)(v7 + 8 * v6 + 32);
      }
      char v11 = v10;
      id v12 = objc_msgSend(v10, (SEL)(v2 + 2456), v16);
      sub_1CAB4E2B0();

      OUTLINED_FUNCTION_16();
      if (v14)
      {
        OUTLINED_FUNCTION_13(v13);
        unint64_t inited = v16;
      }
      OUTLINED_FUNCTION_14();
    }
    while (!v15);
    swift_bridgeObjectRelease();
    return (char *)inited;
  }
  __break(1u);
  return result;
}

id sub_1CA9CE5B0()
{
  if (qword_1EBCBA6B8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1EBCBA790;
  if (qword_1EBCBA790)
  {
    uint64_t v2 = qword_1EBCBA788;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1CA9CF29C(objc_msgSend(v0, sel_fromHandle), (SEL *)&selRef_contactIdentifier);
    if (v4)
    {
      if (v2 == v3 && v1 == v4) {
        char v6 = 1;
      }
      else {
        char v6 = sub_1CAB4E5D0();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v6 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  unint64_t v7 = sub_1CA9CE42C();
  id v8 = sub_1CA9CF428(v0, (uint64_t)v7, v6 & 1);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1CA9CE6C8()
{
  return sub_1CA9CE3DC((SEL *)&selRef_content);
}

uint64_t sub_1CA9CE6F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1CAB4E640();
  swift_bridgeObjectRetain();
  sub_1CAB4E2E0();
  uint64_t v8 = sub_1CAB4E660();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1CAB4E5D0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1CAB4E5D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1CA9CEB80(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1CA9CE8A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F810);
  uint64_t v3 = sub_1CAB4E4F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_1CAB4E640();
      sub_1CAB4E2E0();
      uint64_t result = sub_1CAB4E660();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      id v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *id v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_1CA9CED1C(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *id v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1CA9CEB80(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1CA9CE8A4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1CA9CED38();
      goto LABEL_22;
    }
    sub_1CA9CEEEC();
  }
  uint64_t v11 = *v4;
  sub_1CAB4E640();
  sub_1CAB4E2E0();
  uint64_t result = sub_1CAB4E660();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1CAB4E5D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1CAB4E5E0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1CAB4E5D0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_1CA9CED1C(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_1CA9CED38()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F810);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1CAB4E4E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1CA9CEEEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F810);
  uint64_t v3 = sub_1CAB4E4F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1CAB4E640();
    swift_bridgeObjectRetain();
    sub_1CAB4E2E0();
    uint64_t result = sub_1CAB4E660();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    id v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *id v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_1CA9CF198(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1CA9CF1B8(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1CA9CF1B8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1CA9DF1D8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1CA9DF390((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1CA9CF29C(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    sub_1CAB4E2B0();
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9CF304(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  sub_1CA9CF3E8();
  uint64_t v4 = sub_1CAB4E380();

  return v4;
}

uint64_t sub_1CA9CF360(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_1CAB4E2B0();

  return v4;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_1CA9CF3E8()
{
  unint64_t result = qword_1EBCBA800;
  if (!qword_1EBCBA800)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBCBA800);
  }
  return result;
}

id sub_1CA9CF428(void *a1, uint64_t a2, char a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1CAB4E1D0();
  MEMORY[0x1F4188790](v9);
  size_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(a1, sel_content);
  sub_1CAB4E2B0();

  unint64_t v13 = sub_1CAB4E2F0();
  swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0 && !HIDWORD(v13))
  {
    uint64_t v14 = sub_1CA9E0500(a1);
    if (!v15) {
      return 0;
    }
    uint64_t v16 = v15;
    uint64_t v35 = v14;
    if ((objc_msgSend(a1, sel_respondsToSelector_, sel_domainId) & 1) != 0
      && (id v17 = objc_msgSend(a1, sel_domainId)) != 0)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_1CAB4E2B0();
      uint64_t v33 = v20;
      uint64_t v34 = v19;

      if (!a2)
      {
LABEL_7:
        LOWORD(v21) = 0;
LABEL_10:
        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, v13, 0, (unsigned __int16)v21, a3 & 1);
        id v23 = objc_msgSend(a1, sel_uniqueId);
        uint64_t v24 = sub_1CAB4E2B0();
        uint64_t v26 = v25;

        objc_msgSend(a1, sel_absoluteTimestamp);
        sub_1CAB4E1A0();
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_1CA9DC040();
        uint64_t v29 = v28;
        id v30 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
        return sub_1CA9D12D4(v35, v16, v34, v33, v24, v26, (uint64_t)v11, (uint64_t)v8, a2, v27, v29, v22);
      }
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      if (!a2) {
        goto LABEL_7;
      }
    }
    unint64_t v21 = *(void *)(a2 + 16);
    if (v21 < 0x10000) {
      goto LABEL_10;
    }
  }
  id result = (id)sub_1CAB4E5A0();
  __break(1u);
  return result;
}

unint64_t sub_1CA9CF754()
{
  unint64_t result = qword_1EA60F818;
  if (!qword_1EA60F818)
  {
    sub_1CAB4E240();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA60F818);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_1CA9DC608(819200);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6(unint64_t a1)
{
  if (!a1) {
    a1 = v1;
  }
  return sub_1CA9DF540(a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_1CAB4E310();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_1CAB4E310();
}

char *OUTLINED_FUNCTION_11()
{
  return sub_1CA9CF198(0, v0 & ~(v0 >> 63), 0);
}

char *OUTLINED_FUNCTION_13@<X0>(unint64_t a1@<X8>)
{
  return sub_1CA9CF198((char *)(a1 > 1), v1, 1);
}

void OUTLINED_FUNCTION_14()
{
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = v0 + 16 * v4;
  *(void *)(v5 + 32) = v1;
  *(void *)(v5 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_17()
{
}

uint64_t StringDonation.uniqueId.getter()
{
  OUTLINED_FUNCTION_121();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StringDonation.uniqueId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___PPSWStringDonation_uniqueId);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*StringDonation.uniqueId.modify())()
{
  return j_j__swift_endAccess;
}

double StringDonation.absoluteTimestamp.getter()
{
  OUTLINED_FUNCTION_121();
  return *(double *)v0;
}

uint64_t StringDonation.absoluteTimestamp.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___PPSWStringDonation_absoluteTimestamp);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*StringDonation.absoluteTimestamp.modify())()
{
  return j__swift_endAccess;
}

void *sub_1CA9CFBB4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___PPSWStringDonation_source);
  id v2 = v1;
  return v1;
}

uint64_t sub_1CA9CFC40(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___PPSWStringDonation_source) = a1;
  return MEMORY[0x1F41817F8]();
}

id sub_1CA9CFC6C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v3 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1CA9CFCBC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PPSWStringDonation_extractionContent);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1CA9CFD10(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1CAB4E2B0();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);
}

uint64_t sub_1CA9CFD88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___PPSWStringDonation_extractionContent);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CA9CFDCC()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PPSWStringDonation_shouldConsume);
}

uint64_t sub_1CA9CFE04(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___PPSWStringDonation_shouldConsume) = result;
  return result;
}

void StringDonation.__allocating_init(labeledStrings:bundleId:groupId:documentId:)()
{
  id v1 = objc_allocWithZone(v0);
  StringDonation.init(labeledStrings:bundleId:groupId:documentId:)();
}

void StringDonation.init(labeledStrings:bundleId:groupId:documentId:)()
{
  OUTLINED_FUNCTION_67();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v10 = v9;
  uint64_t v52 = v11;
  uint64_t v13 = v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v15 = OUTLINED_FUNCTION_78(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_122();
  uint64_t v51 = v16;
  uint64_t v48 = sub_1CAB4E1D0();
  OUTLINED_FUNCTION_77();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_122();
  uint64_t v50 = v18;
  uint64_t v19 = OBJC_IVAR___PPSWStringDonation_absoluteTimestamp;
  uint64_t v20 = v0;
  *(CFAbsoluteTime *)&v0[v19] = CFAbsoluteTimeGetCurrent();
  uint64_t v49 = OBJC_IVAR___PPSWStringDonation_source;
  *(void *)&v20[OBJC_IVAR___PPSWStringDonation_source] = 0;
  v20[OBJC_IVAR___PPSWStringDonation_shouldConsume] = 1;
  unint64_t v21 = (uint64_t *)&v20[OBJC_IVAR___PPSWStringDonation_uniqueId];
  uint64_t v53 = v4;
  *unint64_t v21 = v4;
  v21[1] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6E8);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1CAB7B620;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1CA9D0420(0x656C746974, 0xE500000000000000, v13);
  if (v24) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v24) {
    unint64_t v26 = v24;
  }
  else {
    unint64_t v26 = 0xE000000000000000;
  }
  *(void *)(v22 + 32) = v25;
  *(void *)(v22 + 40) = v26;
  uint64_t v27 = sub_1CA9D0420(0xD000000000000012, 0x80000001CAB636C0, v13);
  if (v28) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v28) {
    unint64_t v30 = v28;
  }
  else {
    unint64_t v30 = 0xE000000000000000;
  }
  *(void *)(v22 + 48) = v29;
  *(void *)(v22 + 56) = v30;
  uint64_t v31 = sub_1CA9D0420(0x746E6F4374786574, 0xEB00000000746E65, v13);
  if (v32) {
    uint64_t v33 = v31;
  }
  else {
    uint64_t v33 = 0;
  }
  if (v32) {
    unint64_t v34 = v32;
  }
  else {
    unint64_t v34 = 0xE000000000000000;
  }
  *(void *)(v22 + 64) = v33;
  *(void *)(v22 + 72) = v34;
  uint64_t v55 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7E0);
  sub_1CA9D0478();
  uint64_t v35 = sub_1CAB4E290();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  id v38 = (uint64_t *)&v20[OBJC_IVAR___PPSWStringDonation_extractionContent];
  *id v38 = v35;
  v38[1] = v37;
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_1CAB4E270();
  __swift_project_value_buffer(v39, (uint64_t)qword_1EBCBAAE8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v40 = sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E430();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v47 = v6;
    uint64_t v42 = OUTLINED_FUNCTION_45();
    uint64_t v55 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 134218498;
    swift_bridgeObjectRelease();
    sub_1CAB4E490();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1CA9D199C(v53, v2, &v55);
    sub_1CAB4E490();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v42 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_1CA9D199C(v52, v10, &v55);
    sub_1CAB4E490();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CA9A8000, v40, v41, "StringDonation constructed with %ld string donations from document %s from %s", (uint8_t *)v42, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_0();
    uint64_t v6 = v47;
    OUTLINED_FUNCTION_7_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  unint64_t v43 = *v38;
  swift_bridgeObjectRetain();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_79();
  if ((v43 & 0x8000000000000000) != 0 || HIDWORD(v43))
  {
    OUTLINED_FUNCTION_124();
    sub_1CAB4E5A0();
    __break(1u);
  }
  else
  {
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, v43, 0, 0, 0);
    sub_1CAB4E1C0();
    __swift_storeEnumTagSinglePayload(v51, 1, 1, v48);
    objc_allocWithZone(MEMORY[0x1E4F89F40]);
    id v45 = sub_1CA9D12D4(v52, v10, v8, v6, v53, v2, v50, v51, 0, 0, 0, v44);
    id v46 = *(void **)&v20[v49];
    *(void *)&v20[v49] = v45;

    v54.receiver = v20;
    v54.super_class = (Class)type metadata accessor for StringDonation();
    objc_msgSendSuper2(&v54, sel_init);
    OUTLINED_FUNCTION_25();
  }
}

uint64_t sub_1CA9D0420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1CA9D2154(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

unint64_t sub_1CA9D0478()
{
  unint64_t result = qword_1EBCBA7E8;
  if (!qword_1EBCBA7E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBCBA7E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCBA7E8);
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

id StringDonation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void StringDonation.init()()
{
}

id StringDonation.__deallocating_deinit()
{
  return sub_1CA9D129C(type metadata accessor for StringDonation);
}

uint64_t sub_1CA9D06B4()
{
  return sub_1CA9CFCBC();
}

id StringDonationConsumer.__allocating_init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return sub_1CA9D97B0(a1, a2, a3, 0, a4, a5);
}

id StringDonationConsumer.init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1CA9D97B0(a1, a2, a3, 0, a4, a5);
}

id StringDonationConsumer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return StringDonationConsumer.init()();
}

id StringDonationConsumer.init()()
{
  id v1 = objc_msgSend(self, sel_defaultStore);
  id v2 = objc_msgSend(self, sel_defaultStore);
  id v3 = objc_msgSend(self, sel_defaultStore);
  id v4 = objc_msgSend(self, sel_sharedInstance);
  id v5 = objc_msgSend(self, sel_sharedInstance);
  id v6 = objc_msgSend(v0, sel_initWithTopicStore_entityStore_locationStore_entityDissector_topicDissector_, v1, v2, v3, v4, v5);

  return v6;
}

uint64_t StringDonationConsumer.consume(donation:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_1CA9D0948, 0, 0);
}

uint64_t sub_1CA9D0948()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void **)(*(void *)(v0 + 24) + OBJC_IVAR___PPSWStringDonation_source);
  if (!v1)
  {
    if (qword_1EBCBA6A8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1CAB4E270();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
    id v11 = sub_1CAB4E250();
    os_log_type_t v12 = sub_1CAB4E450();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1CA9A8000, v11, v12, "StringDonationConsumer: encountered a sourceless donation", v13, 2u);
      OUTLINED_FUNCTION_7_0();
    }
    goto LABEL_35;
  }
  id v2 = v1;
  uint64_t v3 = sub_1CA9D22B0(v2);
  uint64_t v5 = v4;
  uint64_t v6 = sub_1CAB4E2B0();
  if (v5)
  {
    if (v3 == v6 && v5 == v7)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v9 = sub_1CAB4E5D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
    }
    id v14 = objc_msgSend(self, sel_sharedInstance);
    unsigned int v15 = objc_msgSend(v14, sel_notificationExtractionEnabled);

    if (!v15) {
      goto LABEL_23;
    }
    id v16 = objc_msgSend(self, sel_defaultPolicy);
    id v17 = objc_msgSend(v2, sel_bundleId);
    if (!v17)
    {
      sub_1CAB4E2B0();
      id v17 = (id)sub_1CAB4E2A0();
      swift_bridgeObjectRelease();
    }
    unsigned __int8 v18 = objc_msgSend(v16, sel_bundleIdentifierIsAllowedForNotifications_, v17);

    if ((v18 & 1) == 0)
    {
LABEL_23:
      if (qword_1EBCBA6A8 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_1CAB4E270();
      __swift_project_value_buffer(v22, (uint64_t)qword_1EBCBAAE8);
      id v11 = sub_1CAB4E250();
      os_log_type_t v23 = sub_1CAB4E460();
      if (os_log_type_enabled(v11, v23))
      {
        unint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v24 = 0;
        _os_log_impl(&dword_1CA9A8000, v11, v23, "StringDonationConsumer: ignoring notification as notification consumption is not enabled either globally or for this bundle ID.", v24, 2u);
LABEL_31:
        OUTLINED_FUNCTION_7_0();

        goto LABEL_32;
      }
      goto LABEL_34;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_19:
  id v19 = objc_msgSend(self, sel_sharedInstance);
  id v20 = objc_msgSend(v2, sel_bundleId);
  if (!v20)
  {
    sub_1CAB4E2B0();
    id v20 = (id)sub_1CAB4E2A0();
    swift_bridgeObjectRelease();
  }
  unsigned __int8 v21 = objc_msgSend(v19, sel_bundleIdentifierIsEnabledForDonation_, v20);

  if (v21)
  {

LABEL_32:
    goto LABEL_36;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1CAB4E270();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBCBAAE8);
  id v2 = v2;
  id v11 = sub_1CAB4E250();
  os_log_type_t v26 = sub_1CAB4E460();
  if (os_log_type_enabled(v11, v26))
  {
    uint64_t v27 = (uint8_t *)OUTLINED_FUNCTION_46();
    uint64_t v34 = OUTLINED_FUNCTION_45();
    *(_DWORD *)uint64_t v27 = 136315138;
    id v28 = objc_msgSend(v2, sel_bundleId);
    uint64_t v29 = sub_1CAB4E2B0();
    unint64_t v31 = v30;

    *(void *)(v0 + 16) = sub_1CA9D199C(v29, v31, &v34);
    sub_1CAB4E490();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1CA9A8000, v11, v26, "StringDonationConsumer: _donateNotificationFromLabeledStrings: ignoring notification string from %s due to settings.", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_0();
    goto LABEL_31;
  }

LABEL_34:
LABEL_35:

LABEL_36:
  OUTLINED_FUNCTION_119();
  return v32();
}

uint64_t sub_1CA9D0F1C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  void v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1CA9D0FE0;
  return StringDonationConsumer.consume(donation:)((uint64_t)v6);
}

uint64_t sub_1CA9D0FE0()
{
  OUTLINED_FUNCTION_33();
  id v2 = (void (**)(void))v1[4];
  uint64_t v3 = (void *)v1[3];
  uint64_t v4 = (void *)v1[2];
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_118();
  *id v6 = v5;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  OUTLINED_FUNCTION_119();
  return v7();
}

uint64_t sub_1CA9D1108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7F8);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1CAB4E3C0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1EA60F868;
  v9[5] = v8;
  sub_1CA9D1688((uint64_t)v6, (uint64_t)&unk_1EA60F878, (uint64_t)v9);
  return swift_release();
}

void sub_1CA9D120C()
{
}

id StringDonationConsumer.__deallocating_deinit()
{
  return sub_1CA9D129C(type metadata accessor for StringDonationConsumer);
}

id sub_1CA9D129C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1CA9D12D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  unsigned int v15 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v16 = (void *)sub_1CAB4E2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = 0;
  }
  id v17 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  unsigned __int8 v18 = (void *)sub_1CAB4E1B0();
  uint64_t v19 = sub_1CAB4E1D0();
  id v20 = 0;
  if (__swift_getEnumTagSinglePayload(a8, 1, v19) != 1)
  {
    id v20 = (void *)sub_1CAB4E1B0();
    OUTLINED_FUNCTION_77();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a8, v19);
  }
  if (a9)
  {
    uint64_t v22 = (void *)sub_1CAB4E360();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (a11)
  {
    os_log_type_t v23 = (void *)sub_1CAB4E2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v23 = 0;
  }
  id v24 = objc_msgSend(v27, sel_initWithBundleId_groupId_documentId_date_relevanceDate_contactHandles_language_metadata_, v15, v16, v17, v18, v20, v22, v23, a12);

  OUTLINED_FUNCTION_77();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a7, v19);
  return v24;
}

uint64_t type metadata accessor for StringDonation()
{
  return self;
}

uint64_t sub_1CA9D14F0(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1CA9D8AEC;
  return v6();
}

uint64_t sub_1CA9D15BC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1CA9D8AEC;
  return v7();
}

uint64_t sub_1CA9D1688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1CAB4E3C0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1CA9D89E4(a1, &qword_1EBCBA7F8);
  }
  else
  {
    sub_1CAB4E3B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CAB4E3A0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1CA9D17F8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1CA9D18D4;
  return v6(a1);
}

uint64_t sub_1CA9D18D4()
{
  OUTLINED_FUNCTION_33();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_118();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_119();
  return v3();
}

uint64_t sub_1CA9D199C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1CA9D1A70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1CA9CC0AC((uint64_t)v12, *a3);
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
      sub_1CA9CC0AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1CA9D1A70(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1CA9D1BC8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1CAB4E4A0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1CA9D1CA0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1CAB4E540();
    if (!v8)
    {
      uint64_t result = sub_1CAB4E5A0();
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

void *sub_1CA9D1BC8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1CAB4E5C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1CA9D1CA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1CA9D1D38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1CA9D1F14(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1CA9D1F14((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CA9D1D38(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1CAB4E320();
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
  unint64_t v3 = sub_1CA9D1EAC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1CAB4E510();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1CAB4E5C0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1CAB4E5A0();
  __break(1u);
  return result;
}

void *sub_1CA9D1EAC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F898);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1CA9D1F14(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F898);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1CA9D20C4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1CA9D1FEC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1CA9D1FEC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1CAB4E5C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1CA9D20C4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1CAB4E5C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1CA9D2154(uint64_t a1, uint64_t a2)
{
  sub_1CAB4E640();
  sub_1CAB4E2E0();
  uint64_t v4 = sub_1CAB4E660();
  return sub_1CA9D21CC(a1, a2, v4);
}

unint64_t sub_1CA9D21CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1CAB4E5D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1CAB4E5D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1CA9D22B0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_groupId);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1CAB4E2B0();

  return v3;
}

void sub_1CA9D2314()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_13_0(v15, v102);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v17 = OUTLINED_FUNCTION_78(v16);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_37();
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_30(v20, v21, v22, v23, v24, v25, v26, v27, v103);
  OUTLINED_FUNCTION_94();
  uint64_t v28 = (uint64_t)sub_1CA9DBD8C();
  if (v28)
  {
    sub_1CA9DC6C0();
    if (v28)
    {
      uint64_t v29 = OUTLINED_FUNCTION_36(v28);
      if (v30(v29))
      {
        v104[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v31 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v31);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          unint64_t v32 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v33 = OUTLINED_FUNCTION_1_1();
              v34(v33);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v104);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v104, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v58)
          {
            OUTLINED_FUNCTION_80();
            if (v59)
            {
              id v60 = v59;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v61 = OUTLINED_FUNCTION_23();
              if (v58)
              {
                v62 = 0;
              }
              else
              {
                v62 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v63 = OUTLINED_FUNCTION_56();
                uint64_t v61 = v64(v63);
              }
              id v65 = OUTLINED_FUNCTION_9_0(v61, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v66 || (OUTLINED_FUNCTION_81(), !v32))
            {
              uint64_t v72 = OUTLINED_FUNCTION_47();
            }
            else
            {
              v67 = self;
              OUTLINED_FUNCTION_115((uint64_t)v32);
              id v68 = objc_msgSend(v67, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v69)
              {
                id v70 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              v73 = v4;
              sub_1CA9DC224();
              if (v74)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                v73 = 0;
              }
              id v75 = OUTLINED_FUNCTION_14_0();

              v76 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v77 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v77);
              id v78 = objc_msgSend(v67, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DC6C0();
              if (v79)
              {
                id v80 = OUTLINED_FUNCTION_101(v79);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              v81 = v4;
              sub_1CA9DC224();
              if (v82)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                v81 = 0;
              }
              id v83 = OUTLINED_FUNCTION_21();

              v84 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538A78);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v104);
              }
              v85 = v4;
              sub_1CA9DC224();
              if (v86)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                v85 = v83;
                sub_1CAB4E1E0();
                uint64_t v87 = OUTLINED_FUNCTION_3_0();
                v88(v87);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v89 = OUTLINED_FUNCTION_96();
              id v90 = OUTLINED_FUNCTION_2_1(v89, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v72))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v91 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v91 = swift_once();
              }
              OUTLINED_FUNCTION_43(v91, (uint64_t)qword_1EBCBAAE8);
              id v92 = v1;
              v93 = (void *)sub_1CAB4E250();
              os_log_type_t v94 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v94))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v95 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v95);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v96 = OUTLINED_FUNCTION_100();
                uint64_t v98 = OUTLINED_FUNCTION_90(v96, v97);
                OUTLINED_FUNCTION_12_0(v98);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v99, v100, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              v101 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v101, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v71 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v71 = objc_msgSend(self, sel_interrupted);
          }
          v71;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v51 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v51 = swift_once();
        }
        OUTLINED_FUNCTION_34(v51, (uint64_t)qword_1EBCBAAE8);
        uint64_t v52 = (void *)sub_1CAB4E250();
        os_log_type_t v53 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v53))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v54 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v54);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v55 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v55);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v56, v57, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v44 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v44 = objc_msgSend(self, sel_interrupted);
      }
      v44;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v28 = swift_once();
  }
  uint64_t v35 = OUTLINED_FUNCTION_4_0(v28, (uint64_t)qword_1EBCBAAE8);
  v36(v35);
  id v37 = v4;
  OUTLINED_FUNCTION_108();
  id v38 = (void *)sub_1CAB4E250();
  os_log_type_t v39 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v39))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v40 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v40);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v41 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v41);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DC6C0();
    if (v42)
    {
      unint64_t v43 = v42;
      objc_msgSend(v42, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v45 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v45);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v46, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v47();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v50 = v48;
}

void sub_1CA9D2D18()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBDA4();
  if (v30)
  {
    sub_1CA9DC8A8();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC23C();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DC8A8();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC23C();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538B38);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC23C();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DC8A8();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D371C()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBDBC();
  if (v30)
  {
    uint64_t v30 = (uint64_t)sub_1CA9CE5B0();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC040();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              id v81 = sub_1CA9CE5B0();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC040();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538B78);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC040();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    id v44 = sub_1CA9CE5B0();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D4120()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBDD4();
  if (v30)
  {
    sub_1CA9DCA90();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC254();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DCA90();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC254();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F25389F8);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC254();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DCA90();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D4B24()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9CD7A0();
  if (v30)
  {
    uint64_t v30 = sub_1CA9CDA44();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9CD5B4();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              id v81 = (void *)sub_1CA9CDA44();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9CD5B4();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538938);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9CD5B4();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    id v44 = (void *)sub_1CA9CDA44();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D5528()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBDEC();
  if (v30)
  {
    sub_1CA9DCC78();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC26C();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DCC78();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC26C();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538978);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC26C();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DCC78();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D5F2C()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBE04();
  if (v30)
  {
    sub_1CA9DCE60();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC284();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DCE60();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC284();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F25389B8);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC284();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DCE60();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

void sub_1CA9D6930()
{
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_8_0(v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_0_3();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_0(v17, v104);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v19 = OUTLINED_FUNCTION_78(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30(v22, v23, v24, v25, v26, v27, v28, v29, v105);
  OUTLINED_FUNCTION_94();
  uint64_t v30 = (uint64_t)sub_1CA9DBE1C();
  if (v30)
  {
    sub_1CA9DD048();
    if (v30)
    {
      uint64_t v31 = OUTLINED_FUNCTION_36(v30);
      if (v32(v31))
      {
        v106[6] = MEMORY[0x1E4FBC860];
        OUTLINED_FUNCTION_65();
        OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_73();
        if (v0)
        {
          uint64_t v33 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_6_0(v33);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          uint64_t v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          if (OUTLINED_FUNCTION_5_0())
          {
            OUTLINED_FUNCTION_44();
            if (OUTLINED_FUNCTION_5_0())
            {
              uint64_t v35 = OUTLINED_FUNCTION_1_1();
              v36(v35);
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            }
            else
            {
              OUTLINED_FUNCTION_55();
              sub_1CA9D89E4(v14, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)v106, &qword_1EA60F890);
              OUTLINED_FUNCTION_38();
            }
            OUTLINED_FUNCTION_97();
          }
          OUTLINED_FUNCTION_82();
          if (v60)
          {
            OUTLINED_FUNCTION_80();
            if (v61)
            {
              id v62 = v61;
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_72();
              uint64_t v63 = OUTLINED_FUNCTION_23();
              if (v60)
              {
                v64 = 0;
              }
              else
              {
                v64 = v2;
                sub_1CAB4E220();
                OUTLINED_FUNCTION_39();
                uint64_t v65 = OUTLINED_FUNCTION_56();
                uint64_t v63 = v66(v65);
              }
              id v67 = OUTLINED_FUNCTION_9_0(v63, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_89();

              OUTLINED_FUNCTION_54();
            }
          }
          OUTLINED_FUNCTION_117();
          if (((uint64_t (*)(void))v1)())
          {
            OUTLINED_FUNCTION_116();
            if (v68 || (OUTLINED_FUNCTION_81(), !v34))
            {
              uint64_t v74 = OUTLINED_FUNCTION_47();
            }
            else
            {
              char v69 = self;
              OUTLINED_FUNCTION_115((uint64_t)v34);
              id v70 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_70();
              objc_msgSend(v4, sel_respondsToSelector_);
              OUTLINED_FUNCTION_114();
              if (v71)
              {
                id v72 = OUTLINED_FUNCTION_112();
                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v75 = v4;
              sub_1CA9DC29C();
              if (v76)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v75 = 0;
              }
              id v77 = OUTLINED_FUNCTION_14_0();

              id v78 = (void *)sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v79 = OUTLINED_FUNCTION_27();
              OUTLINED_FUNCTION_109(v79);
              id v80 = objc_msgSend(v69, sel_sharedInstance);
              OUTLINED_FUNCTION_104();
              sub_1CA9DD048();
              if (v81)
              {
                id v82 = OUTLINED_FUNCTION_101(v81);

                sub_1CAB4E2B0();
                OUTLINED_FUNCTION_52();
              }
              else
              {
                OUTLINED_FUNCTION_53();
              }
              OUTLINED_FUNCTION_49();
              OUTLINED_FUNCTION_51();
              id v83 = v4;
              sub_1CA9DC29C();
              if (v84)
              {
                sub_1CAB4E2A0();
                OUTLINED_FUNCTION_50();
              }
              else
              {
                id v83 = 0;
              }
              id v85 = OUTLINED_FUNCTION_21();

              uint64_t v86 = (void *)OUTLINED_FUNCTION_68();
              OUTLINED_FUNCTION_28();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_91((uint64_t)&off_1F2538A38);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              if (OUTLINED_FUNCTION_15_0()) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
              }
              uint64_t v87 = v4;
              sub_1CA9DC29C();
              if (v88)
              {
                OUTLINED_FUNCTION_102();
              }
              else
              {
                OUTLINED_FUNCTION_71();
                uint64_t v87 = v85;
                sub_1CAB4E1E0();
                uint64_t v89 = OUTLINED_FUNCTION_3_0();
                v90(v89);
                if (!v1) {
                  OUTLINED_FUNCTION_110();
                }
              }
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_32();
              OUTLINED_FUNCTION_107();
              OUTLINED_FUNCTION_48();
              uint64_t v91 = OUTLINED_FUNCTION_96();
              id v92 = OUTLINED_FUNCTION_2_1(v91, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              id v1 = (void *)OUTLINED_FUNCTION_88();

              OUTLINED_FUNCTION_54();
              OUTLINED_FUNCTION_103();
            }
            if (((uint64_t (*)(uint64_t))v1)(v74))
            {
              OUTLINED_FUNCTION_22();
              if (!v1)
              {
                sub_1CA9D89E4(v14, &qword_1EBCBA690);
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_24();
                goto LABEL_69;
              }
              uint64_t v93 = swift_bridgeObjectRelease();
              if (qword_1EBCBA6A8 != -1) {
                uint64_t v93 = swift_once();
              }
              OUTLINED_FUNCTION_43(v93, (uint64_t)qword_1EBCBAAE8);
              id v94 = v1;
              uint64_t v95 = (void *)sub_1CAB4E250();
              os_log_type_t v96 = sub_1CAB4E440();
              if (OUTLINED_FUNCTION_69(v96))
              {
                OUTLINED_FUNCTION_46();
                uint64_t v97 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_95(v97);
                OUTLINED_FUNCTION_20(4.8149e-34);
                uint64_t v98 = OUTLINED_FUNCTION_100();
                uint64_t v100 = OUTLINED_FUNCTION_90(v98, v99);
                OUTLINED_FUNCTION_12_0(v100);
                swift_bridgeObjectRelease();

                OUTLINED_FUNCTION_41(&dword_1CA9A8000, v101, v102, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_75();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              self;
              uint64_t v103 = (void *)OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_113((uint64_t)v103, sel_failedWithError_);

              OUTLINED_FUNCTION_24();
              goto LABEL_68;
            }
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_47();
            swift_bridgeObjectRelease();
            id v73 = objc_msgSend(self, sel_interrupted);
          }
          v73;
          OUTLINED_FUNCTION_24();
LABEL_68:
          sub_1CA9D89E4(v14, &qword_1EBCBA690);
          goto LABEL_69;
        }
        uint64_t v53 = swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          uint64_t v53 = swift_once();
        }
        OUTLINED_FUNCTION_34(v53, (uint64_t)qword_1EBCBAAE8);
        uint64_t v54 = (void *)sub_1CAB4E250();
        os_log_type_t v55 = sub_1CAB4E460();
        if (OUTLINED_FUNCTION_61(v55))
        {
          OUTLINED_FUNCTION_46();
          uint64_t v56 = OUTLINED_FUNCTION_45();
          OUTLINED_FUNCTION_84(v56);
          OUTLINED_FUNCTION_57(4.8149e-34);
          objc_msgSend(v4, sel_uniqueId);
          sub_1CAB4E2B0();
          OUTLINED_FUNCTION_99();
          uint64_t v57 = OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_17_0(v57);

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_40(&dword_1CA9A8000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_76();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_7_0();
        }
        else
        {
        }
        id v46 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v46 = objc_msgSend(self, sel_interrupted);
      }
      v46;
      OUTLINED_FUNCTION_24();
LABEL_69:
      OUTLINED_FUNCTION_25();
      return;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    uint64_t v30 = swift_once();
  }
  uint64_t v37 = OUTLINED_FUNCTION_4_0(v30, (uint64_t)qword_1EBCBAAE8);
  v38(v37);
  id v39 = v4;
  OUTLINED_FUNCTION_108();
  uint64_t v40 = (void *)sub_1CAB4E250();
  os_log_type_t v41 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_64(v41))
  {
    OUTLINED_FUNCTION_87();
    uint64_t v42 = OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_86(v42);
    OUTLINED_FUNCTION_85(4.8151e-34);
    objc_msgSend(v1, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_92();
    uint64_t v43 = OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_11_0(v43);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_60();
    sub_1CA9DD048();
    if (v44)
    {
      uint64_t v45 = v44;
      objc_msgSend(v44, sel_bundleId);

      sub_1CAB4E2B0();
      OUTLINED_FUNCTION_93();
    }
    else
    {
      OUTLINED_FUNCTION_10_0();
    }
    uint64_t v47 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_26(v47);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74(&dword_1CA9A8000, v48, v3, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();

    OUTLINED_FUNCTION_58();
  }
  else
  {

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_59();
  }
  OUTLINED_FUNCTION_83();
  v49();
  objc_msgSend(self, sel_ignored);
  OUTLINED_FUNCTION_25();
  id v52 = v50;
}

id sub_1CA9D7334(char *a1, int a2, unsigned __int8 a3, uint64_t (*a4)(void), uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  v118 = a6;
  v122 = a4;
  uint64_t v123 = a5;
  int v119 = a2;
  uint64_t v120 = a8;
  uint64_t ObjectType = swift_getObjectType();
  v124 = (uint8_t *)sub_1CAB4E270();
  uint64_t v12 = *((void *)v124 - 1);
  MEMORY[0x1F4188790](v124);
  uint64_t v14 = (char *)v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_1CAB4E200();
  uint64_t v116 = *(void *)(v117 - 8);
  MEMORY[0x1F4188790](v117);
  uint64_t v16 = (char *)v111 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char *)v111 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v121 = (uint64_t)v111 - v24;
  uint64_t v25 = swift_getObjectType();
  if (a1[OBJC_IVAR___PPSWStringDonation_shouldConsume] == 1)
  {
    uint64_t v26 = *(void **)&a1[OBJC_IVAR___PPSWStringDonation_source];
    if (v26)
    {
      uint64_t v27 = v25;
      uint64_t v115 = OBJC_IVAR___PPSWStringDonation_source;
      id v28 = v26;
      if (v122())
      {
        unint64_t v130 = MEMORY[0x1E4FBC860];
        *((void *)&v128 + 1) = v27;
        v129 = &off_1F2538BB8;
        *(void *)&long long v127 = a1;
        swift_unknownObjectRetain();
        uint64_t v29 = sub_1CA9DB978((uint64_t)&v127, a7, ObjectType, v27, (uint64_t)&off_1F2538BB8);
        uint64_t v31 = v30;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
        if (v31)
        {
          id v114 = v28;
          LODWORD(v113) = a3;
          uint64_t v32 = sub_1CAB4E240();
          uint64_t v33 = v121;
          uint64_t v112 = v32;
          __swift_storeEnumTagSinglePayload(v121, 1, 1, v32);
          uint64_t v125 = (uint64_t)a1;
          v126 = &off_1F2538BB8;
          swift_unknownObjectRetain();
          uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA818);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
          char v35 = swift_dynamicCast();
          v111[3] = v29;
          v111[2] = v34;
          if (v35)
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
            uint64_t v125 = (uint64_t)a1;
            v126 = &off_1F2538BB8;
            swift_unknownObjectRetain();
            if (swift_dynamicCast())
            {
              uint64_t v36 = *((void *)&v128 + 1);
              uint64_t v37 = v129;
              __swift_project_boxed_opaque_existential_1(&v127, *((uint64_t *)&v128 + 1));
              ((void (*)(void, uint64_t, _UNKNOWN **))v37[3])(0, v36, v37);
              uint64_t v38 = v33;
              sub_1CA9D89E4(v33, &qword_1EBCBA690);
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
              uint64_t v39 = v112;
            }
            else
            {
              v129 = 0;
              long long v127 = 0u;
              long long v128 = 0u;
              uint64_t v38 = v33;
              sub_1CA9D89E4(v33, &qword_1EBCBA690);
              sub_1CA9D89E4((uint64_t)&v127, &qword_1EA60F890);
              uint64_t v39 = v112;
              __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, v112);
            }
            sub_1CA9D8A3C((uint64_t)v23, v38);
            int v68 = (int)v113;
          }
          else
          {
            uint64_t v38 = v33;
            int v68 = (int)v113;
            uint64_t v39 = v112;
          }
          if ((v68 | 2) == 2)
          {
            id v70 = *(void **)(v120 + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityDissector);
            if (v70)
            {
              id v71 = v70;
              uint64_t v72 = v31;
              id v73 = (void *)sub_1CAB4E2A0();
              sub_1CA9D897C(v38, (uint64_t)v20);
              if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v39) == 1)
              {
                uint64_t v74 = 0;
              }
              else
              {
                uint64_t v75 = sub_1CAB4E220();
                uint64_t v76 = v39;
                uint64_t v74 = (void *)v75;
                (*(void (**)(char *))(*(void *)(v76 - 8) + 8))(v20);
              }
              id v77 = objc_msgSend(v71, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_, v73, v74, v114, v119 & 1);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              unint64_t v78 = sub_1CAB4E380();

              sub_1CA9DF558(v78);
              uint64_t v31 = v72;
            }
          }
          id v80 = v122;
          uint64_t v79 = (char **)v123;
          if (v122())
          {
            if ((v68 - 1) < 2
              && (id v81 = *(void **)(v120 + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicDissector)) != 0)
            {
              id v82 = self;
              id v113 = v81;
              id v83 = objc_msgSend(v82, sel_sharedInstance);
              unsigned __int8 v84 = objc_msgSend(a1, sel_respondsToSelector_, sel_bundleId);
              v111[1] = v31;
              if (v84)
              {
                id v85 = objc_msgSend(a1, sel_bundleId);
                sub_1CAB4E2B0();
              }
              uint64_t v88 = (void *)sub_1CAB4E2A0();
              swift_bridgeObjectRelease();
              sub_1CA9DC460();
              if (v89)
              {
                id v90 = (void *)sub_1CAB4E2A0();
                swift_bridgeObjectRelease();
              }
              else
              {
                id v90 = 0;
              }
              id v91 = objc_msgSend(v83, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v88, v90, 0, 0);

              sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
              sub_1CA9D891C();
              uint64_t v112 = sub_1CAB4E3F0();

              id v92 = objc_msgSend(v82, sel_sharedInstance);
              uint64_t v93 = *(void **)&a1[v115];
              if (v93)
              {
                id v94 = objc_msgSend(v93, (SEL)&selRef_addObserver_selector_name_object_);
                sub_1CAB4E2B0();
              }
              uint64_t v95 = (void *)sub_1CAB4E2A0();
              swift_bridgeObjectRelease();
              sub_1CA9DC460();
              if (v96)
              {
                uint64_t v97 = (void *)sub_1CAB4E2A0();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v97 = 0;
              }
              id v98 = objc_msgSend(v92, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v95, v97, 0, 1);

              sub_1CAB4E3F0();
              unint64_t v99 = (void *)sub_1CAB4E2A0();
              swift_bridgeObjectRelease();
              uint64_t v125 = (uint64_t)a1;
              v126 = &off_1F2538BB8;
              swift_unknownObjectRetain();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
              uint64_t v100 = swift_dynamicCast();
              if (v100) {
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
              }
              sub_1CA9DC460();
              if (!v101)
              {
                sub_1CAB4E1F0();
                sub_1CAB4E1E0();
                (*(void (**)(char *, uint64_t))(v116 + 8))(v16, v117);
              }
              uint64_t v102 = v113;
              uint64_t v103 = (void *)sub_1CAB4E2A0();
              swift_bridgeObjectRelease();
              uint64_t v104 = (void *)sub_1CAB4E3E0();
              swift_bridgeObjectRelease();
              uint64_t v105 = (void *)sub_1CAB4E3E0();
              swift_bridgeObjectRelease();
              id v106 = objc_msgSend(v102, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_, v99, v100, v114, v119 & 1, v103, v104, 1.0, v105);

              sub_1CA9CC21C(0, &qword_1EBCBA6D8);
              unint64_t v107 = sub_1CAB4E380();

              sub_1CA9DF558(v107);
              uint64_t v79 = (char **)v123;
              uint64_t v38 = v121;
              id v80 = v122;
            }
            else
            {
              uint64_t v87 = swift_bridgeObjectRelease();
            }
            if (((uint64_t (*)(uint64_t))v80)(v87))
            {
              sub_1CA9D9C94(v130, (unint64_t)v80, v79, v118);
              id v108 = v114;
              uint64_t v110 = v109;
              sub_1CA9D89E4(v38, &qword_1EBCBA690);
              swift_bridgeObjectRelease();

              return (id)v110;
            }
            swift_bridgeObjectRelease();
            id v86 = objc_msgSend(self, sel_interrupted);
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v86 = objc_msgSend(self, sel_interrupted);
          }
          id v69 = v86;

          sub_1CA9D89E4(v38, &qword_1EBCBA690);
          return v69;
        }
        swift_bridgeObjectRelease();
        if (qword_1EBCBA6A8 != -1) {
          swift_once();
        }
        __swift_project_value_buffer((uint64_t)v124, (uint64_t)qword_1EBCBAAE8);
        swift_unknownObjectRetain_n();
        uint64_t v59 = sub_1CAB4E250();
        os_log_type_t v60 = sub_1CAB4E460();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = (uint8_t *)swift_slowAlloc();
          uint64_t v62 = swift_slowAlloc();
          *(void *)&long long v127 = v62;
          *(_DWORD *)uint64_t v61 = 136315138;
          v124 = v61 + 4;
          id v63 = v28;
          id v64 = objc_msgSend(a1, sel_uniqueId);
          uint64_t v65 = sub_1CAB4E2B0();
          unint64_t v67 = v66;

          id v28 = v63;
          uint64_t v125 = sub_1CA9D199C(v65, v67, (uint64_t *)&v127);
          sub_1CAB4E490();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CA9A8000, v59, v60, "Consumer: ignoring item with no content with id %s", v61, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1CB79D960](v62, -1, -1);
          MEMORY[0x1CB79D960](v61, -1, -1);
        }
        else
        {
        }
        id v55 = objc_msgSend(self, sel_ignored);
      }
      else
      {
        id v55 = objc_msgSend(self, sel_interrupted);
      }
      id v69 = v55;

      return v69;
    }
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v40 = (uint64_t)v124;
  uint64_t v41 = __swift_project_value_buffer((uint64_t)v124, (uint64_t)qword_1EBCBAAE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v41, v40);
  uint64_t v42 = a1;
  swift_unknownObjectRetain_n();
  uint64_t v43 = sub_1CAB4E250();
  os_log_type_t v44 = sub_1CAB4E460();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v123 = swift_slowAlloc();
    *(void *)&long long v127 = v123;
    *(_DWORD *)uint64_t v45 = 136315394;
    id v46 = objc_msgSend(v42, sel_uniqueId);
    uint64_t v47 = sub_1CAB4E2B0();
    unint64_t v49 = v48;

    uint64_t v125 = sub_1CA9D199C(v47, v49, (uint64_t *)&v127);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    id v50 = *(void **)&v42[OBJC_IVAR___PPSWStringDonation_source];
    if (v50)
    {
      id v51 = objc_msgSend(v50, sel_bundleId);
      uint64_t v52 = sub_1CAB4E2B0();
      unint64_t v54 = v53;
    }
    else
    {
      unint64_t v54 = 0xEC00000044492065;
      uint64_t v52 = 0x6C646E7542206F4ELL;
    }
    uint64_t v125 = sub_1CA9D199C(v52, v54, (uint64_t *)&v127);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v43, v44, "Consumer: ignoring ineligible item %s from %s.", (uint8_t *)v45, 0x16u);
    uint64_t v56 = v123;
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v56, -1, -1);
    MEMORY[0x1CB79D960](v45, -1, -1);

    (*(void (**)(char *, uint8_t *))(v12 + 8))(v14, v124);
  }
  else
  {

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v40);
  }
  id v57 = objc_msgSend(self, sel_ignored);
  return v57;
}

uint64_t type metadata accessor for StringDonationConsumer()
{
  return self;
}

uint64_t sub_1CA9D8480()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1CA9D84C8()
{
  id v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  os_log_type_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_123(v4);
  void *v5 = v6;
  v5[1] = sub_1CA9D8578;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1EA60F850 + dword_1EA60F850);
  return v7(v1, v2, v3);
}

uint64_t sub_1CA9D8578()
{
  OUTLINED_FUNCTION_33();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_118();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_119();
  return v3();
}

uint64_t sub_1CA9D8640()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  os_log_type_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_123(v4);
  void *v5 = v6;
  v5[1] = sub_1CA9D8AEC;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EA60F860 + dword_1EA60F860);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1CA9D8740(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_123(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_1CA9D8AEC;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA60F870 + dword_1EA60F870);
  return v9(a1, v3, v4, v5);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1CA9D8830()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1CA9D8868(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_123(v4);
  void *v5 = v6;
  v5[1] = sub_1CA9D8578;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA60F880 + dword_1EA60F880);
  return v7(a1, v3);
}

unint64_t sub_1CA9D891C()
{
  unint64_t result = qword_1EBCBA6E0;
  if (!qword_1EBCBA6E0)
  {
    sub_1CA9CC21C(255, (unint64_t *)&unk_1EBCBA820);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBCBA6E0);
  }
  return result;
}

uint64_t sub_1CA9D897C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CA9D89E4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_77();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1CA9D8A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id OUTLINED_FUNCTION_2_1(uint64_t a1, const char *a2)
{
  uint64_t v8 = *(_DWORD *)(v6 - 244) & 1;
  uint64_t v9 = *(void **)(v6 - 320);
  uint64_t v10 = *(void *)(v6 - 288);
  return objc_msgSend(v9, a2, v5, v2, v10, v8, v3, v4);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(*(void *)(v3 - 208), a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(*(void *)(v3 - 232), 1, 1, a1);
  *(void *)(v3 - 160) = v2;
  *(void *)(v3 - 152) = v1;
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_7_0()
{
  JUMPOUT(0x1CB79D960);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 - 256) = a6;
  *(void *)(v8 - 224) = a4;
  *(void *)(v8 - 216) = a5;
  *(_DWORD *)(v8 - 244) = a2;
  *(void *)(v8 - 240) = a8;
  return swift_getObjectType();
}

id OUTLINED_FUNCTION_9_0(uint64_t a1, const char *a2)
{
  uint64_t v7 = *(_DWORD *)(v5 - 244) & 1;
  uint64_t v8 = *(void *)(v5 - 288);
  return objc_msgSend(v2, a2, v4, v3, v8, v7);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_1CAB4E490();
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_1CAB4E490();
}

void OUTLINED_FUNCTION_13_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 280) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

id OUTLINED_FUNCTION_14_0()
{
  return objc_msgSend(v0, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v2, v1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  *(void *)(v2 - 304) = v1;
  *(void *)(v2 - 296) = v0;
  return sub_1CAB4E240();
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_1CAB4E490();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_1CAB4E200();
}

uint64_t OUTLINED_FUNCTION_20(float a1)
{
  *uint64_t v1 = a1;
  return swift_getErrorValue();
}

id OUTLINED_FUNCTION_21()
{
  return objc_msgSend(v0, (SEL)(v3 + 2968), v2, v1, 0, 1);
}

void OUTLINED_FUNCTION_22()
{
  uint64_t v5 = *(void **)(v3 - 256);
  sub_1CA9D9C94(v0, v2, v1, v5);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

void OUTLINED_FUNCTION_24()
{
  unint64_t v2 = *(void **)(v0 - 288);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_1CAB4E490();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_1CAB4E3F0();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1CAB4E2A0();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_1CA9DB978(v4 - 144, v2, v0, v3, v1);
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 232) = (char *)&a9 - v9;
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1CAB4E2A0();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_1CAB4E3E0();
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(*(void *)(v2 - 208), a2);
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1CA9D199C(v1, v0, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_36(uint64_t result)
{
  *(void *)(v1 - 288) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

void OUTLINED_FUNCTION_40(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_41(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_43(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_44()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v2 - 144);
  *(void *)(v2 - 160) = v1;
  *(void *)(v2 - 152) = v0;
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_1CAB4E3E0();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_1CAB4E2A0();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_52()
{
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_1CA9DF558(v0);
}

double OUTLINED_FUNCTION_55()
{
  *(void *)(v0 - 112) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return v0;
}

void OUTLINED_FUNCTION_57(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return v0;
}

void OUTLINED_FUNCTION_60()
{
  *(_WORD *)(v0 + 12) = 2080;
}

BOOL OUTLINED_FUNCTION_61(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_1CA9D199C(v1, v0, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_1CA9D199C(v0, v1, (uint64_t *)(v2 - 144));
}

BOOL OUTLINED_FUNCTION_64(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_65()
{
  *(void *)(v3 - 120) = v1;
  *(void *)(v3 - 112) = v0;
  *(void *)(v3 - 144) = v2;
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_1CAB4E3F0();
}

BOOL OUTLINED_FUNCTION_69(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_1CAB4E1F0();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_1CA9D897C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_73()
{
  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 144);
}

void OUTLINED_FUNCTION_74(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, v4, a3, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_78(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_84(uint64_t result)
{
  *(void *)(v1 - 144) = result;
  return result;
}

void OUTLINED_FUNCTION_85(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_86(uint64_t result)
{
  *(void *)(v1 - 216) = result;
  *(void *)(v1 - 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_1CAB4E380();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_1CAB4E380();
}

uint64_t OUTLINED_FUNCTION_90(uint64_t a1, unint64_t a2)
{
  return sub_1CA9D199C(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_91@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 152) = a1;
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_92()
{
}

void OUTLINED_FUNCTION_93()
{
}

uint64_t OUTLINED_FUNCTION_95(uint64_t result)
{
  *(void *)(v1 - 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_1CA9D8A3C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_98()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_99()
{
}

uint64_t OUTLINED_FUNCTION_100()
{
  return sub_1CAB4E5F0();
}

id OUTLINED_FUNCTION_101(void *a1)
{
  return [a1 (SEL)(v1 + 2712)];
}

uint64_t OUTLINED_FUNCTION_105()
{
  return sub_1CAB4E270();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_1CAB4E180();
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_unknownObjectRetain_n();
}

void OUTLINED_FUNCTION_109(uint64_t a1)
{
  *(void *)(v2 - 328) = a1;
}

uint64_t OUTLINED_FUNCTION_111()
{
  return sub_1CAB4E2A0();
}

id OUTLINED_FUNCTION_112()
{
  return [v1 (SEL)(v0 + 2712)];
}

id OUTLINED_FUNCTION_113(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_114()
{
  *(void *)(v1 - 312) = v0;
}

uint64_t OUTLINED_FUNCTION_115(uint64_t result)
{
  *(void *)(v1 - 320) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_119()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_120()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_123(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

id sub_1CA9D97B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicStoreOverride] = a1;
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityStoreOverride] = a2;
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_locationStoreOverride] = a3;
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_writebackDissector] = a4;
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityDissector] = a5;
  *(void *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicDissector] = a6;
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for Consumer();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_1CA9D982C(void *a1)
{
  id v30 = 0;
  uint64_t v2 = OUTLINED_FUNCTION_1_2();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = &v30;
  uint64_t v3 = OUTLINED_FUNCTION_1_2();
  *(void *)(v3 + 16) = sub_1CA9DBC94;
  *(void *)(v3 + 24) = v2;
  id v28 = sub_1CA9DBCA0;
  uint64_t v29 = v3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_1CA9DA97C;
  uint64_t v27 = &block_descriptor;
  uint64_t v4 = _Block_copy(&aBlock);
  id v5 = v1;
  swift_retain();
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_1_2();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = &v30;
  uint64_t v7 = OUTLINED_FUNCTION_1_2();
  *(void *)(v7 + 16) = sub_1CA9DBCC8;
  *(void *)(v7 + 24) = v6;
  id v28 = sub_1CA9DBCD4;
  uint64_t v29 = v7;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_1CA9DB138;
  uint64_t v27 = &block_descriptor_14;
  objc_super v8 = _Block_copy(&aBlock);
  id v9 = v5;
  swift_retain();
  swift_release();
  uint64_t v10 = OUTLINED_FUNCTION_1_2();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = &v30;
  uint64_t v11 = OUTLINED_FUNCTION_1_2();
  *(void *)(v11 + 16) = sub_1CA9DBCFC;
  *(void *)(v11 + 24) = v10;
  id v28 = sub_1CA9DBD08;
  uint64_t v29 = v11;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_1CA9DB6AC;
  uint64_t v27 = &block_descriptor_23;
  uint64_t v12 = _Block_copy(&aBlock);
  id v13 = v9;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_accessCriteriaUsingBundleIdentifierBlock_domainSelectionBlock_uniqueIdentifiersBlock_, v4, v8, v12);
  _Block_release(v8);
  _Block_release(v4);
  _Block_release(v12);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v2)
  {
    __break(1u);
    goto LABEL_9;
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  char v16 = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v16)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v17 = v30;
  uint64_t v18 = self;
  uint64_t v19 = v18;
  if (v17)
  {
    id v20 = v17;
    uint64_t v21 = (void *)sub_1CAB4E180();

    id v22 = objc_msgSend(v19, sel_failedWithError_, v21);
  }
  else
  {
    id v22 = objc_msgSend(v18, sel_successWithNumberOfExtractions_, 0);
  }

  swift_release();
  swift_release();
  swift_release();
  return (uint64_t)v22;
}

id sub_1CA9D9C04()
{
  return sub_1CA9D9C40(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicStoreOverride);
}

id sub_1CA9D9C18()
{
  return sub_1CA9D9C40(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityStoreOverride);
}

id sub_1CA9D9C2C()
{
  return sub_1CA9D9C40(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_locationStoreOverride);
}

id sub_1CA9D9C40(void *a1)
{
  uint64_t v2 = *(void **)(v1 + *a1);
  id v3 = v2;
  if (!v2) {
    id v3 = objc_msgSend(self, sel_defaultStore);
  }
  id v4 = v2;
  return v3;
}

void sub_1CA9D9C94(unint64_t a1, unint64_t a2, char **a3, void *a4)
{
  uint64_t v6 = v5;
  aBlock[6] = *(id *)MEMORY[0x1E4F143B8];
  if (a1 >> 62) {
    goto LABEL_43;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v11)
  {
    uint64_t v12 = *(void **)&v4[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_writebackDissector];
    if (v12)
    {
      unint64_t v53 = (void *)a2;
      sub_1CA9E25F8(0, (a1 & 0xC000000000000001) == 0, a1);
      uint64_t v51 = v6;
      unint64_t v54 = a4;
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v50 = v12;
        id v15 = (id)MEMORY[0x1CB79C2C0](0, a1);
      }
      else
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = v12;
        id v15 = v13;
      }
      char v16 = v15;
      id v17 = objc_msgSend(v15, sel_source, v51);

      id v18 = objc_msgSend(v17, sel_bundleId);
      if (!v18)
      {
        sub_1CAB4E2B0();
        id v18 = (id)sub_1CAB4E2A0();
        swift_bridgeObjectRelease();
      }
      sub_1CA9CC21C(0, &qword_1EBCBA6D8);
      uint64_t v19 = (void *)sub_1CAB4E360();
      if ((a1 & 0xC000000000000001) != 0) {
        id v20 = (id)MEMORY[0x1CB79C2C0](0, a1);
      }
      else {
        id v20 = *(id *)(a1 + 32);
      }
      uint64_t v21 = v20;
      id v22 = objc_msgSend(v20, sel_source);

      id v23 = objc_msgSend(v22, sel_documentId);
      if (!v23)
      {
        sub_1CAB4E2B0();
        id v23 = (id)sub_1CAB4E2A0();
        swift_bridgeObjectRelease();
      }
      aBlock[4] = v53;
      aBlock[5] = a3;
      aBlock[0] = (id)MEMORY[0x1E4F143A8];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1CA9DA418;
      aBlock[3] = &block_descriptor_26;
      uint64_t v24 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      unsigned int v25 = objc_msgSend(v12, sel_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock_, v18, v19, v23, v54, v24);
      _Block_release(v24);

      if (!v25)
      {
        if (qword_1EBCBA6A8 != -1) {
          swift_once();
        }
        uint64_t v41 = sub_1CAB4E270();
        __swift_project_value_buffer(v41, (uint64_t)qword_1EBCBAAE8);
        uint64_t v42 = sub_1CAB4E250();
        os_log_type_t v43 = sub_1CAB4E420();
        if (os_log_type_enabled(v42, v43))
        {
          os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v44 = 0;
          _os_log_impl(&dword_1CA9A8000, v42, v43, "Deferred donation due to interruption in writeback.", v44, 2u);
          MEMORY[0x1CB79D960](v44, -1, -1);
        }

        objc_msgSend(self, sel_interrupted);
        return;
      }

      uint64_t v6 = v52;
    }
    sub_1CA9DA458(a1, v4);
    if (v6) {
      return;
    }
    id v26 = sub_1CA9D9C04();
    a3 = &selRef_featureValueWithMultiArray_;
    if (v26)
    {
      uint64_t v27 = v26;
      aBlock[0] = 0;
      unsigned int v28 = objc_msgSend(v26, sel_flushDonationsWithError_, aBlock);

      id v29 = aBlock[0];
      if (!v28) {
        goto LABEL_39;
      }
      id v30 = aBlock[0];
    }
    id v31 = sub_1CA9D9C18();
    if (v31)
    {
      uint64_t v32 = v31;
      aBlock[0] = 0;
      unsigned int v33 = objc_msgSend(v31, sel_flushDonationsWithError_, aBlock);

      id v29 = aBlock[0];
      if (!v33)
      {
LABEL_39:
        id v45 = v29;
        sub_1CAB4E190();

        swift_willThrow();
        return;
      }
      id v34 = aBlock[0];
    }
    a2 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    id v4 = 0;
    char v35 = 0;
LABEL_23:
    id v55 = v35;
    uint64_t v36 = v4;
    while (1)
    {
      id v37 = a2 ? (id)MEMORY[0x1CB79C2C0](v36, a1) : *(id *)(a1 + 8 * (void)v36 + 32);
      a4 = v37;
      id v4 = v36 + 1;
      if (__OFADD__(v36, 1)) {
        break;
      }
      uint64_t v38 = (char **)objc_msgSend(v37, sel_numberOfExtractions);
      if (v38)
      {
        a3 = v38;
        uint64_t v39 = (char *)objc_msgSend(v38, sel_unsignedIntegerValue);

        BOOL v40 = __CFADD__(v55, v39);
        char v35 = &v39[(void)v55];
        if (v40) {
          __break(1u);
        }
        if (v4 == (char *)v11)
        {
LABEL_41:
          swift_bridgeObjectRelease();
          id v46 = self;
          uint64_t v47 = (void *)sub_1CAB4E480();
          id v48 = objc_msgSend(v46, sel_successWithNumberOfExtractions_, v47);
          goto LABEL_45;
        }
        goto LABEL_23;
      }

      ++v36;
      if (v4 == (char *)v11) {
        goto LABEL_41;
      }
    }
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  unint64_t v49 = self;
  sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
  uint64_t v47 = (void *)sub_1CAB4E470();
  id v48 = objc_msgSend(v49, sel_successWithNumberOfExtractions_, v47);
LABEL_45:
  v48;
}

id sub_1CA9DA284()
{
  v29[1] = *(id *)MEMORY[0x1E4F143B8];
  id v0 = sub_1CA9D9C04();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (void *)sub_1CAB4E2A0();
    unsigned int v9 = OUTLINED_FUNCTION_3_1((uint64_t)v2, sel_deleteAllTopicsFromSourcesWithBundleId_deletedCount_error_, v3, v4, v5, v6, v7, v8, 0);

    id v10 = v29[0];
    if (!v9) {
      goto LABEL_10;
    }
    id v11 = v29[0];
  }
  id v12 = sub_1CA9D9C18();
  if (v12)
  {
    id v13 = v12;
    id v14 = (void *)sub_1CAB4E2A0();
    unsigned int v21 = OUTLINED_FUNCTION_3_1((uint64_t)v14, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_deletedCount_error_, v15, v16, v17, v18, v19, v20, 0);

    id v10 = v29[0];
    if (v21)
    {
      id v22 = v29[0];
      goto LABEL_7;
    }
LABEL_10:
    id v27 = v10;
    sub_1CAB4E190();

    return (id)swift_willThrow();
  }
LABEL_7:
  id result = sub_1CA9D9C2C();
  if (!result) {
    return result;
  }
  uint64_t v24 = result;
  unsigned int v25 = (void *)sub_1CAB4E2A0();
  v29[0] = 0;
  unsigned int v26 = objc_msgSend(v24, sel_deleteAllLocationsFromSourcesWithBundleId_deletedCount_error_, v25, 0, v29);

  if (v26) {
    return v29[0];
  }
  id v28 = v29[0];
  sub_1CAB4E190();

  return (id)swift_willThrow();
}

uint64_t sub_1CA9DA418(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

void sub_1CA9DA458(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1CAB4E5B0())
  {
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v14 = v3;
      uint64_t v3 = v6 - 4;
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1CB79C2C0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v3, 1)) {
        break;
      }
      id v10 = sub_1CA9D9C04();
      id v11 = sub_1CA9D9C18();
      id v12 = sub_1CA9D9C2C();
      sub_1CA9CB9A8(v10, v11, v12);
      uint64_t v3 = v14;
      if (v14)
      {

        swift_bridgeObjectRelease();
        return;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_10:

  swift_bridgeObjectRelease();
}

id sub_1CA9DA5BC(uint64_t a1, unint64_t a2)
{
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1CAB4E270();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBCBAAE8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_1CAB4E250();
  os_log_type_t v6 = sub_1CAB4E460();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)id v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_1CA9D199C(a1, a2, &v10);
    sub_1CAB4E490();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CA9A8000, v5, v6, "Consumer: beginning deletion from from %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v8, -1, -1);
    MEMORY[0x1CB79D960](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_1CA9DA284();
}

uint64_t sub_1CA9DA97C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_1CAB4E2B0();
  v1(v2);
  return swift_bridgeObjectRelease();
}

void sub_1CA9DA9CC(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, void **a5)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1CAB4E270();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBCBAAE8);
  id v10 = a3;
  swift_bridgeObjectRetain_n();
  id v11 = v10;
  id v12 = sub_1CAB4E250();
  os_log_type_t v13 = sub_1CAB4E460();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = a5;
    uint64_t v16 = (void *)swift_slowAlloc();
    id v61 = v16;
    *(_DWORD *)uint64_t v14 = 134218242;
    objc_msgSend(v11, sel_count);

    sub_1CAB4E490();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1CA9D199C(a1, a2, (uint64_t *)&v61);
    sub_1CAB4E490();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CA9A8000, v12, v13, "Consumer: beginning deletion from %ld group Ids from %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    a5 = v15;
    MEMORY[0x1CB79D960](v17, -1, -1);
    MEMORY[0x1CB79D960](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (sub_1CAB4E2B0() == a1 && v18 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_1CAB4E5D0();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      goto LABEL_15;
    }
  }
  id v61 = 0;
  unint64_t v62 = 0xE000000000000000;
  sub_1CAB4E500();
  unsigned int v21 = (void *)sub_1CAB4E2B0();
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  id v61 = v21;
  unint64_t v62 = v23;
  sub_1CAB4E310();
  uint64_t v24 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  unsigned int v25 = objc_msgSend(v11, sel_containsDomain_, v24);

  if (v25)
  {
    sub_1CA9DA284();
    return;
  }
LABEL_15:
  id v26 = objc_msgSend(v11, sel_allDomains);
  uint64_t v27 = sub_1CAB4E3F0();

  sub_1CA9DB894(v27);
  swift_bridgeObjectRelease();
  id v28 = sub_1CA9D9C04();
  if (v28)
  {
    id v29 = v28;
    id v30 = (void *)sub_1CAB4E2A0();
    id v31 = (void *)sub_1CAB4E360();
    id v61 = 0;
    unsigned int v32 = objc_msgSend(v29, sel_deleteAllTopicsFromSourcesWithBundleId_groupIds_deletedCount_error_, v30, v31, 0, &v61);

    id v33 = v61;
    if (!v32) {
      goto LABEL_26;
    }
    id v34 = v61;
  }
  id v35 = sub_1CA9D9C18();
  if (!v35) {
    goto LABEL_21;
  }
  uint64_t v36 = v35;
  id v37 = (void *)sub_1CAB4E2A0();
  uint64_t v38 = (void *)sub_1CAB4E360();
  id v61 = 0;
  unsigned int v39 = objc_msgSend(v36, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_deletedCount_error_, v37, v38, 0, &v61);

  id v33 = v61;
  if (!v39)
  {
LABEL_26:
    id v48 = v33;
    swift_release();
    unint64_t v49 = (void *)sub_1CAB4E190();

    goto LABEL_29;
  }
  id v40 = v61;
LABEL_21:
  id v41 = sub_1CA9D9C2C();
  if (!v41)
  {
    swift_release();
    return;
  }
  uint64_t v42 = v41;
  os_log_type_t v43 = (void *)sub_1CAB4E2A0();
  os_log_type_t v44 = (void *)sub_1CAB4E360();
  swift_release();
  id v61 = 0;
  unsigned __int8 v45 = objc_msgSend(v42, sel_deleteAllLocationsFromSourcesWithBundleId_groupIds_deletedCount_error_, v43, v44, 0, &v61);

  id v46 = v61;
  if ((v45 & 1) == 0)
  {
    id v50 = v61;
    unint64_t v49 = (void *)sub_1CAB4E190();

LABEL_29:
    swift_willThrow();
    uint64_t v51 = *a5;
    *a5 = v49;
    id v52 = v49;

    swift_bridgeObjectRetain();
    id v53 = v49;
    swift_bridgeObjectRetain();
    id v54 = v49;
    id v55 = sub_1CAB4E250();
    os_log_type_t v56 = sub_1CAB4E440();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      id v61 = v58;
      *(_DWORD *)uint64_t v57 = 136315394;
      swift_bridgeObjectRetain();
      sub_1CA9D199C(a1, a2, (uint64_t *)&v61);
      sub_1CAB4E490();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v57 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v59 = sub_1CAB4E5F0();
      sub_1CA9D199C(v59, v60, (uint64_t *)&v61);
      sub_1CAB4E490();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CA9A8000, v55, v56, "Consumer: failed to delete data on request to delete by group IDs from %s. %s", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1CB79D960](v58, -1, -1);
      MEMORY[0x1CB79D960](v57, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  id v47 = v46;
}

void sub_1CA9DB138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v5 = sub_1CAB4E2B0();
  uint64_t v7 = v6;
  id v8 = a3;
  v4(v5, v7, v8);
  swift_bridgeObjectRelease();
}

void sub_1CA9DB1BC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  v43[1] = *(id *)MEMORY[0x1E4F143B8];
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1CAB4E270();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBCBAAE8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_1CAB4E250();
  os_log_type_t v10 = sub_1CAB4E460();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    id v12 = a5;
    os_log_type_t v13 = (void *)swift_slowAlloc();
    v43[0] = v13;
    *(_DWORD *)uint64_t v11 = 134218242;
    swift_bridgeObjectRelease();
    sub_1CAB4E490();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1CA9D199C(a1, a2, (uint64_t *)v43);
    sub_1CAB4E490();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CA9A8000, v9, v10, "Consumer: beginning deletion from %ld documents from %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    uint64_t v14 = v13;
    a5 = v12;
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_1CA9DB894(v15);
  swift_bridgeObjectRelease();
  id v16 = sub_1CA9D9C04();
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = (void *)sub_1CAB4E2A0();
    uint64_t v19 = (void *)sub_1CAB4E360();
    v43[0] = 0;
    unsigned int v20 = objc_msgSend(v17, sel_deleteAllTopicsFromSourcesWithBundleId_documentIds_deletedCount_error_, v18, v19, 0, v43);

    id v21 = v43[0];
    if (!v20) {
      goto LABEL_17;
    }
    id v22 = v43[0];
  }
  id v23 = sub_1CA9D9C18();
  if (!v23) {
    goto LABEL_12;
  }
  uint64_t v24 = v23;
  unsigned int v25 = (void *)sub_1CAB4E2A0();
  id v26 = (void *)sub_1CAB4E360();
  v43[0] = 0;
  unsigned int v27 = objc_msgSend(v24, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_deletedCount_error_, v25, v26, 0, v43);

  id v21 = v43[0];
  if (!v27)
  {
LABEL_17:
    id v36 = v21;
    swift_release();
    goto LABEL_20;
  }
  id v28 = v43[0];
LABEL_12:
  id v29 = sub_1CA9D9C2C();
  if (!v29)
  {
    swift_release();
    return;
  }
  id v30 = v29;
  id v31 = (void *)sub_1CAB4E2A0();
  unsigned int v32 = (void *)sub_1CAB4E360();
  swift_release();
  v43[0] = 0;
  unsigned __int8 v33 = objc_msgSend(v30, sel_deleteAllLocationsFromSourcesWithBundleId_documentIds_deletedCount_error_, v31, v32, 0, v43);

  id v34 = v43[0];
  if ((v33 & 1) == 0)
  {
    id v36 = v43[0];
LABEL_20:
    id v37 = (void *)sub_1CAB4E190();

    swift_willThrow();
    uint64_t v38 = *a5;
    *a5 = v37;
    id v39 = v37;

    id v40 = sub_1CAB4E250();
    os_log_type_t v41 = sub_1CAB4E440();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_1CA9A8000, v40, v41, "Consumer: failed to delete data on request to delete by group IDs from ", v42, 2u);
      MEMORY[0x1CB79D960](v42, -1, -1);
    }
    else
    {
    }
    return;
  }
  id v35 = v34;
}

uint64_t sub_1CA9DB6AC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_1CAB4E2B0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_1CAB4E3F0();
  v1(v2, v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id Consumer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Consumer.init()()
{
}

id Consumer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Consumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Consumer()
{
  return self;
}

void *sub_1CA9DB894(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6E8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_1CA9E2194((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1CA9DBD30();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1CA9DB978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v23[3] = a4;
  v23[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  sub_1CA9DBB84((uint64_t)v23, (uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBCBA698);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7C8);
  if (OUTLINED_FUNCTION_2_2())
  {
    sub_1CA9DBC44(&v16, (uint64_t)v20);
    uint64_t v9 = v21;
    uint64_t v10 = v22;
    __swift_project_boxed_opaque_existential_1(v20, v21);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
  }
  else
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    sub_1CA9DBBE8((uint64_t)&v16, &qword_1EBCBA7D0);
    sub_1CA9DBB84((uint64_t)v23, (uint64_t)v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA7D8);
    if ((OUTLINED_FUNCTION_2_2() & 1) == 0)
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      sub_1CA9DBBE8((uint64_t)&v16, &qword_1EA60F890);
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    sub_1CA9DBC44(&v16, (uint64_t)v20);
    uint64_t v12 = v21;
    uint64_t v13 = v22;
    __swift_project_boxed_opaque_existential_1(v20, v21);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(a2, v12, v13);
  }
  uint64_t v14 = v11;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
  return v14;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1CA9DBB84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CA9DBBE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CA9DBC44(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1CA9DBC5C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1CA9DBC94(uint64_t a1, unint64_t a2)
{
  return sub_1CA9DA5BC(a1, a2);
}

uint64_t sub_1CA9DBCA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1CA9DBCC8(uint64_t a1, unint64_t a2, void *a3)
{
  sub_1CA9DA9CC(a1, a2, a3, *(void *)(v3 + 16), *(void ***)(v3 + 24));
}

uint64_t sub_1CA9DBCD4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1CA9DBCFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1CA9DB1BC(a1, a2, a3, *(void *)(v3 + 16), *(void ***)(v3 + 24));
}

uint64_t sub_1CA9DBD08()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1CA9DBD30()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_3_1(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend(v9, a2, v10, 0, &a9);
}

id sub_1CA9DBD8C()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E0844);
}

id sub_1CA9DBDA4()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E0C7C);
}

id sub_1CA9DBDBC()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E0500);
}

id sub_1CA9DBDD4()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E10B4);
}

id sub_1CA9DBDEC()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E14EC);
}

id sub_1CA9DBE04()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E1924);
}

id sub_1CA9DBE1C()
{
  return sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E1D5C);
}

id sub_1CA9DBE34(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = a1(v1);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = v2;
    if (qword_1EBCBA6C0 != -1) {
      swift_once();
    }
    sub_1CA9DBF2C(v5, (uint64_t)v4, qword_1EBCBA7A0);
    if (v6)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      id v7 = objc_msgSend(self, sel_defaultPolicy);
      uint64_t v8 = (void *)sub_1CAB4E2A0();
      swift_bridgeObjectRelease();
      id v4 = objc_msgSend(v7, sel_bundleIdentifierIsAllowedForSearchableItems_, v8);
    }
  }
  return v4;
}

void sub_1CA9DBF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1CAB4E640();
    sub_1CAB4E2E0();
    uint64_t v6 = sub_1CAB4E660();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_18_1();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_1CAB4E5D0() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_18_1();
        if (v15)
        {
          do
          {
            long long v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_1CAB4E5D0()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_18_1();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_1CA9DC040()
{
  uint64_t v2 = sub_1CAB4E200();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  id v6 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v7 = objc_msgSend(v6, sel_isMultilingual);

  if (v7
    && (id v8 = objc_msgSend(v0, sel_content),
        sub_1CAB4E2B0(),
        v8,
        uint64_t v9 = sub_1CAB4E2F0(),
        swift_bridgeObjectRelease(),
        v9 >= 51))
  {
    uint64_t v10 = self;
    id v11 = objc_msgSend(v0, sel_content);
    sub_1CAB4E2B0();

    uint64_t v12 = sub_1CA9DC608(500);
    uint64_t v14 = v13;
    MEMORY[0x1CB79C070](v12);
    OUTLINED_FUNCTION_35_0();
    sub_1CAB4E2A0();
    OUTLINED_FUNCTION_43_0();
    id v15 = objc_msgSend(v10, sel_detectLanguageFromTextHeuristically_, v14);

    if (v15)
    {
      uint64_t v16 = sub_1CAB4E2B0();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_1CAB4E1F0();
    uint64_t v16 = v1;
    sub_1CAB4E1E0();
    OUTLINED_FUNCTION_16_1();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  }
  return v16;
}

uint64_t sub_1CA9DC224()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CE188);
}

uint64_t sub_1CA9DC23C()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CE2B0);
}

uint64_t sub_1CA9DC254()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CDFB0);
}

uint64_t sub_1CA9DC26C()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CDDDC);
}

uint64_t sub_1CA9DC284()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CDEE0);
}

uint64_t sub_1CA9DC29C()
{
  return sub_1CA9DC2B4((void (*)(void))sub_1CA9CE074);
}

uint64_t sub_1CA9DC2B4(void (*a1)(void))
{
  uint64_t v2 = sub_1CAB4E200();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_31_0();
  uint64_t v7 = v6 - v5;
  id v8 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v9 = objc_msgSend(v8, sel_isMultilingual);

  if (v9 && (a1(), uint64_t v10 = sub_1CAB4E2F0(), swift_bridgeObjectRelease(), v10 >= 51))
  {
    id v11 = self;
    a1();
    uint64_t v12 = sub_1CA9DC608(500);
    uint64_t v14 = v13;
    MEMORY[0x1CB79C070](v12);
    OUTLINED_FUNCTION_35_0();
    sub_1CAB4E2A0();
    OUTLINED_FUNCTION_43_0();
    id v15 = objc_msgSend(v11, sel_detectLanguageFromTextHeuristically_, v14);

    if (v15)
    {
      sub_1CAB4E2B0();
    }
  }
  else
  {
    sub_1CAB4E1F0();
    sub_1CAB4E1E0();
    OUTLINED_FUNCTION_102();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9DC460()
{
  uint64_t v2 = sub_1CAB4E200();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  id v6 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v7 = objc_msgSend(v6, sel_isMultilingual);

  if (v7
    && (uint64_t v8 = *(void *)(v0 + OBJC_IVAR___PPSWStringDonation_extractionContent),
        swift_bridgeObjectRetain(),
        sub_1CAB4E2F0(),
        OUTLINED_FUNCTION_43_0(),
        v8 >= 51))
  {
    unsigned int v9 = self;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1CA9DC608(500);
    uint64_t v12 = v11;
    MEMORY[0x1CB79C070](v10);
    OUTLINED_FUNCTION_35_0();
    sub_1CAB4E2A0();
    OUTLINED_FUNCTION_43_0();
    id v13 = objc_msgSend(v9, sel_detectLanguageFromTextHeuristically_, v12);

    if (v13)
    {
      uint64_t v14 = sub_1CAB4E2B0();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_1CAB4E1F0();
    uint64_t v14 = v1;
    sub_1CAB4E1E0();
    OUTLINED_FUNCTION_16_1();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  }
  return v14;
}

uint64_t sub_1CA9DC608(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1CAB4E300();
    sub_1CAB4E350();
    OUTLINED_FUNCTION_102();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_9();
  }
  return result;
}

void sub_1CA9DC6C0()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  ((void (*)(uint64_t))MEMORY[0x1F4188790])(v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_12();
  sub_1CA9CE188();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E0844(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v6 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v6);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CE188);
    OUTLINED_FUNCTION_16_1();
    id v7 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, v15, v1, v16, v17);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DC8A8()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  sub_1CA9CE2B0();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E0C7C(v0);
  if (v6)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v7 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CE2B0);
    OUTLINED_FUNCTION_16_1();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v16, v1, v17, v18);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DCA90()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  sub_1CA9CDFB0();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E10B4(v0);
  if (v6)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v7 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CDFB0);
    OUTLINED_FUNCTION_16_1();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v16, v1, v17, v18);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DCC78()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  sub_1CA9CDDDC();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E14EC(v0);
  if (v6)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v7 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CDDDC);
    OUTLINED_FUNCTION_16_1();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v16, v1, v17, v18);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DCE60()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  sub_1CA9CDEE0();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E1924(v0);
  if (v6)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v7 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CDEE0);
    OUTLINED_FUNCTION_16_1();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v16, v1, v17, v18);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DD048()
{
  OUTLINED_FUNCTION_67();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA688);
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12();
  sub_1CA9CE074();
  sub_1CAB4E2F0();
  OUTLINED_FUNCTION_24_0();
  if ((v2 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_13_1();
    goto LABEL_12;
  }
  if (HIDWORD(v2))
  {
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_12_1();
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_28_0();
  }
  sub_1CA9E1D5C(v0);
  if (v6)
  {
    OUTLINED_FUNCTION_8_1();
    if ((objc_msgSend(v0, sel_respondsToSelector_) & 1) != 0
      && OUTLINED_FUNCTION_23_0())
    {
      uint64_t v7 = sub_1CAB4E2B0();
      OUTLINED_FUNCTION_22_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_20_0();
    }
    OUTLINED_FUNCTION_5_1(objc_allocWithZone(MEMORY[0x1E4F89F48]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    objc_msgSend(v0, sel_uniqueId);
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_21_0();
    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1CAB4E1A0();
    OUTLINED_FUNCTION_9_1();
    sub_1CA9DC2B4((void (*)(void))sub_1CA9CE074);
    OUTLINED_FUNCTION_16_1();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
    OUTLINED_FUNCTION_0_5((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v16, v1, v17, v18);
  }
  OUTLINED_FUNCTION_25();
}

void sub_1CA9DD230()
{
  id v0 = objc_msgSend(self, sel_defaultStore);
  id v1 = objc_msgSend(self, sel_defaultStore);
  id v2 = objc_msgSend(self, sel_defaultStore);
  id v3 = objc_allocWithZone((Class)type metadata accessor for StructuredConsumer());
  sub_1CA9DD2E0();
  qword_1EBCBAAE0 = v4;
}

void sub_1CA9DD2E0()
{
  OUTLINED_FUNCTION_67();
  id v1 = v0;
  id v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = self;
  id v7 = v1;
  id v8 = v5;
  id v9 = v3;
  id v10 = objc_msgSend(v6, sel_sharedInstance);
  id v11 = objc_msgSend(self, sel_sharedInstance);
  id v12 = sub_1CA9D97B0((uint64_t)v5, (uint64_t)v3, (uint64_t)v1, 0, (uint64_t)v10, (uint64_t)v11);
  uint64_t v13 = self;
  id v14 = v12;
  id v15 = objc_msgSend(v13, sel_defaultCoordinator);
  objc_msgSend(v15, sel_registerInteractionConsumer_levelOfService_, v14, 3);

  OUTLINED_FUNCTION_25();
}

id sub_1CA9DD3FC(void *a1)
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1CAB4E1D0();
  uint64_t v4 = OUTLINED_FUNCTION_78(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_31_0();
  uint64_t v7 = v6 - v5;
  unint64_t v8 = sub_1CAB4E200();
  OUTLINED_FUNCTION_0_3();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_31_0();
  uint64_t v14 = v13 - v12;
  id v15 = objc_msgSend(a1, sel_interaction);
  id v16 = objc_msgSend(v15, sel_intent);

  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    id v18 = (id)v17;
    uint64_t v126 = v7;
    if ((sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E0844) & 1) == 0)
    {
      id v37 = objc_msgSend(self, sel_ignored);

      return v37;
    }
    unint64_t v19 = sub_1CA9DFB58(v18);
    v122 = a1;
    uint64_t v123 = v18;
    v124 = v16;
    if (v19)
    {
      uint64_t v20 = v19;
      if (v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_1CAB4E5B0();
      }
      else
      {
        uint64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      uint64_t v22 = (char *)MEMORY[0x1E4FBC860];
      unint64_t v125 = v8;
      uint64_t v121 = v10;
      if (v21)
      {
        if (v21 < 1)
        {
          __break(1u);
          goto LABEL_113;
        }
        for (uint64_t i = 0; i != v21; ++i)
        {
          if ((v20 & 0xC000000000000001) != 0) {
            id v24 = (id)MEMORY[0x1CB79C2C0](i, v20);
          }
          else {
            id v24 = *(id *)(v20 + 8 * i + 32);
          }
          unsigned int v25 = v24;
          uint64_t v26 = sub_1CA9DFC2C(v24, (SEL *)&selRef_namedEntities);

          if (v26)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v22 = sub_1CA9DEEB0(0, *((void *)v22 + 2) + 1, 1, (uint64_t)v22);
            }
            unint64_t v8 = *((void *)v22 + 2);
            unint64_t v27 = *((void *)v22 + 3);
            if (v8 >= v27 >> 1)
            {
              BOOL v28 = OUTLINED_FUNCTION_42_0(v27);
              uint64_t v22 = sub_1CA9DEEB0((char *)v28, v29, v30, (uint64_t)v22);
            }
            *((void *)v22 + 2) = v8 + 1;
            *(void *)&v22[8 * v8 + 32] = v26;
          }
        }
      }
      swift_bridgeObjectRelease_n();
      unint64_t v38 = MEMORY[0x1E4FBC860];
      long long v128 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v39 = *((void *)v22 + 2);
      if (v39)
      {
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v39; ++j)
        {
          os_log_type_t v41 = (void *)swift_bridgeObjectRetain();
          sub_1CA9DF740(v41);
        }
        swift_bridgeObjectRelease_n();
        uint64_t v42 = v128;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = (void *)MEMORY[0x1E4FBC860];
      }
      uint64_t v44 = v42[2];
      if (v44)
      {
        unint64_t v127 = v38;
        sub_1CAB4E570();
        unint64_t v8 = (unint64_t)(v42 + 6);
        do
        {
          uint64_t v46 = *(void *)(v8 - 16);
          uint64_t v45 = *(void *)(v8 - 8);
          id v47 = *(void **)v8;
          v8 += 24;
          swift_bridgeObjectRetain_n();
          id v48 = v47;
          sub_1CAB4E1F0();
          sub_1CAB4E1E0();
          (*(void (**)(uint64_t, unint64_t))(v121 + 8))(v14, v125);
          id v49 = objc_allocWithZone(MEMORY[0x1E4F89E90]);
          id v50 = sub_1CA9DEC14(v46, v45, 6);
          long long v128 = 0;
          char v129 = 1;
          MEMORY[0x1CB79C170](v48, &v128);
          OUTLINED_FUNCTION_39_0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F89F00]), sel_initWithItem_score_, v50, v1);

          swift_bridgeObjectRelease();
          sub_1CAB4E550();
          sub_1CAB4E580();
          sub_1CAB4E590();
          sub_1CAB4E560();
          --v44;
        }
        while (v44);
        unint64_t v43 = v127;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v43 = MEMORY[0x1E4FBC860];
      }
      id v16 = v124;
    }
    else
    {
      unint64_t v43 = MEMORY[0x1E4FBC860];
    }
    unint64_t v51 = sub_1CA9DFB58(v18);
    unint64_t v125 = v43;
    if (!v51)
    {
      unint64_t v62 = (char *)MEMORY[0x1E4FBC860];
      goto LABEL_69;
    }
    uint64_t v20 = v51;
    if (v51 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1CAB4E5B0();
    }
    else
    {
      uint64_t v21 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v22 = (char *)MEMORY[0x1E4FBC860];
    if (!v21)
    {
      id v53 = (char *)MEMORY[0x1E4FBC860];
LABEL_59:
      swift_bridgeObjectRelease_n();
      long long v128 = v22;
      uint64_t v63 = *((void *)v53 + 2);
      if (v63)
      {
        swift_bridgeObjectRetain();
        for (uint64_t k = 0; k != v63; ++k)
        {
          uint64_t v65 = (void *)swift_bridgeObjectRetain();
          sub_1CA9DF740(v65);
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      unint64_t v66 = v128;
      uint64_t v67 = v128[2];
      if (v67)
      {
        sub_1CAB4E570();
        int v68 = (void **)(v66 + 6);
        do
        {
          id v69 = *v68;
          v68 += 3;
          id v70 = objc_allocWithZone(MEMORY[0x1E4F89F80]);
          swift_bridgeObjectRetain();
          id v71 = v69;
          uint64_t v72 = (void *)sub_1CAB4E2A0();
          id v73 = objc_msgSend(v70, sel_initWithTopicIdentifier_, v72);

          long long v128 = 0;
          char v129 = 1;
          MEMORY[0x1CB79C170](v71, &v128);
          OUTLINED_FUNCTION_39_0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F89F00]), sel_initWithItem_score_, v73, v1);

          swift_bridgeObjectRelease();
          sub_1CAB4E550();
          sub_1CAB4E580();
          sub_1CAB4E590();
          sub_1CAB4E560();
          --v67;
        }
        while (v67);
        unint64_t v62 = v22;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v62 = (char *)MEMORY[0x1E4FBC860];
      }
      id v16 = v124;
      unint64_t v43 = v125;
LABEL_69:
      if (qword_1EBCBA6A8 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_1CAB4E270();
      __swift_project_value_buffer(v74, (uint64_t)qword_1EBCBAAE8);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v18 = v16;
      uint64_t v21 = sub_1CAB4E250();
      LOBYTE(v22) = sub_1CAB4E460();
      unint64_t v8 = v43 >> 62;
      v124 = v18;
      if (!os_log_type_enabled((os_log_t)v21, (os_log_type_t)v22))
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        goto LABEL_83;
      }
      uint64_t v20 = OUTLINED_FUNCTION_45();
      *(_DWORD *)uint64_t v20 = 134218496;
      if (v8)
      {
        swift_bridgeObjectRetain();
        uint64_t v75 = (void *)sub_1CAB4E5B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v75 = *(void **)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      long long v128 = v75;
      OUTLINED_FUNCTION_34_0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2048;
      if ((unint64_t)v62 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v76 = (void *)sub_1CAB4E5B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v76 = *(void **)(((unint64_t)v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      long long v128 = v76;
      OUTLINED_FUNCTION_34_0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 2048;
      unint64_t v77 = sub_1CA9DFB58(v123);
      if (!v77)
      {

        unint64_t v78 = 0;
        goto LABEL_82;
      }
      if (!(v77 >> 62))
      {
        unint64_t v78 = *(void **)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_79:

        swift_bridgeObjectRelease();
LABEL_82:
        long long v128 = v78;
        OUTLINED_FUNCTION_34_0();

        _os_log_impl(&dword_1CA9A8000, (os_log_t)v21, (os_log_type_t)v22, "StructuredConsumer: identified %ld entities and %ld topics in %ld Podcasts items", (uint8_t *)v20, 0x20u);
        OUTLINED_FUNCTION_7_0();

LABEL_83:
        uint64_t v79 = sub_1CAB4E2B0();
        uint64_t v81 = v80;
        uint64_t v82 = sub_1CA9DFBC8(v122);
        uint64_t v84 = v83;
        id v85 = objc_msgSend(v122, sel_uniqueId);
        uint64_t v86 = sub_1CAB4E2B0();
        uint64_t v88 = v87;

        objc_msgSend(v122, sel_absoluteTimestamp);
        sub_1CAB4E1A0();
        id v89 = objc_allocWithZone(MEMORY[0x1E4F89F40]);
        id v90 = sub_1CA9DECA4(v79, v81, v82, v84, v86, v88, v126);
        if (v8)
        {
          swift_bridgeObjectRetain();
          uint64_t v91 = sub_1CAB4E5B0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v91 = *(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v91)
        {
          id v92 = sub_1CA9D9C18();
          if (v92)
          {
            uint64_t v93 = v92;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6D0);
            id v94 = (void *)sub_1CAB4E360();
            long long v128 = 0;
            unsigned int v95 = objc_msgSend(v93, sel_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error_, v94, v90, 13, 0, &v128, 0.0);

            if (!v95)
            {
              uint64_t v103 = v128;
              swift_bridgeObjectRelease();
LABEL_103:
              swift_bridgeObjectRelease();
              uint64_t v110 = (void *)sub_1CAB4E190();

              swift_willThrow();
              id v111 = v110;
              id v112 = v110;
              id v113 = sub_1CAB4E250();
              os_log_type_t v114 = sub_1CAB4E440();
              if (os_log_type_enabled(v113, v114))
              {
                uint64_t v115 = (uint8_t *)OUTLINED_FUNCTION_46();
                long long v128 = (void *)OUTLINED_FUNCTION_45();
                *(_DWORD *)uint64_t v115 = 136315138;
                swift_getErrorValue();
                uint64_t v116 = sub_1CAB4E5F0();
                sub_1CA9D199C(v116, v117, (uint64_t *)&v128);
                sub_1CAB4E490();
                swift_bridgeObjectRelease();

                _os_log_impl(&dword_1CA9A8000, v113, v114, "StructuredConsumer: failed to write podcast entities to the database: %s", v115, 0xCu);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_7_0();
                OUTLINED_FUNCTION_7_0();
              }
              else
              {
              }
              v118 = self;
              int v119 = (void *)sub_1CAB4E180();
              id v120 = objc_msgSend(v118, sel_failedWithError_, v119);

              return v120;
            }
            uint64_t v96 = v128;
          }
          id v97 = sub_1CA9D9C04();
          if (v97)
          {
            id v98 = v97;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6D0);
            unint64_t v99 = (void *)sub_1CAB4E360();
            swift_bridgeObjectRelease();
            long long v128 = 0;
            unsigned int v100 = objc_msgSend(v98, sel_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error_, v99, v90, 8, 0, 0, &v128, 0.0);

            id v101 = v128;
            if (!v100)
            {
LABEL_102:
              uint64_t v103 = v101;
              goto LABEL_103;
            }
            uint64_t v102 = v128;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          id v104 = sub_1CA9D9C18();
          if (v104)
          {
            uint64_t v105 = v104;
            long long v128 = 0;
            unsigned int v106 = objc_msgSend(v104, sel_flushDonationsWithError_, &v128);

            id v101 = v128;
            if (v106)
            {
              unint64_t v107 = v128;
              goto LABEL_98;
            }
            goto LABEL_102;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
LABEL_98:
        if (v8)
        {
          swift_bridgeObjectRetain();
          sub_1CAB4E5B0();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        id v108 = self;
        uint64_t v109 = (void *)sub_1CAB4E410();
        id v37 = objc_msgSend(v108, sel_successWithNumberOfExtractions_, v109);

        return v37;
      }
LABEL_114:
      unint64_t v78 = (void *)sub_1CAB4E5B0();
      goto LABEL_79;
    }
    if (v21 >= 1)
    {
      uint64_t v52 = 0;
      id v53 = (char *)MEMORY[0x1E4FBC860];
      do
      {
        if ((v20 & 0xC000000000000001) != 0) {
          id v54 = (id)MEMORY[0x1CB79C2C0](v52, v20);
        }
        else {
          id v54 = *(id *)(v20 + 8 * v52 + 32);
        }
        id v55 = v54;
        uint64_t v56 = sub_1CA9DFC2C(v54, (SEL *)&selRef_topics);

        if (v56)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v53 = sub_1CA9DEEB0(0, *((void *)v53 + 2) + 1, 1, (uint64_t)v53);
          }
          unint64_t v58 = *((void *)v53 + 2);
          unint64_t v57 = *((void *)v53 + 3);
          if (v58 >= v57 >> 1)
          {
            BOOL v59 = OUTLINED_FUNCTION_42_0(v57);
            id v53 = sub_1CA9DEEB0((char *)v59, v60, v61, (uint64_t)v53);
          }
          *((void *)v53 + 2) = v58 + 1;
          *(void *)&v53[8 * v58 + 32] = v56;
        }
        ++v52;
      }
      while (v21 != v52);
      goto LABEL_59;
    }
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }

  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_1CAB4E270();
  __swift_project_value_buffer(v31, (uint64_t)qword_1EBCBAAE8);
  unsigned int v32 = sub_1CAB4E250();
  os_log_type_t v33 = sub_1CAB4E420();
  if (os_log_type_enabled(v32, v33))
  {
    id v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v34 = 0;
    _os_log_impl(&dword_1CA9A8000, v32, v33, "StructuredConsumer: ignoring non PlayMedia intent from Podcasts.", v34, 2u);
    OUTLINED_FUNCTION_7_0();
  }

  id v35 = objc_msgSend(self, sel_ignored);
  return v35;
}

id sub_1CA9DE304(void *a1)
{
  sub_1CA9DC6C0();
  if (v2)
  {
    uint64_t v3 = v2;
    if (sub_1CA9DBE34((uint64_t (*)(uint64_t))sub_1CA9E0844))
    {
      uint64_t v4 = self;
      id v5 = objc_msgSend(a1, sel_interaction);
      id v6 = objc_msgSend(v5, sel_intent);

      id v7 = objc_msgSend(v4, sel_scoredEntitiesFromMapsIntent_, v6);
      unint64_t v8 = v7;
      if (!v7)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6D0);
        sub_1CAB4E380();
        unint64_t v8 = (void *)sub_1CAB4E360();
        swift_bridgeObjectRelease();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6D0);
      unint64_t v9 = sub_1CAB4E380();
      if (v9 >> 62) {
        uint64_t v10 = sub_1CAB4E5B0();
      }
      else {
        uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v10)
      {
        id v11 = objc_msgSend(objc_allocWithZone((Class)PPScoredExtractionSet), sel_init);
        objc_msgSend(v11, sel_setEntities_, v8);

        objc_msgSend(v11, sel_setEntityAlgorithm_, 7);
        objc_msgSend(v11, sel_setSource_, v3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA830);
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_1CAB7B3A0;
        *(void *)(v12 + 32) = v11;
        unint64_t v22 = v12;
        sub_1CAB4E390();
        uint64_t v13 = (void *)*MEMORY[0x1E4F28378];
        id v14 = v11;
        sub_1CA9D9C94(v22, (unint64_t)sub_1CA9CB948, 0, v13);
        uint64_t v20 = v19;

        swift_bridgeObjectRelease();
        return (id)v20;
      }
      else
      {

        id v16 = self;
        sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
        uint64_t v17 = (void *)sub_1CAB4E470();
        id v18 = objc_msgSend(v16, sel_successWithNumberOfExtractions_, v17);

        return v18;
      }
    }
  }
  id v15 = objc_msgSend(self, sel_ignored);
  return v15;
}

id sub_1CA9DE7D8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_content);
  id v2 = objc_msgSend(v1, sel_bundleId);
  uint64_t v3 = sub_1CAB4E2B0();
  uint64_t v5 = v4;

  if (v3 == sub_1CAB4E2B0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v8 = OUTLINED_FUNCTION_27_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_16:
    id v26 = sub_1CA9DD3FC(v1);
    goto LABEL_21;
  }
  id v9 = objc_msgSend(v1, sel_bundleId);
  uint64_t v10 = sub_1CAB4E2B0();
  uint64_t v12 = v11;

  if (v10 == sub_1CAB4E2B0() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v15 = OUTLINED_FUNCTION_27_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_18:
    id v26 = sub_1CA9DE304(v1);
    goto LABEL_21;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1CAB4E270();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBCBAAE8);
  id v1 = v1;
  uint64_t v17 = (void *)sub_1CAB4E250();
  os_log_type_t v18 = sub_1CAB4E460();
  if (OUTLINED_FUNCTION_32_0(v18))
  {
    uint64_t v19 = (_DWORD *)OUTLINED_FUNCTION_46();
    uint64_t v29 = OUTLINED_FUNCTION_45();
    *uint64_t v19 = 136315138;
    id v20 = objc_msgSend(v1, sel_bundleId);
    uint64_t v21 = sub_1CAB4E2B0();
    unint64_t v23 = v22;

    sub_1CA9D199C(v21, v23, &v29);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_0(&dword_1CA9A8000, v24, v25, "StructuredConsumer: ignoring interaction from non-structured source %s");
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
  }
  id v26 = objc_msgSend(self, sel_ignored);
LABEL_21:
  id v27 = v26;

  return v27;
}

unint64_t sub_1CA9DEAEC()
{
  return 0xD00000000000003ELL;
}

id sub_1CA9DEBB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StructuredConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StructuredConsumer()
{
  return self;
}

id sub_1CA9DEC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v3, sel_initWithName_category_language_, v5, a3, v6);

  return v7;
}

id sub_1CA9DECA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v8 = v7;
  uint64_t v11 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v12 = (void *)sub_1CAB4E2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  id v14 = (void *)sub_1CAB4E1B0();
  id v15 = objc_msgSend(v8, sel_initWithBundleId_groupId_documentId_date_, v11, v12, v13, v14);

  uint64_t v16 = sub_1CAB4E1D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a7, v16);
  return v15;
}

char *sub_1CA9DEDB8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F950);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CA9DF260((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CA9DEFA0(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1CA9DEEB0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F940);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1CA9DF2FC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CA9DF0C0(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1CA9DEFA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F958);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CAB4E5C0();
  __break(1u);
  return result;
}

uint64_t sub_1CA9DF0C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA60F948);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1CAB4E5C0();
  __break(1u);
  return result;
}

char *sub_1CA9DF1D8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_124();
    __src = (char *)sub_1CAB4E5C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1CA9DF260(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CAB4E5C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_1CA9DF2FC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1CAB4E5C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_1CA9DF390(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_124();
    uint64_t result = sub_1CAB4E5C0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1CA9DF458(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v4 = a1 + 8 * a2 > a3) : (BOOL v4 = 0), v4))
  {
    OUTLINED_FUNCTION_124();
    uint64_t result = sub_1CAB4E5C0();
    __break(1u);
  }
  else
  {
    sub_1CA9CC21C(0, a4);
    OUTLINED_FUNCTION_9();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1CA9DF540(unint64_t a1)
{
  return sub_1CA9DF570(a1, sub_1CA9DFCA8);
}

uint64_t sub_1CA9DF558(unint64_t a1)
{
  return sub_1CA9DF570(a1, sub_1CA9DFE54);
}

uint64_t sub_1CA9DF570(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *objc_super v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x1CB79C2D0](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *objc_super v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1CAB4E5B0();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_1CAB4E390();
}

void *sub_1CA9DF740(void *result)
{
  uint64_t v3 = result[2];
  BOOL v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = (uint64_t)result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    BOOL v4 = sub_1CA9DEDB8(isUniquelyReferenced_nonNull_native, v10, 1, (uint64_t)v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = (void *)(v9 - v11);
  uint64_t result = sub_1CA9E2394(v41, &v4[24 * v11 + 32], v9 - v11, v7);
  if ((uint64_t)result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v15 = *((void *)v4 + 2);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = (char *)result + v15;
    if (v16)
    {
      __break(1u);
      goto LABEL_46;
    }
    *((void *)v4 + 2) = v17;
  }
  if (result != v12)
  {
LABEL_13:
    uint64_t result = (void *)sub_1CA9DBD30();
    *id v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = *((void *)v4 + 2);
  uint64_t v13 = v42;
  uint64_t v39 = v41[1];
  uint64_t v40 = v41[0];
  uint64_t v14 = v43;
  if (!v44)
  {
LABEL_46:
    int64_t v35 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_65;
    }
    int64_t v38 = (unint64_t)(v13 + 64) >> 6;
    if (v35 >= v38) {
      goto LABEL_13;
    }
    unint64_t v36 = *(void *)(v39 + 8 * v35);
    int64_t v19 = v14 + 1;
    if (!v36)
    {
      int64_t v19 = v14 + 2;
      if (v14 + 2 >= v38) {
        goto LABEL_13;
      }
      unint64_t v36 = *(void *)(v39 + 8 * v19);
      if (!v36)
      {
        int64_t v19 = v14 + 3;
        if (v14 + 3 >= v38) {
          goto LABEL_13;
        }
        unint64_t v36 = *(void *)(v39 + 8 * v19);
        if (!v36)
        {
          int64_t v19 = v14 + 4;
          if (v14 + 4 >= v38) {
            goto LABEL_13;
          }
          unint64_t v36 = *(void *)(v39 + 8 * v19);
          if (!v36)
          {
            int64_t v19 = v14 + 5;
            if (v14 + 5 >= v38) {
              goto LABEL_13;
            }
            unint64_t v36 = *(void *)(v39 + 8 * v19);
            if (!v36)
            {
              int64_t v37 = v14 + 6;
              do
              {
                if (v37 >= v38) {
                  goto LABEL_13;
                }
                unint64_t v36 = *(void *)(v39 + 8 * v37++);
              }
              while (!v36);
              int64_t v19 = v37 - 1;
            }
          }
        }
      }
    }
    unint64_t v18 = (v36 - 1) & v36;
    unint64_t v20 = __clz(__rbit64(v36)) + (v19 << 6);
    goto LABEL_18;
  }
  unint64_t v18 = (v44 - 1) & v44;
  int64_t v19 = v43;
  unint64_t v20 = __clz(__rbit64(v44)) | (v43 << 6);
  int64_t v38 = (unint64_t)(v42 + 64) >> 6;
LABEL_18:
  uint64_t v21 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v20);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  uint64_t v24 = *(void **)(*(void *)(v40 + 56) + 8 * v20);
  swift_bridgeObjectRetain();
  uint64_t result = v24;
  while (1)
  {
    unint64_t v25 = *((void *)v4 + 3);
    int64_t v26 = v25 >> 1;
    if ((uint64_t)(v25 >> 1) < v2 + 1)
    {
      uint64_t result = sub_1CA9DEDB8((char *)(v25 > 1), v2 + 1, 1, (uint64_t)v4);
      BOOL v4 = (char *)result;
      int64_t v26 = result[3] >> 1;
    }
    if (v2 < v26) {
      break;
    }
LABEL_43:
    *((void *)v4 + 2) = v2;
  }
  while (1)
  {
    id v27 = &v4[24 * v2 + 32];
    *(void *)id v27 = v22;
    *((void *)v27 + 1) = v23;
    *((void *)v27 + 2) = v24;
    ++v2;
    if (v18)
    {
      unint64_t v28 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v29 = v28 | (v19 << 6);
      goto LABEL_40;
    }
    int64_t v30 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v30 >= v38) {
      goto LABEL_44;
    }
    unint64_t v31 = *(void *)(v39 + 8 * v30);
    int64_t v32 = v19 + 1;
    if (!v31)
    {
      int64_t v32 = v19 + 2;
      if (v19 + 2 >= v38) {
        goto LABEL_44;
      }
      unint64_t v31 = *(void *)(v39 + 8 * v32);
      if (!v31)
      {
        int64_t v32 = v19 + 3;
        if (v19 + 3 >= v38) {
          goto LABEL_44;
        }
        unint64_t v31 = *(void *)(v39 + 8 * v32);
        if (!v31)
        {
          int64_t v32 = v19 + 4;
          if (v19 + 4 >= v38) {
            goto LABEL_44;
          }
          unint64_t v31 = *(void *)(v39 + 8 * v32);
          if (!v31)
          {
            int64_t v32 = v19 + 5;
            if (v19 + 5 >= v38) {
              goto LABEL_44;
            }
            unint64_t v31 = *(void *)(v39 + 8 * v32);
            if (!v31)
            {
              int64_t v33 = v19 + 6;
              while (v33 < v38)
              {
                unint64_t v31 = *(void *)(v39 + 8 * v33++);
                if (v31)
                {
                  int64_t v32 = v33 - 1;
                  goto LABEL_39;
                }
              }
LABEL_44:
              *((void *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_39:
    unint64_t v18 = (v31 - 1) & v31;
    unint64_t v29 = __clz(__rbit64(v31)) + (v32 << 6);
    int64_t v19 = v32;
LABEL_40:
    id v34 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v29);
    uint64_t v22 = *v34;
    uint64_t v23 = v34[1];
    uint64_t v24 = *(void **)(*(void *)(v40 + 56) + 8 * v29);
    if (v2 >= v26)
    {
      swift_bridgeObjectRetain();
      uint64_t result = v24;
      goto LABEL_43;
    }
    swift_bridgeObjectRetain();
    uint64_t result = v24;
    uint64_t v24 = result;
  }
  __break(1u);
LABEL_65:
  __break(1u);
  return result;
}

unint64_t sub_1CA9DFB34(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1CA9DFB58(void *a1)
{
  id v1 = objc_msgSend(a1, sel_mediaItems);
  if (!v1) {
    return 0;
  }
  int64_t v2 = v1;
  sub_1CA9CC21C(0, &qword_1EA60F960);
  uint64_t v3 = sub_1CAB4E380();

  return v3;
}

uint64_t sub_1CA9DFBC8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_domainId);
  if (!v1) {
    return 0;
  }
  int64_t v2 = v1;
  uint64_t v3 = sub_1CAB4E2B0();

  return v3;
}

uint64_t sub_1CA9DFC2C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  sub_1CA9CC21C(0, (unint64_t *)&unk_1EBCBA820);
  uint64_t v4 = sub_1CAB4E280();

  return v4;
}

uint64_t sub_1CA9DFCA8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1CAB4E5B0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1CAB4E5B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1CA9E25A8(&qword_1EBCBA778, &qword_1EBCBA680);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA680);
            int64_t v10 = sub_1CA9E0000();
            id v12 = *v11;
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1CA9DF458((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (unint64_t *)&qword_1EBCBA800);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CA9DFE54(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1CAB4E5B0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1CAB4E5B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1CA9E25A8(&qword_1EBCBA780, &qword_1EBCBA6C8);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA6C8);
            int64_t v10 = sub_1CA9E0050();
            id v12 = *v11;
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1CA9DF458((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_1EBCBA6D8);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1CA9E0000())()
{
  id v1 = OUTLINED_FUNCTION_41_0();
  uint64_t v2 = OUTLINED_FUNCTION_38_0((uint64_t)v1);
  *(void *)(v0 + 32) = sub_1CA9E00E4(v2, v3, v4);
  return sub_1CA9E004C;
}

uint64_t (*sub_1CA9E0050())()
{
  id v1 = OUTLINED_FUNCTION_41_0();
  uint64_t v2 = OUTLINED_FUNCTION_38_0((uint64_t)v1);
  *(void *)(v0 + 32) = sub_1CA9E0154(v2, v3, v4);
  return sub_1CA9E004C;
}

void sub_1CA9E009C(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1CA9E00E4(uint64_t a1, unint64_t a2, uint64_t a3))(id *a1)
{
  OUTLINED_FUNCTION_29_0(a1, a2, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1CB79C2C0](v5, v4);
  }
  else {
    id v7 = *(id *)(v4 + 8 * v5 + 32);
  }
  *unint64_t v3 = v7;
  return sub_1CA9E014C;
}

void sub_1CA9E014C(id *a1)
{
}

uint64_t (*sub_1CA9E0154(uint64_t a1, unint64_t a2, uint64_t a3))()
{
  OUTLINED_FUNCTION_29_0(a1, a2, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1CB79C2C0](v5, v4);
  }
  else {
    id v7 = *(id *)(v4 + 8 * v5 + 32);
  }
  *unint64_t v3 = v7;
  return sub_1CA9E25FC;
}

uint64_t sub_1CA9E01BC(void *a1)
{
  self;
  if (OUTLINED_FUNCTION_6_1()
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1()))
  {
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_102();
    return OUTLINED_FUNCTION_9();
  }
  self;
  if (OUTLINED_FUNCTION_6_1()) {
    goto LABEL_16;
  }
  self;
  if (OUTLINED_FUNCTION_6_1())
  {
    OUTLINED_FUNCTION_15_1();
    id v4 = objc_msgSend(v1, sel_bundleID);
LABEL_17:
    id v5 = v4;
    sub_1CAB4E2B0();

    return OUTLINED_FUNCTION_9();
  }
  self;
  if (OUTLINED_FUNCTION_6_1()
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1()))
  {
LABEL_16:
    OUTLINED_FUNCTION_15_1();
    id v4 = objc_msgSend(v1, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1CAB4E270();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  id v7 = (void *)sub_1CAB4E250();
  os_log_type_t v8 = sub_1CAB4E450();
  if (OUTLINED_FUNCTION_32_0(v8))
  {
    OUTLINED_FUNCTION_46();
    uint64_t v13 = OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_40_0(4.8149e-34);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v9 = sub_1CAB4E2C0();
    sub_1CA9D199C(v9, v10, &v13);
    OUTLINED_FUNCTION_33_0();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_0(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.");
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9E0500(void *a1)
{
  self;
  if (OUTLINED_FUNCTION_6_1()
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1()))
  {
    sub_1CAB4E2B0();
    OUTLINED_FUNCTION_102();
    return OUTLINED_FUNCTION_9();
  }
  self;
  if (OUTLINED_FUNCTION_6_1()) {
    goto LABEL_16;
  }
  self;
  if (OUTLINED_FUNCTION_6_1())
  {
    OUTLINED_FUNCTION_15_1();
    id v4 = objc_msgSend(v1, sel_bundleID);
LABEL_17:
    id v5 = v4;
    sub_1CAB4E2B0();

    return OUTLINED_FUNCTION_9();
  }
  self;
  if (OUTLINED_FUNCTION_6_1()
    || (self, OUTLINED_FUNCTION_6_1())
    || (self, OUTLINED_FUNCTION_6_1()))
  {
LABEL_16:
    OUTLINED_FUNCTION_15_1();
    id v4 = objc_msgSend(v1, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1CAB4E270();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  id v7 = (void *)sub_1CAB4E250();
  os_log_type_t v8 = sub_1CAB4E450();
  if (OUTLINED_FUNCTION_32_0(v8))
  {
    OUTLINED_FUNCTION_46();
    uint64_t v13 = OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_40_0(4.8149e-34);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v9 = sub_1CAB4E2C0();
    sub_1CA9D199C(v9, v10, &v13);
    OUTLINED_FUNCTION_33_0();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_0(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.");
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
  }
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_1CA9E0844(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E0C7C(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E10B4(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E14EC(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E1924(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E1D5C(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  if (swift_dynamicCastObjCClass()) {
    return sub_1CAB4E2B0();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4) {
    goto LABEL_16;
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    id v9 = v7;
    uint64_t v2 = sub_1CAB4E2B0();

    return v2;
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0)
    || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    os_log_type_t v8 = (void *)v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1CAB4E270();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBCBAAE8);
  swift_unknownObjectRetain_n();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E450();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA60F930);
    uint64_t v15 = sub_1CAB4E2C0();
    sub_1CA9D199C(v15, v16, &v17);
    sub_1CAB4E490();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB79D960](v14, -1, -1);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1CA9E2194(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_1CA9E2394(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v24 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    uint64_t v22 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      id v23 = v22;
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = v22;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1CA9E25A8(unint64_t *a1, uint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_1CAB4E1D0();
}

id OUTLINED_FUNCTION_5_1(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0, 0, v2, 0, 0, 0);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_19_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_20_0()
{
  *(void *)(v0 - 96) = 0;
}

void OUTLINED_FUNCTION_21_0()
{
}

void OUTLINED_FUNCTION_22_0(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
}

id OUTLINED_FUNCTION_23_0()
{
  return [v0 (SEL)(v1 + 2154)];
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_1CAB4E5A0();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1CAB4E5D0();
}

void OUTLINED_FUNCTION_28_0()
{
}

unint64_t OUTLINED_FUNCTION_29_0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1CA9DFB34(a2, (a3 & 0xC000000000000001) == 0, a3);
}

BOOL OUTLINED_FUNCTION_32_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return sub_1CAB4E490();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return sub_1CAB4E490();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_38_0(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_40_0(float a1)
{
  *uint64_t v1 = a1;
  return swift_getObjectType();
}

void *OUTLINED_FUNCTION_41_0()
{
  return malloc(0x28uLL);
}

BOOL OUTLINED_FUNCTION_42_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRelease();
}

void static HarvestingSystem.start()()
{
  if (qword_1EBCBA6A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1CAB4E270();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBCBAAE8);
  uint64_t v1 = sub_1CAB4E250();
  os_log_type_t v2 = sub_1CAB4E420();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1CA9A8000, v1, v2, "HarvestingSystem: beginning bring up of consumers", v3, 2u);
    MEMORY[0x1CB79D960](v3, -1, -1);
  }

  if (qword_1EBCBA798 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1EBCBAAE0;
  if (qword_1EBCBA7B0 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_1EBCBAB00;
  if (qword_1EBCBA7C0 != -1) {
    swift_once();
  }
  os_log_type_t v6 = (void *)qword_1EBCBAB08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBCBA830);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1CAB7B710;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v5;
  *(void *)(v7 + 48) = v6;
  unint64_t v14 = v7;
  sub_1CAB4E390();
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1CAB4E250();
  os_log_type_t v12 = sub_1CAB4E420();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1CAB4E5B0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1CAB4E490();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CA9A8000, v11, v12, "HarvestingSystem: completed consumer bring up of %ld consumers", v13, 0xCu);
    MEMORY[0x1CB79D960](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id HarvestingSystem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HarvestingSystem.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HarvestingSystem();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HarvestingSystem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HarvestingSystem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HarvestingSystem()
{
  return self;
}

uint64_t PPM2DatabaseRemoteRecordCountReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      int64_t v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2NamedEntitiesPerDonationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_39;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_41:
          uint64_t v32 = 20;
          goto LABEL_46;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_37;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          break;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
LABEL_37:
          unint64_t v31 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9E53D4(_Unwind_Exception *a1)
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

void sub_1CA9E68CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void ___getNotificationDispatchQueue_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPNamedEntityDissector.NotificationQueue", v2);
  uint64_t v4 = (void *)_getNotificationDispatchQueue__pasExprOnceResult;
  _getNotificationDispatchQueue__pasExprOnceResult = (uint64_t)v3;
}

id ___makeDefaultGazetteer_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  return v0;
}

uint64_t PPSocialHighlightFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_36;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + 24) = v23;
        goto LABEL_43;
      case 3u:
        *(unsigned char *)(a1 + 48) |= 1u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v30;
        goto LABEL_43;
      case 4u:
        unint64_t v31 = objc_alloc_init(PPRankableSocialHighlight);
        objc_storeStrong((id *)(a1 + 32), v31);
        if PBReaderPlaceMark() && (PPRankableSocialHighlightReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
LABEL_36:
        uint64_t v32 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_43;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

void sub_1CA9E9A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA9E9B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop(uint64_t a1)
{
  objc_super v2 = *(void ***)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = v3 - *(void *)a1;
  if ((uint64_t)v4 >= 9)
  {
    uint64_t v5 = 0;
    int64_t v6 = v4 >> 3;
    unsigned int v22 = *v2;
    *objc_super v2 = 0;
    BOOL v7 = __OFSUB__(v4 >> 3, 2);
    uint64_t v8 = (v4 >> 3) - 2;
    if (v8 < 0 != v7) {
      uint64_t v8 = v6 - 1;
    }
    uint64_t v9 = v8 >> 1;
    unint64_t v10 = v2;
    do
    {
      uint64_t v11 = &v10[v5 + 1];
      uint64_t v12 = (2 * v5) | 1;
      uint64_t v13 = 2 * v5 + 2;
      if (v13 < v6 && PPTokenCountCompareLess::operator()(*v11, v10[v5 + 2]))
      {
        ++v11;
        uint64_t v12 = v13;
      }
      char v14 = *v11;
      *uint64_t v11 = 0;
      BOOL v15 = *v10;
      *unint64_t v10 = v14;

      unint64_t v10 = v11;
      uint64_t v5 = v12;
    }
    while (v12 <= v9);
    int v16 = (void **)(v3 - 8);
    if (v16 == v11)
    {
      uint64_t v20 = *v11;
      *uint64_t v11 = v22;
    }
    else
    {
      char v17 = *v16;
      *int v16 = 0;
      uint64_t v18 = *v11;
      *uint64_t v11 = v17;

      uint64_t v19 = *v16;
      *int v16 = v22;

      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>((uint64_t)v2, (uint64_t)(v11 + 1), v11 + 1 - v2);
    }
  }
  uint64_t v21 = *(void *)(a1 + 8);

  *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v21 - 8;
}

void sub_1CA9E9C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v5 = v3 >> 1;
    int64_t v6 = (void **)(a1 + 8 * (v3 >> 1));
    BOOL v7 = (void **)(a2 - 8);
    if (PPTokenCountCompareLess::operator()(*v6, *(void **)(a2 - 8)))
    {
      uint64_t v8 = *v7;
      *BOOL v7 = 0;
      do
      {
        uint64_t v9 = v6;
        unint64_t v10 = *v6;
        *int64_t v6 = 0;
        uint64_t v11 = *v7;
        *BOOL v7 = v10;

        if (!v5) {
          break;
        }
        unint64_t v5 = (v5 - 1) >> 1;
        int64_t v6 = (void **)(a1 + 8 * v5);
        BOOL v7 = v9;
      }
      while (PPTokenCountCompareLess::operator()(*v6, v8));
      uint64_t v12 = *v9;
      *uint64_t v9 = v8;
    }
  }
}

void sub_1CA9E9D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL PPTokenCountCompareLess::operator()(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = [v3 count];
  BOOL v6 = v5 < [v4 count];

  return v6;
}

void sub_1CA9E9DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA9E9E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA9EA02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E65D39C8, MEMORY[0x1E4FBA1C8]);
}

void sub_1CA9EA0E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1CA9EA270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA9EB0E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2LocationItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    BOOL v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_60;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_62:
          uint64_t v50 = 28;
          goto LABEL_71;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_44;
        case 7u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_66:
          BOOL v51 = v28 != 0;
          uint64_t v52 = 40;
          goto LABEL_76;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_70:
          uint64_t v50 = 24;
LABEL_71:
          *(_DWORD *)(a1 + v50) = v19;
          continue;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 16;
LABEL_44:
          int64_t v37 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 0xAu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 44) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_75:
          BOOL v51 = v40 != 0;
          uint64_t v52 = 41;
LABEL_76:
          *(unsigned char *)(a1 + v52) = v51;
          continue;
        case 0xBu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 == -1 || v48 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0) {
          goto LABEL_78;
        }
        v44 += 7;
        BOOL v14 = v45++ >= 9;
        if (v14)
        {
          uint64_t v46 = 0;
          goto LABEL_80;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v46 = 0;
      }
LABEL_80:
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v46;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9EEC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PPM2FeedbackPortraitRegisteredReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  BOOL v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_41;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        a1[52] |= 1u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_52:
        uint64_t v38 = 24;
        goto LABEL_61;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        a1[52] |= 4u;
        while (2)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_56:
        uint64_t v38 = 48;
        goto LABEL_61;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_41;
      case 7u:
        char v31 = objc_alloc_init(PPM2SourceAlgPair);
        [a1 addRecords:v31];
        if (PBReaderPlaceMark() && PPM2SourceAlgPairReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_62:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_41:
        char v32 = *(void **)&a1[v18];
        *(void *)&a1[v18] = v17;

        goto LABEL_62;
      case 9u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v22 = 0;
        a1[52] |= 2u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v22 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_60:
        uint64_t v38 = 28;
LABEL_61:
        *(_DWORD *)&a1[v38] = v22;
        goto LABEL_62;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_62;
    }
  }
}

uint64_t __Block_byref_object_copy__692(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__693(uint64_t a1)
{
}

void sub_1CA9F10C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntitiesScoredReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    BOOL v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_65;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_73:
          BOOL v57 = v28 != 0;
          uint64_t v58 = 30;
          goto LABEL_90;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 36) |= 0x20u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_77:
          BOOL v57 = v34 != 0;
          uint64_t v58 = 32;
          goto LABEL_90;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 36) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_81:
          BOOL v57 = v40 != 0;
          uint64_t v58 = 31;
          goto LABEL_90;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_85:
          BOOL v57 = v46 != 0;
          uint64_t v58 = 29;
          goto LABEL_90;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          break;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_65:
          uint64_t v56 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_87;
        }
        v50 += 7;
        BOOL v14 = v51++ >= 9;
        if (v14)
        {
          uint64_t v52 = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v52 = 0;
      }
LABEL_89:
      BOOL v57 = v52 != 0;
      uint64_t v58 = 28;
LABEL_90:
      *(unsigned char *)(a1 + v5_Block_object_dispose(&STACK[0x2A0], 8) = v57;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9F3A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__927(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__928(uint64_t a1)
{
}

void sub_1CA9F3BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CA9F479C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PPM2DeviceStatsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9F5468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__1114(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1115(uint64_t a1)
{
}

uint64_t PPM2TopicDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 3)
      {
        uint64_t v23 = PBReaderReadString();
        unint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v23;
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9F6308(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t PPRankableSocialHighlightReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 160;
        goto LABEL_109;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 256) |= 0x40u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_120;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_120:
        uint64_t v84 = 168;
        goto LABEL_129;
      case 4u:
        *(_WORD *)(a1 + 256) |= 0x10u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 40;
        goto LABEL_159;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 232;
        goto LABEL_109;
      case 6u:
        PBReaderReadString();
        char v31 = (PPSocialHighlightContact *)objc_claimAutoreleasedReturnValue();
        if (v31) {
          [(id)a1 addApplicationIdentifiers:v31];
        }
        goto LABEL_44;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 216;
        goto LABEL_109;
      case 8u:
        char v31 = objc_alloc_init(PPSocialHighlightContact);
        objc_storeStrong((id *)(a1 + 224), v31);
        if (!PBReaderPlaceMark() || (PPSocialHighlightContactReadFrom((uint64_t)v31, a2) & 1) == 0) {
          goto LABEL_162;
        }
        goto LABEL_43;
      case 9u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_109;
      case 0xAu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 72;
        goto LABEL_109;
      case 0xBu:
        char v31 = objc_alloc_init(PPSocialHighlightFeature);
        [(id)a1 addCalculatedFeatures:v31];
        if PBReaderPlaceMark() && (PPSocialHighlightFeatureReadFrom((uint64_t)v31, a2))
        {
LABEL_43:
          PBReaderRecallMark();
LABEL_44:

LABEL_160:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_162:

        return 0;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_109;
      case 0xDu:
        *(_WORD *)(a1 + 256) |= 1u;
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 8;
        goto LABEL_159;
      case 0xEu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_109;
      case 0xFu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_109;
      case 0x11u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 256) |= 0x800u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                uint64_t v36 = 0;
                goto LABEL_124;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v36 = 0;
        }
LABEL_124:
        BOOL v85 = v36 != 0;
        uint64_t v86 = 251;
        goto LABEL_146;
      case 0x12u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_109;
      case 0x13u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 256) |= 0x80u;
        while (2)
        {
          uint64_t v43 = *v3;
          uint64_t v44 = *(void *)(a2 + v43);
          unint64_t v45 = v44 + 1;
          if (v44 == -1 || v45 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
            *(void *)(a2 + v43) = v45;
            v23 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              BOOL v15 = v42++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_128;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_128:
        uint64_t v84 = 200;
LABEL_129:
        *(_DWORD *)(a1 + v84) = v23;
        goto LABEL_160;
      case 0x14u:
        *(_WORD *)(a1 + 256) |= 8u;
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 <= 0xFFFFFFFFFFFFFFF7 && v48 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v48);
          *(void *)(a2 + v47) = v48 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 32;
        goto LABEL_159;
      case 0x15u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v51 = 0;
        *(_WORD *)(a1 + 256) |= 0x400u;
        while (2)
        {
          uint64_t v52 = *v3;
          uint64_t v53 = *(void *)(a2 + v52);
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                uint64_t v51 = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v51 = 0;
        }
LABEL_133:
        BOOL v85 = v51 != 0;
        uint64_t v86 = 250;
        goto LABEL_146;
      case 0x16u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 192;
        goto LABEL_109;
      case 0x17u:
        *(_WORD *)(a1 + 256) |= 4u;
        uint64_t v56 = *v3;
        unint64_t v57 = *(void *)(a2 + v56);
        if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v57);
          *(void *)(a2 + v56) = v57 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 24;
        goto LABEL_159;
      case 0x18u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 208;
        goto LABEL_109;
      case 0x19u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 240;
        goto LABEL_109;
      case 0x1Au:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v60 = 0;
        *(_WORD *)(a1 + 256) |= 0x1000u;
        while (2)
        {
          uint64_t v61 = *v3;
          uint64_t v62 = *(void *)(a2 + v61);
          unint64_t v63 = v62 + 1;
          if (v62 == -1 || v63 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
            *(void *)(a2 + v61) = v63;
            v60 |= (unint64_t)(v64 & 0x7F) << v58;
            if (v64 < 0)
            {
              v58 += 7;
              BOOL v15 = v59++ >= 9;
              if (v15)
              {
                uint64_t v60 = 0;
                goto LABEL_137;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v60 = 0;
        }
LABEL_137:
        BOOL v85 = v60 != 0;
        uint64_t v86 = 252;
        goto LABEL_146;
      case 0x1Bu:
        *(_WORD *)(a1 + 256) |= 0x20u;
        uint64_t v65 = *v3;
        unint64_t v66 = *(void *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v66);
          *(void *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 48;
        goto LABEL_159;
      case 0x1Cu:
        *(_WORD *)(a1 + 256) |= 2u;
        uint64_t v67 = *v3;
        unint64_t v68 = *(void *)(a2 + v67);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v68);
          *(void *)(a2 + v67) = v68 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v87 = 16;
LABEL_159:
        *(void *)(a1 + v87) = v30;
        goto LABEL_160;
      case 0x1Du:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v71 = 0;
        *(_WORD *)(a1 + 256) |= 0x200u;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v71 |= (unint64_t)(v75 & 0x7F) << v69;
            if (v75 < 0)
            {
              v69 += 7;
              BOOL v15 = v70++ >= 9;
              if (v15)
              {
                uint64_t v71 = 0;
                goto LABEL_141;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_141:
        BOOL v85 = v71 != 0;
        uint64_t v86 = 249;
        goto LABEL_146;
      case 0x1Eu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96;
        goto LABEL_109;
      case 0x1Fu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 112;
        goto LABEL_109;
      case 0x20u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 104;
        goto LABEL_109;
      case 0x21u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_109;
      case 0x22u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 176;
        goto LABEL_109;
      case 0x23u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 184;
        goto LABEL_109;
      case 0x24u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 152;
LABEL_109:
        uint64_t v76 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_160;
      case 0x25u:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v79 = 0;
        *(_WORD *)(a1 + 256) |= 0x100u;
        while (2)
        {
          uint64_t v80 = *v3;
          uint64_t v81 = *(void *)(a2 + v80);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              BOOL v15 = v78++ >= 9;
              if (v15)
              {
                uint64_t v79 = 0;
                goto LABEL_145;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v79 = 0;
        }
LABEL_145:
        BOOL v85 = v79 != 0;
        uint64_t v86 = 248;
LABEL_146:
        *(unsigned char *)(a1 + v86) = v85;
        goto LABEL_160;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_160;
    }
  }
}

uint64_t PPM2TopicDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_44;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_46:
          uint64_t v37 = 24;
          goto LABEL_51;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v24;

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_50:
          uint64_t v37 = 28;
LABEL_51:
          *(_DWORD *)(a1 + v37) = v19;
          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_53;
        }
        v31 += 7;
        BOOL v14 = v32++ >= 9;
        if (v14)
        {
          uint64_t v33 = 0;
          goto LABEL_55;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v33 = 0;
      }
LABEL_55:
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v33;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  unsigned int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_60;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_62:
          uint64_t v50 = 28;
          goto LABEL_71;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_44;
        case 7u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_66:
          BOOL v51 = v28 != 0;
          uint64_t v52 = 40;
          goto LABEL_76;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_70:
          uint64_t v50 = 24;
LABEL_71:
          *(_DWORD *)(a1 + v50) = v19;
          continue;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 16;
LABEL_44:
          uint64_t v37 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 0xAu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 44) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_75:
          BOOL v51 = v40 != 0;
          uint64_t v52 = 41;
LABEL_76:
          *(unsigned char *)(a1 + v52) = v51;
          continue;
        case 0xBu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 == -1 || v48 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0) {
          goto LABEL_78;
        }
        v44 += 7;
        BOOL v14 = v45++ >= 9;
        if (v14)
        {
          uint64_t v46 = 0;
          goto LABEL_80;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v46 = 0;
      }
LABEL_80:
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v46;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA9FDF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

void std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop(uint64_t a1)
{
  objc_super v2 = *(void ***)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = v3 - *(void *)a1;
  if ((uint64_t)v4 >= 9)
  {
    uint64_t v5 = 0;
    int64_t v6 = v4 >> 3;
    char v22 = *v2;
    *objc_super v2 = 0;
    BOOL v7 = __OFSUB__(v4 >> 3, 2);
    uint64_t v8 = (v4 >> 3) - 2;
    if (v8 < 0 != v7) {
      uint64_t v8 = v6 - 1;
    }
    uint64_t v9 = v8 >> 1;
    unint64_t v10 = v2;
    do
    {
      uint64_t v11 = &v10[v5 + 1];
      uint64_t v12 = (2 * v5) | 1;
      uint64_t v13 = 2 * v5 + 2;
      if (v13 < v6 && PPScoredItemCompareGreater::operator()(*v11, v10[v5 + 2]))
      {
        ++v11;
        uint64_t v12 = v13;
      }
      BOOL v14 = *v11;
      *uint64_t v11 = 0;
      int v15 = *v10;
      *unint64_t v10 = v14;

      unint64_t v10 = v11;
      uint64_t v5 = v12;
    }
    while (v12 <= v9);
    int v16 = (void **)(v3 - 8);
    if (v16 == v11)
    {
      uint64_t v20 = *v11;
      *uint64_t v11 = v22;
    }
    else
    {
      char v17 = *v16;
      *int v16 = 0;
      unsigned int v18 = *v11;
      *uint64_t v11 = v17;

      uint64_t v19 = *v16;
      *int v16 = v22;

      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>((uint64_t)v2, (uint64_t)(v11 + 1), v11 + 1 - v2);
    }
  }
  uint64_t v21 = *(void *)(a1 + 8);

  *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v21 - 8;
}

void sub_1CA9FE0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  objc_super v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        int64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v5 = v3 >> 1;
    int64_t v6 = (void **)(a1 + 8 * (v3 >> 1));
    BOOL v7 = (void **)(a2 - 8);
    if (PPScoredItemCompareGreater::operator()(*v6, *(void **)(a2 - 8)))
    {
      uint64_t v8 = *v7;
      *BOOL v7 = 0;
      do
      {
        uint64_t v9 = v6;
        unint64_t v10 = *v6;
        *int64_t v6 = 0;
        uint64_t v11 = *v7;
        *BOOL v7 = v10;

        if (!v5) {
          break;
        }
        unint64_t v5 = (v5 - 1) >> 1;
        int64_t v6 = (void **)(a1 + 8 * v5);
        BOOL v7 = v9;
      }
      while (PPScoredItemCompareGreater::operator()(*v6, v8));
      uint64_t v12 = *v9;
      *uint64_t v9 = v8;
    }
  }
}

void sub_1CA9FE220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL PPScoredItemCompareGreater::operator()(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 score];
  double v6 = v5;
  [v4 score];
  BOOL v8 = v6 > v7;

  return v8;
}

void sub_1CA9FE298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void sub_1CA9FE388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CA9FE530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CA9FE668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PPM2TopicsScoredReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_65;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_73:
          BOOL v57 = v28 != 0;
          uint64_t v58 = 30;
          goto LABEL_90;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 36) |= 0x20u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_77:
          BOOL v57 = v34 != 0;
          uint64_t v58 = 32;
          goto LABEL_90;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 36) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_81:
          BOOL v57 = v40 != 0;
          uint64_t v58 = 31;
          goto LABEL_90;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_85:
          BOOL v57 = v46 != 0;
          uint64_t v58 = 29;
          goto LABEL_90;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          break;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_65:
          uint64_t v56 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_87;
        }
        v50 += 7;
        BOOL v14 = v51++ >= 9;
        if (v14)
        {
          uint64_t v52 = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v52 = 0;
      }
LABEL_89:
      BOOL v57 = v52 != 0;
      uint64_t v58 = 28;
LABEL_90:
      *(unsigned char *)(a1 + v5_Block_object_dispose(&STACK[0x2A0], 8) = v57;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicsScoredForMappingReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_66;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_66;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_70:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 44) |= 0x10u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_74:
          BOOL v57 = v28 != 0;
          uint64_t v58 = 39;
          goto LABEL_91;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_78:
          BOOL v57 = v34 != 0;
          uint64_t v58 = 37;
          goto LABEL_91;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_82:
          BOOL v57 = v40 != 0;
          uint64_t v58 = 36;
          goto LABEL_91;
        case 7u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 44) |= 0x20u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_86:
          BOOL v57 = v46 != 0;
          uint64_t v58 = 40;
          goto LABEL_91;
        case 8u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 44) |= 8u;
          break;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_66:
          uint64_t v56 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_88;
        }
        v50 += 7;
        BOOL v14 = v51++ >= 9;
        if (v14)
        {
          uint64_t v52 = 0;
          goto LABEL_90;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_88:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v52 = 0;
      }
LABEL_90:
      BOOL v57 = v52 != 0;
      uint64_t v58 = 38;
LABEL_91:
      *(unsigned char *)(a1 + v5_Block_object_dispose(&STACK[0x2A0], 8) = v57;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicUniqueItemsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2UniqueNamedEntitiesFoundReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA024DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0265C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void sub_1CAA027A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA02938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA02AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1CAA02BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA02D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA02F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA030D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ***std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100](void ***result, void **a2)
{
  objc_super v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    id v3 = (char *)*v2;
    if (*v2)
    {
      id v4 = (char *)v2[1];
      double v5 = *v2;
      if (v4 != v3)
      {
        do
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v4 - 24));
        while (v4 != v3);
        double v5 = *v2;
      }
      v2[1] = v3;
      operator delete(v5);
    }
    JUMPOUT(0x1CB79CB70);
  }
  return result;
}

void ***std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100](void ***result, void **a2)
{
  objc_super v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    id v3 = v2;
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    JUMPOUT(0x1CB79CB70);
  }
  return result;
}

void std::default_delete<std::vector<PPSubscoreIdentifier>>::operator()[abi:ne180100](uint64_t a1)
{
  objc_super v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1CB79CB70);
}

void std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  objc_super v2 = (void **)**a1;
  if (v2)
  {
    id v4 = (void **)v1[1];
    double v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        double v6 = v4;
        std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      double v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  objc_super v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    double v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v4 - 40);
      while ((void *)v4 != v2);
      double v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      objc_super v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_1CAA046D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PPScoreInterpreterBytecode;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1CAA04E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,char a37)
{
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)&a37);
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v37 - 240);

  _Unwind_Resume(a1);
}

void *std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = a1[1];
    uint64_t v5 = v4 + 40 * a2;
    do
    {
      *(_OWORD *)uint64_t v4 = 0uLL;
      *(_OWORD *)(v4 + 16) = 0uLL;
      *(_DWORD *)(v4 + 32) = 1065353216;
      v4 += 40;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_1CAA050D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_1CAA0525C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA05BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]()
{
}

void sub_1CAA06110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unint64_t v5 = *((unsigned __int16 *)a2 + 1) + 4 * *a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      uint64_t v8 = *((unsigned __int16 *)a2 + 1) + 4 * *a2;
      if (v5 >= v6) {
        uint64_t v8 = v5 % v6;
      }
    }
    else
    {
      uint64_t v8 = (v6 - 1) & v5;
    }
    unsigned int v9 = *(uint64_t ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v5)
        {
          if (((*(_DWORD *)a2 ^ *((_DWORD *)i + 4)) & 0xFFFF00FF) == 0) {
            return 0;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8) {
            break;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unint64_t v12 = operator new(0x18uLL);
  *unint64_t v12 = 0;
  v12[1] = v5;
  *((_DWORD *)v12 + 4) = a3;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v6 || (float)(v14 * (float)v6) < v13)
  {
    BOOL v15 = 1;
    if (v6 >= 3) {
      BOOL v15 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v6);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(a1, v18);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v5 >= v6) {
        uint64_t v8 = v5 % v6;
      }
      else {
        uint64_t v8 = v5;
      }
    }
    else
    {
      uint64_t v8 = (v6 - 1) & v5;
    }
  }
  uint64_t v19 = *(void *)a1;
  char v20 = *(void **)(*(void *)a1 + 8 * v8);
  if (v20)
  {
    *unint64_t v12 = *v20;
LABEL_38:
    *char v20 = v12;
    goto LABEL_39;
  }
  *unint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v19 + 8 * v_Block_object_dispose(&STACK[0x2A0], 8) = a1 + 16;
  if (*v12)
  {
    unint64_t v21 = *(void *)(*v12 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v21 >= v6) {
        v21 %= v6;
      }
    }
    else
    {
      v21 &= v6 - 1;
    }
    char v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return 1;
}

void sub_1CAA06338(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = *((unsigned __int16 *)a3 + 1) + 4 * *a3;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = *((unsigned __int16 *)a3 + 1) + 4 * *a3;
    if (v3 >= a2) {
      uint64_t v5 = v3 % a2;
    }
  }
  else
  {
    uint64_t v5 = (a2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (((*(_DWORD *)a3 ^ *((_DWORD *)result + 4)) & 0xFFFF00FF) == 0) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E65D39D0, MEMORY[0x1E4FBA1D0]);
}

void sub_1CAA06450(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v5 = operator new(8 * prime);
  unint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    float v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *unint64_t v8 = *v14;
          *float v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          float v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        float v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_1CAA06990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unordered_set<PPSubscoreIdentifier>>>,std::vector<std::unordered_set<PPSubscoreIdentifier>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    unint64_t v3 = **(void ****)(a1 + 16);
    int8x8_t v4 = **(void ****)(a1 + 8);
    while (v3 != v4)
    {
      v3 -= 3;
      uint64_t v5 = v3;
      std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v5);
    }
  }
  return a1;
}

char *std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v3 = 5 * a2;
  uint64_t result = (char *)operator new(40 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v3];
  return result;
}

void sub_1CAA06C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2769(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2770(uint64_t a1)
{
}

void sub_1CAA06DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1CAA06F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA07044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA070F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA071D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA07444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA07634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA07A20(_Unwind_Exception *a1)
{
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v3 - 144));

  _Unwind_Resume(a1);
}

void sub_1CAA0845C(_Unwind_Exception *a1)
{
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v3 - 224));

  _Unwind_Resume(a1);
}

void pop(PPScoreInterpreterCtx *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(v3[1] + 8);
  unint64_t v8 = v3;
  if (v4 == *(void *)v3[1])
  {
    uint64_t v7 = pp_score_interpreter_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    a1->super.isa = 0;
    a1->_stack.__ptr_.__value_ = 0;
    a1->_scoreInputs = 0;
    PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)a1, (const PPScoreInterpreterValue *)(v4 - 24));
    uint64_t v5 = v8[1];
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(*(void *)(v5 + 8) - 24));
    *(void *)(v5 + _Block_object_dispose(&STACK[0x2A0], 8) = v6;
  }
}

void sub_1CAA086DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void push(void *a1, const PPScoreInterpreterValue *a2)
{
  float v14 = a1;
  uint64_t v3 = (uint64_t *)v14[1];
  uint64_t v4 = (PPScoreInterpreterValue *)v3[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v4 - *v3) >> 3);
  if (v5 >= 0x200)
  {
    uint64_t v13 = pp_score_interpreter_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "Score interpreter stack overflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    unint64_t v6 = v3[2];
    if ((unint64_t)v4 >= v6)
    {
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *v3) >> 3);
      uint64_t v10 = 2 * v9;
      if (2 * v9 <= v5 + 1) {
        uint64_t v10 = v5 + 1;
      }
      if (v9 >= 0x555555555555555) {
        unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v11 = v10;
      }
      uint64_t v19 = v3 + 2;
      if (v11) {
        unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoreInterpreterValue>>(v11);
      }
      else {
        uint64_t v12 = 0;
      }
      *(void *)buf = v11;
      unint64_t v16 = (PPScoreInterpreterValue *)(v11 + 24 * v5);
      unint64_t v18 = v11 + 24 * v12;
      PPScoreInterpreterValue::PPScoreInterpreterValue(v16, a2);
      unint64_t v17 = (char *)v16 + 24;
      std::vector<PPScoreInterpreterValue>::__swap_out_circular_buffer(v3, buf);
      uint64_t v8 = v3[1];
      std::__split_buffer<PPScoreInterpreterValue>::~__split_buffer((uint64_t)buf);
    }
    else
    {
      PPScoreInterpreterValue::PPScoreInterpreterValue(v4, a2);
      uint64_t v8 = v7 + 24;
      v3[1] = v7 + 24;
    }
    v3[1] = v8;
  }
}

void sub_1CAA08860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1CAA0D6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t shouldReturnUndefined(PPScoreInterpreterCtx *a1, unint64_t a2)
{
  uint64_t v3 = a1;
  value = v3->_stack.__ptr_.__value_;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3);
  unint64_t v6 = v5 - a2;
  if (v5 < a2)
  {
    uint64_t v13 = pp_score_interpreter_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
LABEL_21:
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  if (v6 >= v5)
  {
LABEL_13:
    int v10 = 0;
    goto LABEL_17;
  }
  a2 = -24 * a2 + 8 * ((uint64_t)(value[1] - *value) >> 3);
  while (1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    *(void *)buf = 0;
    uint64_t v8 = value;
    uint64_t v7 = *value;
    if (0xAAAAAAAAAAAAAAABLL * ((v8[1] - v7) >> 3) <= v6) {
      goto LABEL_21;
    }
    PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v7 + a2));
    if (!(_BYTE)v18)
    {
      if (PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf) == -31337.0) {
        break;
      }
      goto LABEL_12;
    }
    if (v18 != 1)
    {
      LODWORD(a2) = v18 != 2;
      goto LABEL_16;
    }
    PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v14);
    uint64_t v9 = v14;
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (!v9) {
      break;
    }
LABEL_12:
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
    ++v6;
    value = v3->_stack.__ptr_.__value_;
    a2 += 24;
    if (v6 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3)) {
      goto LABEL_13;
    }
  }
  LODWORD(a2) = 1;
LABEL_16:
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
  int v10 = 1;
LABEL_17:
  uint64_t v11 = v10 & a2;

  return v11;
}

void sub_1CAA0E6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)va);

  _Unwind_Resume(a1);
}

void drop(PPScoreInterpreterCtx *a1, unint64_t a2)
{
  uint64_t v9 = a1;
  value = v9->_stack.__ptr_.__value_;
  uint64_t v4 = value[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *value) >> 3);
  unint64_t v6 = v5 - a2;
  if (v5 < a2)
  {
    uint64_t v8 = pp_score_interpreter_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    if (v5 > v6)
    {
      uint64_t v7 = *value + 24 * v6;
      while (v4 != v7)
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v4 - 24));
      value[1] = v7;
    }
  }
}

void sub_1CAA0E7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1CAA0E83C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x2A0], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::push_back[abi:ne180100](uint64_t a1, _DWORD *a2)
{
  unint64_t v5 = *(_DWORD **)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = *(_DWORD **)a1;
    uint64_t v8 = ((uint64_t)v5 - *(void *)a1) >> 2;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v4 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    BOOL v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v12);
      uint64_t v7 = *(_DWORD **)a1;
      unint64_t v5 = *(_DWORD **)(a1 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = (_DWORD *)(v12 + 4 * v8);
    unint64_t v15 = v12 + 4 * v13;
    *uint64_t v14 = *a2;
    unint64_t v6 = v14 + 1;
    while (v5 != v7)
    {
      int v16 = *--v5;
      *--uint64_t v14 = v16;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v6;
    *(void *)(a1 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    _DWORD *v5 = *a2;
    unint64_t v6 = v5 + 1;
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v6;
}

uint64_t *std::unordered_set<float>::unordered_set<std::__wrap_iter<float *>>(uint64_t *a1, float *a2, float *a3)
{
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_DWORD *)a1 + _Block_object_dispose(&STACK[0x2A0], 8) = 1065353216;
  if (a2 != a3)
  {
    unint64_t v5 = a2;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = (float **)(a1 + 2);
    while (1)
    {
      float v9 = *v5;
      unint64_t v10 = *v5 == 0.0 ? 0 : *(unsigned int *)v5;
      if (v6)
      {
        uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
        v11.i16[0] = vaddlv_u8(v11);
        if (v11.u32[0] > 1uLL)
        {
          unint64_t v12 = v10;
          if (v10 >= v6) {
            unint64_t v12 = v10 % v6;
          }
        }
        else
        {
          unint64_t v12 = v10 & (v6 + 0xFFFFFFFF);
        }
        uint64_t v13 = *(float ***)(*a1 + 8 * v12);
        if (v13)
        {
          for (uint64_t i = *v13; i; uint64_t i = *(float **)i)
          {
            unint64_t v15 = *((void *)i + 1);
            if (v15 == v10)
            {
              if (i[4] == v9) {
                goto LABEL_79;
              }
            }
            else
            {
              if (v11.u32[0] > 1uLL)
              {
                if (v15 >= v6) {
                  v15 %= v6;
                }
              }
              else
              {
                v15 &= v6 - 1;
              }
              if (v15 != v12) {
                break;
              }
            }
          }
        }
      }
      else
      {
        unint64_t v12 = 0;
      }
      int v16 = (float *)operator new(0x18uLL);
      *(void *)int v16 = 0;
      *((void *)v16 + 1) = v10;
      v16[4] = v9;
      float v17 = (float)(unint64_t)(v7 + 1);
      float v18 = *((float *)a1 + 8);
      if (!v6 || (float)(v18 * (float)v6) < v17) {
        break;
      }
LABEL_69:
      uint64_t v34 = *a1;
      uint64_t v35 = *(float ***)(*a1 + 8 * v12);
      if (v35)
      {
        *(void *)int v16 = *v35;
      }
      else
      {
        *(void *)int v16 = *v8;
        *uint64_t v8 = v16;
        *(void *)(v34 + 8 * v12) = v8;
        if (!*(void *)v16) {
          goto LABEL_78;
        }
        unint64_t v36 = *(void *)(*(void *)v16 + 8);
        if ((v6 & (v6 - 1)) != 0)
        {
          if (v36 >= v6) {
            v36 %= v6;
          }
        }
        else
        {
          v36 &= v6 - 1;
        }
        uint64_t v35 = (float **)(*a1 + 8 * v36);
      }
      char *v35 = v16;
LABEL_78:
      uint64_t v7 = a1[3] + 1;
      a1[3] = v7;
LABEL_79:
      if (++v5 == a3) {
        return a1;
      }
    }
    BOOL v19 = (v6 & (v6 - 1)) != 0;
    if (v6 < 3) {
      BOOL v19 = 1;
    }
    unint64_t v20 = v19 | (2 * v6);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = a1[1];
    }
    if (*(void *)&prime > v6) {
      goto LABEL_35;
    }
    if (*(void *)&prime < v6)
    {
      unint64_t v29 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v6 < 3 || (uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v6)
      {
        unint64_t v6 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_35:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v23 = operator new(8 * *(void *)&prime);
          unint64_t v24 = (void *)*a1;
          *a1 = (uint64_t)v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          char v26 = *v8;
          if (*v8)
          {
            unint64_t v27 = *((void *)v26 + 1);
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }
            else
            {
              v27 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v27) = v8;
            char v32 = *(float **)v26;
            if (*(void *)v26)
            {
              do
              {
                unint64_t v33 = *((void *)v32 + 1);
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(void *)&prime) {
                    v33 %= *(void *)&prime;
                  }
                }
                else
                {
                  v33 &= *(void *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(void *)(*a1 + 8 * v33))
                  {
                    *(void *)(*a1 + 8 * v33) = v26;
                    goto LABEL_60;
                  }
                  *(void *)char v26 = *(void *)v32;
                  *(void *)char v32 = **(void **)(*a1 + 8 * v33);
                  **(void **)(*a1 + 8 * v33) = v32;
                  char v32 = v26;
                }
                unint64_t v33 = v27;
LABEL_60:
                char v26 = v32;
                char v32 = *(float **)v32;
                unint64_t v27 = v33;
              }
              while (v32);
            }
          }
          unint64_t v6 = (unint64_t)prime;
          goto LABEL_64;
        }
        uint64_t v37 = (void *)*a1;
        *a1 = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v6 = 0;
        a1[1] = 0;
      }
    }
LABEL_64:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v10 >= v6) {
        unint64_t v12 = v10 % v6;
      }
      else {
        unint64_t v12 = v10;
      }
    }
    else
    {
      unint64_t v12 = (v6 - 1) & v10;
    }
    goto LABEL_69;
  }
  return a1;
}

void sub_1CAA0ED5C(_Unwind_Exception *a1)
{
  operator delete(v2);
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoreInterpreterValue>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

uint64_t *std::vector<PPScoreInterpreterValue>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    do
    {
      uint64_t v6 = *(void *)(v4 - 24);
      v4 -= 24;
      uint64_t v5 = v6;
      uint64_t v7 = *(void *)(v2 - 24);
      v2 -= 24;
      *(unsigned char *)(v4 + 16) = 3;
      *(void *)uint64_t v4 = v7;
      *(void *)uint64_t v2 = v5;
      uint64_t v8 = *(void *)(v4 + 8);
      *(void *)(v4 + _Block_object_dispose(&STACK[0x2A0], 8) = *(void *)(v2 + 8);
      *(void *)(v2 + _Block_object_dispose(&STACK[0x2A0], 8) = v8;
      *(unsigned char *)(v4 + 16) = *(unsigned char *)(v2 + 16);
      *(unsigned char *)(v2 + 16) = 3;
    }
    while (v2 != v3);
  }
  a2[1] = v4;
  uint64_t v9 = *result;
  *uint64_t result = v4;
  a2[1] = v9;
  uint64_t v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<PPScoreInterpreterValue>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(i - 24));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__shared_ptr_emplace<std::vector<float>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void std::__shared_ptr_emplace<std::vector<float>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2539B18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1CB79CB70);
}

void std::__shared_ptr_emplace<std::vector<float>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2539B18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1CAA0F0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0F344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0F478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0F594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0F634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA0F6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA10BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA110E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2941(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2942(uint64_t a1)
{
}

void sub_1CAA120C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3057(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3058(uint64_t a1)
{
}

void sub_1CAA12304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA12520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA12874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA12C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA137C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 184), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA149B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA14AE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA14CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA14F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA15458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1711C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1764C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAA17B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id defaultRTRoutineManager()
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v0 = (void *)getRTRoutineManagerClass_softClass;
  uint64_t v10 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getRTRoutineManagerClass_block_invoke;
    v6[3] = &unk_1E65DC058;
    v6[4] = &v7;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v6);
    uint64_t v0 = (void *)v8[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v7, 8);
  if (v1)
  {
    SEL v2 = NSSelectorFromString(&cfstr_Defaultmanager.isa);
    uint64_t v3 = ((void (*)(id, SEL))[v1 methodForSelector:v2])(v1, v2);
  }
  else
  {
    uint64_t v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "Failed to dlopen CoreRoutine.", (uint8_t *)v6, 2u);
    }

    uint64_t v3 = 0;
  }
  return v3;
}

void sub_1CAA17C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3226(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3227(uint64_t a1)
{
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreRoutineLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D5118;
    uint64_t v8 = 0;
    CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *CoreRoutineLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPRoutineSupport.m", 40, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("RTRoutineManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getRTRoutineManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPRoutineSupport.m", 41, @"Unable to find class %s", "RTRoutineManager");

LABEL_10:
    __break(1u);
  }
  getRTRoutineManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreRoutineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreRoutineLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1CAA18188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA189E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1CAA19F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1ABDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3385(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3386(uint64_t a1)
{
}

void sub_1CAA1AE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1AF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1B074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1B150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1BCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1D578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

void sub_1CAA1DAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA1E160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t offsetFromAppendingData(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  while (([v3 length] & 0x1F) != 0)
    [v3 appendBytes:"" length:1];
  uint64_t v5 = [v3 length];
  [v3 appendData:v4];

  return v5;
}

void sub_1CAA22484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA2310C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 a11, uint64_t a12, __int16 buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    int v16 = [v15 name];
    float v17 = (void *)*MEMORY[0x1E4F1C3C8];

    if (v16 == v17)
    {
      float v18 = pp_events_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "Corrupted persistent logging store! Removing corrupted store.", (uint8_t *)&buf, 2u);
      }

      int v19 = [MEMORY[0x1E4F89FC8] isInternalDevice];
      unint64_t v20 = *(void **)(v14 + 3256);
      if (v19)
      {
        unint64_t v21 = [v20 defaultManager];
        uint64_t v22 = [v13 stringByAppendingString:@".old"];
        [v21 moveItemAtPath:v13 toPath:v22 error:0];
      }
      else
      {
        unint64_t v21 = [v20 defaultManager];
        [v21 removeItemAtPath:v13 error:0];
      }

      objc_end_catch();
      JUMPOUT(0x1CAA23098);
    }
    uint64_t v23 = pp_events_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      a11 = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEBUG, "Exception we're not catching", (uint8_t *)&a11, 2u);
    }

    objc_exception_throw(v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PPM2AttributedFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 8u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_69;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_71;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_69:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_71:
          uint64_t v53 = 56;
          goto LABEL_88;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_75:
          uint64_t v53 = 16;
          goto LABEL_88;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 4u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_79:
          uint64_t v53 = 32;
          goto LABEL_88;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 8;
          goto LABEL_60;
        case 5u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 24;
          goto LABEL_60;
        case 6u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 48;
          goto LABEL_60;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 0x10u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v3_Block_object_dispose(&STACK[0x2A0], 8) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_83:
          uint64_t v53 = 60;
          goto LABEL_88;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 2u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_87:
          uint64_t v53 = 20;
LABEL_88:
          *(_DWORD *)(a1 + v53) = v19;
          continue;
        case 9u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 40;
LABEL_60:
          uint64_t v46 = *(void **)(a1 + v35);
          *(void *)(a1 + v35) = v34;

          continue;
        case 0xAu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *(unsigned char *)(a1 + 68) |= 0x20u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v50 = *v3;
        unint64_t v51 = *(void *)(a2 + v50);
        if (v51 == -1 || v51 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
        *(void *)(a2 + v50) = v51 + 1;
        v49 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0) {
          goto LABEL_92;
        }
        v47 += 7;
        BOOL v14 = v48++ >= 9;
        if (v14)
        {
          uint64_t v49 = 0;
          goto LABEL_94;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_92:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v49 = 0;
      }
LABEL_94:
      *(unsigned char *)(a1 + 64) = v49 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledSocialProfileReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_24:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, double a2)
{
  *(double *)this = a2;
  *((unsigned char *)this + 16) = 0;
}

{
  *(double *)this = a2;
  *((unsigned char *)this + 16) = 0;
}

void *std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v6 + _Block_object_dispose(&STACK[0x2A0], 8) = 0u;
  *(void *)uint64_t v6 = &unk_1F2539B18;
  *((void *)v6 + 3) = 0;
  *((_OWORD *)v6 + 2) = 0u;
  uint64_t result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((void *)v6 + 3, a2, a3, (a3 - (uint64_t)a2) >> 2);
  *a1 = v6 + 24;
  a1[1] = v6;
  return result;
}

void sub_1CAA270D0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t PPScoreInterpreterValue::PPScoreInterpreterValue(uint64_t a1, void *a2)
{
  arrayToFloatVector(v5, a2);
  id v3 = v5[0];
  std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>((void *)a1, v5[0], (uint64_t)v5[1]);
  *(unsigned char *)(a1 + 16) = 1;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

{
  char *v3;
  char *v5[3];

  arrayToFloatVector(v5, a2);
  id v3 = v5[0];
  std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>((void *)a1, v5[0], (uint64_t)v5[1]);
  *(unsigned char *)(a1 + 16) = 1;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void sub_1CAA27140(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void arrayToFloatVector(char **a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  id v22 = v3;
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 >> 62) {
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v4);
    long long v7 = &v5[4 * v6];
    *a1 = v5;
    a1[1] = v5;
    a1[2] = v7;
  }
  else
  {
    long long v7 = 0;
    uint64_t v5 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v22;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) floatValue];
        int v14 = v13;
        if (v11 >= v7)
        {
          uint64_t v15 = (v11 - v5) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
          }
          if ((v7 - v5) >> 1 > v16) {
            unint64_t v16 = (v7 - v5) >> 1;
          }
          if ((unint64_t)(v7 - v5) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = (char *)(v17 + 4 * v15);
          *(_DWORD *)uint64_t v19 = v14;
          uint64_t v20 = v19 + 4;
          while (v11 != v5)
          {
            int v21 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v19 - 1) = v21;
            v19 -= 4;
          }
          long long v7 = (char *)(v17 + 4 * v18);
          *a1 = v19;
          a1[1] = v20;
          a1[2] = v7;
          if (v5) {
            operator delete(v5);
          }
          uint64_t v5 = v19;
          uint64_t v11 = v20;
        }
        else
        {
          *(_DWORD *)uint64_t v11 = v13;
          v11 += 4;
        }
        a1[1] = v11;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
}

void sub_1CAA27354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  int v13 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + _Block_object_dispose(&STACK[0x2A0], 8) = v13;
    operator delete(v13);
  }

  _Unwind_Resume(a1);
}

void sub_1CAA273F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, NSObject *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  *((unsigned char *)this + 16) = 2;
  if (v3) {
    uint64_t v5 = v3;
  }
  *(void *)this = v4;
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this)
{
  *((unsigned char *)this + 16) = 3;
}

{
  *((unsigned char *)this + 16) = 3;
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, const PPScoreInterpreterValue *a2)
{
  int v3 = *((unsigned __int8 *)a2 + 16);
  *((unsigned char *)this + 16) = v3;
  switch(v3)
  {
    case 0:
      *(void *)this = *(void *)a2;
      break;
    case 1:
      uint64_t v6 = *((void *)a2 + 1);
      *(void *)this = *(void *)a2;
      *((void *)this + 1) = v6;
      if (v6) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
      }
      break;
    case 2:
      long long v7 = *(const void **)a2;
      if (*(void *)a2)
      {
        *(void *)this = v7;
        CFRetain(v7);
      }
      else
      {
        *(void *)this = 0;
      }
      break;
    case 3:
      return;
    default:
      unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"PPScoreInterpreterValue::PPScoreInterpreterValue(const PPScoreInterpreterValue &)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPScoreInterpreterValue.mm", 87, @"Invalid valueType of %d in copy constructor", *((unsigned __int8 *)this + 16));

      break;
  }
}

uint64_t *swap(uint64_t *result, PPScoreInterpreterValue *a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v3 = result[1];
  result[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  LOBYTE(v3) = *((unsigned char *)result + 16);
  *((unsigned char *)result + 16) = *((unsigned char *)a2 + 16);
  *((unsigned char *)a2 + 16) = v3;
  return result;
}

uint64_t *PPScoreInterpreterValue::PPScoreInterpreterValue(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)result + 16) = 3;
  uint64_t v2 = *result;
  *uint64_t result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  *((unsigned char *)result + 16) = *((unsigned char *)a2 + 16);
  *((unsigned char *)a2 + 16) = 3;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  *((unsigned char *)result + 16) = 3;
  uint64_t v2 = *result;
  *uint64_t result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  *((unsigned char *)result + 16) = *((unsigned char *)a2 + 16);
  *((unsigned char *)a2 + 16) = 3;
  return result;
}

uint64_t *PPScoreInterpreterValue::operator=(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  LOBYTE(v3) = *((unsigned char *)result + 16);
  *((unsigned char *)result + 16) = *((unsigned char *)a2 + 16);
  *((unsigned char *)a2 + 16) = v3;
  return result;
}

void PPScoreInterpreterValue::~PPScoreInterpreterValue(PPScoreInterpreterValue *this)
{
  switch(*((unsigned char *)this + 16))
  {
    case 0:
    case 3:
      return;
    case 1:
      uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
      *(void *)this = 0;
      *((void *)this + 1) = 0;
      if (v2) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v2);
      }
      break;
    case 2:
      uint64_t v5 = *(const void **)this;
      if (*(void *)this) {
        CFRelease(v5);
      }
      break;
    default:
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v4 = [NSString stringWithUTF8String:"PPScoreInterpreterValue::~PPScoreInterpreterValue()"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPScoreInterpreterValue.mm", 124, @"Invalid PPScoreInterpreterValueType of %d in destructor", *((unsigned __int8 *)this + 16));

      break;
  }
}

double PPScoreInterpreterValue::getDouble(PPScoreInterpreterValue *this)
{
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"double PPScoreInterpreterValue::getDouble() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPScoreInterpreterValue.mm", 131, @"Invalid valueType of %d in getDouble", *((unsigned __int8 *)this + 16));
  }
  return *(double *)this;
}

void sub_1CAA277FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PPScoreInterpreterValue::getFloatVector(PPScoreInterpreterValue *this@<X0>, void *a2@<X8>)
{
  if (*((unsigned char *)this + 16) != 1)
  {
    unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"std::shared_ptr<std::vector<float>> PPScoreInterpreterValue::getFloatVector() const"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPScoreInterpreterValue.mm", 138, @"Invalid valueType of %d in getFloatVector", *((unsigned __int8 *)this + 16));
  }
  uint64_t v6 = *((void *)this + 1);
  *a2 = *(void *)this;
  a2[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_1CAA278D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PPScoreInterpreterValue::getNumericArray(PPScoreInterpreterValue *this)
{
  if (*((unsigned char *)this + 16) != 1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"NSArray<NSNumber *> *PPScoreInterpreterValue::getNumericArray() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPScoreInterpreterValue.mm", 145, @"Invalid valueType of %d in getNumericArray", *((unsigned __int8 *)this + 16));
  }
  unint64_t v4 = *(void **)this;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(v4[1] - *v4) >> 2];
  long long v7 = (_DWORD *)*v4;
  id v8 = (_DWORD *)v4[1];
  if ((_DWORD *)*v4 != v8)
  {
    do
    {
      LODWORD(v6) = *v7;
      uint64_t v9 = [NSNumber numberWithFloat:v6];
      [v5 addObject:v9];

      ++v7;
    }
    while (v7 != v8);
  }
  uint64_t v10 = (void *)[v5 copy];

  return v10;
}

void sub_1CAA27A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PPScoreInterpreterValue::getObject(PPScoreInterpreterValue *this)
{
  if (*((unsigned char *)this + 16) != 2)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"NSObject *PPScoreInterpreterValue::getObject() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPScoreInterpreterValue.mm", 152, @"Invalid valueType of %d in getObject", *((unsigned __int8 *)this + 16));
  }
  unint64_t v4 = *(void **)this;
  return v4;
}

void sub_1CAA27AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA27F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4418(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4419(uint64_t a1)
{
}

void sub_1CAA2B3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4587(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4588(uint64_t a1)
{
}

void sub_1CAA2C8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4751(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4752(uint64_t a1)
{
}

uint64_t PPPBMusicDataCollectionRecordReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 68) |= 0x10u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_53;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_55:
          uint64_t v46 = 64;
          goto LABEL_64;
        case 2u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 32;
          goto LABEL_37;
        case 3u:
          *(unsigned char *)(a1 + 68) |= 2u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v47 = 16;
          goto LABEL_69;
        case 4u:
          *(unsigned char *)(a1 + 68) |= 1u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v47 = 8;
LABEL_69:
          *(void *)(a1 + v47) = v30;
          continue;
        case 5u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 56;
          goto LABEL_37;
        case 6u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 40;
LABEL_37:
          char v33 = *(void **)(a1 + v27);
          *(void *)(a1 + v27) = v26;

          continue;
        case 7u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 68) |= 8u;
          while (2)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v38;
              v20 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v15 = v35++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_59:
          uint64_t v46 = 48;
          goto LABEL_64;
        case 8u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 68) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v42 = *v3;
        uint64_t v43 = *(void *)(a2 + v42);
        unint64_t v44 = v43 + 1;
        if (v43 == -1 || v44 > *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
        *(void *)(a2 + v42) = v44;
        v20 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0) {
          goto LABEL_61;
        }
        v40 += 7;
        BOOL v15 = v41++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_63;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_63:
      uint64_t v46 = 24;
LABEL_64:
      *(_DWORD *)(a1 + v46) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA2F968(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5139(uint64_t a1)
{
}

void sub_1CAA2FD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA3010C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA30414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA306EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA30A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA31990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA32BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA344CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA34B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1CAA353B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA35874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA35ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1CAA36D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA37974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA37EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA385F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackLogReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        unint64_t v17 = objc_alloc_init(PPPBFeedbackMetadata);
        objc_storeStrong((id *)(a1 + 32), v17);
        if PBReaderPlaceMark() && (PPPBFeedbackMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_39;
        }
        goto LABEL_49;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 64) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_46:
        *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2A0], 8) = v21;
        goto LABEL_47;
      case 3u:
        unint64_t v17 = objc_alloc_init(PPPBScoredItemWithFeatures);
        [(id)a1 addScoredItems:v17];
        if (!PBReaderPlaceMark() || (PPPBScoredItemWithFeaturesReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_39;
      case 4u:
        unint64_t v17 = objc_alloc_init(PPPBExtractedDonationRecord);
        [(id)a1 addExtractedDonations:v17];
        if (!PBReaderPlaceMark() || (PPPBExtractedDonationRecordReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_39;
      case 5u:
        unint64_t v17 = objc_alloc_init(PPPBExperimentalGroup);
        [(id)a1 addExperimentalGroups:v17];
        if (PBReaderPlaceMark() && PPPBExperimentalGroupReadFrom((uint64_t)v17, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_47:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_49:

        return 0;
      case 6u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 40;
        goto LABEL_42;
      case 7u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 8;
LABEL_42:
        uint64_t v27 = *(void **)(a1 + v26);
        *(void *)(a1 + v26) = v25;

        goto LABEL_47;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_47;
    }
  }
}

void sub_1CAA3C4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5731(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5732(uint64_t a1)
{
}

void sub_1CAA3D258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA3E714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__5881(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5882(uint64_t a1)
{
}

void sub_1CAA3F638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA3FBE8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(a1);
    objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(v2 - 120) + 80) + 8) + 40), v3);
    objc_end_catch();
    JUMPOUT(0x1CAA3FB58);
  }
  _Unwind_Resume(a1);
}

void sub_1CAA40CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5984(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5985(uint64_t a1)
{
}

void sub_1CAA411EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA42D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA44E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA45870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1CAA46D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA46F4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAA48DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PPPBScoredItemWithFeaturesReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_41;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_43:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v20;
        goto LABEL_46;
      case 2u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 32;
        goto LABEL_39;
      case 3u:
        *(unsigned char *)(a1 + 52) |= 2u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
        {
          int v30 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v30 = 0;
        }
        *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2A0], 8) = v30;
        goto LABEL_46;
      case 4u:
        uint64_t v31 = objc_alloc_init(PPPBFeatureIdFeatureValuePair);
        [(id)a1 addFeatures:v31];
        if (!PBReaderPlaceMark() || (PPPBFeatureIdFeatureValuePairReadFrom((uint64_t)v31, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_37;
      case 5u:
        uint64_t v31 = objc_alloc_init(PPPBFeedbackItem);
        [(id)a1 addFeedbackItems:v31];
        if PBReaderPlaceMark() && (PPPBFeedbackItemReadFrom((uint64_t)v31, a2))
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_46:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_48:

        return 0;
      case 6u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 40;
LABEL_39:
        uint64_t v32 = *(void **)(a1 + v27);
        *(void *)(a1 + v27) = v26;

        goto LABEL_46;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_46;
    }
  }
}

void sub_1CAA4B028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6265(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6266(uint64_t a1)
{
}

void sub_1CAA4F068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6511(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6512(uint64_t a1)
{
}

void sub_1CAA4F1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA4FB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6584(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6585(uint64_t a1)
{
}

void sub_1CAA4FF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA50C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

id mergeDeduping(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v3 count];
  uint64_t v25 = sortedEvents(v4);

  long long v7 = sortedEvents(v3);

  if (!v5)
  {
    uint64_t v22 = v7;
LABEL_25:
    unsigned int v19 = (void *)[v22 mutableCopy];
    goto LABEL_28;
  }
  if (!v6)
  {
    uint64_t v22 = v25;
    goto LABEL_25;
  }
  char v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v25, "count"));
  char v8 = 0;
  unsigned int v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  do
  {
    unint64_t v13 = v10;
    char v14 = v9;
    unint64_t v10 = objc_msgSend(v25, "objectAtIndexedSubscript:", v12, v24);

    unsigned int v9 = [v7 objectAtIndexedSubscript:v11];

    if (eventCompare(v10, v9) == -1)
    {
      if ((isDupe(v10, v8) & 1) == 0)
      {
        [v24 addObject:v10];
        id v16 = v10;

        char v8 = v16;
      }
      ++v12;
    }
    else
    {
      if ((isDupe(v9, v8) & 1) == 0)
      {
        [v24 addObject:v9];
        id v15 = v9;

        char v8 = v15;
      }
      ++v11;
    }
  }
  while (v12 < v5 && v11 < v6);
  if (v12 < v5)
  {
    do
    {
      unint64_t v17 = v10;
      unint64_t v10 = [v25 objectAtIndexedSubscript:v12];

      if ((isDupe(v10, v8) & 1) == 0)
      {
        [v24 addObject:v10];
        id v18 = v10;

        char v8 = v18;
      }
      ++v12;
    }
    while (v5 != v12);
  }
  if (v11 >= v6)
  {
    unsigned int v19 = v24;
  }
  else
  {
    unsigned int v19 = v24;
    do
    {
      uint64_t v20 = v9;
      unsigned int v9 = [v7 objectAtIndexedSubscript:v11];

      if ((isDupe(v9, v8) & 1) == 0)
      {
        [v24 addObject:v9];
        id v21 = v9;

        char v8 = v21;
      }
      ++v11;
    }
    while (v6 != v11);
  }

LABEL_28:
  return v19;
}

void sub_1CAA514F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sortedEvents(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ((unint64_t)[v1 count] >= 2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = 0;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v2);
          }
          char v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v5)
          {
            if (eventCompare(v5, v8) == 1)
            {
              unsigned int v9 = (void *)MEMORY[0x1CB79D060](1);
              unint64_t v10 = objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_119, (void)v12);

              goto LABEL_17;
            }
          }
          else
          {
            id v5 = v8;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
    else
    {
      id v5 = 0;
    }
  }
  unint64_t v10 = objc_msgSend(v1, "copy", (void)v12);
LABEL_17:

  return v10;
}

uint64_t eventCompare(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 compareStartDateWithEvent:v4];
  if (!v5)
  {
    uint64_t v6 = [v3 eventIdentifier];
    long long v7 = [v4 eventIdentifier];
    uint64_t v5 = [v6 compare:v7];
  }
  return v5;
}

uint64_t isDupe(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectID];
    long long v7 = [v3 objectID];
    if ([v6 isEqual:v7])
    {
      char v8 = [v5 startDate];
      unsigned int v9 = [v3 startDate];
      uint64_t v10 = [v8 isEqual:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __sortedEvents_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return eventCompare(a2, a3);
}

uint64_t PPPBMusicDataCollectionArrayReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(PPPBMusicDataCollectionRecord);
        [(id)a1 addRecords:v17];
        if PBReaderPlaceMark() && (PPPBMusicDataCollectionRecordReadFrom((uint64_t)v17, a2)) {
          goto LABEL_33;
        }
        goto LABEL_41;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if (v23 < 0)
            {
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_38:
        *(unsigned char *)(a1 + 32) = v20 != 0;
        goto LABEL_39;
      case 5u:
        uint64_t v17 = objc_alloc_init(PPPBExperimentalGroup);
        [(id)a1 addExperimentalGroups:v17];
        if (PBReaderPlaceMark() && PPPBExperimentalGroupReadFrom((uint64_t)v17, a2))
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      case 7u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v25;

        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

void sub_1CAA53DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__6804(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6805(uint64_t a1)
{
}

void sub_1CAA564E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

uint64_t __Block_byref_object_copy__6947(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6948(uint64_t a1)
{
}

void sub_1CAA69338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAA69AE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBContactNameRecordReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_49;
      case 2u:
        *(unsigned char *)(a1 + 144) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v23;
        goto LABEL_69;
      case 3u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 144) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v15 = v25++ >= 9;
              if (v15)
              {
                LOBYTE(v26) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LOBYTE(v26) = 0;
        }
LABEL_61:
        uint64_t v39 = 120;
        goto LABEL_66;
      case 4u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 144) |= 2u;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v26 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LOBYTE(v26) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LOBYTE(v26) = 0;
        }
LABEL_65:
        uint64_t v39 = 16;
LABEL_66:
        *(unsigned char *)(a1 + v39) = v26;
        goto LABEL_69;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_49;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
        goto LABEL_49;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_49;
      case 8u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_49;
      case 9u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 104;
        goto LABEL_49;
      case 0xAu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 56;
        goto LABEL_49;
      case 0xBu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96;
        goto LABEL_49;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 80;
        goto LABEL_49;
      case 0xDu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 48;
        goto LABEL_49;
      case 0xEu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 72;
LABEL_49:
        uint64_t v37 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_69;
      case 0xFu:
        unint64_t v38 = objc_alloc_init(PPPBContactRelatedName);
        [(id)a1 addRelatedNames:v38];
        if (PBReaderPlaceMark() && PPPBContactRelatedNameReadFrom((uint64_t)v38, a2))
        {
          PBReaderRecallMark();
LABEL_57:

LABEL_69:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0x10u:
        PBReaderReadString();
        unint64_t v38 = (PPPBContactRelatedName *)objc_claimAutoreleasedReturnValue();
        if (v38) {
          [(id)a1 addStreetNames:v38];
        }
        goto LABEL_57;
      case 0x11u:
        PBReaderReadString();
        unint64_t v38 = (PPPBContactRelatedName *)objc_claimAutoreleasedReturnValue();
        if (v38) {
          [(id)a1 addCityNames:v38];
        }
        goto LABEL_57;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_69;
    }
  }
}

void ***std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100](void ***result, void **a2)
{
  id v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    id v3 = v2;
    std::vector<std::shared_ptr<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    JUMPOUT(0x1CB79CB70);
  }
  return result;
}

void std::default_delete<std::vector<float>>::operator()[abi:ne180100](uint64_t a1)
{
  id v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1CB79CB70);
}

void std::vector<std::shared_ptr<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v1 = *a1;
  id v2 = (char *)**a1;
  if (v2)
  {
    id v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (std::__shared_weak_count *)*((void *)v4 - 1);
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        v4 -= 16;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1CAA6CB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6CCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6CEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6D7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6D9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6DB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6DC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6DCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6DE28(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_1CAA6E0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = *v11;
  if (*v11)
  {
    v10[1].__shared_owners_ = (uint64_t)v13;
    operator delete(v13);
  }
  std::__shared_weak_count::~__shared_weak_count(v10);
  operator delete(v14);

  _Unwind_Resume(a1);
}

void sub_1CAA6E25C(_Unwind_Exception *a1)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(a1);
}

void sub_1CAA6E39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA6E600(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);

  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __AssistantServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D68E0;
    uint64_t v8 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPSettings+AssistantServices.m", 18, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getAFPreferencesClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPSettings+AssistantServices.m", 19, @"Unable to find class %s", "AFPreferences");

LABEL_10:
    __break(1u);
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL isNontrivialString(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 length] != 0;

  return v2;
}

void sub_1CAA70444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8041(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8042(uint64_t a1)
{
}

void sub_1CAA7211C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t indexForPayload(NSString *a1, const unsigned __int8 *a2, int a3, unsigned int a4)
{
  long long v7 = a1;
  if ([(NSString *)v7 lengthOfBytesUsingEncoding:4] <= a4)
  {
    id v9 = [(NSString *)v7 stringByPaddingToLength:a4 withString:@" " startingAtIndex:0];
    uint64_t v10 = [v9 UTF8String];
    if (a3)
    {
      uint64_t v11 = (const void *)v10;
      int v12 = 0;
      uint64_t v8 = 0;
      while (memcmp(v11, &a2[v12], a4))
      {
        ++v8;
        v12 += a4;
        if (a3 == v8) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      uint64_t v8 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1CAA72234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA722F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA7250C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA72768(_Unwind_Exception *exception_object)
{
}

void sub_1CAA72DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PPContactLabelScoringMap()
{
  if (PPContactLabelScoringMap__pasOnceToken4 != -1) {
    dispatch_once(&PPContactLabelScoringMap__pasOnceToken4, &__block_literal_global_8253);
  }
  uint64_t v0 = (void *)PPContactLabelScoringMap__pasExprOnceResult;
  return v0;
}

void __PPContactLabelScoringMap_block_invoke()
{
  v35[14] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79D060]();
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v2 = *MEMORY[0x1E4F1B758];
  v34[0] = @"iPhone";
  v34[1] = @"Mobile";
  uint64_t v3 = *MEMORY[0x1E4F1B728];
  v35[0] = v2;
  v35[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1B720];
  v34[2] = @"Main";
  v34[3] = @"Pager";
  uint64_t v5 = *MEMORY[0x1E4F1B738];
  v35[2] = v4;
  v35[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1B710];
  v34[4] = @"HomeFax";
  v34[5] = @"WorkFax";
  uint64_t v7 = *MEMORY[0x1E4F1B750];
  v35[4] = v6;
  v35[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1B730];
  v34[6] = @"OtherFax";
  v34[7] = @"Home";
  uint64_t v9 = *MEMORY[0x1E4F1B6F8];
  v35[6] = v8;
  v35[7] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1B770];
  v34[8] = @"Work";
  v34[9] = @"School";
  uint64_t v11 = *MEMORY[0x1E4F1B760];
  v35[8] = v10;
  v35[9] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1B6F0];
  v34[10] = @"EmailiCloud";
  v34[11] = @"URLAddressHomePage";
  uint64_t v13 = *MEMORY[0x1E4F1B768];
  v35[10] = v12;
  v35[11] = v13;
  v34[12] = @"DateAnniversary";
  v34[13] = @"Other";
  uint64_t v14 = *MEMORY[0x1E4F1B700];
  v35[12] = *MEMORY[0x1E4F1B6E8];
  v35[13] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:14];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v16 = +[PPConfiguration sharedInstance];
  uint64_t v17 = [v16 contactsLabelScoringMap];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * v21);
        uint64_t v23 = +[PPConfiguration sharedInstance];
        char v24 = [v23 contactsLabelScoringMap];
        unsigned int v25 = [v24 objectForKeyedSubscript:v22];
        uint64_t v26 = [v15 objectForKeyedSubscript:v22];
        [v0 setObject:v25 forKeyedSubscript:v26];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }

  uint64_t v27 = (void *)PPContactLabelScoringMap__pasExprOnceResult;
  PPContactLabelScoringMap__pasExprOnceResult = (uint64_t)v0;
}

__CFString *PPRemovePhoneExtensionAndNonDigits(void *a1)
{
  id v1 = a1;
  uint64_t v2 = malloc_type_malloc([v1 length] + 1, 0x53208270uLL);
  CFStringRef v3 = (const __CFString *)v1;
  uint64_t v4 = (__CFString *)v3;
  uint64_t v5 = v2;
  if (v3)
  {
    memset(v26, 0, sizeof(v26));
    CFIndex Length = CFStringGetLength(v3);
    CFStringRef theString = v4;
    uint64_t v30 = 0;
    CFIndex v31 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v4);
    CStringPtr = 0;
    uint64_t v28 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    }
    int64_t v32 = 0;
    int64_t v33 = 0;
    uint64_t v5 = v2;
    long long v29 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v9 = 0;
      int64_t v10 = 0;
      BOOL v11 = 0;
      uint64_t v12 = 64;
      uint64_t v5 = v2;
      do
      {
        if ((unint64_t)v10 >= 4) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = v10;
        }
        CFIndex v14 = v31;
        if (v31 <= v10)
        {
          UniChar v15 = 0;
        }
        else if (v28)
        {
          UniChar v15 = v28[v10 + v30];
        }
        else if (v29)
        {
          UniChar v15 = v29[v30 + v10];
        }
        else
        {
          int64_t v16 = v32;
          if (v33 <= v10 || v32 > v10)
          {
            uint64_t v18 = v13 + v9;
            uint64_t v19 = v12 - v13;
            int64_t v20 = v10 - v13;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v31) {
              CFIndex v21 = v31;
            }
            int64_t v32 = v20;
            int64_t v33 = v21;
            if (v31 >= v19) {
              CFIndex v14 = v19;
            }
            v34.length = v14 + v18;
            v34.location = v20 + v30;
            CFStringGetCharacters(theString, v34, (UniChar *)v26);
            int64_t v16 = v32;
          }
          UniChar v15 = *((_WORD *)v26 + v10 - v16);
        }
        if (v11)
        {
          BOOL v11 = 1;
        }
        else if (v15 - 48 > 9)
        {
          BOOL v11 = v15 == 59;
        }
        else
        {
          BOOL v11 = 0;
          *v5++ = v15;
        }
        ++v10;
        --v9;
        ++v12;
      }
      while (Length != v10);
    }
  }

  unsigned char *v5 = 0;
  uint64_t v22 = (__CFString *)[[NSString alloc] initWithUTF8String:v2];
  free(v2);
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = v4;
  }
  char v24 = v23;

  return v24;
}

void PPStringNormalizationTypeCheck(void *a1, unsigned char *a2, unsigned char *a3)
{
  CFStringRef v5 = a1;
  uint64_t v6 = (__CFString *)v5;
  if (v5)
  {
    memset(v24, 0, sizeof(v24));
    CFIndex Length = CFStringGetLength(v5);
    CFStringRef theString = v6;
    uint64_t v28 = 0;
    CFIndex v29 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v6);
    CStringPtr = 0;
    uint64_t v26 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
    }
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v27 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 64;
      while (1)
      {
        uint64_t v14 = (unint64_t)v12 >= 4 ? 4 : v12;
        CFIndex v15 = v29;
        if (v29 <= v12)
        {
          UniChar v16 = 0;
        }
        else if (v26)
        {
          UniChar v16 = v26[v12 + v28];
        }
        else if (v27)
        {
          UniChar v16 = v27[v28 + v12];
        }
        else
        {
          if (v31 <= v12 || v11 > v12)
          {
            uint64_t v20 = v14 + v10;
            uint64_t v21 = v13 - v14;
            uint64_t v22 = v12 - v14;
            CFIndex v23 = v22 + 64;
            if (v22 + 64 >= v29) {
              CFIndex v23 = v29;
            }
            uint64_t v30 = v22;
            uint64_t v31 = v23;
            if (v29 >= v21) {
              CFIndex v15 = v21;
            }
            v32.length = v15 + v20;
            v32.location = v22 + v28;
            CFStringGetCharacters(theString, v32, (UniChar *)v24);
            uint64_t v11 = v30;
          }
          UniChar v16 = *((_WORD *)v24 + v12 - v11);
        }
        int v17 = *a3;
        if (!*a3 && v16 - 48 <= 9) {
          break;
        }
        int v18 = *a2;
        if (!*a2 && v16 == 64)
        {
          int v18 = 1;
          *a2 = 1;
          int v17 = *a3;
        }
        if (v17) {
          goto LABEL_20;
        }
LABEL_21:
        ++v12;
        --v10;
        ++v13;
        if (Length == v12) {
          goto LABEL_35;
        }
      }
      *a3 = 1;
      int v18 = *a2;
LABEL_20:
      if (v18) {
        goto LABEL_35;
      }
      goto LABEL_21;
    }
  }
LABEL_35:
}

id PPNormalizePhoneNumber(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  CFStringRef v3 = [v2 countryCode];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v5 = [v6 objectForKey:*MEMORY[0x1E4F1C400]];
  }
  uint64_t v7 = CFPhoneNumberCreate();
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    String = (void *)CFPhoneNumberCreateString();
    CFRelease(v8);
  }
  else
  {
    String = PPRemovePhoneExtensionAndNonDigits(v1);
  }

  return String;
}

id PPNormalizeEmailAddress(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1CB79D060]();
  CFStringRef v3 = [a1 lowercaseString];
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  id v5 = v3;
  uint64_t v6 = [v5 length];
  if (v6)
  {
    uint64_t v7 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    if (!v7)
    {
      id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v30);
    }
    uint64_t v8 = v7;
    CFStringRef v9 = (const __CFString *)v5;
    uint64_t v10 = (__CFString *)v9;
    if (v9)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v33 = 0u;
      CFIndex Length = CFStringGetLength(v9);
      CFStringRef theString = v10;
      uint64_t v43 = 0;
      CFIndex v44 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v10);
      CStringPtr = 0;
      unsigned int v41 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
      }
      uint64_t v31 = v10;
      int64_t v45 = 0;
      int64_t v46 = 0;
      uint64_t v42 = CStringPtr;
      if (Length < 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        int64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 64;
        do
        {
          if ((unint64_t)v15 >= 4) {
            uint64_t v18 = 4;
          }
          else {
            uint64_t v18 = v15;
          }
          CFIndex v19 = v44;
          if (v44 <= v15)
          {
            UniChar v20 = 0;
          }
          else if (v41)
          {
            UniChar v20 = v41[v15 + v43];
          }
          else if (v42)
          {
            UniChar v20 = v42[v43 + v15];
          }
          else
          {
            int64_t v21 = v45;
            if (v46 <= v15 || v45 > v15)
            {
              uint64_t v23 = v18 + v14;
              uint64_t v24 = v17 - v18;
              int64_t v25 = v15 - v18;
              CFIndex v26 = v25 + 64;
              if (v25 + 64 >= v44) {
                CFIndex v26 = v44;
              }
              int64_t v45 = v25;
              int64_t v46 = v26;
              if (v44 >= v24) {
                CFIndex v19 = v24;
              }
              v48.length = v19 + v23;
              v48.location = v25 + v43;
              CFStringGetCharacters(theString, v48, buffer);
              int64_t v21 = v45;
            }
            UniChar v20 = buffer[v15 - v21];
          }
          if (!CFCharacterSetIsCharacterMember(Predefined, v20)) {
            v8[v16++] = v20;
          }
          ++v15;
          --v14;
          ++v17;
        }
        while (Length != v15);
      }
      uint64_t v10 = v31;
    }
    else
    {
      uint64_t v16 = 0;
    }

    id v27 = (id)[[NSString alloc] initWithCharactersNoCopy:v8 length:v16 freeWhenDone:1];
  }
  else
  {
    id v27 = v5;
  }
  uint64_t v28 = v27;

  return v28;
}

id PPQuickTypeItemsForContacts(void *a1, void *a2, unsigned int a3, void *a4, unint64_t a5, char a6, void *a7)
{
  uint64_t v336 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v234 = a2;
  id v232 = a4;
  id v243 = a7;
  v228 = v11;
  if (![v11 count])
  {
    id v213 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_175;
  }
  v245 = objc_opt_new();
  uint64_t v12 = pp_contacts_log_handle();
  uint64_t v229 = a3;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v331 = a3;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "predictionForContact fields: %lu", buf, 0xCu);
  }

  long long v266 = 0u;
  long long v267 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  obuint64_t j = v11;
  uint64_t v233 = [obj countByEnumeratingWithState:&v264 objects:v315 count:16];
  if (v233)
  {
    uint64_t v231 = *(void *)v265;
    v246 = (void *)*MEMORY[0x1E4F1B810];
    unsigned int v242 = a3;
    do
    {
      for (uint64_t i = 0; i != v233; uint64_t i = v208 + 1)
      {
        if (*(void *)v265 != v231) {
          objc_enumerationMutation(obj);
        }
        uint64_t v239 = i;
        uint64_t v14 = *(void **)(*((void *)&v264 + 1) + 8 * i);
        uint64_t v238 = MEMORY[0x1CB79D060]();
        int64_t v15 = pp_contacts_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138739971;
          uint64_t v331 = (uint64_t)v14;
          _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "predictionForContact contact: %{sensitive}@", buf, 0xCu);
        }

        uint64_t v16 = [v14 contact];
        int v17 = [v16 source];

        char v18 = v17 == 1;
        if (v17 == 2) {
          char v18 = 2;
        }
        char v256 = v18;
        id v257 = v14;
        id v19 = v234;
        id v20 = v232;
        v237 = (void *)MEMORY[0x1CB79D060]();
        int64_t v21 = objc_opt_new();
        uint64_t v22 = objc_opt_new();
        uint64_t v23 = +[PPLabelMatcher sharedInstance];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = ___labelAndValueForContactFields_block_invoke;
        aBlock[3] = &unk_1E65D69F0;
        id v235 = v23;
        id v309 = v235;
        id v236 = v19;
        id v310 = v236;
        id v250 = v20;
        id v311 = v250;
        id v240 = v22;
        id v312 = v240;
        id v241 = v21;
        id v313 = v241;
        uint64_t v24 = (void (**)(void *, void *, void *, uint64_t, double))_Block_copy(aBlock);
        int64_t v25 = PPContactLabelScoringMap();
        if (a3)
        {
          long long v307 = 0u;
          long long v306 = 0u;
          long long v305 = 0u;
          long long v304 = 0u;
          CFIndex v26 = [v257 contact];
          id v27 = [v26 phoneNumbers];

          uint64_t v28 = [v27 countByEnumeratingWithState:&v304 objects:buf count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v305;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v305 != v30) {
                  objc_enumerationMutation(v27);
                }
                CFRange v32 = *(void **)(*((void *)&v304 + 1) + 8 * j);
                long long v33 = [v32 label];
                long long v34 = [v25 objectForKeyedSubscript:v33];
                [v34 doubleValue];
                double v36 = v35;

                long long v37 = [v32 label];
                long long v38 = [v32 value];
                v24[2](v24, v37, v38, 1, v36);
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v304 objects:buf count:16];
            }
            while (v29);
          }

          a3 = v242;
          if ((v242 & 2) == 0)
          {
LABEL_15:
            if ((a3 & 4) == 0) {
              goto LABEL_16;
            }
            goto LABEL_37;
          }
        }
        else if ((a3 & 2) == 0)
        {
          goto LABEL_15;
        }
        long long v302 = 0u;
        long long v303 = 0u;
        long long v300 = 0u;
        long long v301 = 0u;
        long long v39 = [v257 contact];
        char v40 = [v39 emailAddresses];

        uint64_t v41 = [v40 countByEnumeratingWithState:&v300 objects:v329 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v301;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v301 != v43) {
                objc_enumerationMutation(v40);
              }
              int64_t v45 = *(void **)(*((void *)&v300 + 1) + 8 * k);
              int64_t v46 = [v45 label];
              uint64_t v47 = [v25 objectForKeyedSubscript:v46];
              [v47 doubleValue];
              double v49 = v48;

              uint64_t v50 = [v45 label];
              unint64_t v51 = [v45 value];
              v24[2](v24, v50, v51, 2, v49);
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v300 objects:v329 count:16];
          }
          while (v42);
        }

        a3 = v242;
        if ((v242 & 4) == 0)
        {
LABEL_16:
          if ((a3 & 0x10) == 0) {
            goto LABEL_17;
          }
          goto LABEL_45;
        }
LABEL_37:
        long long v298 = 0u;
        long long v299 = 0u;
        long long v296 = 0u;
        long long v297 = 0u;
        char v52 = [v257 contact];
        uint64_t v53 = [v52 postalAddresses];

        uint64_t v54 = [v53 countByEnumeratingWithState:&v296 objects:v328 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v297;
          do
          {
            for (uint64_t m = 0; m != v55; ++m)
            {
              if (*(void *)v297 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v58 = *(void **)(*((void *)&v296 + 1) + 8 * m);
              unsigned int v59 = [v58 label];
              uint64_t v60 = [v25 objectForKeyedSubscript:v59];
              [v60 doubleValue];
              double v62 = v61;

              unint64_t v63 = [v58 label];
              char v64 = [v58 value];
              uint64_t v65 = [v250 formattedPostalAddress:v64];
              v24[2](v24, v63, v65, 4, v62);
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v296 objects:v328 count:16];
          }
          while (v55);
        }

        a3 = v242;
        if ((v242 & 0x10) == 0)
        {
LABEL_17:
          if ((a3 & 8) == 0) {
            goto LABEL_18;
          }
          goto LABEL_53;
        }
LABEL_45:
        long long v294 = 0u;
        long long v295 = 0u;
        long long v292 = 0u;
        long long v293 = 0u;
        unint64_t v66 = [v257 contact];
        uint64_t v67 = [v66 postalAddresses];

        uint64_t v68 = [v67 countByEnumeratingWithState:&v292 objects:v327 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v293;
          do
          {
            for (uint64_t n = 0; n != v69; ++n)
            {
              if (*(void *)v293 != v70) {
                objc_enumerationMutation(v67);
              }
              uint64_t v72 = *(void **)(*((void *)&v292 + 1) + 8 * n);
              uint64_t v73 = [v72 label];
              unint64_t v74 = [v25 objectForKeyedSubscript:v73];
              [v74 doubleValue];
              double v76 = v75;

              char v77 = [v72 label];
              unsigned int v78 = [v72 value];
              uint64_t v79 = [v78 locality];
              v24[2](v24, v77, v79, 16, v76);
            }
            uint64_t v69 = [v67 countByEnumeratingWithState:&v292 objects:v327 count:16];
          }
          while (v69);
        }

        a3 = v242;
        if ((v242 & 8) == 0)
        {
LABEL_18:
          if ((a3 & 0x20) == 0) {
            goto LABEL_19;
          }
          goto LABEL_61;
        }
LABEL_53:
        long long v290 = 0u;
        long long v291 = 0u;
        long long v288 = 0u;
        long long v289 = 0u;
        uint64_t v80 = [v257 contact];
        uint64_t v81 = [v80 postalAddresses];

        uint64_t v82 = [v81 countByEnumeratingWithState:&v288 objects:v326 count:16];
        if (v82)
        {
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v289;
          do
          {
            for (iuint64_t i = 0; ii != v83; ++ii)
            {
              if (*(void *)v289 != v84) {
                objc_enumerationMutation(v81);
              }
              uint64_t v86 = *(void **)(*((void *)&v288 + 1) + 8 * ii);
              uint64_t v87 = [v86 label];
              uint64_t v88 = [v25 objectForKeyedSubscript:v87];
              [v88 doubleValue];
              double v90 = v89;

              uint64_t v91 = [v86 label];
              id v92 = [v86 value];
              uint64_t v93 = [v92 thoroughfare];
              v24[2](v24, v91, v93, 8, v90);
            }
            uint64_t v83 = [v81 countByEnumeratingWithState:&v288 objects:v326 count:16];
          }
          while (v83);
        }

        a3 = v242;
        if ((v242 & 0x20) == 0)
        {
LABEL_19:
          if ((a3 & 0x100000) == 0) {
            goto LABEL_77;
          }
LABEL_69:
          long long v282 = 0u;
          long long v283 = 0u;
          long long v280 = 0u;
          long long v281 = 0u;
          id v108 = [v257 contact];
          uint64_t v109 = [v108 postalAddresses];

          uint64_t v110 = [v109 countByEnumeratingWithState:&v280 objects:v324 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            uint64_t v112 = *(void *)v281;
            do
            {
              for (juint64_t j = 0; jj != v111; ++jj)
              {
                if (*(void *)v281 != v112) {
                  objc_enumerationMutation(v109);
                }
                os_log_type_t v114 = *(void **)(*((void *)&v280 + 1) + 8 * jj);
                uint64_t v115 = [v114 label];
                uint64_t v116 = [v25 objectForKeyedSubscript:v115];
                [v116 doubleValue];
                double v118 = v117;

                int v119 = [v114 label];
                id v120 = [v114 value];
                uint64_t v121 = [v120 country];
                v24[2](v24, v119, v121, 0x100000, v118);
              }
              uint64_t v111 = [v109 countByEnumeratingWithState:&v280 objects:v324 count:16];
            }
            while (v111);
          }

          a3 = v242;
          goto LABEL_77;
        }
LABEL_61:
        long long v286 = 0u;
        long long v287 = 0u;
        long long v284 = 0u;
        long long v285 = 0u;
        id v94 = [v257 contact];
        unsigned int v95 = [v94 postalAddresses];

        uint64_t v96 = [v95 countByEnumeratingWithState:&v284 objects:v325 count:16];
        if (v96)
        {
          uint64_t v97 = v96;
          uint64_t v98 = *(void *)v285;
          do
          {
            for (kuint64_t k = 0; kk != v97; ++kk)
            {
              if (*(void *)v285 != v98) {
                objc_enumerationMutation(v95);
              }
              unsigned int v100 = *(void **)(*((void *)&v284 + 1) + 8 * kk);
              id v101 = [v100 label];
              uint64_t v102 = [v25 objectForKeyedSubscript:v101];
              [v102 doubleValue];
              double v104 = v103;

              uint64_t v105 = [v100 label];
              unsigned int v106 = [v100 value];
              unint64_t v107 = [v106 administrativeArea];
              v24[2](v24, v105, v107, 32, v104);
            }
            uint64_t v97 = [v95 countByEnumeratingWithState:&v284 objects:v325 count:16];
          }
          while (v97);
        }

        a3 = v242;
        if ((v242 & 0x100000) != 0) {
          goto LABEL_69;
        }
LABEL_77:
        v258 = v24;
        if ((a3 & 0x200000) != 0)
        {
          v249 = v25;
          long long v278 = 0u;
          long long v279 = 0u;
          long long v276 = 0u;
          long long v277 = 0u;
          v122 = [v257 contact];
          uint64_t v123 = [v122 postalAddresses];

          id v244 = v123;
          uint64_t v253 = [v123 countByEnumeratingWithState:&v276 objects:v323 count:16];
          if (v253)
          {
            id v247 = *(id *)v277;
            do
            {
              for (muint64_t m = 0; mm != v253; ++mm)
              {
                if (*(id *)v277 != v247) {
                  objc_enumerationMutation(v244);
                }
                unint64_t v125 = *(void **)(*((void *)&v276 + 1) + 8 * mm);
                uint64_t v126 = [v125 label];
                unint64_t v127 = [v249 objectForKeyedSubscript:v126];
                [v127 doubleValue];
                double v129 = v128;

                uint64_t v130 = [v125 label];
                v131 = [v125 value];
                v132 = [v131 locality];
                v322[0] = v132;
                v133 = [v125 value];
                v134 = [v133 administrativeArea];
                v322[1] = v134;
                v135 = [v125 value];
                v136 = [v135 country];
                v322[2] = v136;
                v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v322 count:3];
                v138 = objc_msgSend(v137, "_pas_componentsJoinedByString:", @"|");
                v258[2](v258, v130, v138, 0x200000, v129);
              }
              uint64_t v253 = [v244 countByEnumeratingWithState:&v276 objects:v323 count:16];
            }
            while (v253);
          }

          a3 = v242;
          uint64_t v24 = v258;
          int64_t v25 = v249;
          if ((v242 & 0x40) == 0)
          {
LABEL_79:
            if ((a3 & 0x80) == 0) {
              goto LABEL_80;
            }
            goto LABEL_103;
          }
        }
        else if ((a3 & 0x40) == 0)
        {
          goto LABEL_79;
        }
        long long v274 = 0u;
        long long v275 = 0u;
        long long v272 = 0u;
        long long v273 = 0u;
        v139 = [v257 contact];
        v140 = [v139 postalAddresses];

        uint64_t v141 = [v140 countByEnumeratingWithState:&v272 objects:v321 count:16];
        if (v141)
        {
          uint64_t v142 = v141;
          uint64_t v143 = *(void *)v273;
          do
          {
            for (nuint64_t n = 0; nn != v142; ++nn)
            {
              if (*(void *)v273 != v143) {
                objc_enumerationMutation(v140);
              }
              v145 = *(void **)(*((void *)&v272 + 1) + 8 * nn);
              v146 = [v145 label];
              v147 = [v25 objectForKeyedSubscript:v146];
              [v147 doubleValue];
              double v149 = v148;

              v150 = [v145 label];
              v151 = [v145 value];
              v152 = [v151 postalCode];
              v24[2](v24, v150, v152, 64, v149);
            }
            uint64_t v142 = [v140 countByEnumeratingWithState:&v272 objects:v321 count:16];
          }
          while (v142);
        }

        a3 = v242;
        if ((v242 & 0x80) == 0)
        {
LABEL_80:
          if ((a3 & 0x100) == 0) {
            goto LABEL_81;
          }
          goto LABEL_104;
        }
LABEL_103:
        v153 = [v257 contact];
        v154 = [v153 givenName];
        v24[2](v24, 0, v154, 128, 0.0);

        if ((a3 & 0x100) == 0)
        {
LABEL_81:
          if ((a3 & 0x200) == 0) {
            goto LABEL_82;
          }
          goto LABEL_105;
        }
LABEL_104:
        v155 = [v257 contact];
        v156 = [v155 familyName];
        v24[2](v24, 0, v156, 256, 0.0);

        if ((a3 & 0x200) == 0)
        {
LABEL_82:
          if ((a3 & 0x400000) == 0) {
            goto LABEL_83;
          }
          goto LABEL_106;
        }
LABEL_105:
        v157 = [v257 contact];
        v158 = [v157 localizedFullName];
        v24[2](v24, 0, v158, 512, 0.0);

        if ((a3 & 0x400000) == 0)
        {
LABEL_83:
          if ((a3 & 0x400) == 0) {
            goto LABEL_84;
          }
          goto LABEL_107;
        }
LABEL_106:
        v159 = [v257 contact];
        v160 = [v159 nickname];
        v24[2](v24, 0, v160, 0x400000, 0.0);

        if ((a3 & 0x400) == 0)
        {
LABEL_84:
          if ((a3 & 0x800) == 0) {
            goto LABEL_85;
          }
          goto LABEL_108;
        }
LABEL_107:
        v161 = [v257 contact];
        v162 = [v161 organizationName];
        v24[2](v24, 0, v162, 1024, 0.0);

        if ((a3 & 0x800) == 0)
        {
LABEL_85:
          if ((a3 & 0x2000) == 0) {
            goto LABEL_123;
          }
LABEL_113:
          long long v270 = 0u;
          long long v271 = 0u;
          long long v268 = 0u;
          long long v269 = 0u;
          v169 = [v257 contact];
          v170 = [v169 socialProfiles];

          id v248 = v170;
          uint64_t v171 = [v170 countByEnumeratingWithState:&v268 objects:v320 count:16];
          if (v171)
          {
            uint64_t v172 = v171;
            uint64_t v254 = *(void *)v269;
            do
            {
              for (uint64_t i1 = 0; i1 != v172; ++i1)
              {
                v174 = v25;
                if (*(void *)v269 != v254) {
                  objc_enumerationMutation(v248);
                }
                v175 = *(void **)(*((void *)&v268 + 1) + 8 * i1);
                v176 = (void *)MEMORY[0x1CB79D060]();
                v177 = [v175 value];
                v178 = [v175 label];
                v179 = [v178 lowercaseString];
                v180 = [v246 lowercaseString];
                int v181 = [v179 isEqualToString:v180];

                if (v181)
                {
                  uint64_t v182 = [@"@" stringByAppendingString:v177];

                  v177 = (void *)v182;
                }
                uint64_t v24 = v258;
                int64_t v25 = v174;
                v183 = [v175 label];
                v24[2](v24, v183, v177, 0x2000, 0.0);
              }
              uint64_t v172 = [v248 countByEnumeratingWithState:&v268 objects:v320 count:16];
            }
            while (v172);
          }

          uint64_t v184 = objc_opt_new();
          id v241 = (id)v184;
          a3 = v242;
          goto LABEL_123;
        }
LABEL_108:
        v163 = [v257 contact];
        v164 = [v163 birthday];
        v165 = [v250 formattedBirthday:v164];

        if ([v165 length]) {
          v24[2](v24, 0, v165, 2048, 0.0);
        }
        v166 = [v257 contact];
        v167 = [v166 nonGregorianBirthday];
        v168 = [v250 formattedBirthday:v167];

        if ([v168 length]) {
          v24[2](v24, 0, v168, 2048, 0.0);
        }

        if ((a3 & 0x2000) != 0) {
          goto LABEL_113;
        }
LABEL_123:
        v185 = pp_contacts_log_handle();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v316 = 138412546;
          id v317 = v240;
          __int16 v318 = 2112;
          id v319 = v241;
          _os_log_debug_impl(&dword_1CA9A8000, v185, OS_LOG_TYPE_DEBUG, "labelAndValueForPrediction: strong: %@  weak: %@", v316, 0x16u);
        }

        if ([v240 count]) {
          v186 = v240;
        }
        else {
          v186 = v241;
        }
        id v187 = v186;

        if ([v187 count])
        {
          long long v262 = 0u;
          long long v263 = 0u;
          long long v260 = 0u;
          long long v261 = 0u;
          v188 = v187;
          uint64_t v259 = [v188 countByEnumeratingWithState:&v260 objects:v314 count:16];
          if (v259)
          {
            id v251 = v187;
            uint64_t v255 = *(void *)v261;
            do
            {
              for (uint64_t i2 = 0; i2 != v259; ++i2)
              {
                if (*(void *)v261 != v255) {
                  objc_enumerationMutation(v188);
                }
                v190 = v188;
                v191 = *(void **)(*((void *)&v260 + 1) + 8 * i2);
                v192 = [v257 contact];
                v193 = [v192 localizedFullName];

                [v257 score];
                double v195 = v194;
                [v191 scoreBoost];
                double v197 = v195 * (v196 + 1.0);
                v198 = (void *)MEMORY[0x1E4F89EE0];
                uint64_t v199 = [v191 label];
                v200 = (void *)v199;
                if (v199) {
                  v201 = (__CFString *)v199;
                }
                else {
                  v201 = &stru_1F253DF18;
                }
                v202 = [v191 value];
                uint64_t v203 = [v191 fields];
                v204 = [v257 contact];
                v205 = [v204 identifier];
                BYTE2(v226) = v256;
                BYTE1(v226) = a6;
                LOBYTE(v226) = 0;
                v206 = objc_msgSend(v198, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v201, v202, v193, 0, v203, 0, v197, 0, -1, v226, v205);

                if (v206)
                {
                  [v245 addObject:v206];
                }
                else
                {
                  v207 = pp_contacts_log_handle();
                  if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1CA9A8000, v207, OS_LOG_TYPE_ERROR, "failed to create quick type item for contact", buf, 2u);
                  }

                  [v243 push:2];
                }
                v188 = v190;
              }
              uint64_t v259 = [v190 countByEnumeratingWithState:&v260 objects:v314 count:16];
            }
            while (v259);
            a3 = v242;
            v209 = (void *)v238;
            uint64_t v208 = v239;
            id v187 = v251;
          }
          else
          {
            v209 = (void *)v238;
            uint64_t v208 = v239;
          }
        }
        else
        {
          v188 = pp_contacts_log_handle();
          v209 = (void *)v238;
          if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
          {
            v210 = [v257 contact];
            v211 = [v210 identifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v331 = (uint64_t)v211;
            __int16 v332 = 2112;
            id v333 = v234;
            __int16 v334 = 2048;
            uint64_t v335 = v229;
            _os_log_impl(&dword_1CA9A8000, v188, OS_LOG_TYPE_INFO, "contact %@ did not have field: %@: %lu", buf, 0x20u);
          }
          uint64_t v208 = v239;
        }
      }
      uint64_t v233 = [obj countByEnumeratingWithState:&v264 objects:v315 count:16];
    }
    while (v233);
  }

  if (![obj count] || objc_msgSend(v245, "count")) {
    goto LABEL_155;
  }
  if (a3)
  {
    [v243 push:10];
LABEL_155:
    if (a3)
    {
      if (v234) {
        v214 = &__block_literal_global_9;
      }
      else {
        v214 = &__block_literal_global_7;
      }
      uint64_t v215 = deduplicateQuickTypeItems(v245, &__block_literal_global_86_8306, &__block_literal_global_89_8307, v214);

      v212 = (void *)v215;
    }
    else
    {
      v212 = v245;
    }
    if (a3 >= 2)
    {
      if (v234) {
        v216 = &__block_literal_global_9;
      }
      else {
        v216 = &__block_literal_global_7;
      }
      uint64_t v217 = deduplicateQuickTypeItems(v212, &__block_literal_global_91, &__block_literal_global_93_8308, v216);

      v212 = (void *)v217;
    }
    goto LABEL_167;
  }
  [v243 push:8];
  v212 = v245;
LABEL_167:
  [v212 sortWithOptions:16 usingComparator:&__block_literal_global_15];
  v218 = pp_contacts_log_handle();
  if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
  {
    uint64_t v219 = [v212 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v331 = v219;
    _os_log_impl(&dword_1CA9A8000, v218, OS_LOG_TYPE_INFO, "people quick type item count: %lu", buf, 0xCu);
  }

  if ([v212 count] <= a5)
  {
    v222 = v212;
  }
  else
  {
    v220 = (void *)MEMORY[0x1CB79D060]();
    v221 = objc_msgSend(v212, "subarrayWithRange:", 0, a5);
    v222 = (void *)[v221 mutableCopy];

    v223 = pp_contacts_log_handle();
    if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
    {
      uint64_t v224 = [v222 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v331 = v224;
      _os_log_impl(&dword_1CA9A8000, v223, OS_LOG_TYPE_INFO, "people quick type item count trimmed to limit: %lu", buf, 0xCu);
    }
  }
  id v213 = v222;

LABEL_175:
  return v213;
}

void ___labelAndValueForContactFields_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5)
{
  id v18 = a2;
  id v9 = a3;
  if (v9)
  {
    uint64_t v10 = PPCollapseWhitespaceAndStrip();
    uint64_t v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) matchFromLabel:*(void *)(a1 + 40) toLabel:v18];
      id v13 = v18;
      if (v13)
      {
        uint64_t v14 = v13;
        int64_t v15 = [*(id *)(a1 + 48) formattedStringForLabel:v13];
      }
      else
      {
        int64_t v15 = 0;
      }
      if (v12 == 1)
      {
        uint64_t v16 = *(void **)(a1 + 64);
      }
      else
      {
        if (v12 != 2)
        {
LABEL_11:

          goto LABEL_12;
        }
        uint64_t v16 = *(void **)(a1 + 56);
      }
      int v17 = +[PPQuickTypeLabeledValue labeledValueWithLabel:v15 value:v9 scoreBoost:a4 fields:a5];
      [v16 addObject:v17];

      goto LABEL_11;
    }
  }
LABEL_12:
}

id deduplicateQuickTypeItems(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  uint64_t v8 = a2;
  CFIndex v26 = a3;
  uint64_t v24 = a4;
  id v9 = objc_opt_new();
  if ([v7 count] == 1)
  {
    id v10 = v7;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v7;
    obuint64_t j = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = v8[2](v8, v15);
          if (v16)
          {
            int v17 = v26[2](v26, v16, v9);
            if (v17)
            {
              id v18 = [v9 objectForKeyedSubscript:v17];
              id v19 = v24[2](v24, v18, v15);
              [v9 setObject:v19 forKeyedSubscript:v16];

              if (([v16 isEqualToString:v17] & 1) == 0) {
                [v9 removeObjectForKey:v17];
              }
            }
            else
            {
              [v9 setObject:v15 forKeyedSubscript:v16];
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    id v20 = (void *)MEMORY[0x1CB79D060]();
    int64_t v21 = [v9 allValues];
    id v10 = (id)[v21 mutableCopy];

    id v7 = v23;
  }

  return v10;
}

uint64_t __PPQuickTypeItemsForContacts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F89FC8];
  [v4 score];
  double v8 = v7;
  [v5 score];
  uint64_t v10 = [v6 reverseCompareDouble:v8 withDouble:v9];
  if (!v10)
  {
    int v11 = [v4 source];
    int v12 = [v5 source];
    if (v11 != 1 || v12 == 1)
    {
      if (v12 != 1 || v11 == 1) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = -1;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }

  return v10;
}

id __deduplicateGenericQuickTypeItems_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 objectForKeyedSubscript:v4];

  if (v5) {
    id v5 = v4;
  }

  return v5;
}

id __deduplicateGenericQuickTypeItems_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  CFStringRef v3 = (void *)MEMORY[0x1CB79D060]();
  id v4 = [v2 value];
  id v5 = [v4 lowercaseString];

  return v5;
}

id preferredQuickTypeItemByLabelAndScore_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 label];
  if ([v6 length])
  {
    double v7 = [v5 label];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      id v9 = v4;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v10 = [v5 label];
  if ([v10 length])
  {
    int v11 = [v4 label];
    uint64_t v12 = [v11 length];

    if (!v12)
    {
      id v9 = v5;
      goto LABEL_10;
    }
  }
  else
  {
  }
  preferredQuickTypeItemByScore_block_invoke(v13, v4, v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  uint64_t v14 = v9;

  return v14;
}

id preferredQuickTypeItemByScore_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 source] != 1 || (int v6 = objc_msgSend(v5, "source"), v7 = v4, v6 == 1))
  {
    if ([v5 source] != 1 || (v8 = objc_msgSend(v4, "source"), double v7 = v5, v8 == 1))
    {
      [v4 score];
      double v10 = v9;
      [v5 score];
      if (v10 < v11) {
        double v7 = v5;
      }
      else {
        double v7 = v4;
      }
    }
  }
  id v12 = v7;

  return v12;
}

id __deduplicatePhoneQuickTypeItems_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int v6 = (void *)MEMORY[0x1CB79D060]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsString:", v12, (void)v15) & 1) != 0
          || ([v12 containsString:v4] & 1) != 0)
        {
          id v13 = v12;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v13 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_13:

  return v13;
}

id __deduplicatePhoneQuickTypeItems_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 fields])
  {
    int v6 = [v2 value];
    id v5 = PPRemovePhoneExtensionAndNonDigits(v6);
  }
  else
  {
    CFStringRef v3 = (void *)MEMORY[0x1CB79D060]();
    id v4 = [v2 value];
    id v5 = [v4 lowercaseString];
  }

  return v5;
}

id PPRelatedNamesForContact(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v18 = v1;
    id v19 = (id)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = [v1 contactRelations];
    uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v22) {
      goto LABEL_16;
    }
    uint64_t v21 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v3 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v4 = (void *)MEMORY[0x1CB79D060]();
        id v5 = [v3 value];
        uint64_t v6 = [v5 name];
        if (v6)
        {
          id v7 = (void *)v6;
          uint64_t v8 = [v3 value];
          uint64_t v9 = [v8 name];
          uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          double v11 = [v9 stringByTrimmingCharactersInSet:v10];
          char v12 = [v11 isEqualToString:&stru_1F253DF18];

          if (v12) {
            goto LABEL_14;
          }
          id v5 = [v3 value];
          id v13 = [v5 name];
          uint64_t v14 = [v3 label];
          long long v15 = (void *)v14;
          if (v14) {
            long long v16 = (__CFString *)v14;
          }
          else {
            long long v16 = @"unlabeled";
          }
          [v19 setObject:v13 forKey:v16];
        }
LABEL_14:
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v22)
      {
LABEL_16:

        id v1 = v18;
        goto LABEL_18;
      }
    }
  }
  id v19 = 0;
LABEL_18:

  return v19;
}

id PPStreetNamesForContact(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v16 = v1;
    id v17 = (id)objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = [v1 postalAddresses];
    uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v2) {
      goto LABEL_13;
    }
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v8 = [v6 value];
        uint64_t v9 = [v8 street];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          double v11 = [v6 value];
          char v12 = [v11 street];
          char v13 = [v12 isEqualToString:&stru_1F253DF18];

          if (v13) {
            goto LABEL_11;
          }
          uint64_t v8 = [v6 value];
          uint64_t v14 = [v8 street];
          [v17 addObject:v14];
        }
LABEL_11:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v3)
      {
LABEL_13:

        id v1 = v16;
        goto LABEL_15;
      }
    }
  }
  id v17 = 0;
LABEL_15:

  return v17;
}

id PPCityNamesForContact(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v15 = v1;
    id v16 = (id)objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = [v1 postalAddresses];
    uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v19) {
      goto LABEL_13;
    }
    uint64_t v18 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
        id v5 = [v3 value];
        uint64_t v6 = [v5 city];
        if (v6)
        {
          id v7 = (void *)v6;
          uint64_t v8 = [v3 value];
          uint64_t v9 = [v8 city];
          uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          double v11 = [v9 stringByTrimmingCharactersInSet:v10];
          char v12 = [v11 isEqualToString:&stru_1F253DF18];

          if (v12) {
            goto LABEL_11;
          }
          id v5 = [v3 value];
          char v13 = [v5 city];
          [v16 addObject:v13];
        }
LABEL_11:
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v19)
      {
LABEL_13:

        id v1 = v15;
        goto LABEL_15;
      }
    }
  }
  id v16 = 0;
LABEL_15:

  return v16;
}

id PPKeysToFetchPeople()
{
  if (PPKeysToFetchPeople__pasOnceToken16 != -1) {
    dispatch_once(&PPKeysToFetchPeople__pasOnceToken16, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)PPKeysToFetchPeople__pasExprOnceResult;
  return v0;
}

void __PPKeysToFetchPeople_block_invoke()
{
  v11[16] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v11[0] = *MEMORY[0x1E4F1AEB0];
  v11[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v11[2] = *MEMORY[0x1E4F1AEA0];
  v11[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEC0];
  v11[4] = *MEMORY[0x1E4F1AEB8];
  v11[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v11[6] = *MEMORY[0x1E4F1AEE0];
  v11[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AED8];
  v11[8] = *MEMORY[0x1E4F1AF10];
  v11[9] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AD90];
  v11[10] = *MEMORY[0x1E4F1AE78];
  v11[11] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEC8];
  v11[12] = *MEMORY[0x1E4F1AF78];
  v11[13] = v7;
  v11[14] = *MEMORY[0x1E4F1AFA8];
  uint64_t v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[15] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:16];
  uint64_t v10 = (void *)PPKeysToFetchPeople__pasExprOnceResult;
  PPKeysToFetchPeople__pasExprOnceResult = v9;
}

id PPFavoriteContacts()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  pthread_mutex_lock(&favoritesLock);
  id v1 = objc_alloc(MEMORY[0x1E4F1B9E8]);
  uint64_t v2 = PPSharedCNContactStore();
  uint64_t v3 = (void *)[v1 initWithContactStore:v2];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v16 = v3;
  uint64_t v4 = [v3 entries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
        id v11 = objc_alloc(MEMORY[0x1E4F89DD0]);
        char v12 = [v9 contactProperty];
        char v13 = [v12 contact];
        uint64_t v14 = (void *)[v11 initWithContactsContact:v13];
        [v0 addObject:v14];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  pthread_mutex_unlock(&favoritesLock);
  return v0;
}

id PPContactMeCardFromSource()
{
  uint64_t v0 = PPSharedCNContactStore();
  id v1 = PPKeysToFetchPeople();
  id v8 = 0;
  uint64_t v2 = [v0 _crossPlatformUnifiedMeContactWithKeysToFetch:v1 error:&v8];
  id v3 = v8;

  if (v2)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F89DD0]) initWithContactsContact:v2];
  }
  else
  {
    uint64_t v5 = pp_contacts_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "failed to load Me card from contacts framework", v7, 2u);
    }

    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"CN_CS", [v3 code]);
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t PPSocialHighlightContactReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 5) {
        break;
      }
      if (v17 != 4)
      {
        if (v17 != 2)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_47;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_41:
        BOOL v33 = v20 != 0;
        uint64_t v34 = 17;
        goto LABEL_46;
      }
      uint64_t v30 = PBReaderReadString();
      uint64_t v31 = *(void **)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v30;

LABEL_47:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v26 = 0;
    *(unsigned char *)(a1 + 20) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v26 |= (unint64_t)(v29 & 0x7F) << v24;
      if ((v29 & 0x80) == 0) {
        goto LABEL_43;
      }
      v24 += 7;
      BOOL v14 = v25++ >= 9;
      if (v14)
      {
        uint64_t v26 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v26 = 0;
    }
LABEL_45:
    BOOL v33 = v26 != 0;
    uint64_t v34 = 16;
LABEL_46:
    *(unsigned char *)(a1 + v34) = v33;
    goto LABEL_47;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA778D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA783A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7893C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__8524(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8525(uint64_t a1)
{
}

void sub_1CAA79748(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7B458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7C504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7D5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA7DDD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_1CAA7E7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CAA7ECCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__8792(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8793(uint64_t a1)
{
}

void sub_1CAA7FEC4(void *a1)
{
}

void sub_1CAA7FED4(_Unwind_Exception *a1)
{
}

void sub_1CAA7FFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA80230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA8040C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1CAA804F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CAA80698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA80768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAA80924(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1CAA82784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9006(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9007(uint64_t a1)
{
}

void sub_1CAA82EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAA83D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9135(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9136(uint64_t a1)
{
}

void sub_1CAA84F54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA853D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9177(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9178(uint64_t a1)
{
}

void sub_1CAA855E8(void *a1)
{
  id v3 = objc_begin_catch(a1);
  objc_storeStrong((id *)(*(void *)(*(void *)(v2 + 40) + 8) + 40), v3);
  *uint64_t v1 = 1;
  objc_end_catch();
  JUMPOUT(0x1CAA855C0);
}

void sub_1CAA85B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntitiesFilteredReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicsPerDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_39;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_41:
          uint64_t v32 = 20;
          goto LABEL_46;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_37;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          break;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
LABEL_37:
          uint64_t v31 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2FeedbackAtKReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 0x10u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_58;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_60;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_60:
          uint64_t v46 = 32;
          goto LABEL_77;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_64:
          uint64_t v46 = 24;
          goto LABEL_77;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_68:
          uint64_t v46 = 20;
          goto LABEL_77;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_72:
          uint64_t v46 = 28;
          goto LABEL_77;
        case 5u:
          uint64_t v39 = PBReaderReadString();
          char v40 = *(void **)(a1 + 8);
          *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v39;

          continue;
        case 6u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 == -1 || v44 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
        *(void *)(a2 + v43) = v44 + 1;
        v19 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0) {
          goto LABEL_74;
        }
        v41 += 7;
        BOOL v14 = v42++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_76;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_76:
      uint64_t v46 = 16;
LABEL_77:
      *(_DWORD *)(a1 + v46) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA88798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9673(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9674(uint64_t a1)
{
}

void sub_1CAA88A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA88CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PPM2UnmappedMatchedFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledPostalAddressReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_30;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_30;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_30;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_30;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_30;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_30;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_30;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_30;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_30:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          goto LABEL_31;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_31:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPStorableFeedbackReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1EA60E000uLL;
  unint64_t v8 = 0x1EA60E000uLL;
  unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
  unint64_t v10 = 0x1EA60E000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        a1[*(int *)(v7 + 2204)] |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v9) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)&a1[*(int *)(v8 + 2208)] = v23;
        goto LABEL_43;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        a1[*(int *)(v7 + 2204)] |= 2u;
        while (2)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v9) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              BOOL v18 = v26++ >= 9;
              if (v18)
              {
                LODWORD(v27) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_51:
        *(_DWORD *)&a1[*(int *)(v10 + 2212)] = v27;
        goto LABEL_43;
      case 3u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 24;
        goto LABEL_42;
      case 4u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 32;
        goto LABEL_42;
      case 5u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 48;
        goto LABEL_42;
      case 6u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        a1[*(int *)(v7 + 2204)] |= 4u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v9) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v18 = v35++ >= 9;
              if (v18)
              {
                uint64_t v36 = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v36 = 0;
        }
LABEL_55:
        a1[60] = v36 != 0;
        goto LABEL_43;
      case 7u:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = 16;
LABEL_42:
        char v41 = *(void **)&a1[v33];
        *(void *)&a1[v33] = v32;

        goto LABEL_43;
      case 8u:
        unint64_t v42 = v7;
        unint64_t v43 = v10;
        unint64_t v44 = v8;
        char v45 = objc_alloc_init(PPStorableFeedbackItem);
        [a1 addFeedbackItems:v45];
        if PBReaderPlaceMark() && (PPStorableFeedbackItemReadFrom((uint64_t)v45, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v44;
          unint64_t v10 = v43;
          unint64_t v7 = v42;
LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

uint64_t __Block_byref_object_copy__10156(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10157(uint64_t a1)
{
}

uint64_t PPM2DatabaseCheckViolationCountReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        char v25 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v24;
      }
      else
      {
        if (v17 == 2)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_43;
            }
            v26 += 7;
            BOOL v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_45:
          uint64_t v32 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_39;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_41:
          uint64_t v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void setGeoNavigationListenerFactoryForTesting(void *a1)
{
  id v1 = a1;
  __assert_rtn("setGeoNavigationListenerFactoryForTesting", "PPQuickTypeNavigationSupport.m", 31, "0");
}

id newGEONavigationListener()
{
  id v0 = objc_alloc(MEMORY[0x1E4F64770]);
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.Navigation.serialQueue", v2);
  uint64_t v4 = (void *)[v0 initWithQueue:v3];

  return v4;
}

uint64_t PPM2DatabaseRecordCountReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2NamedEntitySourceLanguageReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_45;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_45;
        case 3u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (2)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
              *(void *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_49:
          uint64_t v37 = 36;
          goto LABEL_58;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
              v21 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_53:
          uint64_t v37 = 32;
          goto LABEL_58;
        case 7u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_45:
          uint64_t v36 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v34 + 1;
        v21 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0) {
          goto LABEL_55;
        }
        v31 += 7;
        BOOL v14 = v32++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v21) = 0;
      }
LABEL_57:
      uint64_t v37 = 16;
LABEL_58:
      *(_DWORD *)(a1 + v37) = v21;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA90D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10724(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10725(uint64_t a1)
{
}

void sub_1CAA91600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAA91B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAA92870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__10864(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10865(uint64_t a1)
{
}

void sub_1CAA93038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10938(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10939(uint64_t a1)
{
}

void sub_1CAA93C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityInitialDonationReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v24;
      }
      else
      {
        if (v17 == 2)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_43;
            }
            v26 += 7;
            BOOL v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_45:
          uint64_t v32 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_39;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_41:
          uint64_t v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPPBContactRelatedNameReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA98C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11660(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11661(uint64_t a1)
{
}

void sub_1CAA99BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_1CAA9A2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11713(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11714(uint64_t a1)
{
}

Class __getSGRecordIdClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreSuggestionsLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D77F8;
    uint64_t v8 = 0;
    CoreSuggestionsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *CoreSuggestionsLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPContactStorage+FoundInApps.m", 29, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SGRecordId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSGRecordIdClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPContactStorage+FoundInApps.m", 30, @"Unable to find class %s", "SGRecordId");

LABEL_10:
    __break(1u);
  }
  getSGRecordIdClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSuggestionsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSuggestionsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t PPM2UniqueLocationsFoundReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAA9C82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11912(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11913(uint64_t a1)
{
}

uint64_t PPM2LocationsScoredReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_65;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_73:
          BOOL v57 = v28 != 0;
          uint64_t v58 = 30;
          goto LABEL_90;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 36) |= 0x20u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_77:
          BOOL v57 = v34 != 0;
          uint64_t v58 = 32;
          goto LABEL_90;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 36) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_81:
          BOOL v57 = v40 != 0;
          uint64_t v58 = 31;
          goto LABEL_90;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_85:
          BOOL v57 = v46 != 0;
          uint64_t v58 = 29;
          goto LABEL_90;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          break;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_65:
          uint64_t v56 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_87;
        }
        v50 += 7;
        BOOL v14 = v51++ >= 9;
        if (v14)
        {
          uint64_t v52 = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v52 = 0;
      }
LABEL_89:
      BOOL v57 = v52 != 0;
      uint64_t v58 = 28;
LABEL_90:
      *(unsigned char *)(a1 + v5_Block_object_dispose(&STACK[0x2A0], 8) = v57;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPPBExtractedDonationRecordReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_34;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
          goto LABEL_34;
        case 3u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v23;
          continue;
        case 4u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  uint64_t v26 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_45:
          uint64_t v38 = 16;
          goto LABEL_50;
        case 5u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
LABEL_34:
          char v31 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        uint64_t v35 = *(void *)(a2 + v34);
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v36;
        v26 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_47;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          uint64_t v26 = 0;
          goto LABEL_49;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v26 = 0;
      }
LABEL_49:
      uint64_t v38 = 24;
LABEL_50:
      *(void *)(a1 + v3_Block_object_dispose(&STACK[0x2A0], 8) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAA14D0(void *a1)
{
}

void sub_1CAAA1848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAA1CE0(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1CAAA1CF8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1CAAA1D04);
}

void sub_1CAAA1E6C(_Unwind_Exception *a1)
{
}

void sub_1CAAA1E8C(void *a1)
{
}

void sub_1CAAA23AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12767(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12768(uint64_t a1)
{
}

void sub_1CAAA27AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAA3090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 224), 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Block_object_dispose((const void *)(v69 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAA4848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1CAAA5364(void *a1)
{
}

void sub_1CAAA5374(_Unwind_Exception *a1)
{
}

void sub_1CAAA5698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13051(uint64_t a1)
{
}

id _PASValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v20[1] = &a9;
  unint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = a1;
  v20[0] = 0;
  unint64_t v13 = (void *)[[v10 alloc] initWithValidatedFormat:v12 validFormatSpecifiers:v11 locale:0 arguments:&a9 error:v20];

  id v14 = v20[0];
  if (!v13)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA00]);
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = *MEMORY[0x1E4F28A50];
    v22[0] = v14;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v18 = (void *)[v15 initWithName:v16 reason:@"An error occurred while formatting the string." userInfo:v17];

    [v18 raise];
  }

  return v13;
}

void sub_1CAAA6458(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA6668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA6808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA6914(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA6A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA6D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIntlUtilityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getIntlUtilityClass_softClass;
  uint64_t v7 = getIntlUtilityClass_softClass;
  if (!getIntlUtilityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIntlUtilityClass_block_invoke;
    v3[3] = &unk_1E65DC058;
    v3[4] = &v4;
    __getIntlUtilityClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CAAA7BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIntlUtilityClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __IntlPreferencesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D7C70;
    uint64_t v8 = 0;
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *IntlPreferencesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPQuickTypeFormatter.m", 26, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("IntlUtility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getIntlUtilityClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPQuickTypeFormatter.m", 27, @"Unable to find class %s", "IntlUtility");

LABEL_10:
    __break(1u);
  }
  getIntlUtilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntlPreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntlPreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1CAAA803C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA81A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA8364(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA8468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA856C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAAA87D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeatureIdFeatureValuePairReadFrom(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
        {
          int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v22 = 0;
        }
        *(_DWORD *)(a1 + 16) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t threadKey_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 domainIdentifier];
}

id senderKey_block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 sender];
  dispatch_queue_t v3 = [v2 handle];

  return v3;
}

uint64_t highlightIdentifierKey_block_invoke(uint64_t a1, void *a2)
{
  return [a2 highlightIdentifier];
}

__CFString *staticKeyBlock_block_invoke_3()
{
  return &stru_1F253DF18;
}

double domainAndSenderKey_block_invoke_21(uint64_t a1, void *a2)
{
  int v2 = [a2 isCollaboration];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

double domainAndSenderKey_block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = 0.0;
  if (([v2 fromMeEntitlementOverrideIsPresent] & 1) == 0)
  {
    uint64_t v4 = [v2 sender];
    if ([v4 isMe]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  return v3;
}

double domainAndSenderKey_block_invoke_19(uint64_t a1, void *a2)
{
  int v2 = [a2 isConversationAutoDonating];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

double domainAndSenderKey_block_invoke_18(uint64_t a1, void *a2)
{
  int v2 = [a2 groupPhotoPathDigest];
  if (v2) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

double domainAndSenderKey_block_invoke_17(uint64_t a1, void *a2)
{
  int v2 = [a2 displayName];
  if (v2) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

double domainAndSenderKey_block_invoke_16(uint64_t a1, void *a2)
{
  int v2 = [a2 highlightType];
  double result = 0.0;
  if (v2 == 2) {
    return 1.0;
  }
  return result;
}

double domainAndSenderKey_block_invoke_15(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 syndicationSecondsSinceReferenceDate];
  double v6 = v5;

  long long v7 = (void *)[v4 initWithTimeIntervalSinceReferenceDate:v6];
  [v7 timeIntervalSinceNow];
  double v9 = -v8;

  return v9;
}

double domainAndSenderKey_block_invoke_14(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 contentCreationSecondsSinceReferenceDate];
  double v6 = v5;

  long long v7 = (void *)[v4 initWithTimeIntervalSinceReferenceDate:v6];
  [v7 timeIntervalSinceNow];
  double v9 = -v8;

  return v9;
}

uint64_t __Block_byref_object_copy__13340(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13341(uint64_t a1)
{
}

uint64_t attributionIdentifierKey_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 attributionIdentifier];
}

id domainAndSenderKey_block_invoke_9(uint64_t a1, void *a2)
{
  int v2 = [a2 highlight];
  id v3 = [v2 attributionIdentifier];

  return v3;
}

id domainAndSenderKey_block_invoke_8(uint64_t a1, void *a2)
{
  int v2 = [a2 highlight];
  id v3 = [v2 highlightIdentifier];

  return v3;
}

id domainAndSenderKey_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resourceUrl];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
    double v5 = [v2 resourceUrl];
    id v3 = (void *)[v4 initWithString:v5];
  }
  double v6 = [v3 host];
  long long v7 = [v2 sender];
  double v8 = [v7 handle];

  double v9 = 0;
  if (v6 && v8)
  {
    unint64_t v10 = (void *)MEMORY[0x1CB79D060]();
    double v9 = (void *)[[NSString alloc] initWithFormat:@"%@\t%@", v6, v8];
  }

  return v9;
}

id domainAndSenderKey_block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 highlight];
  id v4 = [v3 resourceUrl];
  double v5 = [v4 host];

  double v6 = [v2 highlight];
  long long v7 = [v6 sender];
  double v8 = [v7 handle];

  double v9 = 0;
  if (v5 && v8)
  {
    unint64_t v10 = (void *)MEMORY[0x1CB79D060]();
    double v9 = (void *)[[NSString alloc] initWithFormat:@"%@\t%@", v5, v8];
  }

  return v9;
}

id domainKey_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resourceUrl];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
    double v5 = [v2 resourceUrl];
    id v3 = (void *)[v4 initWithString:v5];
  }
  double v6 = [v3 host];

  return v6;
}

id domainAndSenderKey_block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 highlight];
  id v3 = [v2 resourceUrl];
  id v4 = [v3 host];

  return v4;
}

id domainAndSenderKey_block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = [a2 highlight];
  id v3 = [v2 sender];
  id v4 = [v3 handle];

  return v4;
}

id domainAndSenderKey_block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = [a2 highlight];
  id v3 = [v2 domainIdentifier];

  return v3;
}

void sub_1CAAACD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

Class __getEMDaemonInterfaceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!EmailLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __EmailLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D7F60;
    uint64_t v8 = 0;
    EmailLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EmailLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *EmailLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPEventScorer.m", 41, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("EMDaemonInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"Class getEMDaemonInterfaceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPEventScorer.m", 43, @"Unable to find class %s", "EMDaemonInterface");

LABEL_10:
    __break(1u);
  }
  getEMDaemonInterfaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EmailLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmailLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t PPM2LocationDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 28) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
      }
      uint64_t v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPPBDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_46;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_48:
          uint64_t v37 = 16;
          goto LABEL_57;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_52:
          uint64_t v37 = 20;
          goto LABEL_57;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 8;
          goto LABEL_44;
        case 5u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 24;
LABEL_44:
          unint64_t v36 = *(void **)(a1 + v35);
          *(void *)(a1 + v35) = v34;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 == -1 || v32 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
        *(void *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0) {
          goto LABEL_54;
        }
        v29 += 7;
        BOOL v14 = v30++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_56:
      uint64_t v37 = 32;
LABEL_57:
      *(_DWORD *)(a1 + v37) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPM2SourceAlgPairReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x2A0], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAB1848(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB1F34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB26C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB3058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB38F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14167(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14168(uint64_t a1)
{
}

void sub_1CAAB4018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1CAAB41B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB42AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAB450C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAAB4F04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        unsigned int v25 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v24;
      }
      else if (v17 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
          *(void *)(a2 + v29) = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v28 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_45:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v28;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicInitialDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        unsigned int v25 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v24;
      }
      else
      {
        if (v17 == 2)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x2A0], 8) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_43;
            }
            v26 += 7;
            BOOL v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_45:
          uint64_t v32 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_39;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_41:
          uint64_t v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPSocialHighlightFeatureReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        unsigned int v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAB80D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAnalyticsClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_14832)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __AssistantServicesLibraryCore_block_invoke_14833;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D82E0;
    uint64_t v8 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_14832 = _sl_dlopen();
  }
  if (!AssistantServicesLibraryCore_frameworkLibrary_14832)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPLocalConnectionsStore.m", 34, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"Class getAFAnalyticsClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPLocalConnectionsStore.m", 35, @"Unable to find class %s", "AFAnalytics");

LABEL_10:
    __break(1u);
  }
  getAFAnalyticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_14833()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_14832 = result;
  return result;
}

void sub_1CAAB9118(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __blockNotifyQueue_block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"blockNotifyQueue"];
  id v2 = (void *)blockNotifyQueue__pasExprOnceResult;
  blockNotifyQueue__pasExprOnceResult = v1;
}

uint64_t PPM2LocationDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 5)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 4)
        {
          if (v17 == 2)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAABA82C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAABAE70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAABB2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAABB8B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAABC880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityNewItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 8u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_68;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_70;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_70:
          uint64_t v55 = 32;
          goto LABEL_83;
        case 4u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_74:
          uint64_t v55 = 28;
          goto LABEL_83;
        case 5u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 40;
          goto LABEL_52;
        case 6u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 48;
          goto LABEL_52;
        case 7u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 60) |= 0x10u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v33 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_78:
          BOOL v56 = v33 != 0;
          uint64_t v57 = 56;
          goto LABEL_88;
        case 8u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
          while (2)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v40 + 1;
              v19 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_82:
          uint64_t v55 = 24;
LABEL_83:
          *(_DWORD *)(a1 + v55) = v19;
          continue;
        case 9u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 16;
LABEL_52:
          unint64_t v42 = *(void **)(a1 + v30);
          *(void *)(a1 + v30) = v29;

          continue;
        case 0xAu:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)(a1 + 60) |= 0x20u;
          while (2)
          {
            uint64_t v46 = *v3;
            unint64_t v47 = *(void *)(a2 + v46);
            if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v14 = v44++ >= 9;
                if (v14)
                {
                  uint64_t v45 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v45 = 0;
          }
LABEL_87:
          BOOL v56 = v45 != 0;
          uint64_t v57 = 57;
LABEL_88:
          *(unsigned char *)(a1 + v57) = v56;
          continue;
        case 0xBu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          *(unsigned char *)(a1 + 60) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v52 = *v3;
        unint64_t v53 = *(void *)(a2 + v52);
        if (v53 == -1 || v53 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
        *(void *)(a2 + v52) = v53 + 1;
        v51 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0) {
          goto LABEL_90;
        }
        v49 += 7;
        BOOL v14 = v50++ >= 9;
        if (v14)
        {
          uint64_t v51 = 0;
          goto LABEL_92;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_90:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v51 = 0;
      }
LABEL_92:
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2A0], 8) = v51;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAC1C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16377(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16378(uint64_t a1)
{
}

void sub_1CAAC23A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC3564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1CAAC3BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC44BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC5034(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__16787(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__16788(uint64_t a1)
{
}

void sub_1CAAC5C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1CAAC6964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC75BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC7B68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC80A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAC863C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CAACAF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1CAACB28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACB794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACC03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACC69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACC9B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAACCEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACD400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACD880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACDD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACE51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACEE80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAACF550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAACFBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1CAAD0A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

uint64_t __Block_byref_object_copy__17155(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17156(uint64_t a1)
{
}

void sub_1CAAD1464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
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

void sub_1CAAD1CBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD27A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
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

void sub_1CAAD3280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1CAAD39E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
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

void sub_1CAAD4498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD4D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD5430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD5BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD6724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1CAAD93B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD990C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAD9EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADA38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADA8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADAE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADB0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADB3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __HealthKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65D8EB0;
    uint64_t v8 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *HealthKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPMaintenance.m", 132, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"Class getHKHealthStoreClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPMaintenance.m", 133, @"Unable to find class %s", "HKHealthStore");

LABEL_10:
    __break(1u);
  }
  getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1CAADBAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADBE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAADCC40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE16E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE29B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17974(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17975(uint64_t a1)
{
}

void sub_1CAAE3324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1CAAE3870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE39FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18072(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18073(uint64_t a1)
{
}

void sub_1CAAE3F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE4260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE4F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE5650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE5C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void sub_1CAAE600C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE66D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE690C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAE88BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAAE9480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

uint64_t __Block_byref_object_copy__18697(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18698(uint64_t a1)
{
}

void sub_1CAAE9F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAAEA148(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PPM2EngagementRatioReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_67;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_69;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_69:
          uint64_t v52 = 28;
          goto LABEL_90;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_73:
          uint64_t v52 = 24;
          goto LABEL_90;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_77:
          uint64_t v52 = 20;
          goto LABEL_90;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 0x20u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_81:
          uint64_t v52 = 44;
          goto LABEL_90;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v19 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_85:
          uint64_t v52 = 16;
          goto LABEL_90;
        case 6u:
          uint64_t v44 = PBReaderReadString();
          uint64_t v45 = 8;
          goto LABEL_65;
        case 7u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 0x10u;
          break;
        case 8u:
          uint64_t v44 = PBReaderReadString();
          uint64_t v45 = 32;
LABEL_65:
          uint64_t v51 = *(void **)(a1 + v45);
          *(void *)(a1 + v45) = v44;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v3;
        unint64_t v49 = *(void *)(a2 + v48);
        if (v49 == -1 || v49 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
        *(void *)(a2 + v4_Block_object_dispose(&STACK[0x220], 8) = v49 + 1;
        v19 |= (unint64_t)(v50 & 0x7F) << v46;
        if ((v50 & 0x80) == 0) {
          goto LABEL_87;
        }
        v46 += 7;
        BOOL v14 = v47++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_89:
      uint64_t v52 = 40;
LABEL_90:
      *(_DWORD *)(a1 + v52) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPPBEvaluationRecordReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_33:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__19302(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19303(uint64_t a1)
{
}

void sub_1CAAEF380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19466(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19467(uint64_t a1)
{
}

void PPExit(int a1)
{
}

void sub_1CAAF0914(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAAF0D88(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t PPM2FrustrationEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_31;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_31;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_31:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x220], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_33;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAF3960(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAF3FA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAF4484(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2ExperimentDeployedReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      uint64_t v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAAF5058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20198(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20199(uint64_t a1)
{
}

void sub_1CAAF557C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAF7448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAAF762C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAF7BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20507(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20508(uint64_t a1)
{
}

void sub_1CAAFAA00(_Unwind_Exception *a1)
{
}

void sub_1CAAFCF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAAFEDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB004E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB00FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB02B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAB0310C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB03A5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAB03BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAB03DE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAB04B80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          while (2)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (v14)
                {
                  uint64_t v23 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_42:
          *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v23;
          continue;
        case 5u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_44;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v29 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_46:
      *(unsigned char *)(a1 + 40) = v29 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPStorableFeedbackItemReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB06628(void *a1)
{
}

void sub_1CAB06638(_Unwind_Exception *a1)
{
}

void sub_1CAB07270(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB078B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2DonationIntervalReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_50;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_52:
          uint64_t v40 = 8;
          goto LABEL_65;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_56:
          uint64_t v40 = 16;
          goto LABEL_65;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)(a1 + 24) |= 8u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v31 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v31 = 0;
          }
LABEL_60:
          *(unsigned char *)(a1 + 20) = v31 != 0;
          continue;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
        *(void *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_62;
        }
        v35 += 7;
        BOOL v14 = v36++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_64;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_64:
      uint64_t v40 = 12;
LABEL_65:
      *(_DWORD *)(a1 + v40) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB094F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21729(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21730(uint64_t a1)
{
}

void sub_1CAB0A004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 232), 8);
  _Block_object_dispose((const void *)(v54 - 184), 8);
  _Block_object_dispose((const void *)(v54 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0AE38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0AF68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0B180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0B3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0B61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0B854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0BA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0BC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0C0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0E3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_1CAB0EEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB0F3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PPM2ObjectsDeletedReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v20 |= (unint64_t)(v28 & 0x7F) << v24;
          if ((v28 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_51:
        uint64_t v36 = 12;
      }
      else
      {
        if (v17 == 3)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)(a1 + 20) |= 4u;
          while (1)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if ((v34 & 0x80) == 0) {
              goto LABEL_54;
            }
            v29 += 7;
            BOOL v14 = v30++ >= 9;
            if (v14)
            {
              uint64_t v31 = 0;
              goto LABEL_56;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v31 = 0;
          }
LABEL_56:
          *(unsigned char *)(a1 + 16) = v31 != 0;
          continue;
        }
        if (v17 != 2)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_45;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_47:
        uint64_t v36 = 8;
      }
      *(_DWORD *)(a1 + v36) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB1181C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22314(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22315(uint64_t a1)
{
}

void sub_1CAB11BAC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAB11DE0(void *a1)
{
}

void sub_1CAB11DF4(_Unwind_Exception *a1)
{
}

void PPPostNotification(const char *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint32_t v2 = notify_post(a1);
  if (v2)
  {
    uint32_t v3 = v2;
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      double v6 = a1;
      __int16 v7 = 2048;
      uint64_t v8 = v3;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPNotifications failed to post notification %s: error %lu", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_1CAB1234C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void __getHKAnchoredObjectQueryClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKAnchoredObjectQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKAnchoredObjectQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint32_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v3 = [NSString stringWithUTF8String:"Class getHKAnchoredObjectQueryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPHealthKitImporter.m", 31, @"Unable to find class %s", "HKAnchoredObjectQuery");

    __break(1u);
  }
}

void __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKObjectType");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint32_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v3 = [NSString stringWithUTF8String:"Class getHKObjectTypeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPHealthKitImporter.m", 32, @"Unable to find class %s", "HKObjectType");

    __break(1u);
  }
}

void sub_1CAB13778(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a19 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__22714(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22715(uint64_t a1)
{
}

void sub_1CAB13B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKQueryAnchorClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKQueryAnchor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQueryAnchorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint32_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v3 = [NSString stringWithUTF8String:"Class getHKQueryAnchorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPHealthKitImporter.m", 33, @"Unable to find class %s", "HKQueryAnchor");

    __break(1u);
  }
}

void HealthKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_22724)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __HealthKitLibraryCore_block_invoke_22725;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E65DAC40;
    uint64_t v5 = 0;
    HealthKitLibraryCore_frameworkLibrary_22724 = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary_22724)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v2 = [NSString stringWithUTF8String:"void *HealthKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PPHealthKitImporter.m", 29, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __HealthKitLibraryCore_block_invoke_22725()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_22724 = result;
  return result;
}

void sub_1CAB13F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKHealthStoreClass_block_invoke_22734(uint64_t a1)
{
  HealthKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass_22733 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint32_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v3 = [NSString stringWithUTF8String:"Class getHKHealthStoreClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPHealthKitImporter.m", 30, @"Unable to find class %s", "HKHealthStore");

    __break(1u);
  }
}

void sub_1CAB14434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB14560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB147EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22826(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22827(uint64_t a1)
{
}

void sub_1CAB16EAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB171D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB179E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB181D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB1A92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1CAB1DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _nowPlayingInfoCallback(uint64_t a1, void *a2)
{
  uint32_t v3 = pp_entities_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: _nowPlayingInfoCallback was called!", v6, 2u);
  }

  id v4 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = [v4 getResponse];
  [v4 processResponse:v5];

  objc_sync_exit(v4);
}

void sub_1CAB1F6E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    __int16 v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB2380C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1CAB240C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24315(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24316(uint64_t a1)
{
}

void sub_1CAB245B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB24D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB25364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB25600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

void sub_1CAB25E44(void *a1)
{
}

void sub_1CAB25E50(_Unwind_Exception *a1)
{
}

void sub_1CAB2610C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB2623C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB263B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24510(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24511(uint64_t a1)
{
}

void sub_1CAB26B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB282C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1CAB28648(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB2F58C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    atomic_store(0, (unsigned __int8 *)(v2 + 80));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAB2FF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25280(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25281(uint64_t a1)
{
}

void sub_1CAB30050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB302D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB303B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3048C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB307E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB308B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB30F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB311E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB312C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB314B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3180C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB318E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB319B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB31FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB324DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB325B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3268C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB329DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB32FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3351C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB335F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB336CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB337A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB338B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB33FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB340CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB341A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB34CE4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB352AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB35508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1CAB35670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3574C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB35864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3597C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB35A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB35B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB3B3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

uint64_t PPM2PositivePersonalizationEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    __int16 v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_31;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_31;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_31:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_33;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPPBExperimentalGroupReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    __int16 v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void PPSetSuggestionsURLServiceFactoryForTesting(void *a1)
{
  id v1 = a1;
  __assert_rtn("PPSetSuggestionsURLServiceFactoryForTesting", "PPFoundInAppsSupport.m", 50, "0");
}

id PPNewSuggestionsURLService()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  id v0 = (void *)getSGSuggestionsServiceClass_softClass;
  uint64_t v8 = getSGSuggestionsServiceClass_softClass;
  if (!getSGSuggestionsServiceClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getSGSuggestionsServiceClass_block_invoke;
    v4[3] = &unk_1E65DC058;
    v4[4] = &v5;
    __getSGSuggestionsServiceClass_block_invoke((uint64_t)v4);
    id v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 serviceForURLs];
  return v2;
}

void sub_1CAB3CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSGSuggestionsServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CoreSuggestionsLibraryCore_frameworkLibrary_25940)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreSuggestionsLibraryCore_block_invoke_25941;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65DC078;
    uint64_t v8 = 0;
    CoreSuggestionsLibraryCore_frameworkLibrary_25940 = _sl_dlopen();
  }
  if (!CoreSuggestionsLibraryCore_frameworkLibrary_25940)
  {
    uint32_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *CoreSuggestionsLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPFoundInAppsSupport.m", 19, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SGSuggestionsService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint32_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getSGSuggestionsServiceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPFoundInAppsSupport.m", 20, @"Unable to find class %s", "SGSuggestionsService");

LABEL_10:
    __break(1u);
  }
  getSGSuggestionsServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSuggestionsLibraryCore_block_invoke_25941()
{
  uint64_t result = _sl_dlopen();
  CoreSuggestionsLibraryCore_frameworkLibrary_25940 = result;
  return result;
}

id PPSharedSuggestionsURLService()
{
  if (PPSharedSuggestionsURLService__pasOnceToken2 != -1) {
    dispatch_once(&PPSharedSuggestionsURLService__pasOnceToken2, &__block_literal_global_25957);
  }
  id v0 = (void *)PPSharedSuggestionsURLService__pasExprOnceResult;
  return v0;
}

void __PPSharedSuggestionsURLService_block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = PPNewSuggestionsURLService();
  uint64_t v2 = (void *)PPSharedSuggestionsURLService__pasExprOnceResult;
  PPSharedSuggestionsURLService__pasExprOnceResult = v1;
}

uint64_t PPPBContactReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 56;
        goto LABEL_54;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_54;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_54;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_54;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_54;
      case 6u:
        char v20 = objc_alloc_init(PPPBLabeledString);
        [(id)a1 addPhoneNumbers:v20];
        goto LABEL_28;
      case 7u:
        char v20 = objc_alloc_init(PPPBLabeledString);
        [(id)a1 addEmailAddresses:v20];
LABEL_28:
        if (!PBReaderPlaceMark() || !PPPBLabeledStringReadFrom((uint64_t)v20, a2)) {
          goto LABEL_73;
        }
        goto LABEL_42;
      case 8u:
        char v20 = objc_alloc_init(PPPBLabeledPostalAddress);
        [(id)a1 addPostalAddresses:v20];
        if (!PBReaderPlaceMark() || !PPPBLabeledPostalAddressReadFrom((uint64_t)v20, a2)) {
          goto LABEL_73;
        }
        goto LABEL_42;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 104;
        goto LABEL_54;
      case 0xAu:
        char v20 = objc_alloc_init(PPPBDateComponents);
        uint64_t v21 = 16;
        goto LABEL_37;
      case 0xBu:
        char v20 = objc_alloc_init(PPPBDateComponents);
        uint64_t v21 = 96;
LABEL_37:
        objc_storeStrong((id *)(a1 + v21), v20);
        if (!PBReaderPlaceMark() || (PPPBDateComponentsReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_42;
      case 0xCu:
        char v20 = objc_alloc_init(PPPBLabeledSocialProfile);
        [(id)a1 addSocialProfiles:v20];
        if (PBReaderPlaceMark() && PPPBLabeledSocialProfileReadFrom((uint64_t)v20, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_55:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_73:

        return 0;
      case 0xDu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 72;
        goto LABEL_54;
      case 0xEu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 80;
        goto LABEL_54;
      case 0xFu:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 152) |= 2u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1 || v26 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v14 = v23++ >= 9;
              if (v14)
              {
                LODWORD(v24) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_67:
        *(_DWORD *)(a1 + 24) = v24;
        goto LABEL_55;
      case 0x10u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 144;
        goto LABEL_54;
      case 0x11u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 136;
LABEL_54:
        char v28 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

        goto LABEL_55;
      case 0x12u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 152) |= 1u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v14 = v30++ >= 9;
              if (v14)
              {
                uint64_t v31 = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_71:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v31;
        goto LABEL_55;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_55;
    }
  }
}

void sub_1CAB41D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2LogEventOccurredReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledStringReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PPPBContactNameRecordCacheReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(PPPBContactNameRecord);
        [(id)a1 addRecords:v17];
        if (!PBReaderPlaceMark() || (PPPBContactNameRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB46300(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__26818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26819(uint64_t a1)
{
}

uint64_t PPM2UserCreatedMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  uint32_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_44;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_46:
          uint64_t v36 = 24;
          goto LABEL_55;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_50:
          uint64_t v36 = 16;
          goto LABEL_55;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          break;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          char v35 = *(void **)(a1 + 8);
          *(void *)(a1 + _Block_object_dispose(&STACK[0x2F8], 8) = v34;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 == -1 || v32 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
        *(void *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0) {
          goto LABEL_52;
        }
        v29 += 7;
        BOOL v14 = v30++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_54:
      uint64_t v36 = 20;
LABEL_55:
      *(_DWORD *)(a1 + v36) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CAB495E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t __Block_byref_object_copy__27210(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27211(uint64_t a1)
{
}

void sub_1CAB49FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4A104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4A254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4A440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4A954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 224), 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4B7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose((const void *)(v9 - 160), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CAB4D100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1CAB4E180()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1CAB4E190()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1CAB4E1A0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1CAB4E1B0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1CAB4E1C0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1CAB4E1D0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1CAB4E1E0()
{
  return MEMORY[0x1F40E55A0]();
}

uint64_t sub_1CAB4E1F0()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1CAB4E200()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1CAB4E210()
{
  return MEMORY[0x1F40E5B50]();
}

uint64_t sub_1CAB4E220()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1CAB4E230()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1CAB4E240()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1CAB4E250()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1CAB4E260()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1CAB4E270()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1CAB4E280()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1CAB4E290()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1CAB4E2A0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1CAB4E2B0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1CAB4E2C0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1CAB4E2D0()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1CAB4E2E0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1CAB4E2F0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1CAB4E300()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1CAB4E310()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1CAB4E320()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1CAB4E330()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1CAB4E340()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1CAB4E350()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1CAB4E360()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1CAB4E370()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1CAB4E380()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1CAB4E390()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1CAB4E3A0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1CAB4E3B0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1CAB4E3C0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1CAB4E3D0()
{
  return MEMORY[0x1F40E63D8]();
}

uint64_t sub_1CAB4E3E0()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1CAB4E3F0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1CAB4E400()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1CAB4E410()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1CAB4E420()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1CAB4E430()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1CAB4E440()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1CAB4E450()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1CAB4E460()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1CAB4E470()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1CAB4E480()
{
  return MEMORY[0x1F40E6B80]();
}

uint64_t sub_1CAB4E490()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1CAB4E4A0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1CAB4E4B0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1CAB4E4C0()
{
  return MEMORY[0x1F4184A80]();
}

uint64_t sub_1CAB4E4D0()
{
  return MEMORY[0x1F4184A90]();
}

uint64_t sub_1CAB4E4E0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1CAB4E4F0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1CAB4E500()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1CAB4E510()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1CAB4E520()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1CAB4E530()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1CAB4E540()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1CAB4E550()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1CAB4E560()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1CAB4E570()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1CAB4E580()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1CAB4E590()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1CAB4E5A0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1CAB4E5B0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1CAB4E5C0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1CAB4E5D0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1CAB4E5E0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1CAB4E5F0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1CAB4E600()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1CAB4E610()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1CAB4E620()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1CAB4E630()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1CAB4E640()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1CAB4E650()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1CAB4E660()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFBitVectorRef CFBitVectorCreateCopy(CFAllocatorRef allocator, CFBitVectorRef bv)
{
  return (CFBitVectorRef)MEMORY[0x1F40D73B0](allocator, bv);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1F40D73C8](bv, idx);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1F40D73D8](bv);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F413F2D8]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F413F2E8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8418](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.locatiouint64_t n = v1;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x1F4117208]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1F4117248]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1F4117268]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1F4117278]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x1F4117280]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1F4117318]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1F4117320]();
}

uint64_t DDScannerScanStringWithRange()
{
  return MEMORY[0x1F4117358]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1F412E5B8]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return MEMORY[0x1F412E748]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x1F412E818]();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return MEMORY[0x1F412E910]();
}

uint64_t NLGazetteerCreate()
{
  return MEMORY[0x1F4113F48]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1F4114100]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1F4114108]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1F4114110]();
}

uint64_t NLTaggerSetGazetteers()
{
  return MEMORY[0x1F4114120]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1F4114130]();
}

uint64_t NLTokenizerCreate()
{
  return MEMORY[0x1F4114138]();
}

uint64_t NLTokenizerEnumerateTokens()
{
  return MEMORY[0x1F4114148]();
}

uint64_t NLTokenizerSetString()
{
  return MEMORY[0x1F4114180]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.locatiouint64_t n = v2;
  return result;
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1F40E7240](bytes);
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

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.locatiouint64_t n = v2;
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PPCollapseWhitespaceAndStrip()
{
  return MEMORY[0x1F413F1D0]();
}

uint64_t PPNewCNContactStore()
{
  return MEMORY[0x1F413F1D8]();
}

uint64_t PPNewEKEventStore()
{
  return MEMORY[0x1F413F1E0]();
}

uint64_t PPNextMidnight()
{
  return MEMORY[0x1F413F1E8]();
}

uint64_t PPSharedCNContactStore()
{
  return MEMORY[0x1F413F1F0]();
}

uint64_t PPSharedSuggestionsContactService()
{
  return MEMORY[0x1F413F1F8]();
}

uint64_t PPStringAllWhiteSpace()
{
  return MEMORY[0x1F413F200]();
}

uint64_t PPStringIsWellFormed()
{
  return MEMORY[0x1F413F208]();
}

uint64_t PPStringLooksLikeNumber()
{
  return MEMORY[0x1F413F210]();
}

uint64_t SGPostalAddressParse()
{
  return MEMORY[0x1F4115570]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1F415CB68]();
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

uint64_t _PASBytesToHex()
{
  return MEMORY[0x1F4146218]();
}

uint64_t _PASCollapseWhitespaceAndStrip()
{
  return MEMORY[0x1F4146220]();
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return MEMORY[0x1F4146238]();
}

uint64_t _PASInsensitiveStringContainsString()
{
  return MEMORY[0x1F4146268]();
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x1F41462C0]();
}

uint64_t _PASRemoveCharacterSet()
{
  return MEMORY[0x1F41462E0]();
}

uint64_t _PASTrimTrailingWhitespace()
{
  return MEMORY[0x1F4146318]();
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x1F417EC40]();
}

void std::terminate(void)
{
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

void _exit(int a1)
{
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

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int cblas_icamax(const int __N, const void *__X, const int __incX)
{
  return MEMORY[0x1F40D15C0](*(void *)&__N, __X, *(void *)&__incX);
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x1F40D15D0](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x1F40D1668](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t pp_connections_log_handle()
{
  return MEMORY[0x1F413F218]();
}

uint64_t pp_connections_signpost_handle()
{
  return MEMORY[0x1F413F220]();
}

uint64_t pp_contacts_log_handle()
{
  return MEMORY[0x1F413F228]();
}

uint64_t pp_contacts_signpost_handle()
{
  return MEMORY[0x1F413F230]();
}

uint64_t pp_default_log_handle()
{
  return MEMORY[0x1F413F238]();
}

uint64_t pp_default_signpost_handle()
{
  return MEMORY[0x1F413F240]();
}

uint64_t pp_entities_log_handle()
{
  return MEMORY[0x1F413F248]();
}

uint64_t pp_entities_signpost_handle()
{
  return MEMORY[0x1F413F250]();
}

uint64_t pp_events_log_handle()
{
  return MEMORY[0x1F413F258]();
}

uint64_t pp_events_signpost_handle()
{
  return MEMORY[0x1F413F260]();
}

uint64_t pp_locations_log_handle()
{
  return MEMORY[0x1F413F268]();
}

uint64_t pp_locations_signpost_handle()
{
  return MEMORY[0x1F413F270]();
}

uint64_t pp_maintenance_signpost_handle()
{
  return MEMORY[0x1F413F278]();
}

uint64_t pp_quicktype_log_handle()
{
  return MEMORY[0x1F413F280]();
}

uint64_t pp_quicktype_signpost_handle()
{
  return MEMORY[0x1F413F288]();
}

uint64_t pp_score_interpreter_log_handle()
{
  return MEMORY[0x1F413F290]();
}

uint64_t pp_social_highlights_log_handle()
{
  return MEMORY[0x1F413F298]();
}

uint64_t pp_social_highlights_signpost_handle()
{
  return MEMORY[0x1F413F2A0]();
}

uint64_t pp_temporal_clusters_log_handle()
{
  return MEMORY[0x1F413F2A8]();
}

uint64_t pp_temporal_clusters_signpost_handle()
{
  return MEMORY[0x1F413F2B0]();
}

uint64_t pp_topics_log_handle()
{
  return MEMORY[0x1F413F2B8]();
}

uint64_t pp_topics_signpost_handle()
{
  return MEMORY[0x1F413F2C0]();
}

uint64_t pp_universal_search_log_handle()
{
  return MEMORY[0x1F413F2C8]();
}

uint64_t pp_xpc_server_log_handle()
{
  return MEMORY[0x1F413F2D0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

float tanhf(float a1)
{
  MEMORY[0x1F40CE438](a1);
  return result;
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
}

void vvlog1pf(float *a1, const float *a2, const int *a3)
{
}

void vvlogf(float *a1, const float *a2, const int *a3)
{
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}