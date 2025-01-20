id psg_default_log_handle()
{
  void *v0;
  uint64_t vars8;

  if (psg_default_log_handle__pasOnceToken2 != -1) {
    dispatch_once(&psg_default_log_handle__pasOnceToken2, &__block_literal_global_302);
  }
  v0 = (void *)psg_default_log_handle__pasExprOnceResult;
  return v0;
}

void sub_20A02BFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02C0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02C250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02C4C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02C634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PSGLMWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_20A02D110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37)
{
  operator delete(v38);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__60(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__61(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    v4 = result;
    if (a4 >> 62) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    __n128 result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(a4);
    v7 = result;
    void *v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      __n128 result = memmove(result, a2, v9);
    }
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_20A02D2C4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
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

void ___ZL12tokenizeTextPvS_P8NSStringS1__block_invoke(uint64_t a1, const UInt8 *a2, CFIndex a3, int a4)
{
  if (a4)
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = (char *)v6[7];
    unint64_t v7 = v6[8];
    if ((unint64_t)v8 < v7)
    {
      *(_DWORD *)uint64_t v8 = a4;
      size_t v9 = v8 + 4;
LABEL_39:
      v6[7] = v9;
      return;
    }
    v18 = (char *)v6[6];
    uint64_t v19 = (v8 - v18) >> 2;
    unint64_t v20 = v19 + 1;
    if (!((unint64_t)(v19 + 1) >> 62))
    {
      uint64_t v21 = v7 - (void)v18;
      if (v21 >> 1 > v20) {
        unint64_t v20 = v21 >> 1;
      }
      BOOL v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL;
      unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v22) {
        unint64_t v23 = v20;
      }
      if (v23)
      {
        unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v23);
        v18 = (char *)v6[6];
        uint64_t v8 = (char *)v6[7];
      }
      else
      {
        uint64_t v24 = 0;
      }
      v26 = (_DWORD *)(v23 + 4 * v19);
      unint64_t v27 = v23 + 4 * v24;
      _DWORD *v26 = a4;
      size_t v9 = v26 + 1;
      while (v8 != v18)
      {
        int v28 = *((_DWORD *)v8 - 1);
        v8 -= 4;
        *--v26 = v28;
      }
      v6[6] = v26;
      v6[7] = v9;
      v6[8] = v27;
      if (v18) {
        operator delete(v18);
      }
      goto LABEL_39;
    }
LABEL_80:
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  if (!a3)
  {
    v25 = psg_default_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v56[0] = 0;
      _os_log_error_impl(&dword_20A02A000, v25, OS_LOG_TYPE_ERROR, "Encountered empty token with non-special token id.", (uint8_t *)v56, 2u);
    }

    return;
  }
  v10 = (__CFString *)CFStringCreateWithBytes(0, a2, a3, 0x8000100u, 0);
  if (v10)
  {
    v11 = v10;
    int TokenIDForLemmaString = getTokenIDForLemmaString(v11, *(void **)(a1 + 56), *(void **)(a1 + 64));
    if (!TokenIDForLemmaString)
    {
      if ([(NSString *)v11 length] >= 3)
      {
        v13 = -[NSString substringWithRange:](v11, "substringWithRange:", [(NSString *)v11 length] - 2, 2);
        if (([@"’s" isEqualToString:v13] & 1) != 0
          || ([@"'s" isEqualToString:v13] & 1) != 0
          || ([@"’S" isEqualToString:v13] & 1) != 0
          || ([@"'S" isEqualToString:v13] & 1) != 0)
        {
          v14 = [(NSString *)v11 substringToIndex:[(NSString *)v11 length] - 2];
          int TokenIDForLemmaString = getTokenIDForLemmaString(v14, *(void **)(a1 + 56), *(void **)(a1 + 64));

          if (TokenIDForLemmaString) {
            goto LABEL_45;
          }
        }
        else
        {
        }
      }
      int TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
      if (!TokenIDForLemmaString)
      {
        [(NSString *)v11 lowercaseString];
        int TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
        if (!TokenIDForLemmaString)
        {
          [(NSString *)v11 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
          int TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
          if (!TokenIDForLemmaString)
          {
            v15 = [(NSString *)v11 lowercaseString];
            [v15 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

            int TokenIDForLemmaString = LMLanguageModelGetTokenIDForString();
            if (!TokenIDForLemmaString)
            {
              if (*(void *)(a1 + 72) && *(unsigned char *)(a1 + 80))
              {
                v16 = malloc_type_malloc(2 * [(NSString *)v11 length], 0x1000040BDFB0063uLL);
                if (!v16)
                {
                  id v55 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
                  objc_exception_throw(v55);
                }
                -[NSString getCharacters:range:](v11, "getCharacters:range:", v16, 0, [(NSString *)v11 length]);
                LMLexiconGetRootCursor();
                [(NSString *)v11 length];
                uint64_t CursorByAdvancingWithCharacters = LMLexiconGetCursorByAdvancingWithCharacters();
                int TokenIDForLemmaString = CursorByAdvancingWithCharacters;
                if (CursorByAdvancingWithCharacters)
                {
                  if (LMLexiconCursorHasEntries()) {
                    int TokenIDForLemmaString = LMLexiconCursorFirstTokenID();
                  }
                  else {
                    int TokenIDForLemmaString = 0;
                  }
                }
                free(v16);
              }
              else
              {
                int TokenIDForLemmaString = 0;
              }
            }
          }
        }
      }
    }
LABEL_45:
    if (!*(unsigned char *)(a1 + 80)
      || !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
      || *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) == *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 56))
    {
      v34 = v11;
LABEL_55:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      uint64_t v35 = [(NSString *)v34 copy];
      uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 8);
      v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;

      CFRelease(v11);
      goto LABEL_56;
    }
    int ClassForTokenID = LMVocabularyGetClassForTokenID();
    v30 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:v11];
    int TokenIDForString = LMLanguageModelGetTokenIDForString();
    int v32 = LMVocabularyGetClassForTokenID();
    if ((v32 - 68) > 0x15 || ((1 << (v32 - 68)) & 0x200003) == 0)
    {
      v34 = v11;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) -= 4;
      v34 = v30;

      if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) == *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 56))
      {
        uint64_t v51 = *(void *)(*(void *)(a1 + 40) + 8);
        v52 = *(NSString **)(v51 + 40);
        *(void *)(v51 + 40) = 0;
        goto LABEL_78;
      }
      int ClassForTokenID = LMVocabularyGetClassForTokenID();
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      int TokenIDForLemmaString = TokenIDForString;
    }

    if (ClassForTokenID != 69 || LMVocabularyGetClassForTokenID() != 68) {
      goto LABEL_55;
    }
    v53 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:v34];
    int TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (LMVocabularyGetClassForTokenID() != 89) {
      goto LABEL_79;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) -= 4;
    v54 = v53;
    v52 = v34;
    v34 = v54;
