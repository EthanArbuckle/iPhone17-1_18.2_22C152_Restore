uint64_t _setModifierCharMap(uint64_t a1, void *a2)
{
  return [a2 setModifierCharMap];
}

void sub_2603DB7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2603DCD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603DD154(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
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

uint64_t currentKeyboardPlaneIsSameAs(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getVisibleKeyplaneName];
    if ([v2 containsString:@"_"])
    {
      v3 = [v2 componentsSeparatedByString:@"_"];
      v4 = [v3 lastObject];
      uint64_t v5 = [v4 lowercaseString];

      v2 = (void *)v5;
    }
    v6 = [v1 lowercaseString];
    uint64_t v7 = [v2 isEqualToString:v6];

    if ((v7 & 1) == 0) {
      TYLogl(OS_LOG_TYPE_ERROR, @"Unexpected keyboard plane: [%@]. Waiting for: [%@]", v8, v9, v10, v11, v12, v13, (char)v2);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t _choose(int a1, int a2)
{
  uint64_t v2 = 0;
  if ((a2 & 0x80000000) == 0 && a1 >= a2)
  {
    if (a1 - a2 >= a2) {
      int v3 = a2;
    }
    else {
      int v3 = a1 - a2;
    }
    if (v3 < 1)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = (v3 + 1);
      uint64_t v5 = 1;
      uint64_t v2 = 1;
      do
        uint64_t v2 = v2 * a1-- / v5++;
      while (v4 != v5);
    }
  }
  return v2;
}

void getTouchPoints(void *a1, int *a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = (double *)*((void *)a2 + 1);
  int v5 = *a2;
  v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  if ([v3 count])
  {
    uint64_t v7 = [v3 lastObject];

    v6 = (void *)v7;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __getTouchPoints_block_invoke;
  v16[3] = &__block_descriptor_40_e8_d16__0d8l;
  v16[4] = 0x3FD5555555555555;
  uint64_t v8 = (double (**)(void, double))MEMORY[0x261210570](v16);
  switch(v5)
  {
    case 0:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *v4, v4[1]);
      [v3 addObject:v9];
      goto LABEL_11;
    case 1:
      v19[0] = v6;
      uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *v4, v4[1]);
      v19[1] = v10;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
      double v11 = 1.0;
      goto LABEL_9;
    case 2:
      v18[0] = v6;
      uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *v4, v4[1]);
      v18[1] = v10;
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v4[2], v4[3]);
      v18[2] = v12;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
      goto LABEL_8;
    case 3:
      v17[0] = v6;
      uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *v4, v4[1]);
      v17[1] = v10;
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v4[2], v4[3]);
      v17[2] = v12;
      uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v4[4], v4[5]);
      v17[3] = v13;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

LABEL_8:
      double v11 = 0.333333333;
LABEL_9:

      if (v9)
      {
        do
        {
          v14 = (void *)MEMORY[0x263F08D40];
          +[TypistPathUtilities pointOnCurve:v9 atTime:v11];
          v15 = objc_msgSend(v14, "valueWithCGPoint:");
          [v3 addObject:v15];

          double v11 = v8[2](v8, v11);
        }
        while (v11 <= 1.0);
LABEL_11:
      }
      break;
    default:
      break;
  }
}

double __getTouchPoints_block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

void sub_2603E7890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603E85D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
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

void sub_2603ECBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2603EF390(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2603F1C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_2603F46E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_2603F4924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603F4A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_2603F4F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_2603F51BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603F54A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603F5A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Block_object_dispose((const void *)(v39 - 112), 8);
  _Unwind_Resume(a1);
}

id getITTKeyboardProxyClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getITTKeyboardProxyClass_softClass;
  uint64_t v7 = getITTKeyboardProxyClass_softClass;
  if (!getITTKeyboardProxyClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getITTKeyboardProxyClass_block_invoke;
    v3[3] = &unk_265559710;
    v3[4] = &v4;
    __getITTKeyboardProxyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2603F67E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603F6C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ___inputTeletypeIsLinked_block_invoke()
{
  id result = getITTKeyboardProxyClass();
  _inputTeletypeIsLinked_linked = result != 0;
  return result;
}

Class __getITTKeyboardProxyClass_block_invoke(uint64_t a1)
{
  InputTeletypeLibrary();
  Class result = objc_getClass("ITTKeyboardProxy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getITTKeyboardProxyClass_block_invoke_cold_1();
  }
  getITTKeyboardProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void InputTeletypeLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!InputTeletypeLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __InputTeletypeLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265559A88;
    uint64_t v3 = 0;
    InputTeletypeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!InputTeletypeLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __InputTeletypeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  InputTeletypeLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getITTKeyboardConfigurationClass_block_invoke(uint64_t a1)
{
  InputTeletypeLibrary();
  Class result = objc_getClass("ITTKeyboardConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getITTKeyboardConfigurationClass_block_invoke_cold_1();
  }
  getITTKeyboardConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2603F8040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2603F85A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 208), 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

unint64_t TYMakeArabicCharacter(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (a3 << 32) | (a4 << 48) | ((unint64_t)a2 << 16) | a1;
}

void sub_2603FD860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _shouldNotTapArrowKey(void *a1)
{
  id v1 = a1;
  long long v2 = [@"0123456789↨☻" stringByAppendingFormat:@"%@%@%@", @"⌫", @"⏎", @" "];
  if (v1)
  {
    uint64_t v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v2];
    uint64_t v4 = [v1 stringByTrimmingCharactersInSet:v3];
    BOOL v5 = [v4 length] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_260404E94(_Unwind_Exception *a1)
{
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

void sub_260405B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260407540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260407914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260407BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_260407E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260407FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260408170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260408688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2604089C4(_Unwind_Exception *a1)
{
}

void sub_260408AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260408C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260408D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040908C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260409204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2604094C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_260409C40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_26040B388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_26040B6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040BECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void sub_26040C838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_26040D74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_26040DD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040E8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040EB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040EC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040EDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040EF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_26040F518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_26040F7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2604100D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_260412774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_260413548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_260413830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id TYLogFramework()
{
  if (TYLogFramework_onceToken != -1) {
    dispatch_once(&TYLogFramework_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)TYLogFramework___logObj;
  return v0;
}

uint64_t __TYLogFramework_block_invoke()
{
  TYLogFramework___logObj = (uint64_t)os_log_create("com.apple.typist", "TypistFramework");
  return MEMORY[0x270F9A758]();
}

void _TYLogl(os_log_type_t a1, void *a2, va_list a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2)
  {
    BOOL v5 = (objc_class *)NSString;
    id v6 = a2;
    uint64_t v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:a3];

    id v8 = v7;
    uint64_t v9 = [v8 UTF8String];
    uint64_t v10 = TYLogFramework();
    if (os_log_type_enabled(v10, a1))
    {
      *(_DWORD *)buf = 136380675;
      uint64_t v19 = v9;
      _os_log_impl(&dword_2603D4000, v10, a1, "%{private}s", buf, 0xCu);
    }

    if (_logToSTDERR)
    {
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", @"%", @"%%", 0, 0, objc_msgSend(v8, "length"));
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSLogv(v11, a3);
    }
    if (_logFileHandle)
    {
      if (_logToFile)
      {
        id v12 = objc_alloc_init(MEMORY[0x263F08790]);
        [v12 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        uint64_t v13 = [MEMORY[0x263EFF910] date];
        uint64_t v14 = [v12 stringFromDate:v13];

        uint64_t v15 = [NSString stringWithFormat:@"%@ %@\n", v14, v8];

        uint64_t v16 = (void *)_logFileHandle;
        uint64_t v17 = [v15 dataUsingEncoding:4];
        [v16 writeData:v17];

        [(id)_logFileHandle synchronizeFile];
        id v8 = v15;
      }
    }
  }
}

void TYLogl(os_log_type_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a2) {
    _TYLogl(a1, a2, &a9);
  }
}

void TYLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1) {
    _TYLogl(OS_LOG_TYPE_DEFAULT, a1, &a9);
  }
}

void sub_2604147F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t sub_2604151D0(uint64_t a1, void *a2)
{
  return sub_260415D48(a1, a2);
}

TypistMathSupport __swiftcall TypistMathSupport.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (TypistMathSupport)objc_msgSend(v0, sel_init);
}

