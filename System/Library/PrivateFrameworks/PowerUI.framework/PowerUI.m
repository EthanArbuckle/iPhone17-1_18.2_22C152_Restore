void sub_221361090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_221366FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
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

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22136C160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
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

void sub_22136D940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22136E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose((const void *)(v68 - 248), 8);
  _Block_object_dispose((const void *)(v68 - 216), 8);
  _Block_object_dispose((const void *)(v68 - 184), 8);
  _Block_object_dispose((const void *)(v68 - 152), 8);
  _Block_object_dispose((const void *)(v68 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22136F1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_22136F794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22136F968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_221376894(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2213789A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_221379760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_22137A074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Block_object_dispose((const void *)(v55 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_22137AF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose((const void *)(v71 - 240), 8);
  _Block_object_dispose((const void *)(v71 - 208), 8);
  _Block_object_dispose((const void *)(v71 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_22137C04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_22137C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_22137E128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_22137EF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22137F3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_221383300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221383570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
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

void sub_221383900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_221383D80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_221383FF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_221384300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221384708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_221384B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2213851B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_22138548C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22138585C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221385B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_221385CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221385EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221386068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2213862F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_221386544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2213868C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221386BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221386EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2213872D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_221387488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221387694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_221387B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221387EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_221388148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2213883B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_221388C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2213890F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

id OUTLINED_FUNCTION_5(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_6(uint64_t a1, void *a2)
{
  return a2;
}

void sub_22138BA4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
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

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_22138F120(_Unwind_Exception *a1)
{
}

void sub_221390B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_221390EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_221391170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221391714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221391A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221391DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_221392310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221392690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2213928DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_221393578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2213995B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(location);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sessionEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (!v7) {
    sessionEventCallback_cold_1();
  }
  v8 = v7;
  uint64_t v9 = [v7 accessoryLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInt:a2];
    v11 = [NSNumber numberWithInt:a3];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "BT SessionEvent: %@, %@", buf, 0x16u);
  }
  if (a3 | a2)
  {
    if (a2 || a3 != 1)
    {
      uint64_t v18 = [v8 accessoryLog];
      v19 = v18;
      if ((a2 & 0xFFFFFFFE) == 2)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "The current BT session terminated, try to attach to the next one.", buf, 2u);
        }

        [v8 attachToBluetoothSession];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sessionEventCallback_cold_3(a2, v19);
        }
      }
    }
    else
    {
      v12 = [v8 accessoryLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sessionEventCallback_cold_2();
      }

      dispatch_time_t v13 = dispatch_walltime(0, 60000000000);
      uint64_t v14 = [v8 queue];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __sessionEventCallback_block_invoke;
      v20[3] = &unk_2645A5CF0;
      id v21 = v8;
      dispatch_after(v13, v14, v20);
    }
  }
  else
  {
    uint64_t v15 = [v8 accessoryLog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "BT Session connected successfully.", buf, 2u);
    }

    [v8 setSession:a1];
    *(void *)buf = 0;
    [v8 session];
    BTAccessoryManagerGetDefault();
    uint64_t v16 = [v8 accessoryLog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Set up connection callback", v23, 2u);
    }

    [v8 session];
    BTServiceAddCallbacksWithFilter();
    uint64_t v17 = [v8 accessoryLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Set up message receiving callback", v23, 2u);
    }

    *(void *)v23 = incomingCustomMessageCallback;
    BTAccessoryManagerRegisterCustomMessageClient();
    v22 = incomingTimeSeriesMessageCallback;
    BTAccessoryManagerRegisterCustomMessageClient();
  }
}