LABEL_78:

    v53 = v34;
    int TokenIDForLemmaString = TokenIDForString;
LABEL_79:

    goto LABEL_55;
  }
  int TokenIDForLemmaString = 0;
LABEL_56:
  v38 = *(void **)(*(void *)(a1 + 32) + 8);
  v40 = (char *)v38[7];
  unint64_t v39 = v38[8];
  if ((unint64_t)v40 >= v39)
  {
    v42 = (char *)v38[6];
    uint64_t v43 = (v40 - v42) >> 2;
    unint64_t v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 62) {
      goto LABEL_80;
    }
    uint64_t v45 = v39 - (void)v42;
    if (v45 >> 1 > v44) {
      unint64_t v44 = v45 >> 1;
    }
    BOOL v22 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v22) {
      unint64_t v46 = v44;
    }
    if (v46)
    {
      unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v46);
      v42 = (char *)v38[6];
      v40 = (char *)v38[7];
    }
    else
    {
      uint64_t v47 = 0;
    }
    v48 = (_DWORD *)(v46 + 4 * v43);
    unint64_t v49 = v46 + 4 * v47;
    _DWORD *v48 = TokenIDForLemmaString;
    v41 = v48 + 1;
    while (v40 != v42)
    {
      int v50 = *((_DWORD *)v40 - 1);
      v40 -= 4;
      *--v48 = v50;
    }
    v38[6] = v48;
    v38[7] = v41;
    v38[8] = v49;
    if (v42) {
      operator delete(v42);
    }
  }
  else
  {
    *(_DWORD *)v40 = TokenIDForLemmaString;
    v41 = v40 + 4;
  }
  v38[7] = v41;
}