id TypistMathSupport.init()()
{
  v1.super_class = (Class)TypistMathSupport;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_26041537C(double a1, double a2, double a3, double a4)
{
  BOOL v5 = v4;
  sub_260416840();
  sub_260416830();
  uint64_t v10 = sub_260416950();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x26120FC50](v10, v12, v14, v16);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = *v5;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2604155E0(0, v20[2] + 1, 1, v20);
    uint64_t v20 = (void *)result;
  }
  unint64_t v23 = v20[2];
  unint64_t v22 = v20[3];
  if (v23 >= v22 >> 1)
  {
    uint64_t result = (uint64_t)sub_2604155E0((void *)(v22 > 1), v23 + 1, 1, v20);
    uint64_t v20 = (void *)result;
  }
  v20[2] = v23 + 1;
  v24 = (double *)&v20[6 * v23];
  *((void *)v24 + 4) = v17;
  *((void *)v24 + 5) = v19;
  v24[6] = a1;
  v24[7] = a2;
  v24[8] = a3;
  v24[9] = a4;
  *BOOL v5 = v20;
  return result;
}

void *sub_2604154BC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD18);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DCF0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2604155E0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD28);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[6 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD30);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_26041571C(uint64_t a1, uint64_t a2)
{
  sub_2604169D0();
  sub_260416930();
  uint64_t v4 = sub_2604169E0();
  return sub_260415AAC(a1, a2, v4);
}