void btConnectionUpdateCallback(uint64_t a1, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (!v10) {
    btConnectionUpdateCallback_cold_1();
  }
  v11 = v10;
  if ((a4 - 13) >= 0xFFFFFFFE && !a5)
  {
    v12 = (void *)os_transaction_create();
    dispatch_time_t v13 = [v11 btHandler];
    uint64_t v14 = [v13 getAddressStringForDevice:a1];

    uint64_t v15 = [v11 accessoryLog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "New connection callback. Address: %@", buf, 0xCu);
    }

    uint64_t v16 = [v11 btHandler];
    int v17 = [v16 protocolForDevice:a1];

    if (v17)
    {
      if (v17 == 255)
      {
        uint64_t v18 = [v11 accessoryLog];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Device is not supported", buf, 2u);
        }
      }
      else if (a3 || a4 != 11)
      {
        if (a3 != 1)
        {
LABEL_45:

          goto LABEL_46;
        }
        v33 = [v11 accessoryLog];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v14;
          _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was disconnected.", buf, 0xCu);
        }

        uint64_t v34 = [v11 walletMonitor];
        [v34 stopMonitoring];

        if (_os_feature_enabled_impl() && ([v11 firstNotificationDisplayed] & 1) == 0)
        {
          uint64_t v35 = [v11 returnAccessoryStatusForDevice:v14];
          if ([v35 currentState] == 1)
          {
            uint64_t v36 = [v35 lastSentDate];
            BOOL v37 = v36 == 0;

            if (!v37)
            {
              objc_initWeak((id *)buf, v11);
              v38 = +[PowerUINotificationManager sharedInstance];
              v39 = [v11 btHandler];
              v40 = objc_msgSend(v11, "firstUseNotificationRequestForDeviceType:", objc_msgSend(v39, "productIDForDevice:", a1));
              uint64_t v41 = [v38 postNotificationWithRequest:v40];

              id WeakRetained = objc_loadWeakRetained((id *)buf);
              v43 = WeakRetained;
              if (v41)
              {
                v44 = [WeakRetained accessoryLog];

                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                  btConnectionUpdateCallback_cold_2();
                }
              }
              else
              {
                [WeakRetained setFirstNotificationDisplayed:1];

                +[PowerUISmartChargeUtilities setNumber:&unk_26D3855A0 forPreferenceKey:@"firstNoteDisplayed" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
              }

              objc_destroyWeak((id *)buf);
            }
          }
        }
        v46 = [v11 latestAnalyticsForDevice];
        uint64_t v18 = [v46 objectForKeyedSubscript:v14];

        if (v18)
        {
          uint64_t v18 = v18;
          AnalyticsSendEventLazy();
          v47 = [v11 accessoryLog];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v18;
            _os_log_impl(&dword_22135E000, v47, OS_LOG_TYPE_DEFAULT, "Reported prediction metrics to CoreAnalytics %@", buf, 0xCu);
          }

          v48 = [v11 latestAnalyticsForDevice];
          [v48 setObject:0 forKeyedSubscript:v14];
        }
      }
      else
      {
        v19 = [v11 btConnectionSemaphore];
        dispatch_semaphore_signal(v19);

        uint64_t v18 = [v11 returnAccessoryStatusForDevice:v14];
        v20 = [MEMORY[0x263EFF910] date];
        id v21 = [v18 lastTimeseriesDate];
        [v20 timeIntervalSinceDate:v21];
        BOOL v23 = v22 > 86400.0;

        if (v23) {
          [v11 timeSeriesForDevice:v14];
        }
        [v11 persistentlyHandleSeeingDevice:v14];
        v24 = [v11 predictor];
        int v25 = [v24 isSufficientDataAvailableForEngagementForDevice:v14];
        if (v17 == 3) {
          int v26 = 1;
        }
        else {
          int v26 = v25;
        }

        if (v26)
        {
          uint64_t v27 = [v11 walletMonitor];
          [v27 startMonitoring];

          uint64_t v28 = [v11 acceptMessageFromRightBudForDevice];
          [v28 setValue:MEMORY[0x263EFFA88] forKey:v14];

          v29 = [v11 acceptMessageFromLeftBudForDevice];
          [v29 setValue:MEMORY[0x263EFFA88] forKey:v14];

          uint64_t v30 = [v11 accessoryLog];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v14;
            _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was connected, queue update.", buf, 0xCu);
          }

          dispatch_time_t v31 = dispatch_walltime(0, 1000000000);
          uint64_t v32 = [v11 queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __btConnectionUpdateCallback_block_invoke;
          block[3] = &unk_2645A68C8;
          id v50 = v11;
          uint64_t v51 = a1;
          dispatch_after(v31, v32, block);
        }
        else
        {
          v45 = [v11 accessoryLog];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v14;
            _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Supported device (%@) was connected, but device history is not old enough or there were not enough connections. Do not send prediction.", buf, 0xCu);
          }

          [v18 setManagerState:10];
        }
      }
    }
    else
    {
      uint64_t v18 = [v11 accessoryLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        btConnectionUpdateCallback_cold_3();
      }
    }

    goto LABEL_45;
  }