void sub_20A02D988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

uint64_t getTokenIDForLemmaString(NSString *a1, void *a2, void *a3)
{
  v3 = a1;
  if ([(NSString *)v3 length])
  {
    if (LMVocabularyContainsLemma())
    {
      uint64_t TokenIDForString = LMLanguageModelGetTokenIDForString();
    }
    else
    {
      v5 = [(NSString *)v3 localizedCapitalizedString];
      if (LMVocabularyContainsLemma()) {
        uint64_t TokenIDForString = LMLanguageModelGetTokenIDForString();
      }
      else {
        uint64_t TokenIDForString = 0;
      }
      CFRelease(v5);
    }
  }
  else
  {
    uint64_t TokenIDForString = 0;
  }

  return TokenIDForString;
}

void sub_20A02DB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_263FCF710, MEMORY[0x263F8C060]);
}

void sub_20A02DBB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  __n128 result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_20A02DDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02DF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02E11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_20A02E2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A02E98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_20A02F7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{
}

void sub_20A0325AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A0326A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A03291C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A032AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __psg_default_log_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  os_log_t v1 = os_log_create("com.apple.proactive.ProactiveInputPredictions", "Default");
  v2 = (void *)psg_default_log_handle__pasExprOnceResult;
  psg_default_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void sub_20A0347BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__327(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__328(uint64_t a1)
{
}

id _PASValidatedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v20[1] = *MEMORY[0x263EF8340];
  v18[1] = &a9;
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  v18[0] = 0;
  v11 = (void *)[[v9 alloc] initWithValidatedFormat:v10 validFormatSpecifiers:@"%@" locale:0 arguments:&a9 error:v18];

  id v12 = v18[0];
  if (!v11)
  {
    id v13 = objc_alloc(MEMORY[0x263EFF940]);
    uint64_t v14 = *MEMORY[0x263EFF4A0];
    uint64_t v19 = *MEMORY[0x263F08608];
    v20[0] = v12;
    v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v16 = (void *)[v13 initWithName:v14 reason:@"An error occurred while formatting the string." userInfo:v15];

    [v16 raise];
  }

  return v11;
}

void sub_20A038B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__703(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__704(uint64_t a1)
{
}

void sub_20A0399F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_20A03D5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1019(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1020(uint64_t a1)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t LMLanguageModelAddTransientVocabulary()
{
  return MEMORY[0x270F46AC0]();
}

uint64_t LMLanguageModelCopyTokenAttributes()
{
  return MEMORY[0x270F46AD8]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x270F46AE8]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x270F46AF0]();
}

uint64_t LMLanguageModelGetTokenIDForString()
{
  return MEMORY[0x270F46B40]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x270F46B78]();
}

uint64_t LMLanguageModelTokenHasAttributes()
{
  return MEMORY[0x270F46BA8]();
}

uint64_t LMLexiconCreate()
{
  return MEMORY[0x270F46BC0]();
}

uint64_t LMLexiconCursorFirstTokenID()
{
  return MEMORY[0x270F46BC8]();
}

uint64_t LMLexiconCursorHasEntries()
{
  return MEMORY[0x270F46BE0]();
}

uint64_t LMLexiconGetCursorByAdvancingWithCharacters()
{
  return MEMORY[0x270F46BF0]();
}

uint64_t LMLexiconGetRootCursor()
{
  return MEMORY[0x270F46BF8]();
}

uint64_t LMLexiconRelease()
{
  return MEMORY[0x270F46C00]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x270F46C10]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x270F46C18]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x270F46C20]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x270F46C28]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x270F46C30]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x270F46C38]();
}

uint64_t LMVocabularyContainsLemma()
{
  return MEMORY[0x270F46C40]();
}

uint64_t LMVocabularyGetClassForTokenID()
{
  return MEMORY[0x270F46C50]();
}

uint64_t LMVocabularyGetSharedVocabulary()
{
  return MEMORY[0x270F46C58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PASInsensitiveStringContainsString()
{
  return MEMORY[0x270F57F78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}