uint64_t sub_260415794(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD10);
  char v38 = a2;
  uint64_t v6 = sub_260416990();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    v34 = (long long *)(*(void *)(v5 + 56) + 32 * v22);
    long long v39 = *v34;
    long long v40 = v34[1];
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2604169D0();
    sub_260416930();
    uint64_t result = sub_2604169E0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *uint64_t v19 = v33;
    v19[1] = v32;
    uint64_t v20 = (_OWORD *)(*(void *)(v7 + 56) + 32 * v18);
    *uint64_t v20 = v39;
    v20[1] = v40;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_260415AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2604169A0() & 1) == 0)
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
      while (!v14 && (sub_2604169A0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_260415B90()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260416980();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *objc_super v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    unint64_t v21 = (long long *)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    long long v23 = *v21;
    long long v24 = v21[1];
    *unint64_t v22 = v19;
    v22[1] = v18;
    unint64_t v25 = (_OWORD *)(*(void *)(v4 + 56) + v20);
    *unint64_t v25 = v23;
    v25[1] = v24;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_260415D48(uint64_t a1, void *a2)
{
  v66 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DCF8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v63 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2604168B0();
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v69 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260416890();
  ((void (*)(void))MEMORY[0x270FA5388])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD00);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260416860();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_260416800();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v59 - v16;
  sub_2604167F0();
  sub_2604167E0();
  uint64_t v18 = v66;
  swift_bridgeObjectRetain();
  sub_260416880();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  uint64_t v19 = v70;
  sub_260416870();
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    return (uint64_t)v18;
  }
  uint64_t v61 = v12;
  uint64_t v62 = v11;
  v59 = v10;
  v60 = v17;
  uint64_t v20 = (uint64_t)v63;
  uint64_t v21 = v64;
  uint64_t v70 = a1;
  uint64_t v22 = v65;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v7, 1, v65) == 1)
  {
    sub_26041654C((uint64_t)v7, &qword_26A86DD00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DD08);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_26041AA00;
    unint64_t v71 = 0;
    unint64_t v72 = 0xE000000000000000;
    sub_260416970();
    swift_bridgeObjectRelease();
    unint64_t v71 = 0xD000000000000011;
    unint64_t v72 = 0x8000000260420250;
    sub_260416940();
    unint64_t v24 = v71;
    unint64_t v25 = v72;
    *(void *)(v23 + 56) = MEMORY[0x263F8D310];
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v25;
    sub_2604169C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
    return MEMORY[0x263F8EE78];
  }
  v66 = 0;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v59, v7, v22);
  sub_260416810();
  uint64_t v26 = sub_260416820();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v20, 0, 1, v26);
  unint64_t v27 = v69;
  sub_260416850();
  sub_26041654C(v20, &qword_26A86DCF8);
  uint64_t v18 = (void *)MEMORY[0x263F8EE78];
  unint64_t v71 = MEMORY[0x263F8EE78];
  sub_2604165A8();
  sub_2604168A0();
  uint64_t v28 = *(void *)(v71 + 16);
  v63 = (char *)v71;
  if (!v28)
  {
    uint64_t v54 = v67;
    uint64_t v53 = v68;
LABEL_25:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v27, v53);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v59, v65);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
    return (uint64_t)v18;
  }
  BOOL v29 = (uint64_t *)(v71 + 72);
  uint64_t v30 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v70 = v28;
    uint64_t v31 = *(v29 - 5);
    uint64_t v32 = *(v29 - 4);
    uint64_t v34 = *(v29 - 3);
    uint64_t v33 = *(v29 - 2);
    uint64_t v36 = *(v29 - 1);
    uint64_t v35 = *v29;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v73 = v30;
    unint64_t v39 = sub_26041571C(v31, v32);
    uint64_t v40 = v30[2];
    BOOL v41 = (v38 & 1) == 0;
    uint64_t v42 = v40 + v41;
    if (__OFADD__(v40, v41)) {
      break;
    }
    char v43 = v38;
    if (v30[3] >= v42)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        v46 = v73;
        if (v38) {
          goto LABEL_14;
        }
      }
      else
      {
        sub_260415B90();
        v46 = v73;
        if (v43) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      sub_260415794(v42, isUniquelyReferenced_nonNull_native);
      unint64_t v44 = sub_26041571C(v31, v32);
      if ((v43 & 1) != (v45 & 1)) {
        goto LABEL_29;
      }
      unint64_t v39 = v44;
      v46 = v73;
      if (v43)
      {
LABEL_14:
        v47 = (void *)(v46[7] + 32 * v39);
        void *v47 = v34;
        v47[1] = v33;
        v47[2] = v36;
        v47[3] = v35;
        goto LABEL_18;
      }
    }
    v46[(v39 >> 6) + 8] |= 1 << v39;
    v48 = (uint64_t *)(v46[6] + 16 * v39);
    uint64_t *v48 = v31;
    v48[1] = v32;
    v49 = (void *)(v46[7] + 32 * v39);
    void *v49 = v34;
    v49[1] = v33;
    v49[2] = v36;
    v49[3] = v35;
    uint64_t v50 = v46[2];
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      goto LABEL_28;
    }
    v46[2] = v52;
    swift_bridgeObjectRetain();
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v18 = sub_2604154BC(0, v18[2] + 1, 1, v18);
    }
    uint64_t v54 = v67;
    uint64_t v53 = v68;
    unint64_t v27 = v69;
    unint64_t v56 = v18[2];
    unint64_t v55 = v18[3];
    v57 = v18;
    if (v56 >= v55 >> 1) {
      v57 = sub_2604154BC((void *)(v55 > 1), v56 + 1, 1, v18);
    }
    uint64_t v18 = v57;
    v57[2] = v56 + 1;
    v57[v56 + 4] = v46;
    v29 += 6;
    uint64_t v28 = v70 - 1;
    if (v70 == 1) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = sub_2604169B0();
  __break(1u);
  return result;
}

unint64_t type metadata accessor for TypistMathSupport()
{
  unint64_t result = qword_26A86DFC0;
  if (!qword_26A86DFC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A86DFC0);
  }
  return result;
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

uint64_t sub_26041654C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2604165A8()
{
  unint64_t result = qword_26A86DFC8[0];
  if (!qword_26A86DFC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A86DFC8);
  }
  return result;
}

ValueMetadata *_s9CollectorVMa()
{
  return &_s9CollectorVN;
}