LABEL_46:
}

void sub_22139A610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void incomingCustomMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = (void *)os_transaction_create();
  id v11 = a6;
  if (!v11) {
    incomingCustomMessageCallback_cold_1();
  }
  v12 = v11;
  dispatch_time_t v13 = [v11 btHandler];
  uint64_t v14 = [v13 getAddressStringForDevice:a2];

  if (a5 == 11)
  {
    int v42 = 0;
    unsigned __int16 v41 = 0;
    __int16 v40 = 0;
    __int16 v39 = 0;
    unsigned __int8 v38 = 0;
    decodeAccessoryMessage(a4, (_WORD *)&v42 + 1, &v42, &v41, (unsigned char *)&v40 + 1, &v40, (unsigned char *)&v39 + 1, &v39, &v38);
    uint64_t v15 = [v12 accessoryLog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v10;
      [NSNumber numberWithUnsignedShort:HIWORD(v42)];
      uint64_t v16 = v37 = v14;
      int v17 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v42];
      uint64_t v18 = [NSNumber numberWithUnsignedShort:v41];
      [NSNumber numberWithUnsignedChar:HIBYTE(v40)];
      v19 = uint64_t v35 = a2;
      v20 = [NSNumber numberWithUnsignedChar:v40];
      id v21 = [NSNumber numberWithUnsignedChar:HIBYTE(v39)];
      double v22 = [NSNumber numberWithUnsignedChar:v39];
      BOOL v23 = [NSNumber numberWithUnsignedChar:v38];
      *(_DWORD *)buf = 138414338;
      v44 = v37;
      __int16 v45 = 2112;
      v46 = v16;
      __int16 v47 = 2112;
      v48 = v17;
      __int16 v49 = 2112;
      id v50 = v18;
      __int16 v51 = 2112;
      v52 = v19;
      __int16 v53 = 2112;
      uint64_t v54 = v20;
      __int16 v55 = 2112;
      v56 = v21;
      __int16 v57 = 2112;
      v58 = v22;
      __int16 v59 = 2112;
      v60 = v23;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Received a message from device '%@' - successRatio: %@ - timeSpentAtLowerSoC: %@ - timeSpentAtHigherSoC: %@ - engagementEventsSinceLastReport: %@ - underchargeEventsSinceLastReport: %@ - chargingEventsSinceLastReport: %@ - budSocAtLastEngagement: %@ - side: %@", buf, 0x5Cu);

      id v10 = v36;
      a2 = v35;

      uint64_t v14 = v37;
    }

    if (v38 == 2)
    {
      v24 = [v12 acceptMessageFromLeftBudForDevice];
    }
    else
    {
      if (v38 != 1)
      {
        uint64_t v27 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v24 = [v12 acceptMessageFromRightBudForDevice];
    }
    int v26 = v24;
    uint64_t v27 = [v24 objectForKeyedSubscript:v14];

    if (!v27 || ![v27 BOOLValue]) {
      goto LABEL_23;
    }
    uint64_t v28 = [v12 btHandler];
    v29 = objc_msgSend(v12, "nameForProductID:", objc_msgSend(v28, "productIDForDevice:", a2));

    WORD1(v33) = HIWORD(v42);
    LOBYTE(v33) = v39;
    objc_msgSend(v12, "reportSessionMetricsForSide:withTimeSpendAtLowerSoC:timeSpentAtHigherSoC:engagementEventsSinceLastReport:underchargeEventsSinceLastReport:chargingEventsSinceLastReport:budSocAtLastEngagement:successRatio:deviceType:", v38, (unsigned __int16)v42, v41, HIBYTE(v40), v40, HIBYTE(v39), v33, v29);
    if (v38 == 2)
    {
      dispatch_time_t v31 = [v12 acceptMessageFromLeftBudForDevice];
      [v31 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v14];
    }
    else
    {
      if (v38 != 1) {
        goto LABEL_22;
      }
      uint64_t v30 = [v12 acceptMessageFromRightBudForDevice];
      [v30 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v14];

      if (!+[PowerUISmartChargeUtilities isInternalBuild]) {
        goto LABEL_22;
      }
      WORD1(v34) = HIWORD(v42);
      LOBYTE(v34) = v39;
      objc_msgSend(v12, "recordBudMetricsLocallyForDevice:withTimeSpendAtLowerSoC:timeSpentAtHigherSoC:engagementEventsSinceLastReport:underchargeEventsSinceLastReport:chargingEventsSinceLastReport:budSocAtLastEngagement:successRatio:", v14, (unsigned __int16)v42, v41, HIBYTE(v40), v40, HIBYTE(v39), v34);
      dispatch_time_t v31 = [v12 accessoryLog];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v31, OS_LOG_TYPE_DEFAULT, "Internal device, write bud metrics to defaults.", buf, 2u);
      }
    }

LABEL_22:
    uint64_t v32 = [v12 returnAccessoryStatusForDevice:v14];
    [v32 setMinutesSavedSinceLastReport:(unsigned __int16)v42];
    [v32 setUnderchargesSinceLastReport:v40];
    [v32 setChargingEventsSinceLastReport:HIBYTE(v39)];
    [v32 setManagerState:7];

    goto LABEL_23;
  }
  int v25 = [v12 accessoryLog];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    incomingCustomMessageCallback_cold_2(a5, (uint64_t)v14, v25);
  }

LABEL_24:
}

void incomingTimeSeriesMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = (void *)os_transaction_create();
  id v11 = a6;
  if (!v11) {
    incomingTimeSeriesMessageCallback_cold_1();
  }
  v12 = v11;
  dispatch_time_t v13 = [v11 btHandler];
  uint64_t v14 = [v13 getAddressStringForDevice:a2];

  uint64_t v15 = [v12 accessoryLog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v47 = a5;
    __int16 v48 = 2112;
    __int16 v49 = v14;
    _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Received time series message of size %zu from device '%@'.", buf, 0x16u);
  }

  if (a5 == 983)
  {
    bzero(buf, 0x620uLL);
    uint64_t v16 = 0;
    uint64_t v17 = a4 + 9;
    do
    {
      uint64_t v18 = &buf[v16];
      *(void *)uint64_t v18 = *(void *)(v17 - 9);
      *((_WORD *)v18 + 4) = *(_WORD *)(v17 - 1);
      v16 += 16;
      v17 += 10;
    }
    while (v16 != 1568);
    unsigned int v19 = *(unsigned __int16 *)(a4 + 980);
    unsigned int v20 = *(unsigned __int8 *)(a4 + 982);
    id v21 = [v12 accessoryLog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned __int8 v38 = 138413058;
      *(void *)__int16 v39 = v14;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v20;
      __int16 v40 = 1024;
      unsigned int v41 = v19;
      __int16 v42 = 1024;
      LODWORD(v43) = 98;
      _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "Received time series data for device '%@' (bud side: %u, FW version: %u, #records: %u):", v38, 0x1Eu);
    }

    double v22 = [v12 budSideToRecord];
    int v23 = [v22 unsignedShortValue];

    if (v23 == v20)
    {
      unsigned int v35 = v19;
      unsigned int v36 = v20;
      BOOL v37 = v10;
      uint64_t v24 = 0;
      int v25 = buf;
      do
      {
        int v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(unint64_t *)v25];
        uint64_t v27 = [v12 accessoryLog];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v28 = v25[8];
          unint64_t v29 = *(void *)v25;
          int v30 = v25[9];
          *(_DWORD *)unsigned __int8 v38 = 67110146;
          *(_DWORD *)__int16 v39 = v24;
          *(_WORD *)&v39[4] = 2112;
          *(void *)&v39[6] = v26;
          __int16 v40 = 1024;
          unsigned int v41 = v28;
          __int16 v42 = 2048;
          unint64_t v43 = v29;
          __int16 v44 = 1024;
          int v45 = v30;
          _os_log_impl(&dword_22135E000, v27, OS_LOG_TYPE_DEFAULT, "%d: %@: eventData: %u - timestamp: %llu - offset: %u", v38, 0x28u);
        }

        ++v24;
        v25 += 16;
      }
      while (v24 != 98);
      dispatch_time_t v31 = [v12 accessoryLog];
      [v12 addTimeSeriesDataToStream:buf withSide:v36 withFirmwareVersion:v35 withLog:v31];

      uint64_t v32 = [MEMORY[0x263EFF910] date];
      [v12 persistentlySetLastTimeseriesDate:v32 forDevice:v14];
      id v10 = v37;
    }
    else
    {
      uint64_t v32 = [v12 accessoryLog];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v12 budSideToRecord];
        *(_DWORD *)unsigned __int8 v38 = 67109378;
        *(_DWORD *)__int16 v39 = v20;
        *(_WORD *)&v39[4] = 2112;
        *(void *)&v39[6] = v34;
        _os_log_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEFAULT, "Bud side in message (%hhu) does not match bud side to record (%@), skip this message.", v38, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v33 = [v12 accessoryLog];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      incomingTimeSeriesMessageCallback_cold_2();
    }
  }
}