uint64_t sub_260416610(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_260416654(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_260416674(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2604166C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2604166E0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_260416730(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void __getITTKeyboardProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getITTKeyboardConfigurationClass_block_invoke_cold_1(v0);
}

void __getITTKeyboardConfigurationClass_block_invoke_cold_1()
{
}

uint64_t sub_2604167D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2604167E0()
{
  return MEMORY[0x270F49708]();
}

uint64_t sub_2604167F0()
{
  return MEMORY[0x270F49720]();
}

uint64_t sub_260416800()
{
  return MEMORY[0x270F49730]();
}

uint64_t sub_260416810()
{
  return MEMORY[0x270F49738]();
}

uint64_t sub_260416820()
{
  return MEMORY[0x270F49748]();
}

uint64_t sub_260416830()
{
  return MEMORY[0x270F49770]();
}

uint64_t sub_260416840()
{
  return MEMORY[0x270F49778]();
}

uint64_t sub_260416850()
{
  return MEMORY[0x270F49790]();
}

uint64_t sub_260416860()
{
  return MEMORY[0x270F497A0]();
}

uint64_t sub_260416870()
{
  return MEMORY[0x270F497A8]();
}

uint64_t sub_260416880()
{
  return MEMORY[0x270F497C8]();
}

uint64_t sub_260416890()
{
  return MEMORY[0x270F497E0]();
}

uint64_t sub_2604168A0()
{
  return MEMORY[0x270F497F8]();
}

uint64_t sub_2604168B0()
{
  return MEMORY[0x270F49800]();
}

uint64_t sub_2604168C0()
{
  return MEMORY[0x270F49810]();
}

uint64_t sub_2604168D0()
{
  return MEMORY[0x270F49818]();
}

uint64_t sub_2604168E0()
{
  return MEMORY[0x270F49820]();
}

uint64_t sub_2604168F0()
{
  return MEMORY[0x270F49828]();
}

uint64_t sub_260416900()
{
  return MEMORY[0x270F49830]();
}

uint64_t sub_260416910()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_260416920()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_260416930()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260416940()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260416950()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_260416960()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_260416970()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260416980()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_260416990()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2604169A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2604169B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2604169C0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2604169D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2604169E0()
{
  return MEMORY[0x270F9FC90]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
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

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

uint64_t GSEventSetHardwareKeyboardAttached()
{
  return MEMORY[0x270F30620]();
}

uint64_t GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType()
{
  return MEMORY[0x270F30628]();
}

uint64_t GSInitialize()
{
  return MEMORY[0x270F30638]();
}

uint64_t GSKeyboardCreate()
{
  return MEMORY[0x270F30640]();
}

uint64_t GSKeyboardGetModifierState()
{
  return MEMORY[0x270F30648]();
}

uint64_t GSKeyboardHWKeyboardNormalizeInput()
{
  return MEMORY[0x270F30650]();
}

uint64_t GSKeyboardRelease()
{
  return MEMORY[0x270F30658]();
}

uint64_t GSKeyboardTranslateKeyExtended()
{
  return MEMORY[0x270F30660]();
}

uint64_t GSMainScreenPixelSize()
{
  return MEMORY[0x270F30670]();
}

uint64_t GSMainScreenPointSize()
{
  return MEMORY[0x270F30678]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t IOHIDUserDeviceCreate()
{
  return MEMORY[0x270EF46D8]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x270EF46E8]();
}

uint64_t IOHIDUserDeviceScheduleWithRunLoop()
{
  return MEMORY[0x270EF4720]();
}

uint64_t IOHIDUserDeviceUnscheduleFromRunLoop()
{
  return MEMORY[0x270EF4740]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLogv(NSString *format, va_list args)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t SBSAlertItemsSuppressionAssertionCreate()
{
  return MEMORY[0x270F77128]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIKeyboardCurrencyVariants()
{
  return MEMORY[0x270F06098]();
}

uint64_t UIKeyboardGetCurrentIdiom()
{
  return MEMORY[0x270F060C0]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x270F060C8]();
}

uint64_t UIKeyboardGetCurrentUILanguage()
{
  return MEMORY[0x270F060D0]();
}

uint64_t UIKeyboardGetSupportedHardwareKeyboardsForInputMode()
{
  return MEMORY[0x270F060E8]();
}

uint64_t UIKeyboardGetSupportedInputModes()
{
  return MEMORY[0x270F060F0]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom()
{
  return MEMORY[0x270F06108]();
}

uint64_t UIKeyboardInputModeWithNewHWLayout()
{
  return MEMORY[0x270F06158]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x270F06160]();
}

uint64_t UIKeyboardRomanAccentVariants()
{
  return MEMORY[0x270F061A8]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

int pclose(FILE *a1)
{
  return MEMORY[0x270EDAC08](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x270EDAC48](a1, a2);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

void srand48(uint64_t a1)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}