uint64_t __sessionEventCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) attachToBluetoothSession];
}

uint64_t __btConnectionUpdateCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runUpdateForDevice:*(void *)(a1 + 40) withHash:0 asInitialUpdate:1];
}

id __btConnectionUpdateCallback_block_invoke_316(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t decodeAccessoryMessage(uint64_t result, _WORD *a2, _WORD *a3, _WORD *a4, unsigned char *a5, unsigned char *a6, unsigned char *a7, unsigned char *a8, unsigned char *a9)
{
  *a2 = *(_WORD *)result;
  *a3 = *(_WORD *)(result + 2);
  *a4 = *(_WORD *)(result + 4);
  *a5 = *(unsigned char *)(result + 6);
  *a6 = *(unsigned char *)(result + 7);
  *a7 = *(unsigned char *)(result + 8);
  *a8 = *(unsigned char *)(result + 9);
  *a9 = *(unsigned char *)(result + 10);
  return result;
}

void sub_22139B61C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

_DWORD *prepare9ByteMessage(_DWORD *result, int a2, int a3)
{
  if (a3 != 1)
  {
    if (a3 == 3) {
      char v3 = 2;
    }
    else {
      char v3 = a3 == 2;
    }
    *(unsigned char *)result = v3;
    result = (_DWORD *)((char *)result + 1);
  }
  *result = a2;
  return result;
}

void sub_22139EB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2213A3050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 200));
  _Unwind_Resume(a1);
}

void sub_2213A3154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
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

double OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

void sub_2213C1B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_2213C51AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
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

void sub_2213C6CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_2213C78C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2213C7F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2213C8A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __67__durationModel_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[durationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __58__durationModel_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [durationModelOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }
}

void __66__durationModel_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [durationModelOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }
}

void __64__deoc_model_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_model alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __55__deoc_model_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_modelOutput alloc];
    id v7 = [v14 featureValueForName:@"next_drain_is_significant"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_modelOutput *)v6 initWithNext_drain_is_significant:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_modelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __63__deoc_model_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_modelOutput alloc];
    id v7 = [v14 featureValueForName:@"next_drain_is_significant"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_modelOutput *)v6 initWithNext_drain_is_significant:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_modelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __65__engageModel_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[engageModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__engageModel_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [engageModelOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(engageModelOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, engageModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __64__engageModel_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [engageModelOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(engageModelOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, engageModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __65__easy_engage_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[easy_engage alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__easy_engage_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [easy_engageOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(easy_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, easy_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __64__easy_engage_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [easy_engageOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(easy_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, easy_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __65__deoc_series_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_series alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__deoc_series_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_seriesOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_seriesOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_seriesOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __64__deoc_series_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_seriesOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_seriesOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_seriesOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __67__base_duration_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[base_duration alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __58__base_duration_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [base_durationOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    uint64_t v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, base_durationOutput *))(v9 + 16);
    uint64_t v8 = a3;
    v10(v9, 0, v8);
  }
}

void __66__base_duration_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [base_durationOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    uint64_t v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, base_durationOutput *))(v9 + 16);
    uint64_t v8 = a3;
    v10(v9, 0, v8);
  }
}

void __90__deoc_two_stage_sequential_low_second_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_two_stage_sequential_low_second alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __81__deoc_two_stage_sequential_low_second_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_two_stage_sequential_low_secondOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_two_stage_sequential_low_secondOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_two_stage_sequential_low_secondOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __89__deoc_two_stage_sequential_low_second_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_two_stage_sequential_low_secondOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_two_stage_sequential_low_secondOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_two_stage_sequential_low_secondOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __68__deoc_iphone_80_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_iphone_80 alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__deoc_iphone_80_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_iphone_80Output alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_iphone_80Output *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_iphone_80Output *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __67__deoc_iphone_80_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_iphone_80Output alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_iphone_80Output *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_iphone_80Output *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __64__deoc_ultra_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_ultra alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __55__deoc_ultra_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_ultraOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_ultraOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_ultraOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __63__deoc_ultra_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_ultraOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_ultraOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_ultraOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __67__long_duration_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[long_duration alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __58__long_duration_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [long_durationOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    uint64_t v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, long_durationOutput *))(v9 + 16);
    uint64_t v8 = a3;
    v10(v9, 0, v8);
  }
}

void __66__long_duration_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    v6 = [long_durationOutput alloc];
    id v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    uint64_t v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void, long_durationOutput *))(v9 + 16);
    uint64_t v8 = a3;
    v10(v9, 0, v8);
  }
}

void __68__deoc_iphone_95_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_iphone_95 alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__deoc_iphone_95_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_iphone_95Output alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_iphone_95Output *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_iphone_95Output *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __67__deoc_iphone_95_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_iphone_95Output alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_iphone_95Output *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_iphone_95Output *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __65__base_engage_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[base_engage alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__base_engage_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [base_engageOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(base_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, base_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __64__base_engage_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [base_engageOutput alloc];
    id v7 = [v14 featureValueForName:@"engage"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(base_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, base_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __91__deoc_two_stage_sequential_high_second_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_two_stage_sequential_high_second alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __82__deoc_two_stage_sequential_high_second_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_two_stage_sequential_high_secondOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_two_stage_sequential_high_secondOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_two_stage_sequential_high_secondOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __90__deoc_two_stage_sequential_high_second_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_two_stage_sequential_high_secondOutput alloc];
    id v7 = [v14 featureValueForName:@"target"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_two_stage_sequential_high_secondOutput *)v6 initWithTarget:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_two_stage_sequential_high_secondOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __71__deoc_model_iphone_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    char v3 = [[deoc_model_iphone alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __62__deoc_model_iphone_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_model_iphoneOutput alloc];
    id v7 = [v14 featureValueForName:@"next_drain_is_significant"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_model_iphoneOutput *)v6 initWithNext_drain_is_significant:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_model_iphoneOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void __70__deoc_model_iphone_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    v6 = [deoc_model_iphoneOutput alloc];
    id v7 = [v14 featureValueForName:@"next_drain_is_significant"];
    uint64_t v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    uint64_t v10 = [v9 dictionaryValue];
    id v11 = [(deoc_model_iphoneOutput *)v6 initWithNext_drain_is_significant:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_time_t v13 = *(void (**)(uint64_t, void, deoc_model_iphoneOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sessionEventCallback_cold_1()
{
  __assert_rtn("sessionEventCallback", "PowerUIAudioAccessorySmartChargeManager.m", 667, "smartChargeManager != NULL");
}

void sessionEventCallback_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "An error occured attaching the BT session, try again in 60 seconds.", v2, v3, v4, v5, v6);
}

void sessionEventCallback_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, a2, v4, "BT session returned unknown event code '%@' - this should not happen!", v5);
}

void btConnectionUpdateCallback_cold_1()
{
  __assert_rtn("btConnectionUpdateCallback", "PowerUIAudioAccessorySmartChargeManager.m", 712, "smartChargeManager != NULL");
}

void btConnectionUpdateCallback_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Unable to display first use notification: %@", v2);
}

void btConnectionUpdateCallback_cold_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "ERROR getting protocol for device with address: %@", v2);
}

void incomingCustomMessageCallback_cold_1()
{
  __assert_rtn("incomingCustomMessageCallback", "PowerUIAudioAccessorySmartChargeManager.m", 802, "smartChargeManager != NULL");
}

void incomingCustomMessageCallback_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithUnsignedLong:a1];
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = &unk_26D3855B8;
  __int16 v9 = v6;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_22135E000, a3, OS_LOG_TYPE_ERROR, "ERROR: Unexpected message size (size of %@ bytes != %@) from device '%@', aborting.", v7, 0x20u);
}

void incomingTimeSeriesMessageCallback_cold_1()
{
  __assert_rtn("incomingTimeSeriesMessageCallback", "PowerUIAudioAccessorySmartChargeManager.m", 889, "smartChargeManager != NULL");
}

void incomingTimeSeriesMessageCallback_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v2 = 1024;
  int v3 = 983;
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "Unexpected data size: %zu != %u)", v1, 0x12u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x270F0B6D8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BMDeviceBatteryGaugingOCVStateAsString()
{
  return MEMORY[0x270F10A48]();
}

uint64_t BMDeviceBatteryGaugingPeriodicFullChargeStateAsString()
{
  return MEMORY[0x270F10A50]();
}

uint64_t BMDeviceBatteryGaugingQMaxStateAsString()
{
  return MEMORY[0x270F10A58]();
}

uint64_t BMDeviceSmartChargingModeOfOperationAsString()
{
  return MEMORY[0x270F10A60]();
}

uint64_t BMDeviceSmartChargingOBCEventAsString()
{
  return MEMORY[0x270F10A68]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x270F4A998]();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return MEMORY[0x270F4AA90]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x270F4AB30]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x270F4AB58]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x270F4AB68]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x270F4AB78]();
}

uint64_t BTServiceAddCallbacksWithFilter()
{
  return MEMORY[0x270F4AD80]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AE8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

uint64_t IOPSCopyBatteryLevelLimits()
{
  return MEMORY[0x270EF48F0]();
}

uint64_t IOPSGaugingMitigationGetState()
{
  return MEMORY[0x270EF4938]();
}

uint64_t IOPSLimitBatteryLevel()
{
  return MEMORY[0x270EF4970]();
}

uint64_t IOPSLimitBatteryLevelCancel()
{
  return MEMORY[0x270EF4978]();
}

uint64_t IOPSLimitBatteryLevelRegister()
{
  return MEMORY[0x270EF4980]();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
}

uint64_t SBGetIsAlive()
{
  return MEMORY[0x270F770E0]();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return MEMORY[0x270F771E0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}