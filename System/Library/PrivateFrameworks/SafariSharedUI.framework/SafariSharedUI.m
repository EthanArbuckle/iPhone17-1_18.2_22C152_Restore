void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

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

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_1ABB73738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB73CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB73D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB73F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB74038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABB74388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1ABB754E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  if (v23) {
    free(v23);
  }

  if (v21) {
    free(v21);
  }

  _Unwind_Resume(a1);
}

id queryKeyFromSearchTemplate(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v18 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"{searchTerms}", 0, 0, 0x8000100u);
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v1);
  v3 = [v2 query];
  v4 = [v3 componentsSeparatedByString:@"&"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v17 = v1;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "rangeOfString:", @"=", v17);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v12 = v11;
          if (v11 < [v10 length] - 1)
          {
            v13 = [v10 substringFromIndex:v12 + 1];
            char v14 = [v13 isEqualToString:v18];

            if (v14)
            {
              v15 = [v10 substringToIndex:v12];
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    v15 = 0;
LABEL_13:
    id v1 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1ABB75B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

void sub_1ABB75CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB761E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7635C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB769E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB76E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1ABB77068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB77288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7733C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB773BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB77548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
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

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD115160](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__30(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1ABB77CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB77D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB78008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiteMetadata()
{
  if (WBS_LOG_CHANNEL_PREFIXSiteMetadata_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiteMetadata_onceToken, &__block_literal_global_49_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSiteMetadata_log;
}

void sub_1ABB790DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1ABB793A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXStartPage()
{
  if (WBS_LOG_CHANNEL_PREFIXStartPage_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXStartPage_onceToken, &__block_literal_global_55);
  }
  return WBS_LOG_CHANNEL_PREFIXStartPage_log;
}

void sub_1ABB79B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABB79D74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_1ABB79FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));

  _Unwind_Resume(a1);
}

void sub_1ABB7A124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7A2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7A348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7A528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABB7A5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7A77C(_Unwind_Exception *a1)
{
  MEMORY[0x1AD114BD0](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_1ABB7A828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *WBSStartPageSectionIdentifierTitle(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F98878]]
    || [v1 isEqualToString:*MEMORY[0x1E4F98880]]
    || [v1 isEqualToString:*MEMORY[0x1E4F98888]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988A8]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988B0]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988C0]]
    || [v1 isEqualToString:*MEMORY[0x1E4F98890]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988C8]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988B8]]
    || [v1 isEqualToString:*MEMORY[0x1E4F988D0]])
  {
    _WBSLocalizedString();
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = &stru_1F031A860;
  }

  return v2;
}

void sub_1ABB7B888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABB7BFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB7C9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7D17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7D2BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7D6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7D99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7DBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7DD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7DF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E3E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v3 query:v4];
  uint64_t v6 = [v5 fetch];

  return v6;
}

void sub_1ABB7E658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7E6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7ED34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7EF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABB7F074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7F24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7F2D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)va, 0);
  _Unwind_Resume(a1);
}

void sub_1ABB7F360(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)va, 0);
  _Unwind_Resume(a1);
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
}

void sub_1ABB7F3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7F510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7F5F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1ABB7F7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7F9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7FA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7FAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB7FC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXFaviconProvider()
{
  if (WBS_LOG_CHANNEL_PREFIXFaviconProvider_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXFaviconProvider_onceToken, &__block_literal_global_22_2);
  }
  return WBS_LOG_CHANNEL_PREFIXFaviconProvider_log;
}

void sub_1ABB80230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8076C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB80F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB819D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void ___ZL50trimPairOfParenthesesContainingOnlyDigitsAndSpacesP8NSString_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"(（❨❪[");
  uint64_t v1 = (void *)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::leftParenthesisCharacterSet;
  trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::leftParenthesisCharacterSet = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"）❩❫]"]);
  id v3 = (void *)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::rightParenthesisCharacterSet;
  trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::rightParenthesisCharacterSet = v2;
}

void sub_1ABB82DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB82F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB83660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB837B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB83F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXMobileAsset()
{
  if (WBS_LOG_CHANNEL_PREFIXMobileAsset_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXMobileAsset_onceToken, &__block_literal_global_100);
  }
  return WBS_LOG_CHANNEL_PREFIXMobileAsset_log;
}

void sub_1ABB8404C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8425C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB85424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB854D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB856D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB857C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB85D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1ABB85E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB85EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8609C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB865F8(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABB86734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8696C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABB86B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudExtensions_onceToken, &__block_literal_global_88);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudExtensions_log;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

void OUTLINED_FUNCTION_3_2(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return [v0 state];
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_1_5(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_0_9(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

id OUTLINED_FUNCTION_2_1(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t result, float a2)
{
  float *v3 = a2;
  void *v2 = result;
  return result;
}

void OUTLINED_FUNCTION_2_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1ABB87C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrivacyReport()
{
  if (WBS_LOG_CHANNEL_PREFIXPrivacyReport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrivacyReport_onceToken, &__block_literal_global_34);
  }
  return WBS_LOG_CHANNEL_PREFIXPrivacyReport_log;
}

void sub_1ABB88CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB89004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getSLAttributionViewClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSLAttributionViewClass_softClass;
  uint64_t v7 = getSLAttributionViewClass_softClass;
  if (!getSLAttributionViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSLAttributionViewClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getSLAttributionViewClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABB89980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLAttributionViewClass_block_invoke(uint64_t a1)
{
  SocialLayerLibrary();
  Class result = objc_getClass("SLAttributionView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSLAttributionViewClass_block_invoke_cold_1();
  }
  getSLAttributionViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABB89AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLHighlightCenterClass_block_invoke(uint64_t a1)
{
  SocialLayerLibrary();
  Class result = objc_getClass("SLHighlightCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSLHighlightCenterClass_block_invoke_cold_1();
  }
  getSLHighlightCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SocialLayerLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __SocialLayerLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5E42F10;
    uint64_t v2 = 0;
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SocialLayerLibraryCore_frameworkLibrary) {
    SocialLayerLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void sub_1ABB89DEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABB89EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SynapseLibrary()
{
  uint64_t v0 = 0;
  if (!SynapseLibraryCore()) {
    SynapseLibrary_cold_1(&v0);
  }
}

uint64_t SynapseLibraryCore()
{
  if (!SynapseLibraryCore_frameworkLibrary) {
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SynapseLibraryCore_frameworkLibrary;
}

Class __getSYLinkContextClientClass_block_invoke(uint64_t a1)
{
  SynapseLibrary();
  Class result = objc_getClass("SYLinkContextClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSYLinkContextClientClass_block_invoke_cold_1();
  }
  getSYLinkContextClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSYFeatureEligibilityClass_block_invoke(uint64_t a1)
{
  SynapseLibrary();
  Class result = objc_getClass("SYFeatureEligibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSYFeatureEligibilityClass_block_invoke_cold_1();
  }
  getSYFeatureEligibilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABB8A224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v15 - 64), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSYNotesActivationObserverClass_block_invoke(uint64_t a1)
{
  SynapseLibrary();
  Class result = objc_getClass("SYNotesActivationObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSYNotesActivationObserverClass_block_invoke_cold_1();
  }
  getSYNotesActivationObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABB8A56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8A914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExtensions_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXExtensions_log;
}

void sub_1ABB8AB4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8AF38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB8B0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8B194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8B6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8BA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::TranslatedFileURLProtocol::registerProtocol(void (**a1)(uint64_t))
{
  uint64_t v6 = a1;
  {
    uint64_t v1 = (uint64_t *)SafariShared::TranslatedFileURLProtocol::registerProtocol(SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*)::registeredProtocols;
  }
  else
  {
    uint64_t v1 = (uint64_t *)WTF::fastMalloc((WTF *)8);
    uint64_t *v1 = 0;
    SafariShared::TranslatedFileURLProtocol::registerProtocol(SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*)::registeredProtocols = (uint64_t)v1;
  }
  if (!WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::contains<WTF::IdentityHashTranslator<WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>(v1, &v6))
  {
    WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::add((uint64_t *)SafariShared::TranslatedFileURLProtocol::registerProtocol(SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*)::registeredProtocols, (uint64_t *)&v6, (uint64_t)v5);
    v5[0] = 0;
    v5[1] = v6;
    memset(&v5[2], 0, 24);
    v5[5] = SafariShared::TranslatedFileURLProtocol::canHandleRequest;
    v5[6] = SafariShared::TranslatedFileURLProtocol::createCanonicalRequest;
    v5[7] = SafariShared::TranslatedFileURLProtocol::requestsAreCacheEquivalent;
    v5[8] = SafariShared::TranslatedFileURLProtocol::protocolInstanceForProtocol;
    uint64_t v2 = CFURLProtocolRegisterImplementation();
    uint64_t v3 = (void *)MEMORY[0x1E4F46668];
    uint64_t v4 = (*v6)(v2);
    [v3 registerSchemeForCustomProtocol:v4];
  }
}

void sub_1ABB8BC28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::contains<WTF::IdentityHashTranslator<WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0;
  }
  int v3 = *(_DWORD *)(v2 - 8);
  unint64_t v4 = ~(*a2 << 32) + *a2;
  unint64_t v5 = 9 * (((v4 ^ (v4 >> 22)) + ~((v4 ^ (v4 >> 22)) << 13)) ^ (((v4 ^ (v4 >> 22)) + ~((v4 ^ (v4 >> 22)) << 13)) >> 8));
  unint64_t v6 = (v5 ^ (v5 >> 15)) + ~((v5 ^ (v5 >> 15)) << 27);
  unsigned int v7 = v3 & ((v6 >> 31) ^ v6);
  uint64_t v8 = *(void *)(v2 + 8 * v7);
  if (v8 == *a2) {
    return 1;
  }
  int v9 = 1;
  do
  {
    BOOL result = v8 != 0;
    if (!v8) {
      break;
    }
    unsigned int v7 = (v7 + v9) & v3;
    uint64_t v8 = *(void *)(v2 + 8 * v7);
    ++v9;
  }
  while (v8 != *a2);
  return result;
}

uint64_t *WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::add@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = result;
  uint64_t v6 = *result;
  if (*result
    || (result = WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::expand(result, 0), (uint64_t v6 = *v4) != 0))
  {
    char v7 = 0;
    int v8 = *(_DWORD *)(v6 - 8);
  }
  else
  {
    int v8 = 0;
    char v7 = 1;
  }
  uint64_t v9 = *a2;
  unint64_t v10 = ~(*a2 << 32) + *a2;
  unint64_t v11 = 9
      * (((v10 ^ (v10 >> 22)) + ~((v10 ^ (v10 >> 22)) << 13)) ^ (((v10 ^ (v10 >> 22)) + ~((v10 ^ (v10 >> 22)) << 13)) >> 8));
  unint64_t v12 = (v11 ^ (v11 >> 15)) + ~((v11 ^ (v11 >> 15)) << 27);
  unsigned int v13 = v8 & ((v12 >> 31) ^ v12);
  char v14 = (uint64_t *)(v6 + 8 * v13);
  uint64_t v15 = *v14;
  if (*v14)
  {
    v16 = 0;
    int v17 = 1;
    do
    {
      if (v15 == v9)
      {
        if (v7) {
          uint64_t v20 = 0;
        }
        else {
          uint64_t v20 = *(unsigned int *)(v6 - 4);
        }
        char v26 = 0;
        uint64_t v27 = v6 + 8 * v20;
        goto LABEL_31;
      }
      if (v15 == -1) {
        v16 = v14;
      }
      unsigned int v13 = (v13 + v17) & v8;
      char v14 = (uint64_t *)(v6 + 8 * v13);
      uint64_t v15 = *v14;
      ++v17;
    }
    while (*v14);
    if (v16)
    {
      uint64_t *v16 = 0;
      --*(_DWORD *)(*v4 - 16);
      uint64_t v9 = *a2;
      char v14 = v16;
    }
  }
  uint64_t *v14 = v9;
  uint64_t v18 = *v4;
  if (*v4) {
    int v19 = *(_DWORD *)(v18 - 12) + 1;
  }
  else {
    int v19 = 1;
  }
  *(_DWORD *)(v18 - 12) = v19;
  uint64_t v21 = *v4;
  if (*v4) {
    int v22 = *(_DWORD *)(v21 - 12);
  }
  else {
    int v22 = 0;
  }
  uint64_t v23 = (*(_DWORD *)(v21 - 16) + v22);
  unint64_t v24 = *(unsigned int *)(v21 - 4);
  if (v24 > 0x400)
  {
    if (v24 > 2 * v23) {
      goto LABEL_25;
    }
  }
  else if (3 * v24 > 4 * v23)
  {
    goto LABEL_25;
  }
  BOOL result = WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::expand(v4, v14);
  char v14 = result;
  uint64_t v21 = *v4;
  if (!*v4)
  {
    uint64_t v25 = 0;
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v25 = *(unsigned int *)(v21 - 4);
LABEL_30:
  uint64_t v27 = v21 + 8 * v25;
  char v26 = 1;
LABEL_31:
  *(void *)a3 = v14;
  *(void *)(a3 + 8) = v27;
  *(unsigned char *)(a3 + 16) = v26;
  return result;
}

void *WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::rehash(uint64_t *a1, unsigned int a2, void *a3)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    LODWORD(v7) = *(_DWORD *)(v6 - 4);
    int v8 = *(_DWORD *)(v6 - 12);
  }
  else
  {
    LODWORD(v7) = 0;
    int v8 = 0;
  }
  uint64_t v9 = WTF::fastZeroedMalloc((WTF *)(8 * a2 + 16));
  *a1 = v9 + 16;
  *(_DWORD *)(v9 + 12) = a2;
  *(_DWORD *)(*a1 - 8) = a2 - 1;
  *(_DWORD *)(*a1 - 16) = 0;
  *(_DWORD *)(*a1 - 12) = v8;
  unint64_t v11 = 0;
  if (v7)
  {
    uint64_t v7 = v7;
    unint64_t v12 = (void *)v6;
    do
    {
      if ((unint64_t)(*v12 + 1) >= 2)
      {
        unsigned int v13 = (void *)WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::lookupForReinsert(a1, v12);
        void *v13 = *v12;
        if (v12 == a3) {
          unint64_t v11 = v13;
        }
      }
      ++v12;
      --v7;
    }
    while (v7);
  }
  else
  {
    BOOL result = 0;
    if (!v6) {
      return result;
    }
  }
  WTF::fastFree((WTF *)(v6 - 16), v10);
  return v11;
}

void *WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::expand(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  if (*a1 && (int v4 = *(_DWORD *)(v3 - 4)) != 0) {
    unsigned int v5 = v4 << (6 * *(_DWORD *)(v3 - 12) >= (2 * v4));
  }
  else {
    unsigned int v5 = 8;
  }
  return WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::rehash(a1, v5, a2);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrivacyProxy()
{
  if (WBS_LOG_CHANNEL_PREFIXPrivacyProxy_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrivacyProxy_onceToken, &__block_literal_global_79_0);
  }
  return WBS_LOG_CHANNEL_PREFIXPrivacyProxy_log;
}

id WBSSearchProviderDefinitions()
{
  if (WBSSearchProviderDefinitions_onceToken != -1) {
    dispatch_once(&WBSSearchProviderDefinitions_onceToken, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)WBSSearchProviderDefinitions_definitions;
  return v0;
}

void sub_1ABB8D224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 256), 8);
  _Block_object_dispose((const void *)(v57 - 224), 8);
  _Block_object_dispose((const void *)(v57 - 192), 8);
  _Block_object_dispose((const void *)(v57 - 160), 8);
  _Block_object_dispose((const void *)(v57 - 128), 8);
  _Block_object_dispose((const void *)(v57 - 96), 8);
  _Unwind_Resume(a1);
}

id getPrivacyProxyClientClass()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPrivacyProxyClientClass_softClass;
  uint64_t v7 = getPrivacyProxyClientClass_softClass;
  if (!getPrivacyProxyClientClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPrivacyProxyClientClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getPrivacyProxyClientClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABB8D350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPrivacyProxyClientClass_block_invoke(uint64_t a1)
{
  if (!NetworkServiceProxyLibraryCore_frameworkLibrary) {
    NetworkServiceProxyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("PrivacyProxyClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPrivacyProxyClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMAAssetQueryClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getMAAssetQueryClass_softClass;
  uint64_t v6 = getMAAssetQueryClass_softClass;
  if (!getMAAssetQueryClass_softClass)
  {
    MobileAssetLibraryCore();
    v4[3] = (uint64_t)objc_getClass("MAAssetQuery");
    getMAAssetQueryClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABB8D7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileAssetLibraryCore()
{
  if (!MobileAssetLibraryCore_frameworkLibrary) {
    MobileAssetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return MobileAssetLibraryCore_frameworkLibrary;
}

void sub_1ABB8DBEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void WBSLoadBuiltInContentBlockersWithStore(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (WBSLoadBuiltInContentBlockersWithStore_onceToken != -1) {
    dispatch_once(&WBSLoadBuiltInContentBlockersWithStore_onceToken, &__block_literal_global_49);
  }
  if (WBSLoadBuiltInContentBlockersWithStore_canLoadRuleListUsingWebPrivacy)
  {
    uint64_t v5 = [getWPResourcesClass() sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2;
    v6[3] = &unk_1E5E45488;
    id v7 = v4;
    [v5 loadTrackerBlockerRuleListForStore:v3 completionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __WBSLoadBuiltInContentBlockersWithStore_block_invoke()
{
  uint64_t result = [getWPResourcesClass() instancesRespondToSelector:sel_loadTrackerBlockerRuleListForStore_completionHandler_];
  if (result) {
    WBSLoadBuiltInContentBlockersWithStore_canLoadRuleListUsingWebPrivacy = 1;
  }
  return result;
}

id getWPResourcesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getWPResourcesClass_softClass;
  uint64_t v7 = getWPResourcesClass_softClass;
  if (!getWPResourcesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getWPResourcesClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getWPResourcesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABB8E058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWPResourcesClass_block_invoke(uint64_t a1)
{
  if (!WebPrivacyLibraryCore_frameworkLibrary) {
    WebPrivacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("WPResources");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWPResourcesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABB8E314(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2_cold_1(v7, v5);
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_1ABB8E97C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB8EA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8ECF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8EE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8F350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB8F504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABB8F60C(_Unwind_Exception *a1)
{
  MEMORY[0x1AD114BD0](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_1ABB8F6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id defaultTranslationPreferenceValues()
{
  v4[19] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F988E0];
  v3[0] = @"WBSTranslationEnabledSettingsKey";
  v3[1] = v0;
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = MEMORY[0x1E4F1CC38];
  v3[2] = @"WBSTranslationUseTranslationAPIsSettingsKey";
  v3[3] = @"WBSTranslationForceOnlineTranslationSettingsKey";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = MEMORY[0x1E4F1CC38];
  v3[4] = @"WBSTranslationSetWebpageTranslationTaskSettingsKey";
  void v3[5] = @"WBSTranslationEnableContinuedTranslationSettingsKey";
  v4[4] = MEMORY[0x1E4F1CC38];
  v4[5] = MEMORY[0x1E4F1CC38];
  v3[6] = @"WBSTranslationLowErrorAlertThresholdSettingsKey";
  v3[7] = @"WBSTranslationHideInternalTapToRadarActionSettingsKey";
  v4[6] = MEMORY[0x1E4F1CC28];
  v4[7] = MEMORY[0x1E4F1CC28];
  v3[8] = @"WBSTranslationHideMessageInUnifiedFieldSettingsKey";
  v3[9] = @"WBSTranslationConsentedToFirstTimeAlertSettingsKey";
  v4[8] = MEMORY[0x1E4F1CC28];
  v4[9] = MEMORY[0x1E4F1CC28];
  v3[10] = @"WBSTranslationDebugAlwaysShowConsentAlertSettingsKey";
  v3[11] = @"WBSTranslationDebugDelayLanguageDetectionSettingsKey";
  v4[10] = MEMORY[0x1E4F1CC28];
  v4[11] = MEMORY[0x1E4F1CC28];
  v3[12] = @"WBSTranslationTargetLanguageEnglishSettingsKey";
  v3[13] = @"WBSTranslationTargetLanguageSpanishSettingsKey";
  v4[12] = MEMORY[0x1E4F1CC38];
  v4[13] = MEMORY[0x1E4F1CC28];
  v3[14] = @"WBSTranslationTargetLanguageFrenchSettingsKey";
  v3[15] = @"WBSTranslationTargetLanguageGermanSettingsKey";
  v4[14] = MEMORY[0x1E4F1CC28];
  v4[15] = MEMORY[0x1E4F1CC28];
  v3[16] = @"WBSTranslationTargetLanguageRussianSettingsKey";
  v3[17] = @"WBSTranslationTargetLanguageChineseSettingsKey";
  v4[16] = MEMORY[0x1E4F1CC28];
  v4[17] = MEMORY[0x1E4F1CC28];
  v3[18] = @"WBSTranslationTargetLanguagePortugeseSettingsKey";
  v4[18] = MEMORY[0x1E4F1CC28];
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:19];
  return v1;
}

id WBSSearchProviderBaiduTrackingCodeTemplateParameterValues(int a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v1 = @"1099b";
  if (a1) {
    id v1 = @"1000539d";
  }
  v6[0] = @"baiduTrackingCodeiPhone";
  v6[1] = @"baiduTrackingCodeiPad";
  uint64_t v2 = @"84053098_1_dg";
  if (a1) {
    uint64_t v2 = @"84053098_4_dg";
  }
  v7[0] = v1;
  v7[1] = v2;
  v6[2] = @"baiduTrackingCodeMac";
  id v3 = @"84053098_dg";
  if (a1) {
    id v3 = @"84053098_3_dg";
  }
  v7[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  return v4;
}

id _WBSSearchProviderDefinitionGoogle()
{
  v8[23] = *MEMORY[0x1E4F143B8];
  v7[0] = @"HomepageURLs";
  v7[1] = @"HostSuffixes";
  v8[0] = &unk_1F0341C18;
  v8[1] = &unk_1F0341C30;
  v7[2] = @"LocalizedName";
  uint64_t v0 = _WBSLocalizedString();
  uint64_t v1 = *MEMORY[0x1E4F98700];
  v8[2] = v0;
  v8[3] = v1;
  v7[3] = @"ParsecSearchIdentifier";
  void v7[4] = @"ParsecSearchSuggestionIdentifier";
  v8[4] = *MEMORY[0x1E4F986F8];
  v8[5] = &unk_1F0341640;
  v7[5] = @"ParsecSearchEndpointType";
  v7[6] = @"ParsecSearchResultType";
  v8[6] = &unk_1F0341658;
  v8[7] = @"safari_group";
  v7[7] = @"GroupIdentifierQueryStringKey";
  v7[8] = @"PathPrefixes";
  v8[8] = &unk_1F0341C48;
  v8[9] = @"&safe=active";
  v7[9] = @"SafeSearchSuffix";
  v7[10] = @"SafeSearchURLQueryParameters";
  v8[10] = &unk_1F0342200;
  v8[11] = @"https://www.google.com/search?client=safari&rls=en&q={searchTerms}&ie=UTF-8&oe=UTF-8&safe=active";
  v7[11] = @"SafeSearchURLTemplateMac";
  v7[12] = @"ScriptingName";
  v8[12] = @"Google";
  v8[13] = &unk_1F0341670;
  v7[13] = @"SearchEngineID";
  v7[14] = @"SearchEngineIdentifier";
  v8[14] = @"com.google.www";
  v8[15] = @"https://www.google.{topLevelDomain}/search?q={searchTerms}&ie=UTF-8&oe=UTF-8&hl={languageCode}&client=safari";
  v7[15] = @"SearchURLTemplate";
  v7[16] = @"SearchURLTemplateChina";
  v8[16] = @"http://www.google.{topLevelDomain}/search?q={searchTerms}&ie=UTF-8&oe=UTF-8&hl={languageCode}&client=safari";
  v8[17] = @"https://www.google.com/search?client=safari&rls=en&q={searchTerms}&ie=UTF-8&oe=UTF-8";
  v7[17] = @"SearchURLTemplateMac";
  v7[18] = @"ShortName";
  v8[18] = @"Google";
  v8[19] = @"https://clients1.google.com/complete/search?json=t&nolabels=t&client=iphonesafari&q={searchTerms}";
  v7[19] = @"SuggestionsURLTemplate";
  v7[20] = @"SuggestionsURLTemplateMac";
  v8[20] = @"https://clients1.google.com/complete/search?client=safari&q={searchTerms}";
  v7[21] = @"TopLevelDomains";
  v5[0] = &stru_1F031A860;
  v5[1] = @"CN";
  v6[0] = @"com";
  v6[1] = @"cn";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[22] = @"UsesSearchTermsFromFragment";
  v8[21] = v2;
  v8[22] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:23];

  return v3;
}

id _WBSSearchProviderDefinitionYahoo()
{
  void v8[24] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CarrierInfoTemplate";
  v7[1] = @"HomepageURLs";
  v8[0] = @"&pcarrier={carrierName}&pmcc={carrierCountryCode}&pmnc={carrierNetworkCode}";
  v8[1] = &unk_1F0341CC0;
  v8[2] = &unk_1F0341CD8;
  v7[2] = @"HostSuffixes";
  v7[3] = @"LocalizedName";
  uint64_t v0 = _WBSLocalizedString();
  uint64_t v1 = *MEMORY[0x1E4F98738];
  v8[3] = v0;
  v8[4] = v1;
  void v7[4] = @"ParsecSearchIdentifier";
  v7[5] = @"ParsecSearchSuggestionIdentifier";
  v8[5] = *MEMORY[0x1E4F98730];
  v8[6] = &unk_1F0341718;
  v7[6] = @"ParsecSearchEndpointType";
  v7[7] = @"ParsecSearchResultType";
  v8[7] = &unk_1F0341730;
  v8[8] = @"safari_group";
  v7[8] = @"GroupIdentifierQueryStringKey";
  v7[9] = @"PathPrefixes";
  v8[9] = &unk_1F0341CF0;
  v8[10] = @"&vm=r";
  v7[10] = @"SafeSearchSuffix";
  v7[11] = @"SafeSearchURLQueryParameters";
  v8[11] = &unk_1F0342228;
  v8[12] = @"https://search.yahoo.com/search?ei=utf-8&fr=aaplw&p={searchTerms}&vm=r";
  v7[12] = @"SafeSearchURLTemplateMac";
  v7[13] = @"ScriptingName";
  v8[13] = @"Yahoo";
  v8[14] = &unk_1F0341748;
  v7[14] = @"SearchEngineID";
  v7[15] = @"SearchEngineIdentifier";
  v8[15] = @"com.yahoo.www";
  v8[16] = @"https://{topLevelDomain}search.yahoo.com/search?p={searchTerms}&fr=iphone&.tsrc=apple";
  v7[16] = @"SearchURLTemplate";
  v7[17] = @"SearchURLTemplateIPad";
  v8[17] = @"https://{topLevelDomain}search.yahoo.com/search?p={searchTerms}&fr=ipad";
  v8[18] = @"https://search.yahoo.com/search?ei=utf-8&fr=aaplw&p={searchTerms}";
  v7[18] = @"SearchURLTemplateMac";
  v7[19] = @"ShortName";
  v8[19] = @"Yahoo!";
  v8[20] = @"https://{topLevelDomain}search.yahoo.com/sugg/safari?command={searchTerms}&appid=safarim&output=fxjson";
  v7[20] = @"SuggestionsURLTemplate";
  v7[21] = @"SuggestionsURLTemplateIPad";
  v8[21] = @"https://{topLevelDomain}search.yahoo.com/sugg/safari?command={searchTerms}&appid=safarit&output=fxjson";
  v8[22] = @"https://search.yahoo.com/sugg/safari?command={searchTerms}&appid=safarid&output=fxjson";
  v7[22] = @"SuggestionsURLTemplateMac";
  void v7[23] = @"TopLevelDomains";
  v5[0] = &stru_1F031A860;
  v5[1] = @"AE";
  v6[0] = &stru_1F031A860;
  v6[1] = @"xa.";
  void v5[2] = @"AR";
  v5[3] = @"AS";
  void v6[2] = @"ar.";
  void v6[3] = @"as.";
  v5[4] = @"AT";
  v5[5] = @"AU";
  void v6[4] = @"at.";
  v6[5] = @"au.";
  v5[6] = @"AZ";
  v5[7] = @"BE";
  v6[6] = @"az.";
  v6[7] = @"be.";
  v5[8] = @"BH";
  void v5[9] = @"BI";
  v6[8] = @"xa.";
  v6[9] = @"bi.";
  v5[10] = @"BR";
  v5[11] = @"CA";
  v6[10] = @"br.";
  v6[11] = @"ca.";
  v5[12] = @"CD";
  v5[13] = @"CG";
  v6[12] = @"cd.";
  v6[13] = @"cg.";
  v5[14] = @"CH";
  v5[15] = @"CL";
  v6[14] = @"ch.";
  v6[15] = @"cl.";
  v5[16] = @"CN";
  v5[17] = @"CO";
  v6[16] = @"cn.";
  v6[17] = @"co.";
  v5[18] = @"CR";
  v5[19] = @"DE";
  v6[18] = @"cr.";
  v6[19] = @"de.";
  v5[20] = @"DJ";
  v5[21] = @"DK";
  v6[20] = @"xa.";
  v6[21] = @"dk.";
  v5[22] = @"DO";
  v5[23] = @"DZ";
  v6[22] = @"do.";
  v6[23] = @"xa.";
  v5[24] = @"EG";
  v5[25] = @"EH";
  v6[24] = @"xa.";
  v6[25] = @"xa.";
  v5[26] = @"ER";
  v5[27] = @"ES";
  v6[26] = @"xa.";
  v6[27] = @"es.";
  v5[28] = @"FI";
  v5[29] = @"FJ";
  v6[28] = @"fi.";
  v6[29] = @"fj.";
  v5[30] = @"FR";
  v5[31] = @"GB";
  v6[30] = @"fr.";
  v6[31] = @"uk.";
  v5[32] = @"GL";
  v5[33] = @"GM";
  v6[32] = @"gl.";
  v6[33] = @"gm.";
  v5[34] = @"GR";
  v5[35] = @"HK";
  v6[34] = @"gr.";
  v6[35] = @"hk.";
  v5[36] = @"HN";
  v5[37] = @"HU";
  v6[36] = @"hn.";
  v6[37] = @"hu.";
  v5[38] = @"ID";
  v5[39] = @"IE";
  v6[38] = @"id.";
  v6[39] = @"ie.";
  v5[40] = @"IN";
  v5[41] = @"IQ";
  v6[40] = @"in.";
  v6[41] = @"xa.";
  v5[42] = @"IT";
  v5[43] = @"JO";
  v6[42] = @"it.";
  v6[43] = @"xa.";
  v5[44] = @"JP";
  v5[45] = @"KM";
  v6[44] = @"jp.";
  v6[45] = @"xa.";
  v5[46] = @"KR";
  v5[47] = @"KW";
  v6[46] = @"kr.";
  v6[47] = @"xa.";
  v5[48] = @"KZ";
  v5[49] = @"LB";
  v6[48] = @"kz.";
  v6[49] = @"xa.";
  v5[50] = @"LI";
  v5[51] = @"LT";
  v6[50] = @"li.";
  v6[51] = @"lt.";
  v5[52] = @"LU";
  v5[53] = @"LV";
  v6[52] = @"lu.";
  v6[53] = @"lv.";
  v5[54] = @"LY";
  v5[55] = @"MA";
  v6[54] = @"xa.";
  v6[55] = @"xa.";
  v5[56] = @"MO";
  v5[57] = @"MR";
  v6[56] = @"hk.";
  v6[57] = @"xa.";
  v5[58] = @"MT";
  v5[59] = @"MU";
  v6[58] = @"mt.";
  v6[59] = @"mu.";
  v5[60] = @"MW";
  v5[61] = @"MX";
  v6[60] = @"mw.";
  v6[61] = @"mx.";
  v5[62] = @"MY";
  v5[63] = @"NI";
  v6[62] = @"my.";
  v6[63] = @"ni.";
  v5[64] = @"NL";
  v6[64] = @"nl.";
  v5[65] = @"NO";
  v6[65] = @"no.";
  v5[66] = @"NP";
  v6[66] = @"np.";
  v5[67] = @"NZ";
  v6[67] = @"nz.";
  v5[68] = @"OM";
  v6[68] = @"xa.";
  v5[69] = @"PA";
  v6[69] = @"pa.";
  v5[70] = @"PE";
  v6[70] = @"pe.";
  v5[71] = @"PH";
  v6[71] = @"ph.";
  v5[72] = @"PK";
  v6[72] = @"pk.";
  v5[73] = @"PL";
  v6[73] = @"pl.";
  v5[74] = @"PR";
  v6[74] = @"pr.";
  v5[75] = @"PS";
  v6[75] = @"xa.";
  v5[76] = @"PT";
  v6[76] = @"pt.";
  v5[77] = @"PY";
  v6[77] = @"py.";
  v5[78] = @"QS";
  v6[78] = @"xa.";
  v5[79] = @"RO";
  v6[79] = @"ro.";
  v5[80] = @"RU";
  v6[80] = @"ru.";
  v5[81] = @"RW";
  v6[81] = @"rw.";
  v5[82] = @"SA";
  v6[82] = @"xa.";
  v5[83] = @"SD";
  v6[83] = @"xa.";
  v5[84] = @"SE";
  v6[84] = @"se.";
  v5[85] = @"SG";
  v6[85] = @"sg.";
  v5[86] = @"SV";
  v6[86] = @"sv.";
  v5[87] = @"SY";
  v6[87] = @"xa.";
  v5[88] = @"TD";
  v6[88] = @"xa.";
  v5[89] = @"TH";
  v6[89] = @"th.";
  v5[90] = @"TN";
  v6[90] = @"xa.";
  v5[91] = @"TR";
  v6[91] = @"tr.";
  v5[92] = @"TW";
  v6[92] = @"tw.";
  v5[93] = @"UA";
  v6[93] = @"ua.";
  v5[94] = @"UY";
  v6[94] = @"uy.";
  v5[95] = @"UZ";
  v6[95] = @"uz.";
  v5[96] = @"VE";
  v6[96] = @"ve.";
  v5[97] = @"VN";
  v6[97] = @"vn.";
  v5[98] = @"YE";
  v6[98] = @"xa.";
  v5[99] = @"ZA";
  v6[99] = @"za.";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:100];
  v8[23] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:24];

  return v3;
}

void __WBSSearchProviderDefinitions_block_invoke()
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v37 = _WBSSearchProviderDefinitionGoogle();
  v38[0] = v37;
  v39 = @"CarrierInfoTemplate";
  v40 = @"HomepageURLs";
  v61 = @"&pcarrier={carrierName}&pmcc={carrierCountryCode}&pmnc={carrierNetworkCode}";
  v62 = &unk_1F0341D08;
  v41 = @"HostSuffixes";
  v42 = @"Language";
  v63 = &unk_1F0341D20;
  v64 = &unk_1F0341D38;
  v43 = @"LocalizedName";
  uint64_t v0 = _WBSLocalizedString();
  uint64_t v1 = (void *)*MEMORY[0x1E4F98738];
  v65 = v0;
  v66 = v1;
  v44 = @"ParsecSearchIdentifier";
  v45 = @"ParsecSearchSuggestionIdentifier";
  v67 = (__CFString *)*MEMORY[0x1E4F98730];
  v68 = (__CFString *)&unk_1F0341718;
  v46 = @"ParsecSearchEndpointType";
  v47 = @"ParsecSearchResultType";
  v69 = (__CFString *)&unk_1F0341730;
  v70 = (__CFString *)&unk_1F0341D50;
  v48 = @"PathPrefixes";
  v49 = @"SafeSearchSuffix";
  v71 = @"&vm=r";
  v72 = (__CFString *)&unk_1F0342250;
  v50 = @"SafeSearchURLQueryParameters";
  v51 = @"SafeSearchURLTemplateMac";
  v73 = @"https://search.yahoo.co.jp/search?p={searchTerms}&ei=UTF-8&fr=appsfch2&vm=r";
  v74 = @"Yahoo";
  v52 = @"ScriptingName";
  v53 = @"SearchEngineID";
  v75 = (__CFString *)&unk_1F0341760;
  v76 = @"jp.co.yahoo.www";
  v54 = @"SearchEngineIdentifier";
  v55 = @"SearchURLTemplate";
  v77 = @"https://search.yahoo.co.jp/search?p={searchTerms}&ei=UTF-8&fr=applep1";
  v78 = @"https://search.yahoo.co.jp/search?p={searchTerms}&ei=UTF-8&fr=applpd";
  v56 = @"SearchURLTemplateIPad";
  uint64_t v57 = @"SearchURLTemplateMac";
  v79 = @"https://search.yahoo.co.jp/search?p={searchTerms}&ei=UTF-8&fr=appsfch2";
  v80 = @"Yahoo!";
  v58 = @"ShortName";
  v59 = @"SuggestionsURLTemplate";
  v60 = @"SuggestionsURLTemplateMac";
  v81 = @"https://search.yahooapis.jp/AssistSearchService/V2/webassistSearch?p={searchTerms}&appid=oQsoxcyxg66enp0TYoirkKoryq6rF8bK76mW0KYxZ0v0WPLtn.Lix6wy8F_LwGWHUII-";
  v82 = @"https://search.yahooapis.jp/AssistSearchService/V2/webassistSearch?p={searchTerms}&appid=oQsoxcyxg66enp0TYoirkKoryq6rF8bK76mW0KYxZ0v0WPLtn.Lix6wy8F_LwGWHUII-";
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[1] = v36;
  v35 = _WBSSearchProviderDefinitionYahoo();
  v38[2] = v35;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341B40;
  v62 = &unk_1F0341B58;
  v41 = @"LocalizedName";
  uint64_t v2 = _WBSLocalizedString();
  id v3 = (void *)*MEMORY[0x1E4F986D0];
  v63 = v2;
  v64 = v3;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = (void *)*MEMORY[0x1E4F986C8];
  v66 = &unk_1F0341568;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341580;
  v68 = (__CFString *)&unk_1F0341B70;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v69 = @"&adlt=strict";
  v70 = (__CFString *)&unk_1F0342188;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://www.bing.com/search?q={searchTerms}&form=APMCS1&PC=APMC&adlt=strict";
  v72 = @"Bing";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F0341598;
  v74 = @"com.bing.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://www.bing.com/search?q={searchTerms}&form=APIPH1&PC=APPL";
  v76 = @"https://www.bing.com/search?q={searchTerms}&form=APIPA1&PC=APPD";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://www.bing.com/search?q={searchTerms}&form=APMCS1&PC=APMC";
  v78 = @"Bing";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://www.bing.com/asjson.aspx?query={searchTerms}&form=APIPH2&PC=APPL";
  v80 = @"https://www.bing.com/asjson.aspx?query={searchTerms}&form=APIPA2&PC=APPD";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v81 = @"https://www.bing.com/asjson.aspx?query={searchTerms}&form=APMCS2&PC=APMC";
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:21];

  v38[3] = v34;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341AF8;
  v62 = &unk_1F0341B10;
  v41 = @"LocalizedName";
  uint64_t v4 = _WBSLocalizedString();
  id v5 = (void *)*MEMORY[0x1E4F986C0];
  v63 = v4;
  v64 = v5;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = (void *)*MEMORY[0x1E4F986B8];
  v66 = &unk_1F0341520;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341538;
  v68 = (__CFString *)&unk_1F0341B28;
  v46 = @"PathPrefixes";
  v47 = @"ScriptingName";
  v69 = @"Baidu";
  v70 = (__CFString *)&unk_1F0341550;
  v48 = @"SearchEngineID";
  v49 = @"SearchEngineIdentifier";
  v71 = @"com.baidu.www";
  v50 = @"SearchURLTemplate";
  [NSString stringWithFormat:@"https://m.baidu.com/s?from={%@}&word={searchTerms}", @"baiduTrackingCodeiPhone"];
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v72 = v6;
  v51 = @"SearchURLTemplateIPad";
  [NSString stringWithFormat:@"https://www.baidu.com/s?ie=utf-8&wd={searchTerms}&tn={%@}", @"baiduTrackingCodeiPad"];
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v73 = v7;
  v52 = @"SearchURLTemplateMac";
  [NSString stringWithFormat:@"https://www.baidu.com/s?wd={searchTerms}&tn={%@}&ie=utf-8", @"baiduTrackingCodeMac"];
  int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v74 = v8;
  v75 = @"Baidu";
  v53 = @"ShortName";
  v54 = @"SuggestionsURLTemplate";
  v55 = @"SuggestionsURLTemplateIPad";
  v76 = @"https://m.baidu.com/su?&from=wise_web&action=opensearch&ie=utf-8&wd={searchTerms}";
  v77 = @"https://www.baidu.com/su?&action=opensearch&ie=utf-8&wd={searchTerms}";
  v56 = @"SuggestionsURLTemplateMac";
  v78 = @"https://www.baidu.com/su?&action=opensearch&ie=utf-8&wd={searchTerms}";
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:18];

  v38[4] = v33;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341E70;
  v62 = &unk_1F0341E88;
  v41 = @"LocalizedName";
  uint64_t v9 = _WBSLocalizedString();
  unint64_t v10 = (void *)*MEMORY[0x1E4F98708];
  v63 = v9;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341EA0;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F03422F0;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.ru/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F03417F0;
  v74 = @"ru.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://yandex.ru/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.ru/search/pad/?clid=1906723&text={searchTerms}";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://yandex.ru/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=ru&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=ru&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v60 = @"UserRegions";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  v82 = (__CFString *)&unk_1F0341EB8;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[5] = v32;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341ED0;
  v62 = &unk_1F0341EE8;
  v41 = @"LocalizedName";
  unint64_t v11 = _WBSLocalizedString();
  v63 = v11;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341F00;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F0342318;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.com.tr/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F0341808;
  v74 = @"tr.com.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v54 = @"SearchURLTemplateIPad";
  v75 = @"https://yandex.com.tr/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.com.tr/search/pad/?clid=1906723&text={searchTerms}";
  v77 = @"https://yandex.com.tr/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v55 = @"SearchURLTemplateMac";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=tr&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=tr&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v60 = @"UserRegions";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  v82 = (__CFString *)&unk_1F0341F18;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[6] = v31;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341DB0;
  v62 = &unk_1F0341DC8;
  v41 = @"LocalizedName";
  unint64_t v12 = _WBSLocalizedString();
  v63 = v12;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v43 = @"ParsecSearchSuggestionIdentifier";
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v46 = @"PathPrefixes";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341DE0;
  v47 = @"SafeSearchSuffix";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F03422A0;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.by/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F03417C0;
  v74 = @"by.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://yandex.by/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.by/search/pad/?clid=1906723&text={searchTerms}";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://yandex.by/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=be&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=be&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v60 = @"UserRegions";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  v82 = (__CFString *)&unk_1F0341DF8;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[7] = v30;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341F30;
  v62 = &unk_1F0341F48;
  v41 = @"LocalizedName";
  unsigned int v13 = _WBSLocalizedString();
  v63 = v13;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341F60;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F0342340;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.ua/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F0341820;
  v74 = @"ua.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://yandex.ua/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.ua/search/pad/?clid=1906723&text={searchTerms}";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://yandex.ua/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=ua&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=ua&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v60 = @"UserRegions";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  v82 = (__CFString *)&unk_1F0341F78;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[8] = v29;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341E10;
  v62 = &unk_1F0341E28;
  v41 = @"LocalizedName";
  char v14 = _WBSLocalizedString();
  v63 = v14;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341E40;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F03422C8;
  v48 = @"SafeSearchURLQueryParameters";
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.kz/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F03417D8;
  v74 = @"kz.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://yandex.kz/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.kz/search/pad/?clid=1906723&text={searchTerms}";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://yandex.kz/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=kk&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=kk&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v60 = @"UserRegions";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  v82 = (__CFString *)&unk_1F0341E58;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:22];

  v38[9] = v28;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341D68;
  v62 = &unk_1F0341D80;
  v41 = @"LocalizedName";
  uint64_t v15 = _WBSLocalizedString();
  v63 = v15;
  v64 = v10;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = v10;
  v66 = &unk_1F0341778;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F0341790;
  v68 = (__CFString *)&unk_1F0341D98;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v48 = @"SafeSearchURLQueryParameters";
  v69 = @"&fyandex=1";
  v70 = (__CFString *)&unk_1F0342278;
  v49 = @"SafeSearchURLTemplateMac";
  v71 = @"https://yandex.com/search?clid=1906725&text={searchTerms}&fyandex=1";
  v72 = @"Yandex";
  v50 = @"ScriptingName";
  v51 = @"SearchEngineID";
  v73 = (__CFString *)&unk_1F03417A8;
  v74 = @"com.yandex.www";
  v52 = @"SearchEngineIdentifier";
  v53 = @"SearchURLTemplate";
  v75 = @"https://yandex.com/search/touch/?clid=1906591&text={searchTerms}";
  v76 = @"https://yandex.com/search/pad/?clid=1906723&text={searchTerms}";
  v54 = @"SearchURLTemplateIPad";
  v55 = @"SearchURLTemplateMac";
  v77 = @"https://yandex.com/search?clid=1906725&text={searchTerms}";
  v78 = @"Yandex";
  v56 = @"ShortName";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v79 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_iphone&uil=en&mob=1&part={searchTerms}";
  v80 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari_ipad&uil=en&mob=1&part={searchTerms}";
  v58 = @"SuggestionsURLTemplateIPad";
  v59 = @"SuggestionsURLTemplateMac";
  v81 = @"https://suggest.yandex.net/suggest-ff.cgi?srv=safari&part={searchTerms}";
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:21];

  v38[10] = v27;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341B88;
  v62 = &unk_1F0341BA0;
  v16 = (void *)*MEMORY[0x1E4F986D8];
  v63 = (void *)*MEMORY[0x1E4F986E0];
  v64 = v16;
  v65 = &unk_1F03415B0;
  v66 = &unk_1F03415C8;
  v41 = @"ParsecSearchIdentifier";
  v42 = @"ParsecSearchSuggestionIdentifier";
  v44 = @"ParsecSearchResultType";
  v45 = @"GroupIdentifierQueryStringKey";
  v43 = @"ParsecSearchEndpointType";
  v67 = @"anon_safari_group";
  v68 = (__CFString *)&unk_1F0341BB8;
  v46 = @"PathPrefixes";
  v47 = @"SafeSearchSuffix";
  v48 = @"SafeSearchURLQueryParameters";
  v69 = @"&kp=1";
  v70 = (__CFString *)&unk_1F03421B0;
  v49 = @"SafeSearchURLTemplateMac";
  v50 = @"ScriptingName";
  v71 = @"https://duckduckgo.com/?q={searchTerms}&t=osx&kp=1";
  v72 = @"DuckDuckGo";
  v51 = @"SearchEngineID";
  v52 = @"SearchEngineIdentifier";
  v73 = (__CFString *)&unk_1F03415E0;
  v74 = @"com.duckduckgo";
  v53 = @"SearchURLTemplate";
  v54 = @"SearchURLTemplateIPad";
  v75 = @"https://duckduckgo.com/?q={searchTerms}&t=iphone";
  v76 = @"https://duckduckgo.com/?q={searchTerms}&t=ipad";
  v55 = @"SearchURLTemplateMac";
  v56 = @"ShortName";
  v77 = @"https://duckduckgo.com/?q={searchTerms}&t=osx";
  v78 = @"DuckDuckGo";
  uint64_t v57 = @"SuggestionsURLTemplate";
  v58 = @"SuggestionsURLTemplateMac";
  v79 = @"https://duckduckgo.com/ac/?q={searchTerms}&type=list";
  v80 = @"https://duckduckgo.com/ac/?q={searchTerms}&type=list";
  char v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:20];
  v38[11] = v26;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341C90;
  v62 = &unk_1F0341CA8;
  v41 = @"LocalizedName";
  int v17 = _WBSLocalizedString();
  uint64_t v18 = (void *)*MEMORY[0x1E4F98728];
  v63 = v17;
  v64 = v18;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = (void *)*MEMORY[0x1E4F98720];
  v66 = &unk_1F03416D0;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F03416E8;
  v68 = @"Sogou";
  v46 = @"ScriptingName";
  v47 = @"SearchEngineID";
  v69 = (__CFString *)&unk_1F0341700;
  v70 = @"com.sogou.www";
  v48 = @"SearchEngineIdentifier";
  v49 = @"SearchURLTemplate";
  v71 = @"https://m.sogou.com/web/sl?keyword={searchTerms}&v=5";
  v72 = @"https://www.sogou.com/web?query={searchTerms}&ie=utf8";
  v50 = @"SearchURLTemplateIPad";
  v51 = @"SearchURLTemplateMac";
  v73 = @"https://www.sogou.com/web?query={searchTerms}&ie=utf8";
  v74 = @"Sogou";
  v52 = @"ShortName";
  v53 = @"SuggestionsURLTemplate";
  v75 = @"https://m.sogou.com/sugg_json?type=addrbar&pr=web&key={searchTerms}&ofr=json&ie=utf-8";
  v76 = @"https://www.sogou.com/sugg_json?type=addrbar&pr=web&key={searchTerms}&ofr=json&ie=utf-8";
  v54 = @"SuggestionsURLTemplateIPad";
  v55 = @"SuggestionsURLTemplateMac";
  v77 = @"https://www.sogou.com/sugg_json?type=addrbar&pr=web&key={searchTerms}&ofr=json&ie=utf-8";
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:17];

  v38[12] = v19;
  v39 = @"HomepageURLs";
  v40 = @"HostSuffixes";
  v61 = (__CFString *)&unk_1F0341C60;
  v62 = &unk_1F0341C78;
  v41 = @"LocalizedName";
  uint64_t v20 = _WBSLocalizedString();
  uint64_t v21 = (void *)*MEMORY[0x1E4F98718];
  v63 = v20;
  v64 = v21;
  v42 = @"ParsecSearchIdentifier";
  v43 = @"ParsecSearchSuggestionIdentifier";
  v65 = (void *)*MEMORY[0x1E4F98710];
  v66 = &unk_1F0341688;
  v44 = @"ParsecSearchEndpointType";
  v45 = @"ParsecSearchResultType";
  v67 = (__CFString *)&unk_1F03416A0;
  v68 = @"Qihoo";
  v46 = @"ScriptingName";
  v47 = @"SearchEngineID";
  v69 = (__CFString *)&unk_1F03416B8;
  v70 = @"com.qihoo.www";
  v48 = @"SearchEngineIdentifier";
  v49 = @"SearchURLTemplate";
  v71 = @"https://m.so.com/s?q={searchTerms}&src=home&srcg=safariwap_1";
  v72 = @"https://m.so.com/s?q={searchTerms}&src=home&srcg=safariwap_1";
  v50 = @"SearchURLTemplateIPad";
  v51 = @"SearchURLTemplateMac";
  v73 = @"https://www.so.com/s?q={searchTerms}&src=pclm&ls=safarimac";
  v74 = @"Qihoo";
  v52 = @"ShortName";
  v53 = @"SuggestionsURLTemplate";
  v54 = @"SuggestionsURLTemplateMac";
  v75 = @"https://m.sug.so.com/suggest?word={searchTerms}&encodein=utf-8&encodeout=utf-8&format=opensearch&srcg=safariwap_1";
  v76 = @"https://sug.so.360.cn/suggest?word={searchTerms}&encodein=utf-8&encodeout=utf-8&format=opensearch&srcg=safarimac";
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v39 count:16];

  v38[13] = v22;
  uint64_t v23 = _WBSSearchProviderDefinitionEcosia();
  v38[14] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:15];
  uint64_t v25 = (void *)WBSSearchProviderDefinitions_definitions;
  WBSSearchProviderDefinitions_definitions = v24;
}

id _WBSSearchProviderDefinitionEcosia()
{
  v5[20] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HomepageURLs";
  v4[1] = @"HostSuffixes";
  v5[0] = &unk_1F0341BD0;
  v5[1] = &unk_1F0341BE8;
  uint64_t v0 = *MEMORY[0x1E4F986F0];
  v4[2] = @"ParsecSearchIdentifier";
  v4[3] = @"ParsecSearchSuggestionIdentifier";
  uint64_t v1 = *MEMORY[0x1E4F986E8];
  void v5[2] = v0;
  v5[3] = v1;
  v4[4] = @"ParsecSearchEndpointType";
  v4[5] = @"ParsecSearchResultType";
  v5[4] = &unk_1F03415F8;
  v5[5] = &unk_1F0341610;
  v4[6] = @"PathPrefixes";
  v4[7] = @"SafeSearchSuffix";
  v5[6] = &unk_1F0341C00;
  v5[7] = @"&sfn=true";
  v4[8] = @"SafeSearchURLQueryParameters";
  v4[9] = @"SafeSearchURLTemplateMac";
  v5[8] = &unk_1F03421D8;
  void v5[9] = @"https://www.ecosia.org/search?q={searchTerms}&tts=st_asaf_macos&sfn=true";
  v4[10] = @"ScriptingName";
  v4[11] = @"SearchEngineID";
  v5[10] = @"Ecosia";
  v5[11] = &unk_1F0341628;
  v4[12] = @"SearchEngineIdentifier";
  v4[13] = @"SearchURLTemplate";
  v5[12] = @"org.ecosia.www";
  v5[13] = @"https://www.ecosia.org/search?q={searchTerms}";
  v4[14] = @"SearchURLTemplateMac";
  v4[15] = @"SearchURLTemplateIPhone";
  v5[14] = @"https://www.ecosia.org/search?q={searchTerms}&tts=st_asaf_macos";
  v5[15] = @"https://www.ecosia.org/search?q={searchTerms}&tts=st_asaf_iphone";
  v4[16] = @"SearchURLTemplateIPad";
  v4[17] = @"ShortName";
  v5[16] = @"https://www.ecosia.org/search?q={searchTerms}&tts=st_asaf_ipad";
  v5[17] = @"Ecosia";
  v4[18] = @"SuggestionsURLTemplate";
  v4[19] = @"SuggestionsURLTemplateMac";
  v5[18] = @"https://ac.ecosia.org/autocomplete?q={searchTerms}&type=list";
  v5[19] = @"https://ac.ecosia.org/autocomplete?q={searchTerms}&type=list";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:20];
  return v2;
}

void sub_1ABB921D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB92854(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB9380C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB93A38(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABB93C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB93CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB93D74(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABB94008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94064()
{
}

void sub_1ABB940C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94288(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

void sub_1ABB944C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB945AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1ABB94D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB94F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB95024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB950D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Init_DustEffect256_graph_DC680B38_F027_4C51_B1B0_557E92AAEFE7(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { FMOV            V1.4S, #1.0 }
  *(float *)&_Q1 = a1;
  DWORD1(_Q1) = *(_DWORD *)(a4 + 4);
  *(_OWORD *)a4 = _Q1;
}

double __vfx_script_DustEffect256_graph_DC680B38_F027_4C51_B1B0_557E92AAEFE7(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(void *)(arguments_buffer_delayInitStub + 24);
  __asm { FMOV            V0.4S, #1.0 }
  LODWORD(_Q0) = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  DWORD1(_Q0) = *(_DWORD *)(v2 + 4);
  *(_OWORD *)uint64_t v2 = _Q0;
  return *(double *)&_Q0;
}

__n128 Update_DustEffect256_graph_949E61E3_E147_4B13_857E_B5CB57635D87(uint64_t a1, uint64_t a2, long long *a3, double *a4)
{
  long long v11 = *a3;
  long long v12 = *(_OWORD *)a4;
  vfx_script_clock_time_delayInitStub(*a4);
  *(float *)&double v6 = v6;
  int v10 = LODWORD(v6);
  vfx_script_clock_time_delayInitStub(v6);
  *(float *)&long long v8 = *(double *)&v8;
  *(float *)&long long v8 = *(float *)&v8 * 0.2;
  long long v7 = v11;
  DWORD2(v7) = v10;
  *a3 = v7;
  *(void *)((char *)&v8 + 4) = *(void *)((char *)&v12 + 4);
  *(_OWORD *)a4 = v8;
  result.n128_u64[0] = v8;
  result.n128_u32[2] = DWORD2(v8);
  return result;
}

__n128 __vfx_script_DustEffect256_graph_949E61E3_E147_4B13_857E_B5CB57635D87(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(long long **)(arguments_buffer_delayInitStub + 16);
  id v3 = *(long long **)(arguments_buffer_delayInitStub + 24);
  long long v9 = *v2;
  long long v10 = *v3;
  vfx_script_clock_time_delayInitStub(*(double *)v3);
  *(float *)&double v4 = v4;
  int v8 = LODWORD(v4);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&long long v6 = *(double *)&v6;
  *(float *)&long long v6 = *(float *)&v6 * 0.2;
  long long v5 = v9;
  DWORD2(v5) = v8;
  long long *v2 = v5;
  *(void *)((char *)&v6 + 4) = *(void *)((char *)&v10 + 4);
  long long *v3 = v6;
  *((_DWORD *)v2 + 3) = 1065353216;
  *((_DWORD *)v3 + 3) = 1065353216;
  result.n128_u64[0] = v6;
  result.n128_u32[2] = DWORD2(v6);
  return result;
}

char **__vfx_get_script_table_DustEffect256()
{
  return &__vfx_get_script_table_DustEffect256::scriptTable;
}

void sub_1ABB97160(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __shouldShowAlternateNewsUniversalLinksFormatting_block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.newscore"];
  shouldShowAlternateNewsUniversalLinksFormatting_shouldShowAlternateNewsUniversalLinksFormatting = [v0 BOOLForKey:@"show_alternate_universal_links_preference"];
}

id tertiaryGroupedBackgroundColor()
{
  if (tertiaryGroupedBackgroundColor_onceToken != -1) {
    dispatch_once(&tertiaryGroupedBackgroundColor_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)tertiaryGroupedBackgroundColor_tertiaryGroupBGColor;
  return v0;
}

void __tertiaryGroupedBackgroundColor_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", &unk_1F0341A80);
  uint64_t v1 = (void *)tertiaryGroupedBackgroundColor_tertiaryGroupBGColor;
  tertiaryGroupedBackgroundColor_tertiaryGroupBGColor = v0;
}

uint64_t WBSFolderGlyphColor()
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.18 green:0.46 blue:0.85 alpha:1.0];
}

void sub_1ABB9A8D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB9A974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB9AD24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB9AEA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB9B774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABB9BD28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __defaultConfiguration_block_invoke()
{
  id v0 = [[WBSBookmarkFolderTouchIconConfiguration alloc] initFor3x3Layout];
  uint64_t v1 = (void *)defaultConfiguration_configuration;
  defaultConfiguration_configuration = (uint64_t)v0;
}

void sub_1ABB9CF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9D074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9D398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9D47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9D988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9DB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9DC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9DDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9DEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9E1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9E694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9E7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9E91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9EA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABB9EB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9EC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9EE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v5 query:v6];
  [v7 bindString:*a3 atParameterIndex:1];
  int v8 = [v7 fetch];

  return v8;
}

void sub_1ABB9EF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9F938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9FB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABB9FC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v13 = 0;
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v5 query:v6 error:&v13];
  id v8 = v13;
  long long v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v7 execute];
    [v7 invalidate];
    if ((v10 - 100) >= 2 && v10 != 0) {
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, objc_msgSend(v7, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v8;
    }
    uint64_t v10 = [v9 code];
  }

  return v10;
}

void sub_1ABB9FD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},double>(void *a1, void *a2, void *a3, void *a4, double *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v17 = 0;
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v9 query:v10 error:&v17];
  id v12 = v17;
  id v13 = v12;
  if (v11)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double>(v11, a4, a5);
    uint64_t v14 = [v11 execute];
    [v11 invalidate];
    if ((v14 - 100) >= 2 && v14 != 0) {
      objc_msgSend(v9, "reportErrorWithCode:statement:error:", v14, objc_msgSend(v11, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v12;
    }
    uint64_t v14 = [v13 code];
  }

  return v14;
}

void sub_1ABB9FE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double>(void *a1, void *a2, double *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:1];
  [v5 bindDouble:2 atParameterIndex:*a3];
}

void sub_1ABB9FF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong},double,BOOL,BOOL>(void *a1, void *a2, void *a3, void *a4, void *a5, double *a6, unsigned __int8 *a7, unsigned __int8 *a8)
{
  id v15 = a1;
  id v16 = a3;
  id v23 = 0;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v15 query:v16 error:&v23];
  id v18 = v23;
  int v19 = v18;
  if (v17)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong},double,BOOL,BOOL>(v17, a4, a5, a6, a7, a8);
    uint64_t v20 = [v17 execute];
    [v17 invalidate];
    if ((v20 - 100) >= 2 && v20 != 0) {
      objc_msgSend(v15, "reportErrorWithCode:statement:error:", v20, objc_msgSend(v17, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v18;
    }
    uint64_t v20 = [v19 code];
  }

  return v20;
}

void sub_1ABBA005C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong},double,BOOL,BOOL>(void *a1, void *a2, void *a3, double *a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},double,BOOL,BOOL>(v11, a3, a4, a5, a6);
}

void sub_1ABBA010C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},double,BOOL,BOOL>(void *a1, void *a2, double *a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  id v9 = a1;
  [v9 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,double,BOOL,BOOL>(v9, a3, a4, a5);
}

void sub_1ABBA0198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,double,BOOL,BOOL>(void *a1, double *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  id v7 = a1;
  [v7 bindDouble:3 atParameterIndex:*a2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,BOOL,BOOL>(v7, a3, a4);
}

void sub_1ABBA021C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,BOOL,BOOL>(void *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  id v5 = a1;
  [v5 bindInt:*a2 atParameterIndex:4];
  [v5 bindInt:*a3 atParameterIndex:5];
}

void sub_1ABBA0294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v15 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v7 query:v8 error:&v15];
  id v10 = v15;
  id v11 = v10;
  if (v9)
  {
    [v9 bindString:*a4 atParameterIndex:1];
    uint64_t v12 = [v9 execute];
    [v9 invalidate];
    if ((v12 - 100) >= 2 && v12 != 0) {
      objc_msgSend(v7, "reportErrorWithCode:statement:error:", v12, objc_msgSend(v9, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v10;
    }
    uint64_t v12 = [v11 code];
  }

  return v12;
}

void sub_1ABBA03B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id developerIdentifierFromComposedIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "rangeOfString:", @"(");
  unint64_t v3 = [v1 rangeOfString:@""]);
  BOOL v4 = v2 == 0x7FFFFFFFFFFFFFFFLL || v3 == 0x7FFFFFFFFFFFFFFFLL;
  if (v4 || v3 <= v2 + 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(v1, "substringWithRange:");
  }

  return v5;
}

void sub_1ABBA2EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBA3214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBA36D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBA39A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id extensionsStatesDictionaryToUseForComparison(void *a1)
{
  uint64_t v1 = extensionsStatesDictionaryToUseForComparison_once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&extensionsStatesDictionaryToUseForComparison_once, &__block_literal_global_219);
  }
  unint64_t v3 = objc_msgSend(v2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_221);

  return v3;
}

void __filteredStateDictionaryForExtensionState_block_invoke()
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F987F0];
  v6[0] = *MEMORY[0x1E4F987B8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F98830];
  void v6[2] = *MEMORY[0x1E4F98828];
  void v6[3] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)filteredStateDictionaryForExtensionState_allowedKeys;
  filteredStateDictionaryForExtensionState_allowedKeys = v4;
}

uint64_t __filteredStateDictionaryForExtensionState_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_189);
}

id __filteredStateDictionaryForExtensionState_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)filteredStateDictionaryForExtensionState_allowedKeys;
  id v3 = a2;
  if ([v2 containsObject:v3]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void __filteredStateDictionaryForEnabledState_block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F987F8];
  v5[0] = *MEMORY[0x1E4F98800];
  v5[1] = v1;
  void v5[2] = *MEMORY[0x1E4F98820];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)filteredStateDictionaryForEnabledState_allowedKeys;
  filteredStateDictionaryForEnabledState_allowedKeys = v3;
}

id __filteredStateDictionaryForEnabledState_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)filteredStateDictionaryForEnabledState_allowedKeys;
  id v3 = a2;
  if ([v2 containsObject:v3]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void __saveCurrentDeviceTimeInterval_block_invoke()
{
  if ([MEMORY[0x1E4F98318] isInternalInstall]
    && (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        id v0 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "safari_numberForKey:", *MEMORY[0x1E4F98498]),
        uint64_t v1 = objc_claimAutoreleasedReturnValue(),
        v0,
        v1))
  {
    [v1 doubleValue];
    saveCurrentDeviceTimeInterval_saveCurrentDeviceTimeInterval = v2;
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __saveCurrentDeviceTimeInterval_block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    saveCurrentDeviceTimeInterval_saveCurrentDeviceTimeInterval = 0x40F5180000000000;
  }
}

void __pruneInactiveDevicesTimeInterval_block_invoke()
{
  if ([MEMORY[0x1E4F98318] isInternalInstall]
    && (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        id v0 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "safari_numberForKey:", *MEMORY[0x1E4F98488]),
        uint64_t v1 = objc_claimAutoreleasedReturnValue(),
        v0,
        v1))
  {
    [v1 doubleValue];
    pruneInactiveDevicesTimeInterval_pruneInactiveDevicesTimeInterval = v2;
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __pruneInactiveDevicesTimeInterval_block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    pruneInactiveDevicesTimeInterval_pruneInactiveDevicesTimeInterval = 0x40F5180000000000;
  }
}

void __timeIntervalBeforeAssumingDeviceHasBecomeInactive_block_invoke()
{
  if ([MEMORY[0x1E4F98318] isInternalInstall]
    && (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        id v0 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "safari_numberForKey:", *MEMORY[0x1E4F984A8]),
        uint64_t v1 = objc_claimAutoreleasedReturnValue(),
        v0,
        v1))
  {
    [v1 doubleValue];
    timeIntervalBeforeAssumingDeviceHasBecomeInactive_timeIntervalBeforeAssumingDeviceHasBecomeInactive = v2;
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __timeIntervalBeforeAssumingDeviceHasBecomeInactive_block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    timeIntervalBeforeAssumingDeviceHasBecomeInactive_timeIntervalBeforeAssumingDeviceHasBecomeInactive = 0x4132750000000000;
  }
}

void __extensionDeviceDictionaryToUseForComparison_block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = *MEMORY[0x1E4F987C0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)extensionDeviceDictionaryToUseForComparison_ignoredKeys;
  extensionDeviceDictionaryToUseForComparison_ignoredKeys = v2;
}

id __extensionDeviceDictionaryToUseForComparison_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)extensionDeviceDictionaryToUseForComparison_ignoredKeys;
  id v5 = a3;
  if ([v4 containsObject:a2]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = v6;

  return v7;
}

void __extensionsStatesDictionaryToUseForComparison_block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F98820];
  v11[0] = *MEMORY[0x1E4F987E8];
  v11[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)extensionsStatesDictionaryToUseForComparison_ignoredKeys;
  extensionsStatesDictionaryToUseForComparison_ignoredKeys = v3;

  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = *MEMORY[0x1E4F987F8];
  v10[0] = *MEMORY[0x1E4F98800];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v5 setWithArray:v7];
  uint64_t v9 = (void *)extensionsStatesDictionaryToUseForComparison_BOOLKeys;
  extensionsStatesDictionaryToUseForComparison_BOOLKeys = v8;
}

uint64_t __extensionsStatesDictionaryToUseForComparison_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_223);
}

id __extensionsStatesDictionaryToUseForComparison_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([(id)extensionsStatesDictionaryToUseForComparison_ignoredKeys containsObject:v4]) {
    goto LABEL_5;
  }
  if (![v4 isEqualToString:*MEMORY[0x1E4F98838]])
  {
    if ([(id)extensionsStatesDictionaryToUseForComparison_BOOLKeys containsObject:v4])
    {
      if ([v5 BOOLValue]) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = 0;
      }
      id v6 = v8;
    }
    else
    {
      id v6 = v5;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    id v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_225);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  id v7 = v6;
LABEL_13:

  return v7;
}

id __extensionsStatesDictionaryToUseForComparison_block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_227);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __extensionsStatesDictionaryToUseForComparison_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([(id)extensionsStatesDictionaryToUseForComparison_ignoredKeys containsObject:v4])
  {
    id v6 = 0;
  }
  else
  {
    int v7 = [(id)extensionsStatesDictionaryToUseForComparison_BOOLKeys containsObject:v4];
    uint64_t v8 = v5;
    if (v7)
    {
      if ([v5 BOOLValue]) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    id v6 = v8;
  }

  return v6;
}

uint64_t getValidColorComponentAtIndexInArray(void *a1, uint64_t a2, double *a3)
{
  id v4 = objc_msgSend(a1, "safari_numberAtIndex:", a2);
  id v5 = v4;
  if (v4 && (([v4 doubleValue], v6 >= 0.0) ? (BOOL v7 = v6 <= 1.0) : (BOOL v7 = 0), v7))
  {
    *a3 = v6;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1ABBA5C40(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1ABBA5BF4);
  }
  _Unwind_Resume(a1);
}

void sub_1ABBA7764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBA79AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class __getPKGlyphViewClass_block_invoke(uint64_t a1)
{
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary) {
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("PKGlyphView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKGlyphViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUIFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPKAddPassesViewControllerClass_block_invoke(uint64_t a1)
{
  if (!PassKitUILibraryCore_frameworkLibrary) {
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("PKAddPassesViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKAddPassesViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1ABBA84D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA85D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)WBSExtensionsController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1ABBA86AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA87F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA898C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABBA8A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA8FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA91A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA92E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA94BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBA9BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAA9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAAC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBAAD40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAAE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAAFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAB8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBABF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAC994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBACA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBACBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBACD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBACF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1ABBACFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAD7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void -[WBSExtensionsController _blockExtension:](WBSExtensionsController *self, SEL a2, id a3)
{
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [v4 identifier];
    objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController _blockExtension:]();
  }

  double v6 = [(WBSExtensionsController *)self composedIdentifierForExtensionStateForExtension:v4];
  [(WBSExtensionsController *)self _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:v6];

  blockedExtensions = self->_blockedExtensions;
  if (!blockedExtensions)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v9 = self->_blockedExtensions;
    self->_blockedExtensions = v8;

    blockedExtensions = self->_blockedExtensions;
  }
  if (([(NSMutableSet *)blockedExtensions containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_blockedExtensions addObject:v4];
    [(WBSExtensionsController *)self _removeSafariExtensionDataForExtension:v4];
    extensions = self->_extensions;
    p_extensions = &self->_extensions;
    if ([(NSMutableArray *)extensions count])
    {
      uint64_t v12 = (void *)[(NSMutableArray *)*p_extensions mutableCopy];
      [v12 removeObject:v4];
      objc_storeStrong((id *)p_extensions, v12);
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:*MEMORY[0x1E4F98570] object:v4];
    }
  }
}

void sub_1ABBAD990(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABBADE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE18C(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABBAE294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE33C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE6E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAE934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAEB04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAEB58()
{
}

void sub_1ABBAEB60()
{
}

void sub_1ABBAEB68()
{
}

void sub_1ABBAEC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAEC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAEE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAEF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAF804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAFA1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAFAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBAFED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB00A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB0390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB04A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB071C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB0B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB0DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB0F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB1238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABBB150C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB15CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB166C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB18E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB1A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB1D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB1F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19)
{
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)(v23 - 104));

  _Unwind_Resume(a1);
}

void sub_1ABBB24C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB27AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBB29A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  objc_destroyWeak(v20);
  _Unwind_Resume(a1);
}

void sub_1ABBB2C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB344C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB35A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB388C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1ABBB39FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1ABBB3AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1ABBB3BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1ABBB3C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB3F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB40F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB43D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB44F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id -[WBSFaviconProvider _blockOperationForRequest:](WBSFaviconProvider *self, SEL a2, id a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke;
  v8[3] = &unk_1E5E41D10;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  double v6 = (void *)MEMORY[0x1AD115160](v8);

  return v6;
}

void sub_1ABBB46A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBB4968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB4A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB4AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB4E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB5068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABBB52B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB53D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB54D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB55C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB58A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB5A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABBB5C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  objc_destroyWeak(v19);
  _Unwind_Resume(a1);
}

void sub_1ABBB5DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  return result;
}

void sub_1ABBB6000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBB615C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBB6368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB63C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  v40 = v38;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);

  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose((const void *)(v39 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1ABBB6A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB6DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v25 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1ABBB6F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB700C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBB72FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB74F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBB7670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB78A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB79A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB7F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB80B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB837C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB852C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB86B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABBB8EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB8FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&,NSString * {__strong}&>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v7 query:v8];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&>(v9, a3, a4);
  uint64_t v10 = [v9 fetch];

  return v10;
}

void sub_1ABBB9614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB97A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB99AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBB9F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBA910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1ABBBA9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBAA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBAB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBABE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBAD1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBAE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABBBB090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:1];
  [v5 bindString:*a3 atParameterIndex:2];
}

void sub_1ABBBB178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v17 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v9 query:v10 error:&v17];
  id v12 = v17;
  id v13 = v12;
  if (v11)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&>(v11, a4, a5);
    uint64_t v14 = [v11 execute];
    [v11 invalidate];
    if ((v14 - 100) >= 2 && v14 != 0) {
      objc_msgSend(v9, "reportErrorWithCode:statement:error:", v14, objc_msgSend(v11, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v12;
    }
    uint64_t v14 = [v13 code];
  }

  return v14;
}

void sub_1ABBBB2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double,double &,double &,BOOL &>(void *a1, void *a2, void *a3, void *a4, void *a5, double *a6, double *a7, double *a8, unsigned __int8 *a9)
{
  id v16 = a1;
  id v17 = a3;
  id v24 = 0;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v16 query:v17 error:&v24];
  id v19 = v24;
  uint64_t v20 = v19;
  if (v18)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&,double,double &,double &,BOOL &>(v18, a4, a5, a6, a7, a8, a9);
    uint64_t v21 = [v18 execute];
    [v18 invalidate];
    if ((v21 - 100) >= 2 && v21 != 0) {
      objc_msgSend(v16, "reportErrorWithCode:statement:error:", v21, objc_msgSend(v18, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v19;
    }
    uint64_t v21 = [v20 code];
  }

  return v21;
}

void sub_1ABBBB400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&,double,double &,double &,BOOL &>(void *a1, void *a2, void *a3, double *a4, double *a5, double *a6, unsigned __int8 *a7)
{
  id v13 = a1;
  [v13 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,double,double &,double &,BOOL &>(v13, a3, a4, a5, a6, a7);
}

void sub_1ABBBB4B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,double,double &,double &,BOOL &>(void *a1, void *a2, double *a3, double *a4, double *a5, unsigned __int8 *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,double,double &,double &,BOOL &>(v11, a3, a4, a5, a6);
}

void sub_1ABBBB554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,double,double &,double &,BOOL &>(void *a1, double *a2, double *a3, double *a4, unsigned __int8 *a5)
{
  id v9 = a1;
  [v9 bindDouble:3 atParameterIndex:*a2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,double &,double &,BOOL &>(v9, a3, a4, a5);
}

void sub_1ABBBB5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,double &,double &,BOOL &>(void *a1, double *a2, double *a3, unsigned __int8 *a4)
{
  id v7 = a1;
  [v7 bindDouble:4 atParameterIndex:*a2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,double &,BOOL &>(v7, a3, a4);
}

void sub_1ABBBB664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,double &,BOOL &>(void *a1, double *a2, unsigned __int8 *a3)
{
  id v5 = a1;
  [v5 bindDouble:5 atParameterIndex:*a2];
  [v5 bindInt:*a3 atParameterIndex:6];
}

void sub_1ABBBB6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&>(void *a1, void *a2, void *a3, double *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v17 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v9 query:v10 error:&v17];
  id v12 = v17;
  id v13 = v12;
  if (v11)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,double,NSString * {__strong}&>(v11, a4, a5);
    uint64_t v14 = [v11 execute];
    [v11 invalidate];
    if ((v14 - 100) >= 2 && v14 != 0) {
      objc_msgSend(v9, "reportErrorWithCode:statement:error:", v14, objc_msgSend(v11, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v12;
    }
    uint64_t v14 = [v13 code];
  }

  return v14;
}

void sub_1ABBBB804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,double,NSString * {__strong}&>(void *a1, double *a2, void *a3)
{
  id v5 = a1;
  [v5 bindDouble:1 atParameterIndex:*a2];
  [v5 bindString:*a3 atParameterIndex:2];
}

void sub_1ABBBB890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double>(void *a1, void *a2, void *a3, void *a4, void *a5, double *a6)
{
  id v11 = a1;
  id v12 = a3;
  id v19 = 0;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F983C8]) initWithDatabase:v11 query:v12 error:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&,double>(v13, a4, a5, a6);
    uint64_t v16 = [v13 execute];
    [v13 invalidate];
    if ((v16 - 100) >= 2 && v16 != 0) {
      objc_msgSend(v11, "reportErrorWithCode:statement:error:", v16, objc_msgSend(v13, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v14;
    }
    uint64_t v16 = [v15 code];
  }

  return v16;
}

void sub_1ABBBB9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,NSString * {__strong}&,double>(void *a1, void *a2, void *a3, double *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,double>(v7, a3, a4);
}

void sub_1ABBBBA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,double>(void *a1, void *a2, double *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:2];
  [v5 bindDouble:3 atParameterIndex:*a3];
}

void sub_1ABBBBAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1ABBC172C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBC1FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sizeOfImageAtIndex(CGImageSource *a1, int a2)
{
  CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(a1, a2, 0);
  if (!v2) {
    return *MEMORY[0x1E4F1DB30];
  }
  CFDictionaryRef v3 = v2;
  Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F2FD00]);
  id v5 = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F2FCE8]);
  CFRelease(v3);
  [Value floatValue];
  double v7 = v6;
  [v5 floatValue];
  return v7;
}

void sub_1ABBC23B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC256C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC353C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBC3834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v31 - 136), 8);
  objc_destroyWeak(v29);
  objc_sync_exit(v28);
  _Unwind_Resume(a1);
}

void sub_1ABBC39B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBC3AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBC3CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC3F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC471C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC47A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC4F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC51A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC52A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC5360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC5658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBC678C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBC6B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBC6D9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBC6F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1ABBC7474(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBC75A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBC77F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBC792C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBC814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBC8858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBC8944(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id WBSForYouLinkRecommendationSourceDownvoteActionTitle(void *a1)
{
  switch((unint64_t)a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      a1 = _WBSLocalizedString();
      break;
    default:
      break;
  }
  return a1;
}

void sub_1ABBCA81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBCAA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCAB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCAB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCAE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCAFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCB160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCB1E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCB568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCBBD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBCBD4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBCBE9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBCBFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBCC600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  objc_destroyWeak(v54);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a54, 8);
  objc_destroyWeak((id *)(v55 - 248));
  _Unwind_Resume(a1);
}

void sub_1ABBCC7C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBCC8E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBCCA5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void removeLinkRecommendationsPassingTestWithReductionReason(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 count];
  objc_msgSend(v5, "safari_removeObjectsPassingTest:", v7);

  if ([v5 count] != v8)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v9;
      int v11 = 134218498;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = [v5 count];
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Number of allowed recommendations reduced from %ld to %ld after removing %{public}@.", (uint8_t *)&v11, 0x20u);
    }
  }
}

id imageValidForPresentation(void *a1)
{
  id v1 = a1;
  [v1 size];
  if (v2 <= 57.0 || ([v1 size], v3 <= 57.0)) {
    id v4 = 0;
  }
  else {
    id v4 = v1;
  }

  return v4;
}

void sub_1ABBCE790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBCF8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1ABBCF984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1ABBCFD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBCFEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD0084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD0394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD054C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD071C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD0830(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABBD0A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBD0C64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id bestDateForSuggestion(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v1 documentDate], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    uint64_t v3 = [v1 documentDate];
  }
  else
  {
    id v4 = [v1 receivedAt];

    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v3 = [v1 receivedAt];
  }
  id v4 = (void *)v3;
LABEL_7:

  return v4;
}

double WBSRectCenteredWithinRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&a1);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  v15.origin.y = CGRectGetMidY(v14);
  v15.size.width = 0.0;
  v15.size.height = 0.0;
  v15.origin.x = MidX;
  return floor(COERCE_DOUBLE(CGRectInset(v15, a5 * -0.5, a6 * -0.5)));
}

double WBSSizeScaleAspectFillSize(double result, double a2, double a3, double a4)
{
  double v4 = result / a2 / (a3 / a4);
  if (v4 <= 1.0) {
    return result / v4;
  }
  return result;
}

double WBSSizeScaleAspectFitSize(double result, double a2, double a3, double a4)
{
  double v4 = result / a2 / (a3 / a4);
  if (v4 > 1.0) {
    return result / v4;
  }
  return result;
}

double WBSRoundFloatToPixelsInContext(CGContext *a1, double a2)
{
  CGContextGetUserSpaceToDeviceSpaceTransform(&v4, a1);
  return round(v4.a * a2) / v4.a;
}

double WBSEuclideanDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return sqrt((a1 - a3) * (a1 - a3) + (a2 - a4) * (a2 - a4));
}

id WBSURLForHighlight(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 resourceURL];
  uint64_t v3 = [v2 host];
  int v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"apple.news");

  if (v4)
  {
    id v5 = [v1 supplementaryData];
    id v6 = [v5 objectForKey:@"com_apple_mobilesms_resolvedURL"];
  }
  else
  {
    id v6 = 0;
  }
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v2;
  }
  id v8 = v7;

  return v8;
}

uint64_t __SocialLayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t WBSShouldApplyBackingForLightBackdropToImage(CGImage *a1)
{
  return WBSShouldApplyBackingForBackdropToImage(a1, &__block_literal_global_19, &__block_literal_global_3_1);
}

uint64_t WBSShouldApplyBackingForBackdropToImage(CGImage *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t Width = CGImageGetWidth(a1);
  unint64_t Height = CGImageGetHeight(a1);
  id v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
  uint64_t v10 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, v9, 1u);
  v68.size.width = (double)Width;
  v68.size.height = (double)Height;
  v68.origin.x = 0.0;
  v68.origin.y = 0.0;
  CGContextDrawImage(v10, v68, a1);
  Data = CGBitmapContextGetData(v10);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke;
  v67[3] = &__block_descriptor_48_e23_I56__0Q8Q16_24_32_40_48l;
  v67[4] = Data;
  v67[5] = Width;
  uint64_t v12 = (void *)MEMORY[0x1AD115160](v67);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke_2;
  v61[3] = &unk_1E5E43030;
  id v53 = v12;
  id v62 = v53;
  id v13 = v6;
  id v63 = v13;
  unint64_t v65 = Width;
  unint64_t v66 = Height;
  id v14 = v5;
  id v64 = v14;
  CGRect v15 = (uint64_t (**)(void, void, void, void, void, void))MEMORY[0x1AD115160](v61);
  char v60 = 0;
  unint64_t v47 = Height + Width;
  unint64_t v16 = 0;
  v48 = v13;
  id v49 = v14;
  v58 = (unint64_t *)malloc_type_malloc(16 * (Height + Width), 0x9FCAD845uLL);
  v50 = v10;
  v51 = v9;
  if (Width)
  {
    unint64_t v17 = 0;
    unint64_t v16 = 0;
    unint64_t v54 = Height;
    unint64_t v56 = Width;
    unint64_t v18 = Width;
    unint64_t v19 = Height;
    do
    {
      if (Height)
      {
        unint64_t v20 = 0;
        while ((((uint64_t (**)(void, unint64_t, unint64_t, void, uint64_t, char *))v15)[2](v15, v17, v20, 0, 1, &v60) & 1) == 0)
        {
          if (Height == ++v20) {
            goto LABEL_12;
          }
        }
        unint64_t v21 = v16 + 1;
        v58[v16] = v20;
        if (v20 < v19) {
          unint64_t v19 = v20;
        }
        if (!v60)
        {
          if (v17 < v18) {
            unint64_t v18 = v17;
          }
          unint64_t v22 = v56;
          if (v56 >= Width + ~v17) {
            unint64_t v22 = Width + ~v17;
          }
          unint64_t v56 = v22;
          uint64_t v23 = 1;
          while (Height + v23 - 2 < Height)
          {
            --v23;
            if (((uint64_t (*)(uint64_t (**)(void, void, void, void, void, void), unint64_t))v15[2])(v15, v17))
            {
              v16 += 2;
              v58[v21] = -v23;
              uint64_t v24 = v54;
              if (v54 >= -v23) {
                uint64_t v24 = -v23;
              }
              unint64_t v54 = v24;
              goto LABEL_12;
            }
          }
        }
        ++v16;
      }
LABEL_12:
      ++v17;
    }
    while (v17 < Width && !v60);
  }
  else
  {
    unint64_t v19 = Height;
    unint64_t v18 = 0;
    unint64_t v54 = Height;
    unint64_t v56 = 0;
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke_3;
  v59[3] = &__block_descriptor_56_e5_v8__0l;
  v59[4] = v50;
  v59[5] = v51;
  v59[6] = v58;
  uint64_t v25 = MEMORY[0x1AD115160](v59);
  char v26 = (void (**)(void))v25;
  if (!v60 && v19 != Height)
  {
    unint64_t v27 = Height - v54;
    if (v19 >= Height - v54) {
      goto LABEL_55;
    }
    v52 = (void (**)(void))v25;
    unint64_t v28 = Width - v56;
    unint64_t v29 = Width + ~v56;
    BOOL v30 = v29 < v18 || v29 >= Width;
    BOOL v31 = v30;
    char v55 = v31;
    uint64_t v57 = -(uint64_t)v56;
    do
    {
      if (v18 < v28)
      {
        unint64_t v32 = v18;
        while ((((uint64_t (**)(void, unint64_t, unint64_t, uint64_t, void, char *))v15)[2](v15, v32, v19, 1, 0, &v60) & 1) == 0)
        {
          if (++v32 >= v28) {
            goto LABEL_51;
          }
        }
        unint64_t v33 = v16 + 1;
        v58[v16] = v32;
        char v34 = v55;
        if (v60) {
          char v34 = 1;
        }
        if (v34)
        {
LABEL_44:
          ++v16;
        }
        else
        {
          uint64_t v35 = v57;
          while ((((uint64_t (**)(void, unint64_t, unint64_t, uint64_t, void, char *))v15)[2](v15, Width + v35 - 1, v19, -1, 0, &v60) & 1) == 0)
          {
            unint64_t v36 = Width + v35 - 2;
            if (v36 >= v18)
            {
              --v35;
              if (v36 < Width) {
                continue;
              }
            }
            goto LABEL_44;
          }
          v16 += 2;
          v58[v33] = -v35;
        }
      }
LABEL_51:
      ++v19;
    }
    while (v19 < v27 && !v60);
    char v26 = v52;
    if (!v60)
    {
LABEL_55:
      if (v16)
      {
        unint64_t v39 = v16 - 1;
        if (v16 != 1)
        {
          uint64_t v41 = 0;
          float v42 = 0.0;
          v43 = v58;
          do
            float v42 = v42 + (float)v58[v41++];
          while (v16 != v41);
          float v40 = v42 / (float)v16;
          float v44 = 0.0;
          v38 = v49;
          do
          {
            unint64_t v45 = *v43++;
            float v44 = v44 + (float)((float)(v40 - (float)v45) * (float)(v40 - (float)v45));
            --v16;
          }
          while (v16);
          if (sqrtf(v44 / (float)v39) >= 1.25)
          {
LABEL_66:
            v26[2](v26);
            uint64_t v37 = 1;
            goto LABEL_68;
          }
LABEL_65:
          if ((double)v47 * 0.125 * 0.5 >= v40)
          {
            v26[2](v26);
            uint64_t v37 = 0;
            goto LABEL_68;
          }
          goto LABEL_66;
        }
        float v40 = (float)*v58;
      }
      else
      {
        float v40 = 0.0;
      }
      v38 = v49;
      goto LABEL_65;
    }
  }
  v26[2](v26);
  uint64_t v37 = 0;
  v38 = v49;
LABEL_68:

  return v37;
}

void sub_1ABBD4338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,void *a35)
{
  _Unwind_Resume(a1);
}

BOOL __WBSShouldApplyBackingForLightBackdropToImage_block_invoke(double a1)
{
  return a1 < 220.0;
}

uint64_t __WBSShouldApplyBackingForLightBackdropToImage_block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  BOOL v7 = a2 > 0xF0 && a3 > 0xF0 && a4 > 0xF0;
  return a5 < 0x19 || v7;
}

uint64_t WBSShouldApplyBackingForDarkBackdropToImage(CGImage *a1)
{
  return WBSShouldApplyBackingForBackdropToImage(a1, &__block_literal_global_5, &__block_literal_global_7);
}

BOOL __WBSShouldApplyBackingForDarkBackdropToImage_block_invoke(double a1)
{
  return a1 > 80.0;
}

BOOL __WBSShouldApplyBackingForDarkBackdropToImage_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return a5 < 0x19;
}

void sub_1ABBD45BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD4748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD47DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD485C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD49AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD4B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBD4ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD50C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD51AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double WBSComputeAverageLuminance(CGImage *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v3 = data;
  int v4 = CGBitmapContextCreate(data, 4uLL, 4uLL, 8uLL, 0x10uLL, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetInterpolationQuality(v4, kCGInterpolationMedium);
  CGContextSetBlendMode(v4, kCGBlendModeCopy);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 4.0;
  v16.size.height = 4.0;
  CGContextDrawImage(v4, v16, a1);
  CGContextRelease(v4);
  uint64_t v8 = 0;
  int v13 = 0;
  uint64_t v12 = 0;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 3; ++j)
        *((_DWORD *)&v12 + j) += v3[j];
      v3 += 4;
    }
    ++v8;
  }
  while (v8 != 4);
  LODWORD(v6) = HIDWORD(v12);
  LODWORD(v7) = v13;
  LODWORD(v5) = v12;
  return ((double)v6 * 0.7152 + (double)v7 * 0.2126 + (double)v5 * 0.0722) / 4080.0;
}

void sub_1ABBD5440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1ABBD5528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double WBSComputeLuminance(double a1, double a2, double a3)
{
  return a2 * 0.7152 + a1 * 0.2126 + a3 * 0.0722;
}

uint64_t ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned char *a5, unsigned char *a6, unsigned char *a7)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 4 * (a2 + *(void *)(a1 + 40) * a3));
  if (a4) {
    *a4 = result;
  }
  if (a5) {
    *a5 = BYTE1(result);
  }
  if (a6) {
    *a6 = BYTE2(result);
  }
  if (a7) {
    *a7 = BYTE3(result);
  }
  return result;
}

uint64_t ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  (*(void (**)(void))(a1[4] + 16))();
  char v12 = (*(uint64_t (**)(void))(a1[5] + 16))();
  uint64_t result = 0;
  if ((v12 & 1) == 0)
  {
    if ((unint64_t)(a4 + a2) < a1[7] && (unint64_t)(a5 + a3) < a1[8]) {
      (*(void (**)(void))(a1[4] + 16))();
    }
    if (a6)
    {
      LOBYTE(v13) = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v15) = 0;
      float v17 = ((double)v14 * 0.7152 + (double)v13 * 0.2126 + (double)v15 * 0.0722)
          * (255.0
           / (double)0x3FB27BB2FEC56D00uLL);
      *a6 = (*(uint64_t (**)(double))(a1[6] + 16))(v17);
    }
    return 1;
  }
  return result;
}

void ___ZL39WBSShouldApplyBackingForBackdropToImageP7CGImageU13block_pointerFbdEU13block_pointerFbhhhhE_block_invoke_3(uint64_t a1)
{
  CGContextRelease(*(CGContextRef *)(a1 + 32));
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 48);
  free(v2);
}

void ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke(uint64_t a1)
{
}

BOOL ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 64) * a2 + 4 * a3 + *(void *)(a1 + 32) + 3) == 255;
}

uint64_t ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_3(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) != 0
    || ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) != 0
    || !(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    return 0;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t ___ZL25_analyzeImageTransparencyP7CGImage_block_invoke_4(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) != 0
    || ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) != 0
    || !(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    return 0;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void sub_1ABBD5D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 240), 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBD66E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD67B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD69D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD6AF8(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABBD6C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD6D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBD6DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id get_SWCTrackingDomainInfoClass()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)get_SWCTrackingDomainInfoClass_softClass;
  uint64_t v7 = get_SWCTrackingDomainInfoClass_softClass;
  if (!get_SWCTrackingDomainInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_SWCTrackingDomainInfoClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __get_SWCTrackingDomainInfoClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABBD7200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SharedWebCredentialsLibraryCore()
{
  if (!SharedWebCredentialsLibraryCore_frameworkLibrary) {
    SharedWebCredentialsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SharedWebCredentialsLibraryCore_frameworkLibrary;
}

uint64_t __SharedWebCredentialsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharedWebCredentialsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1ABBD79C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id scribbleElementsFromActions(void *a1)
{
  id v1 = objc_msgSend(a1, "safari_mapObjectsUsingBlock:", &__block_literal_global_229);
  uint64_t v2 = v1;
  if (!v1) {
    id v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

void sub_1ABBD8098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBD8188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBD8344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBD87B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBD914C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1ABBD980C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBD9D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDA0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDA25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDAC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

WBSScribbleElement *__scribbleElementsFromActions_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WBSScribbleElement alloc] initWithContentBlockerAction:v2];

  return v3;
}

void sub_1ABBDB2F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDB450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDC9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WBSAnnotationStringForLockdownModeStatus(unint64_t a1, id a2)
{
  if (a1 <= 2)
  {
    _WBSLocalizedString();
    a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a2;
}

void sub_1ABBDD820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBDE1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDE368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBDE5B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDE808(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDEBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDF0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBDF434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDF4B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBDF550(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getLPMetadataProviderClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibraryCore();
  Class result = objc_getClass("LPMetadataProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLPMetadataProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void LinkPresentationLibraryCore()
{
  if (!LinkPresentationLibraryCore_frameworkLibrary) {
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
}

uint64_t __LinkPresentationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLPImageClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibraryCore();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLPImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getASAttributeContentVersion()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (void **)getASAttributeContentVersionSymbolLoc_ptr;
  uint64_t v7 = getASAttributeContentVersionSymbolLoc_ptr;
  if (!getASAttributeContentVersionSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getASAttributeContentVersionSymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getASAttributeContentVersionSymbolLoc_block_invoke((uint64_t)v3);
    id v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getASAttributeContentVersion_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBE06AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBE0C68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getMAAssetQueryClass_block_invoke(uint64_t a1)
{
  MobileAssetLibraryCore();
  Class result = objc_getClass("MAAssetQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAAssetQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileAssetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileAssetLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getASAttributeContentVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v2 = (void *)MobileAssetLibraryCore();
  if (!v2) {
    __getASAttributeContentVersionSymbolLoc_block_invoke_cold_1(&v4);
  }
  uint64_t result = dlsym(v2, "ASAttributeContentVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAttributeContentVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMAAssetClass_block_invoke(uint64_t a1)
{
  MobileAssetLibraryCore();
  Class result = objc_getClass("MAAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABBE1B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE1DA4(_Unwind_Exception *exception_object)
{
}

void sub_1ABBE1F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE2084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBE21D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE2390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBE24A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE25A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE26BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE27FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE2954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE2D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE2FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE308C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE3188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE3368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE34CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE35E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBE36A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE3718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](id **a1, id *a2)
{
  Class result = *a1;
  *a1 = a2;
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x1AD114BD0);
  }
  return result;
}

void sub_1ABBE393C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL targetedElementRectsAreSimilar(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5)) {
    return 1;
  }
  v25.origin.CGFloat x = a1;
  v25.origin.CGFloat y = a2;
  v25.size.CGFloat width = a3;
  v25.size.CGFloat height = a4;
  if (CGRectIsEmpty(v25)) {
    return 0;
  }
  v26.origin.CGFloat x = a5;
  v26.origin.CGFloat y = a6;
  v26.size.CGFloat width = a7;
  v26.size.CGFloat height = a8;
  if (CGRectIsEmpty(v26)) {
    return 0;
  }
  v27.origin.CGFloat x = a1;
  v27.origin.CGFloat y = a2;
  v27.size.CGFloat width = a3;
  v27.size.CGFloat height = a4;
  v34.origin.CGFloat x = a5;
  v34.origin.CGFloat y = a6;
  v34.size.CGFloat width = a7;
  v34.size.CGFloat height = a8;
  CGRect v28 = CGRectIntersection(v27, v34);
  CGFloat y = v28.origin.y;
  CGFloat x = v28.origin.x;
  CGFloat height = v28.size.height;
  CGFloat width = v28.size.width;
  double v23 = CGRectGetWidth(v28);
  v29.origin.CGFloat y = y;
  v29.origin.CGFloat x = x;
  v29.size.CGFloat height = height;
  v29.size.CGFloat width = width;
  double v24 = v23 * CGRectGetHeight(v29);
  v30.origin.CGFloat x = a1;
  v30.origin.CGFloat y = a2;
  v30.size.CGFloat width = a3;
  v30.size.CGFloat height = a4;
  double v22 = CGRectGetWidth(v30);
  v31.origin.CGFloat x = a1;
  v31.origin.CGFloat y = a2;
  v31.size.CGFloat width = a3;
  v31.size.CGFloat height = a4;
  if (v24 / (v22 * CGRectGetHeight(v31)) < 0.800000012) {
    return 0;
  }
  v32.origin.CGFloat x = a5;
  v32.origin.CGFloat y = a6;
  v32.size.CGFloat width = a7;
  v32.size.CGFloat height = a8;
  double v17 = CGRectGetWidth(v32);
  v33.origin.CGFloat x = a5;
  v33.origin.CGFloat y = a6;
  v33.size.CGFloat width = a7;
  v33.size.CGFloat height = a8;
  return v24 / (v17 * CGRectGetHeight(v33)) >= 0.800000012;
}

uint64_t positionTypeIsOutOfFlow(unint64_t a1)
{
  return (a1 < 5) & (0x1Cu >> a1);
}

void sub_1ABBE5488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id selectorsForJavaScript(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      uint64_t v16 = v4;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * v6);
        if ([v7 count] == 1)
        {
          if (selectorsForJavaScript_onceToken != -1) {
            dispatch_once(&selectorsForJavaScript_onceToken, &__block_literal_global_85_1);
          }
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v8 = [v7 lastObject];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v19;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v19 != v11) {
                  objc_enumerationMutation(v8);
                }
                unint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
                if (objc_msgSend((id)selectorsForJavaScript_pseudoSelectorPattern, "rangeOfFirstMatchInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length")) == 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(v2, "addObject:", v13); {
              }
                }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v10);
          }

          uint64_t v5 = v15;
          uint64_t v4 = v16;
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  return v2;
}

void __selectorsForJavaScript_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"::\\w+$" options:0 error:0];
  id v1 = (void *)selectorsForJavaScript_pseudoSelectorPattern;
  selectorsForJavaScript_pseudoSelectorPattern = v0;
}

Class __getVNImageRequestHandlerClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNImageRequestHandler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVNImageRequestHandlerClass_block_invoke_cold_1();
  }
  getVNImageRequestHandlerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void VisionLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __VisionLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5E43BD8;
    uint64_t v2 = 0;
    VisionLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary) {
    VisionLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __VisionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getVNRecognizeTextRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNRecognizeTextRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVNRecognizeTextRequestClass_block_invoke_cold_1();
  }
  getVNRecognizeTextRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id WBSSharedParsecBag()
{
  uint64_t v0 = [MEMORY[0x1E4F98368] sharedPARSession];
  long long v1 = [v0 bag];

  return v1;
}

void sub_1ABBE6620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE6684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBE6854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t indexOfURLInParsecURLStrings(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 absoluteString];
  uint64_t v5 = objc_msgSend(v4, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 4, 0, 0);

  if ([v5 length]) {
    uint64_t v6 = [v3 indexOfObject:v5];
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __NetworkServiceProxyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NetworkServiceProxyLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1ABBE8554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id mapTrackersByFirstPartyDomain(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v1;
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v5 = [v4 firstParties];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v20 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * j) domain];
              uint64_t v11 = [v2 objectForKeyedSubscript:v10];

              if (!v11)
              {
                char v12 = [MEMORY[0x1E4F1CA80] set];
                [v2 setObject:v12 forKeyedSubscript:v10];
              }
              unint64_t v13 = [v2 objectForKeyedSubscript:v10];
              [v13 addObject:v4];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v7);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

  unint64_t v14 = (void *)[v2 copy];
  return v14;
}

id fetchingQueue()
{
  if (fetchingQueue_onceToken != -1) {
    dispatch_once(&fetchingQueue_onceToken, &__block_literal_global_265);
  }
  uint64_t v0 = (void *)fetchingQueue_fetchingQueue;
  return v0;
}

void __fetchingQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SafariShared.WBSPrivacyReportData", v2);
  id v1 = (void *)fetchingQueue_fetchingQueue;
  fetchingQueue_fetchingQueue = (uint64_t)v0;
}

id getAnalyticsWorkspaceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getAnalyticsWorkspaceClass_softClass;
  uint64_t v7 = getAnalyticsWorkspaceClass_softClass;
  if (!getAnalyticsWorkspaceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAnalyticsWorkspaceClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getAnalyticsWorkspaceClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABBEB900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUsageFeedClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getUsageFeedClass_softClass;
  uint64_t v7 = getUsageFeedClass_softClass;
  if (!getUsageFeedClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUsageFeedClass_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getUsageFeedClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABBEB9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkSymptomAnalyticsServiceEndpoint()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getkSymptomAnalyticsServiceEndpointSymbolLoc_ptr;
  uint64_t v7 = getkSymptomAnalyticsServiceEndpointSymbolLoc_ptr;
  if (!getkSymptomAnalyticsServiceEndpointSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkSymptomAnalyticsServiceEndpointSymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getkSymptomAnalyticsServiceEndpointSymbolLoc_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkSymptomAnalyticsServiceEndpoint_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBEBAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_ptr;
  uint64_t v7 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_ptr;
  if (!getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBEBBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_ptr;
  uint64_t v7 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_ptr;
  if (!getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBEBC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_ptr;
  uint64_t v7 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_ptr;
  if (!getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBEBD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_ptr;
  uint64_t v7 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_ptr;
  if (!getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_block_invoke;
    v3[3] = &unk_1E5E41610;
    v3[4] = &v4;
    __getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1ABBEBE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__SymptomAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 1);
  SymptomAnalyticsLibraryCore_librarCGFloat y = (uint64_t)result;
  return result;
}

void *__SymptomPresentationFeedLibraryCore_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomPresentationFeed.framework/SymptomPresentationFeed", 1);
  SymptomPresentationFeedLibraryCore_librarCGFloat y = (uint64_t)result;
  return result;
}

void *__SymptomPresentationLiteLibraryCore_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomPresentationLite.framework/SymptomPresentationLite", 1);
  SymptomPresentationLiteLibraryCore_librarCGFloat y = (uint64_t)result;
  return result;
}

Class __getAnalyticsWorkspaceClass_block_invoke(uint64_t a1)
{
  if (SymptomAnalyticsLibraryCore_once != -1) {
    dispatch_once(&SymptomAnalyticsLibraryCore_once, &__block_literal_global_6);
  }
  Class result = objc_getClass("AnalyticsWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUsageFeedClass_block_invoke(uint64_t a1)
{
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  Class result = objc_getClass("UsageFeed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUsageFeedClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomAnalyticsServiceEndpointSymbolLoc_block_invoke(uint64_t a1)
{
  if (SymptomPresentationLiteLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationLiteLibraryCore_once, &__block_literal_global_12);
  }
  Class result = dlsym((void *)SymptomPresentationLiteLibraryCore_library, "kSymptomAnalyticsServiceEndpoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomAnalyticsServiceEndpointSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_block_invoke(uint64_t a1)
{
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  Class result = dlsym((void *)SymptomPresentationFeedLibraryCore_library, "kSymptomAnalyticsServiceDomainTrackingClearHistoryKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_block_invoke(uint64_t a1)
{
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  Class result = dlsym((void *)SymptomPresentationFeedLibraryCore_library, "kSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

void *__getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_block_invoke(uint64_t a1)
{
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  Class result = dlsym((void *)SymptomPresentationFeedLibraryCore_library, "kSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

void *__getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_block_invoke(uint64_t a1)
{
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  Class result = dlsym((void *)SymptomPresentationFeedLibraryCore_library, "kSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                        + 24);
  return result;
}

__CFString *WBSStringFromPrivateBrowsingExplanationState(uint64_t a1)
{
  if (a1) {
    return @"minimized";
  }
  else {
    return @"expanded";
  }
}

unint64_t WBSPrivateBrowsingExplanationStateFromInteger(unint64_t result)
{
  if (result > 1) {
    return 0;
  }
  return result;
}

void sub_1ABBED00C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)WBSSafariExtension;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1ABBED2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)WBSSafariExtensionStateObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1ABBED4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBED848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABBED96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABBEDAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEDBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v16 = v14;

  _Unwind_Resume(a1);
}

void sub_1ABBEDCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEE45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id valueForKeyInQuery(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [a1 componentsSeparatedByString:@"&"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [v8 rangeOfString:@"="];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v9;
          uint64_t v11 = [v8 substringToIndex:v9];
          char v12 = [v11 isEqualToString:v15];

          if (v12)
          {
            unint64_t v13 = [v8 substringFromIndex:v10 + 1];
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  unint64_t v13 = 0;
LABEL_12:

  return v13;
}

void sub_1ABBEEAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id WBSSearchProviderShortNameOrderOnMac()
{
  if (_WBSSearchProviderInternetServicesRegion_onceToken != -1) {
    dispatch_once(&_WBSSearchProviderInternetServicesRegion_onceToken, &__block_literal_global_209);
  }
  id v0 = (id)_WBSSearchProviderInternetServicesRegion_region;
  if ([v0 isEqualToString:@"CN"])
  {
    if (_WBSSearchProviderShortNameOrderOnMac_onceToken != -1) {
      dispatch_once(&_WBSSearchProviderShortNameOrderOnMac_onceToken, &__block_literal_global_196);
    }
    id v1 = &_WBSSearchProviderShortNameOrderOnMac_definitionOrder;
  }
  else if ([v0 isEqualToString:@"RU"])
  {
    if (_WBSSearchProviderShortNameOrderOnMac_onceToken_201 != -1) {
      dispatch_once(&_WBSSearchProviderShortNameOrderOnMac_onceToken_201, &__block_literal_global_203);
    }
    id v1 = &_WBSSearchProviderShortNameOrderOnMac_definitionOrder_200;
  }
  else
  {
    if (_WBSSearchProviderShortNameOrderOnMac_onceToken_205 != -1) {
      dispatch_once(&_WBSSearchProviderShortNameOrderOnMac_onceToken_205, &__block_literal_global_207);
    }
    id v1 = &_WBSSearchProviderShortNameOrderOnMac_definitionOrder_204;
  }
  id v2 = (id)*v1;

  return v2;
}

id WBSSearchProviderShortNameForProviderIdentifier(void *a1)
{
  uint64_t v1 = WBSSearchProviderShortNameForProviderIdentifier_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&WBSSearchProviderShortNameForProviderIdentifier_onceToken, &__block_literal_global_190);
  }
  id v3 = [(id)WBSSearchProviderShortNameForProviderIdentifier_identifiersToShortNames objectForKeyedSubscript:v2];

  return v3;
}

void __WBSSearchProviderShortNameForProviderIdentifier_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v1 = WBSSearchProviderDefinitions();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "objectForKeyedSubscript:", @"SearchEngineIdentifier", (void)v11);
        uint64_t v8 = [v6 objectForKeyedSubscript:@"ShortName"];
        [v0 setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  uint64_t v9 = [v0 copy];
  uint64_t v10 = (void *)WBSSearchProviderShortNameForProviderIdentifier_identifiersToShortNames;
  WBSSearchProviderShortNameForProviderIdentifier_identifiersToShortNames = v9;
}

void sub_1ABBEF49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEF634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEF728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEF7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEF828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEF8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBEFBB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBEFEBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1ABBF01D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF0478(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF0904(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF0D60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF130C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF18D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBF1CD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABBF1F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBF22F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABBF28EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1ABBF2A0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF2B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABBF2F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF35A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF384C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF3D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF40C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF43F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF44B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF45B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF489C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF4EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF521C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF56B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF5840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF591C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF5A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF5DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF60D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF63F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void logCompletionMatchToDebugChannel(NSString *a1, WBSURLCompletionMatch *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  if ([MEMORY[0x1E4F98318] isSearchEvaluationLoggingEnabled])
  {
    uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(WBSURLCompletionMatch *)v4 uuidString];
      logCompletionMatchToDebugChannel((uint64_t)v3, v6, v8, v5);
    }
  }
  else
  {
    uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [(WBSURLCompletionMatch *)v4 originalURLString];
      logCompletionMatchToDebugChannel((uint64_t)v3, v7, v8, v5);
    }
  }
}

void sub_1ABBF6B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF6FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF70BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF71B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF72FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF74FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v16 = v14;

  _Unwind_Resume(a1);
}

void sub_1ABBF7808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF7F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF80D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF8214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF82BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF83C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF84BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF85AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBF866C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFA588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *WBSStringFromSiteMetadataRequestPriority(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown WBSSiteMetadataRequestPriority";
  }
  else {
    return off_1E5E44AC0[a1];
  }
}

void sub_1ABBFB624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFB858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFB8F8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABBFBBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFBD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFBE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFBEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFBFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFC238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFC454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFC51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFC5F8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABBFC884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFC970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFCAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFCB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFCC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _WBSSetStartPageWallpaperImage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[WBSStartPageBackgroundManager defaultManager];
  uint64_t v3 = v2;
  if (v1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F982B8];
    id v5 = v1;
    uint64_t v6 = objc_msgSend(v4, "imageByAdoptingCGImage:", CGImageCreateCopy((CGImageRef)objc_msgSend(v5, "CGImage")));
    [v5 imageOrientation];
    LODWORD(v5) = _EXIFOrientationForUIImageOrientation();
    uint64_t v7 = v3[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___WBSSetStartPageWallpaperImage_block_invoke;
    block[3] = &unk_1E5E44C58;
    uint64_t v10 = v3;
    id v11 = v6;
    int v12 = (int)v5;
    id v8 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    [v2 clearImage];
  }
}

void sub_1ABBFCDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFCF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _WBSGetStartPageWallpaperImage()
{
  id v0 = +[WBSStartPageBackgroundManager defaultManager];
  id v1 = [v0 image];

  if (v1) {
    id v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", objc_msgSend(v1, "CGImage"));
  }

  if (v1) {
    uint64_t v2 = v0;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2;
}

void sub_1ABBFD02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFD23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFD3A4(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABBFD9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFDF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t appearanceNameForLuminance(double a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v2 floatForKey:*MEMORY[0x1E4F98868]];
  float v4 = v3;
  double v5 = v3;

  double v6 = 0.65;
  if (v4 > 0.0) {
    double v6 = v5;
  }
  if (v6 < a1) {
    return 1;
  }
  else {
    return 2;
  }
}

void sub_1ABBFE478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFE9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFEC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFED94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFF6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFF89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFF9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFFD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFFDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABBFFF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC002B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0053C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0062C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC007C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC009B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC00E3C(_Unwind_Exception *a1)
{
  float v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC0101C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC013A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1ABC014B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC015F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC019E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC01FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC03EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABC04088(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABC05480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABC05AB8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __SynapseLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SynapseLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1ABC063D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD115160](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1ABC066BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLPMetadataProviderClass_block_invoke_0(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPMetadataProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLPMetadataProviderClass_block_invoke_cold_1();
  }
  getLPMetadataProviderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void LinkPresentationLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __LinkPresentationLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5E45160;
    uint64_t v2 = 0;
    LinkPresentationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!LinkPresentationLibraryCore_frameworkLibrary_0) {
    LinkPresentationLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __LinkPresentationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getLPImageClass_block_invoke_0(uint64_t a1)
{
  LinkPresentationLibrary();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLPImageClass_block_invoke_cold_1();
  }
  getLPImageClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1ABC070B8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1ABC07914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __defaultConfiguration_block_invoke_0()
{
  id v0 = [[WBSBookmarkFolderTouchIconConfiguration alloc] initForTabGroup];
  uint64_t v1 = (void *)defaultConfiguration_configuration_0;
  defaultConfiguration_configuration_0 = (uint64_t)v0;
}

void sub_1ABC07E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC07ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)WBSTemplateIconCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1ABC07F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC081BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC082A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC083B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC086C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0884C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC08C4C()
{
}

void sub_1ABC08F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0931C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC097A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0988C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC099AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC09C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0A9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0AABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0AB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0ADE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0B9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0BF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

WBSCachedFont *systemFontWithSizeWeightAndDesign(uint64_t a1, uint64_t a2, double a3)
{
  double v6 = objc_alloc_init(WBSCachedFont);
  [(WBSCachedFont *)v6 setSize:a3];
  [(WBSCachedFont *)v6 setFontWeight:a1];
  [(WBSCachedFont *)v6 setFontDesign:a2];
  if (a1)
  {
    if (a1 == 1)
    {
      id v8 = (double *)MEMORY[0x1E4F246B8];
    }
    else
    {
      double v7 = 0.0;
      if (a1 != 2) {
        goto LABEL_8;
      }
      id v8 = (double *)MEMORY[0x1E4F246C0];
    }
  }
  else
  {
    id v8 = (double *)MEMORY[0x1E4F246B0];
  }
  double v7 = *v8;
LABEL_8:
  if (a2 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F42A30];
    id v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:a3 weight:v7];
    int v12 = [v11 fontDescriptor];
    uint64_t v13 = [v12 fontDescriptorWithDesign:*MEMORY[0x1E4F43830]];
    uint64_t v9 = [v10 fontWithDescriptor:v13 size:a3];
  }
  else if (a2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:a3 weight:v7];
  }
  [(WBSCachedFont *)v6 setFont:v9];

  return v6;
}

void sub_1ABC0C0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0C250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0C4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __collectElementsToHide_block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "safari_coversWebView:", *(void *)(a1 + 40)) ^ 1;
  }
}

id describeColor(void *a1)
{
  if (a1)
  {
    uint64_t v2 = NSString;
    id v3 = a1;
    objc_msgSend(v3, "safari_luminance");
    uint64_t v5 = v4;
    objc_msgSend(v3, "safari_saturation");
    uint64_t v7 = v6;
    objc_msgSend(v3, "safari_grayscaleComponent");
    uint64_t v9 = v8;

    a1 = [v2 stringWithFormat:@"luminance: %.2f, saturation: %.2f, grayscale: %.2f", v5, v7, v9];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __sampledPageTopColorEnabled_block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  sampledPageTopColorEnabled_sampledPageTopColorEnabled = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F98858], 1);
}

void sub_1ABC0E190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0E220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0E28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)WBSTouchIconCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1ABC0E4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC0E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  uint64_t v21 = v19;

  _Unwind_Resume(a1);
}

void sub_1ABC0E848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0E97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC0EC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0ECF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0EFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0F31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0F430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0F4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id -[WBSTouchIconCache _blockOperationForRequest:knownImageState:](WBSTouchIconCache *self, SEL a2, id a3, int64_t a4)
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke;
  v10[3] = &unk_1E5E45390;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  uint64_t v8 = (void *)MEMORY[0x1AD115160](v10);
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
  return v8;
}

void sub_1ABC0F6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v14);
  _Unwind_Resume(a1);
}

void sub_1ABC0F97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0FB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0FD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC0FEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABC10474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC1083C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC108C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC10DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC11030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC111D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC1127C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC11408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC1146C()
{
}

void sub_1ABC115F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC1165C()
{
}

void sub_1ABC116F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC11790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC119B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(void *a1, void *a2, double *a3, unsigned __int8 *a4, void *a5, unsigned __int8 *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17 = a1;
  [v17 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(v17, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_1ABC11ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(void *a1, double *a2, unsigned __int8 *a3, void *a4, unsigned __int8 *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  [v16 bindDouble:2 atParameterIndex:*a2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(v16, a3, a4, a5, a6, a7, a8, a9);
}

void sub_1ABC11B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(void *a1, unsigned __int8 *a2, void *a3, unsigned __int8 *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindInt:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,long,BOOL,unsigned long,long,NSString * {__strong},long>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_1ABC11C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,long,BOOL,unsigned long,long,NSString * {__strong},long>(void *a1, void *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindInt64:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,BOOL,unsigned long,long,NSString * {__strong},long>(v13, a3, a4, a5, a6, a7);
}

void sub_1ABC11CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,BOOL,unsigned long,long,NSString * {__strong},long>(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindInt:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,unsigned long,long,NSString * {__strong},long>(v11, a3, a4, a5, a6);
}

void sub_1ABC11D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,unsigned long,long,NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:6];
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,long,NSString * {__strong},long>(v9, a3, a4, a5);
}

void sub_1ABC11E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,long,NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindInt64:*a2 atParameterIndex:7];
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(v7, a3, a4);
}

void sub_1ABC11E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:8];
  [v5 bindInt64:*a3 atParameterIndex:9];
}

void sub_1ABC11F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(void *a1, void *a2, double *a3, unsigned __int8 *a4, void *a5, unsigned __int8 *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v18 = a1;
  [v18 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(v18, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

void sub_1ABC11FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(void *a1, double *a2, unsigned __int8 *a3, void *a4, unsigned __int8 *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17 = a1;
  [v17 bindDouble:2 atParameterIndex:*a2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(v17, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_1ABC12098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(void *a1, unsigned __int8 *a2, void *a3, unsigned __int8 *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  [v16 bindInt:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(v16, a3, a4, a5, a6, a7, a8, a9);
}

void sub_1ABC12154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(void *a1, void *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindInt64:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,BOOL,unsigned long,long,NSString * {__strong},long,long>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_1ABC12208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,BOOL,unsigned long,long,NSString * {__strong},long,long>(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindInt:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,unsigned long,long,NSString * {__strong},long,long>(v13, a3, a4, a5, a6, a7);
}

void sub_1ABC122AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,unsigned long,long,NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindInt64:*a2 atParameterIndex:6];
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,long,NSString * {__strong},long,long>(v11, a3, a4, a5, a6);
}

void sub_1ABC12348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,long,NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:7];
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long,long>(v9, a3, a4, a5);
}

void sub_1ABC123D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:8];
  SafariShared::_WBSSQLiteStatementBindAllParameters<9,long,long>(v7, a3, a4);
}

void sub_1ABC12458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<9,long,long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindInt64:*a2 atParameterIndex:9];
  [v5 bindInt64:*a3 atParameterIndex:10];
}

void sub_1ABC124D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC130D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABC1362C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WBSReaderThemeBackgroundColor(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = (void *)MEMORY[0x1E4F428B8];
      double v2 = 0.901960784;
      double v3 = 1.0;
      double v4 = 0.901960784;
      double v5 = 0.901960784;
      goto LABEL_6;
    case 1:
      uint64_t v1 = (void *)MEMORY[0x1E4F428B8];
      double v2 = 0.878431373;
      double v4 = 0.847058824;
      double v5 = 0.784313725;
      double v3 = 1.0;
      goto LABEL_6;
    case 2:
      uint64_t v1 = (void *)MEMORY[0x1E4F428B8];
      double v2 = 0.196078431;
      double v5 = 0.2;
      double v3 = 1.0;
      double v4 = 0.196078431;
LABEL_6:
      id v6 = [v1 colorWithRed:v2 green:v4 blue:v5 alpha:v3];
      break;
    case 3:
      id v6 = [MEMORY[0x1E4F428B8] blackColor];
      break;
    default:
      id v6 = WBSReaderThemeBackgroundColor(0);
      break;
  }
  return v6;
}

id WBSReaderThemeCheckmarkColor(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F428B8] colorWithRed:0.309803922 green:0.196078431 blue:0.109803922 alpha:1.0];
      break;
    case 2:
      double v2 = (void *)MEMORY[0x1E4F428B8];
      double v3 = 0.843137255;
      double v4 = 1.0;
      goto LABEL_6;
    case 3:
      double v2 = (void *)MEMORY[0x1E4F428B8];
      double v4 = 0.8;
      double v3 = 1.0;
LABEL_6:
      uint64_t v1 = [v2 colorWithWhite:v3 alpha:v4];
      break;
    default:
      uint64_t v1 = [MEMORY[0x1E4F428B8] blackColor];
      break;
  }
  return v1;
}

id WBSReaderThemeColor(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      double v2 = (void *)MEMORY[0x1E4F428B8];
      double v3 = 0.97254902;
      double v4 = 0.945098039;
      double v5 = 0.890196078;
      double v6 = 1.0;
      goto LABEL_6;
    case 2:
      double v2 = (void *)MEMORY[0x1E4F428B8];
      double v3 = 0.290196078;
      double v5 = 0.301960784;
      double v6 = 1.0;
      double v4 = 0.290196078;
      goto LABEL_6;
    case 3:
      double v2 = (void *)MEMORY[0x1E4F428B8];
      double v3 = 0.0705882353;
      double v6 = 1.0;
      double v4 = 0.0705882353;
      double v5 = 0.0705882353;
LABEL_6:
      uint64_t v1 = [v2 colorWithRed:v3 green:v4 blue:v5 alpha:v6];
      break;
    default:
      uint64_t v1 = [MEMORY[0x1E4F428B8] whiteColor];
      break;
  }
  return v1;
}

id WBSReaderThemePrimaryButtonColor(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 2 && a1 == 1)
  {
    uint64_t v1 = [MEMORY[0x1E4F428B8] colorWithRed:0.91372549 green:0.71372549 blue:0.247058824 alpha:1.0];
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  return v1;
}

BOOL WBSReaderThemeIsDark(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

id WBSReaderThemeLocalizedName(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t v1 = _WBSLocalizedString();
      break;
    default:
      uint64_t v1 = WBSReaderThemeLocalizedName(0);
      break;
  }
  return v1;
}

uint64_t __WebPrivacyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebPrivacyLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

uint64_t SafariShared::TranslatedFileURLProtocol::canHandleRequest(uint64_t a1, void (**a2)(void))
{
  double v3 = CFURLRequestGetURL();
  double v4 = (*a2)();
  uint64_t v5 = objc_msgSend(v3, "safari_hasScheme:", v4);

  return v5;
}

void sub_1ABC156C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFTypeRef SafariShared::TranslatedFileURLProtocol::createCanonicalRequest(int a1, CFTypeRef cf)
{
  return cf;
}

uint64_t SafariShared::TranslatedFileURLProtocol::requestsAreCacheEquivalent()
{
  return 0;
}

uint64_t SafariShared::TranslatedFileURLProtocol::protocolInstanceForProtocol(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = a3;
  *a2 = &SafariShared::TranslatedFileURLProtocol::protocolInstanceForProtocol(_CFURLProtocol *,CFURLProtocolInstanceCallbacks const**,void const*)::instanceCallbacks;
  return result;
}

void SafariShared::TranslatedFileURLProtocol::start(uint64_t a1, uint64_t a2)
{
  uint64_t Client = CFURLProtocolGetClient();
  MEMORY[0x1AD1143A0](a1);
  uint64_t v5 = *(void (**)(uint64_t))(a2 + 8);
  uint64_t URL = CFURLRequestGetURL();
  id v7 = v5(URL);
  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:0 error:&v14];
    id v9 = v14;
    if (v9)
    {
      (*(void (**)(uint64_t, id, void))(Client + 80))(a1, v9, 0);
    }
    else
    {
      uint64_t v10 = [v7 pathExtension];
      PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v10, 0);

      if (PreferredIdentifierForTag) {
        int v12 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E4F22500]);
      }
      else {
        int v12 = 0;
      }

      CFURLRequestGetURL();
      [v8 length];
      id v13 = (const void *)CFURLResponseCreate();
      if (v13)
      {
        (*(void (**)(uint64_t, const void *, void))(Client + 56))(a1, v13, 0);
        (*(void (**)(uint64_t, void *, uint64_t, void))(Client + 64))(a1, v8, [v8 length], 0);
        (*(void (**)(uint64_t, void))(Client + 72))(a1, 0);
        CFRelease(v13);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, void))(Client + 80))(a1, [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F18F50] code:-998 userInfo:0], 0);
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(Client + 80))(a1, [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F18F50] code:-1000 userInfo:0], 0);
  }
}

void sub_1ABC1593C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WTF::HashTable<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*,WTF::IdentityExtractor,WTF::DefaultHash<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>,WTF::HashTraits<SafariShared::TranslatedFileURLProtocol::ProtocolInfo const*>>::lookupForReinsert(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    int v3 = *(_DWORD *)(v2 - 8);
  }
  else {
    int v3 = 0;
  }
  unint64_t v4 = ~(*a2 << 32) + *a2;
  unint64_t v5 = 9 * (((v4 ^ (v4 >> 22)) + ~((v4 ^ (v4 >> 22)) << 13)) ^ (((v4 ^ (v4 >> 22)) + ~((v4 ^ (v4 >> 22)) << 13)) >> 8));
  unint64_t v6 = (v5 ^ (v5 >> 15)) + ~((v5 ^ (v5 >> 15)) << 27);
  unsigned int v7 = v3 & ((v6 >> 31) ^ v6);
  int v8 = 1;
  do
  {
    unsigned int v9 = v7;
    uint64_t v10 = *(void *)(v2 + 8 * v7);
    unsigned int v7 = (v7 + v8++) & v3;
  }
  while (v10);
  return v2 + 8 * v9;
}

uint64_t TranslationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  int v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = TranslationLibraryCore_frameworkLibrary;
  uint64_t v5 = TranslationLibraryCore_frameworkLibrary;
  if (!TranslationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5E454C0;
    long long v7 = *(_OWORD *)&off_1E5E454D0;
    v3[3] = _sl_dlopen();
    TranslationLibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1ABC15B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __TranslationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  TranslationLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TranslationLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = TranslationLibraryCore();
  if (!result) {
    TranslationLibrary_cold_1(&v1);
  }
  return result;
}

id get_LTAlignmentClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTAlignmentClass_softClass;
  uint64_t v6 = get_LTAlignmentClass_softClass;
  if (!get_LTAlignmentClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTAlignment");
    get_LTAlignmentClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC15CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTTranslatorClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTTranslatorClass_softClass;
  uint64_t v6 = get_LTTranslatorClass_softClass;
  if (!get_LTTranslatorClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTTranslator");
    get_LTTranslatorClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC15E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTTranslationFeedbackClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTTranslationFeedbackClass_softClass;
  uint64_t v6 = get_LTTranslationFeedbackClass_softClass;
  if (!get_LTTranslationFeedbackClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTTranslationFeedback");
    get_LTTranslationFeedbackClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC15FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTParagraphTranslationRequestClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTParagraphTranslationRequestClass_softClass;
  uint64_t v6 = get_LTParagraphTranslationRequestClass_softClass;
  if (!get_LTParagraphTranslationRequestClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTParagraphTranslationRequest");
    get_LTParagraphTranslationRequestClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC16118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTTranslationRangeClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTTranslationRangeClass_softClass;
  uint64_t v6 = get_LTTranslationRangeClass_softClass;
  if (!get_LTTranslationRangeClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTTranslationRange");
    get_LTTranslationRangeClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC16278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTLocalePairClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_LTLocalePairClass_softClass;
  uint64_t v6 = get_LTLocalePairClass_softClass;
  if (!get_LTLocalePairClass_softClass)
  {
    TranslationLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_LTLocalePair");
    get_LTLocalePairClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1ABC163D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LTTranslationErrorDomainSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LTTranslationErrorDomainSymbolLoc_ptr;
  uint64_t v6 = get_LTTranslationErrorDomainSymbolLoc_ptr;
  if (!get_LTTranslationErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)TranslationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LTTranslationErrorDomain");
    get_LTTranslationErrorDomainSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1ABC1651C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTTranslationErrorDomain()
{
  LTTranslationErrorDomainSymbolLoc = (void **)get_LTTranslationErrorDomainSymbolLoc();
  if (!LTTranslationErrorDomainSymbolLoc) {
    get_LTTranslationErrorDomain_cold_1();
  }
  id v1 = *LTTranslationErrorDomainSymbolLoc;
  return v1;
}

uint64_t getkLTUnknownLanguageCodeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkLTUnknownLanguageCodeSymbolLoc_ptr;
  uint64_t v6 = getkLTUnknownLanguageCodeSymbolLoc_ptr;
  if (!getkLTUnknownLanguageCodeSymbolLoc_ptr)
  {
    id v1 = (void *)TranslationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kLTUnknownLanguageCode");
    getkLTUnknownLanguageCodeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1ABC16690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkLTUnknownLanguageCodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TranslationLibrary();
  uint64_t result = dlsym(v2, "kLTUnknownLanguageCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkLTUnknownLanguageCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkLTUnknownLanguageCode()
{
  uint64_t v0 = (void **)getkLTUnknownLanguageCodeSymbolLoc();
  if (!v0) {
    getkLTUnknownLanguageCode_cold_1();
  }
  id v1 = *v0;
  return v1;
}

id availablePreferredTargetLocalesFilteredBySupportedLocales(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  long long v7 = v6;
  if (a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __availablePreferredTargetLocalesFilteredBySupportedLocales_block_invoke;
    void v11[3] = &unk_1E5E45518;
    id v12 = v6;
    uint64_t v8 = objc_msgSend(a2, "safari_mapAndFilterObjectsUsingBlock:", v11);
    id v9 = [MEMORY[0x1E4F1CA20] matchedLanguagesFromAvailableLanguages:v8 forPreferredLanguages:v5];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

id __availablePreferredTargetLocalesFilteredBySupportedLocales_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (v5
    && ([v3 sourceLocaleIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        !v7))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v4 targetLocaleIdentifier];
  }

  return v8;
}

void sub_1ABC16BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void performWithLock(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);

  os_unfair_lock_unlock(a1);
}

void sub_1ABC16EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC170D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABC172E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t preferredTaskHint()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v0 BOOLForKey:@"WBSTranslationSetWebpageTranslationTaskSettingsKey"]) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void sub_1ABC17928(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC17C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v33 - 136), 8);
  objc_destroyWeak((id *)(v33 - 88));
  _Unwind_Resume(a1);
}

void sub_1ABC17DB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABC17F3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABC180A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_destroyWeak(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC18468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

id WBSTranslationAlertAllowButtonTitleForType(void *a1)
{
  if ((unint64_t)a1 <= 1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

id WBSTranslationAlertDeclineButtonTitleForType(void *a1)
{
  if ((unint64_t)a1 <= 1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

id WBSTranslationAlertTitleStringForType(void *a1)
{
  if ((unint64_t)a1 <= 1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

id WBSTranslationLearnMoreBodyTextForType(void *a1)
{
  if (a1 != (void *)1)
  {
    if (a1) {
      goto LABEL_5;
    }
    [MEMORY[0x1E4F98318] isAppleAccountBrandingEnabled];
  }
  a1 = _WBSLocalizedString();
LABEL_5:
  return a1;
}

id WBSTranslationDetailStringForType(void *a1)
{
  if ((unint64_t)a1 <= 1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

id WBSTranslationLearnMoreTitleForType(void *a1)
{
  if ((unint64_t)a1 <= 1)
  {
    a1 = _WBSLocalizedString();
  }
  return a1;
}

void sub_1ABC18B44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1ABC191B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __WBSTranslationIsUnthrottled_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  WBSTranslationIsUnthrottled_translationIsUnthrottled = [v0 BOOLForKey:*MEMORY[0x1E4F988E8]];
}

void sub_1ABC1A544(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1A668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1A860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t preferredBaseLocalesContainBaseLocaleIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(a1, "safari_mapObjectsUsingBlock:", &__block_literal_global_440);
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", v3);

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

void sub_1ABC1AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1AB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1AC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1AE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
}

void sub_1ABC1B294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1B4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1B944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1C1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

id loggingStringForTextSampleArray(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
  uint64_t v2 = NSString;
  id v3 = [v1 componentsJoinedByString:@","];
  uint64_t v4 = [v2 stringWithFormat:@"[%@]", v3];

  return v4;
}

void logTextSamplesIfNeededPreservingPrivacy(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v13 = v1;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          uint64_t v10 = WBS_LOG_CHANNEL_PREFIXTranslation();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v11 = v10;
            id v12 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
            *(_DWORD *)buf = 134218243;
            uint64_t v19 = v6;
            __int16 v20 = 2113;
            uint64_t v21 = v12;
            _os_log_debug_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEBUG, "Sample %lu: %{private}@", buf, 0x16u);

            ++v6;
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v5);
    }

    id v1 = v13;
  }
}

void sub_1ABC1CBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1D2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1D768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1ABC1DF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC1E188(_Unwind_Exception *a1)
{
}

void sub_1ABC1E330(_Unwind_Exception *a1)
{
}

void sub_1ABC1E858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1ABC1F640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1ABC1FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1ABC1FE00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABC202C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1ABC20AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)(v9 - 88));
  _Unwind_Resume(a1);
}

void sub_1ABC20EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC21098(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC21268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC213FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC21598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC218E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC21C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC2200C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  uint64_t v28 = v25;
  objc_destroyWeak(v26);
  objc_destroyWeak(v28);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v27 - 120), 8);
  objc_destroyWeak((id *)(v27 - 72));
  _Unwind_Resume(a1);
}

void sub_1ABC221A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1ABC22418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC22838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t canTransitionFromStateToState(unint64_t a1, uint64_t a2)
{
  if (a1 > 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = (void *)qword_1E5E45C50[a1];
  }
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

__CFString *WBSTranslationStateDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Unknown";
  }
  else {
    return off_1E5E45C90[a1 - 1];
  }
}

void sub_1ABC22D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC22FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC2355C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC23704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC238FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC23CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC23FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC241D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC24788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1ABC24A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1ABC24CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

uint64_t __loggingStringForTextSampleArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 length];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __preferredBaseLocalesContainBaseLocaleIdentifier_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", a2);
}

id preferredTargetLocalesFromSettings()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v0 = possibleTargetLocaleKeys();
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v0;
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
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v2, "BOOLForKey:", v8, (void)v12))
        {
          uint64_t v9 = localeForSettingsKey(v8);
          if ([v9 length]) {
            [v1 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = (void *)[v1 copy];
  return v10;
}

id possibleTargetLocaleKeys()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)possibleTargetLocaleKeys_targetLocaleKeys;
  if (!possibleTargetLocaleKeys_targetLocaleKeys)
  {
    v4[0] = @"WBSTranslationTargetLanguageEnglishSettingsKey";
    v4[1] = @"WBSTranslationTargetLanguageSpanishSettingsKey";
    void v4[2] = @"WBSTranslationTargetLanguageFrenchSettingsKey";
    v4[3] = @"WBSTranslationTargetLanguageGermanSettingsKey";
    v4[4] = @"WBSTranslationTargetLanguageRussianSettingsKey";
    v4[5] = @"WBSTranslationTargetLanguageChineseSettingsKey";
    v4[6] = @"WBSTranslationTargetLanguagePortugeseSettingsKey";
    uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
    uint64_t v2 = (void *)possibleTargetLocaleKeys_targetLocaleKeys;
    possibleTargetLocaleKeys_targetLocaleKeys = v1;

    id v0 = (void *)possibleTargetLocaleKeys_targetLocaleKeys;
  }
  return v0;
}

id localeForSettingsKey(void *a1)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  v6[0] = @"WBSTranslationTargetLanguageEnglishSettingsKey";
  v6[1] = @"WBSTranslationTargetLanguageSpanishSettingsKey";
  v7[0] = @"en_US";
  v7[1] = @"es_ES";
  void v6[2] = @"WBSTranslationTargetLanguageFrenchSettingsKey";
  void v6[3] = @"WBSTranslationTargetLanguageGermanSettingsKey";
  v7[2] = @"fr_FR";
  v7[3] = @"de_DE";
  void v6[4] = @"WBSTranslationTargetLanguageRussianSettingsKey";
  void v6[5] = @"WBSTranslationTargetLanguageChineseSettingsKey";
  void v7[4] = @"ru_RU";
  v7[5] = @"zh_CN";
  v6[6] = @"WBSTranslationTargetLanguagePortugeseSettingsKey";
  v7[6] = @"pt_BR";
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = a1;
  id v3 = [v1 dictionaryWithObjects:v7 forKeys:v6 count:7];
  uint64_t v4 = [v3 objectForKeyedSubscript:v2];

  return v4;
}

id allSupportedTargetLocales()
{
  id v0 = possibleTargetLocaleKeys();
  uint64_t v1 = objc_msgSend(v0, "safari_mapObjectsUsingBlock:", &__block_literal_global_53);

  return v1;
}

id __allSupportedTargetLocales_block_invoke(uint64_t a1, void *a2)
{
  return localeForSettingsKey(a2);
}

uint64_t showInternalTranslationActions()
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_79);
  }
  if (!isInternalInstall_isInternal) {
    return 0;
  }
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"WBSTranslationHideInternalTapToRadarActionSettingsKey"] ^ 1;

  return v1;
}

uint64_t __isInternalInstall_block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F98318] hasInternalContent];
  isInternalInstall_isInternal = result;
  return result;
}

void sub_1ABC26598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers()
{
  if (WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers_onceToken, &__block_literal_global_59);
  }
  return WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDownloads()
{
  if (WBS_LOG_CHANNEL_PREFIXDownloads_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDownloads_onceToken, &__block_literal_global_7_0);
  }
  return WBS_LOG_CHANNEL_PREFIXDownloads_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExport()
{
  if (WBS_LOG_CHANNEL_PREFIXExport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExport_onceToken, &__block_literal_global_10);
  }
  return WBS_LOG_CHANNEL_PREFIXExport_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXFaviconDatabase()
{
  if (WBS_LOG_CHANNEL_PREFIXFaviconDatabase_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXFaviconDatabase_onceToken, &__block_literal_global_16);
  }
  return WBS_LOG_CHANNEL_PREFIXFaviconDatabase_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXFaviconPersistence()
{
  if (WBS_LOG_CHANNEL_PREFIXFaviconPersistence_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXFaviconPersistence_onceToken, &__block_literal_global_19);
  }
  return WBS_LOG_CHANNEL_PREFIXFaviconPersistence_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeyedArchiver()
{
  if (WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken, &__block_literal_global_25);
  }
  return WBS_LOG_CHANNEL_PREFIXKeyedArchiver_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrivacyTransparency()
{
  if (WBS_LOG_CHANNEL_PREFIXPrivacyTransparency_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrivacyTransparency_onceToken, &__block_literal_global_37_0);
  }
  return WBS_LOG_CHANNEL_PREFIXPrivacyTransparency_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSafariSuggestions()
{
  if (WBS_LOG_CHANNEL_PREFIXSafariSuggestions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSafariSuggestions_onceToken, &__block_literal_global_40);
  }
  return WBS_LOG_CHANNEL_PREFIXSafariSuggestions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSchemaDataLoading()
{
  if (WBS_LOG_CHANNEL_PREFIXSchemaDataLoading_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSchemaDataLoading_onceToken, &__block_literal_global_43_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSchemaDataLoading_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiriIntelligence()
{
  if (WBS_LOG_CHANNEL_PREFIXSiriIntelligence_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiriIntelligence_onceToken, &__block_literal_global_46);
  }
  return WBS_LOG_CHANNEL_PREFIXSiriIntelligence_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXThemeColor()
{
  if (WBS_LOG_CHANNEL_PREFIXThemeColor_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXThemeColor_onceToken, &__block_literal_global_58);
  }
  return WBS_LOG_CHANNEL_PREFIXThemeColor_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXURLAutocomplete()
{
  if (WBS_LOG_CHANNEL_PREFIXURLAutocomplete_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXURLAutocomplete_onceToken, &__block_literal_global_61);
  }
  return WBS_LOG_CHANNEL_PREFIXURLAutocomplete_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUniversalLinks()
{
  if (WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken, &__block_literal_global_64_0);
  }
  return WBS_LOG_CHANNEL_PREFIXUniversalLinks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebApps()
{
  if (WBS_LOG_CHANNEL_PREFIXWebApps_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebApps_onceToken, &__block_literal_global_67_0);
  }
  return WBS_LOG_CHANNEL_PREFIXWebApps_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTranslation()
{
  if (WBS_LOG_CHANNEL_PREFIXTranslation_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTranslation_onceToken, &__block_literal_global_70);
  }
  return WBS_LOG_CHANNEL_PREFIXTranslation_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken, &__block_literal_global_73_0);
  }
  return WBS_LOG_CHANNEL_PREFIXWebExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXInterstellar()
{
  if (WBS_LOG_CHANNEL_PREFIXInterstellar_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXInterstellar_onceToken, &__block_literal_global_76);
  }
  return WBS_LOG_CHANNEL_PREFIXInterstellar_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSystemNoteTaking()
{
  if (WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_onceToken, &__block_literal_global_82_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXHideMyEmail()
{
  if (WBS_LOG_CHANNEL_PREFIXHideMyEmail_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXHideMyEmail_onceToken, &__block_literal_global_85_2);
  }
  return WBS_LOG_CHANNEL_PREFIXHideMyEmail_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSharedTabGroups()
{
  if (WBS_LOG_CHANNEL_PREFIXSharedTabGroups_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSharedTabGroups_onceToken, &__block_literal_global_91);
  }
  return WBS_LOG_CHANNEL_PREFIXSharedTabGroups_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXManagedExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken, &__block_literal_global_97);
  }
  return WBS_LOG_CHANNEL_PREFIXManagedExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXScribble()
{
  if (WBS_LOG_CHANNEL_PREFIXScribble_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXScribble_onceToken, &__block_literal_global_103);
  }
  return WBS_LOG_CHANNEL_PREFIXScribble_log;
}

id prewarmingQueue()
{
  if (prewarmingQueue_onceToken != -1) {
    dispatch_once(&prewarmingQueue_onceToken, &__block_literal_global_77);
  }
  id v0 = (void *)prewarmingQueue_queue;
  return v0;
}

void __prewarmingQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SafariSharedUI.WBSScribbleEffectView.prewarmingQueue", v2);
  uint64_t v1 = (void *)prewarmingQueue_queue;
  prewarmingQueue_queue = (uint64_t)v0;
}

void sub_1ABC297D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1ABC29994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC29A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC29ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC29B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC29F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2A1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  va_start(va, a8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC2A398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBSUISafariSandboxBrokerInterface()
{
  return MEMORY[0x1F414A2D0](&unk_1F0371AF8);
}

uint64_t WBSUISafariSandboxBrokerInterfaceWithProtocol(uint64_t a1)
{
  return MEMORY[0x1F414A2D0](a1);
}

id WBSStartPageSectionIdentifierIcon(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F98878]])
  {
    id v2 = @"icloud";
LABEL_21:
    id v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:v2];
    uint64_t v4 = [v3 imageWithRenderingMode:2];

    goto LABEL_22;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F98880]])
  {
    id v2 = @"star";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F98888]])
  {
    id v2 = @"clock";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988A8]])
  {
    id v2 = @"shield.lefthalf.fill";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988B0]])
  {
    id v2 = @"eyeglasses";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988C0]])
  {
    id v2 = @"siri";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F98890]])
  {
    id v2 = @"shared.with.you";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988C8]])
  {
    id v2 = @"globe.badge.sparkles";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988D0]])
  {
    id v2 = @"star.square.on.square";
    goto LABEL_21;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F988B8]])
  {
    id v2 = @"square.on.square";
    goto LABEL_21;
  }
  uint64_t v4 = 0;
LABEL_22:

  return v4;
}

void sub_1ABC2B3FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1ABC2BBB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2BDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2BF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2C020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2C1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2C3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2C604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2C900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2CFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2D310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2D3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2D594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBSIsValidWebExtensionTabStatusString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"complete"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"loading"];
  }

  return v2;
}

uint64_t WBSIsSupportedWebExtensionWindowTypeString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"normal"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"popup"];
  }

  return v2;
}

void sub_1ABC2DF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2E1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2E310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id localizedDescriptionForErrorCode(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 == 3
    && ([v3 userInfo],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28228]],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    uint64_t v7 = NSString;
    uint64_t v8 = _WBSLocalizedString();
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
  }
  else
  {
    uint64_t v9 = _WBSLocalizedString();
  }

  return v9;
}

void sub_1ABC2E444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2E4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2E6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2E9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2EB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2F998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2FAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2FB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2FD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC2FFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC301B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC303F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC308FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30D10(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1ABC30DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC30F60(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC31498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void addHostsFromPatternsToSet(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchesAllURLs", (void)v16))
        {
          [v4 addObject:@"*"];
          goto LABEL_16;
        }
        uint64_t v10 = [v9 scheme];
        char v11 = [v10 isEqualToString:@"file"];

        if ((v11 & 1) == 0)
        {
          long long v12 = [v9 host];
          uint64_t v13 = objc_msgSend(v12, "safari_stringByRemovingWwwAndWildcardDotPrefixes");
          long long v14 = (void *)v13;
          if (v13) {
            uint64_t v15 = (__CFString *)v13;
          }
          else {
            uint64_t v15 = @"*";
          }
          [v4 addObject:v15];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

void sub_1ABC316F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC318E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC31A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC31ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC31D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3225C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC327E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC328DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC32FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC330FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3397C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC33C6C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC33D50(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC33DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3488C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC34CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC352D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id matchPatternsWithExpiredItemsRemoved(void *a1)
{
  id v1 = (id)[a1 mutableCopy];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZL36modifyDictionaryToRemoveExpiredItemsP19NSMutableDictionary_block_invoke;
  v9[3] = &unk_1E5E466F8;
  id v3 = v2;
  id v10 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v9];
  id v4 = [v3 allObjects];
  [v1 removeObjectsForKeys:v4];

  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [v1 allKeys];
  uint64_t v7 = [v5 setWithArray:v6];

  return v7;
}

void sub_1ABC3553C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3563C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC356DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC35760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC357EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC359F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC35B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC35BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC35D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC35FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC362D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  uint64_t v27 = v25;
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);

  _Unwind_Resume(a1);
}

void sub_1ABC3645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  __int16 v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1ABC3650C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC365BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

WBSWebExtensionMatchPattern *___ZL39toWBSWebExtensionMatchPatternDictionaryP12NSDictionaryIP26WKWebExtensionMatchPatternP6NSDateE_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WBSWebExtensionMatchPattern alloc] initWithWebKitMatchPattern:v2];

  return v3;
}

void sub_1ABC36858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL38toWKWebExtensionMatchPatternDictionaryP12NSDictionaryIP27WBSWebExtensionMatchPatternP6NSDateE_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 webKitMatchPattern];
  return v2;
}

void ___ZL36modifyDictionaryToRemoveExpiredItemsP19NSMutableDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [v5 timeIntervalSinceNow];
  if (v6 < 0.0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void sub_1ABC36904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1ABC36A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id localizationDictionaryAtURL(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a1];
  if (v1)
  {
    id v6 = 0;
    id v2 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v1 options:0 error:&v6];
    id v3 = v6;
    if (!v2)
    {
      uint64_t v4 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        localizationDictionaryAtURL_cold_1(v4, v3);
      }
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_1ABC3823C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC384E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3877C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC387E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3894C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC38FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC39068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC39BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC39CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC39E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3A9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3AAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3AC80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3AD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3AFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B16C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3B478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3BAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, id *a11, id *location, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3BCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3BEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3BF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3C8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3CA74(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABC3CB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3CC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3CCA8()
{
}

void sub_1ABC3CD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3CDB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3CF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1ABC3D478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3D8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1ABC3D9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3DBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3DD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3DE34(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC3DF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3DFD0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC3E0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3E980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3EA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3ECAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3EE08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3F0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3F5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3F9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3FBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3FD78(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABC3FE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC3FF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC400C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC401C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC40278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC40354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC403C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC40568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABC406CC(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABC407A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC40878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC409FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC40B04(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABC40C34(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABC40D90(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1ABC40FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41194(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABC4158C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24)
{
  JUMPOUT(0x1ABC4160CLL);
}

void sub_1ABC4171C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41A08(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1ABC41B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC41EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABC41F8C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABC4204C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC420F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC4220C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC42254()
{
}

void sub_1ABC42358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBSIsiPad()
{
  if (WBSIsiPad::onceToken != -1) {
    dispatch_once(&WBSIsiPad::onceToken, &__block_literal_global_66);
  }
  return WBSIsiPad::isiPad;
}

void __WBSIsiPad_block_invoke()
{
  id v0 = [MEMORY[0x1E4F982F8] currentDevice];
  WBSIsiPad::isiPad = [v0 deviceClass] == 3;
}

void sub_1ABC42794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC42A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC42E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

__CFString *classToClassString(objc_class *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (classToClassString(objc_class *,BOOL)::onceToken != -1) {
    dispatch_once(&classToClassString(objc_class *,BOOL)::onceToken, &__block_literal_global_127);
  }
  uint64_t v4 = &classToClassString(objc_class *,BOOL)::classTypeToPluralClassString;
  if (!a2) {
    uint64_t v4 = &classToClassString(objc_class *,BOOL)::classTypeToSingularClassString;
  }
  id v5 = (id)*v4;
  id v6 = [v5 objectForKey:a1];
  if (!v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      id v6 = @"unknown";
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (-[objc_class isSubclassOfClass:](a1, "isSubclassOfClass:", v11, (void)v13))
          {
            id v6 = [v7 objectForKey:v11];
            goto LABEL_17;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = @"unknown";
    }
LABEL_17:
  }
  return v6;
}

void sub_1ABC430C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1ABC4326C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABC43380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC43430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ABC435D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL18classToClassStringP10objc_classb_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v1 = (void *)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString;
  classToClassString(objc_class *,BOOL)::classTypeToSingularClassString = v0;

  [(id)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString setObject:@"a BOOLean value" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString setObject:@"a number value" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString setObject:@"a string value" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString setObject:@"an array" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToSingularClassString setObject:@"an object" forKey:objc_opt_class()];
  uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v3 = (void *)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString;
  classToClassString(objc_class *,BOOL)::classTypeToPluralClassString = v2;

  [(id)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString setObject:@"BOOLean values" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString setObject:@"number values" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString setObject:@"string values" forKey:objc_opt_class()];
  [(id)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString setObject:@"arrays" forKey:objc_opt_class()];
  uint64_t v4 = (void *)classToClassString(objc_class *,BOOL)::classTypeToPluralClassString;
  uint64_t v5 = objc_opt_class();
  return [v4 setObject:@"objects" forKey:v5];
}

void sub_1ABC43B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1ABC443A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *WBSWKStringForManifestDisplayMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5E46D90[a1 - 1];
  }
}

uint64_t resolvedDisplayModeForURL(unint64_t a1, void *a2)
{
  id v3 = [a2 host];
  uint64_t v4 = [v3 lowercaseString];
  uint64_t v5 = objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");

  if ([MEMORY[0x1E4F1CBF0] containsObject:v5])
  {
    uint64_t v6 = 2;
  }
  else
  {
    int v7 = [&unk_1F0342170 containsObject:v5];
    if (a1 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = a1;
    }
    if (v7) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v8;
    }
  }

  return v6;
}

void sub_1ABC46998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1ABC46E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABC47228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void Init_DustEffect254_graph_DC680B38_F027_4C51_B1B0_557E92AAEFE7(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { FMOV            V1.4S, #1.0 }
  *(float *)&_Q1 = a1;
  DWORD1(_Q1) = *(_DWORD *)(a4 + 4);
  *(_OWORD *)a4 = _Q1;
}

double __vfx_script_DustEffect254_graph_DC680B38_F027_4C51_B1B0_557E92AAEFE7(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(void *)(arguments_buffer_delayInitStub + 24);
  __asm { FMOV            V0.4S, #1.0 }
  LODWORD(_Q0) = **(_DWORD **)(arguments_buffer_delayInitStub + 16);
  DWORD1(_Q0) = *(_DWORD *)(v2 + 4);
  *(_OWORD *)uint64_t v2 = _Q0;
  return *(double *)&_Q0;
}

__n128 Update_DustEffect254_graph_949E61E3_E147_4B13_857E_B5CB57635D87(uint64_t a1, uint64_t a2, long long *a3, double *a4)
{
  long long v11 = *a3;
  long long v12 = *(_OWORD *)a4;
  vfx_script_clock_time_delayInitStub(*a4);
  *(float *)&double v6 = v6;
  int v10 = LODWORD(v6);
  vfx_script_clock_time_delayInitStub(v6);
  *(float *)&long long v8 = *(double *)&v8;
  *(float *)&long long v8 = *(float *)&v8 * 0.2;
  long long v7 = v11;
  DWORD2(v7) = v10;
  *a3 = v7;
  *(void *)((char *)&v8 + 4) = *(void *)((char *)&v12 + 4);
  *(_OWORD *)a4 = v8;
  result.n128_u64[0] = v8;
  result.n128_u32[2] = DWORD2(v8);
  return result;
}

__n128 __vfx_script_DustEffect254_graph_949E61E3_E147_4B13_857E_B5CB57635D87(double a1)
{
  uint64_t arguments_buffer_delayInitStub = vfx_script_get_arguments_buffer_delayInitStub(a1);
  uint64_t v2 = *(long long **)(arguments_buffer_delayInitStub + 16);
  id v3 = *(long long **)(arguments_buffer_delayInitStub + 24);
  long long v9 = *v2;
  long long v10 = *v3;
  vfx_script_clock_time_delayInitStub(*(double *)v3);
  *(float *)&double v4 = v4;
  int v8 = LODWORD(v4);
  vfx_script_clock_time_delayInitStub(v4);
  *(float *)&long long v6 = *(double *)&v6;
  *(float *)&long long v6 = *(float *)&v6 * 0.2;
  long long v5 = v9;
  DWORD2(v5) = v8;
  long long *v2 = v5;
  *(void *)((char *)&v6 + 4) = *(void *)((char *)&v10 + 4);
  long long *v3 = v6;
  *((_DWORD *)v2 + 3) = 1065353216;
  *((_DWORD *)v3 + 3) = 1065353216;
  result.n128_u64[0] = v6;
  result.n128_u32[2] = DWORD2(v6);
  return result;
}

char **__vfx_get_script_table_DustEffect254()
{
  return &__vfx_get_script_table_DustEffect254::scriptTable;
}

void sub_1ABC480C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __saveCurrentDeviceTimeInterval_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __pruneInactiveDevicesTimeInterval_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __timeIntervalBeforeAssumingDeviceHasBecomeInactive_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getSLHighlightCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSLHighlightCenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSHighlightManager.m", 21, @"Unable to find class %s", "SLHighlightCenter");

  __break(1u);
}

void SocialLayerLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SocialLayerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSHighlightManager.m", 20, @"%s", *a1);

  __break(1u);
}

void __getSLAttributionViewClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSLAttributionViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSHighlightManager.m", 22, @"Unable to find class %s", "SLAttributionView");

  __break(1u);
}

void getASAttributeContentVersion_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getASAttributeContentVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSMobileAssetController.m", 16, @"%s", dlerror());

  __break(1u);
}

void __getASAttributeContentVersionSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *MobileAssetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSMobileAssetController.m", 13, @"%s", *a1);

  __break(1u);
}

void __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getVNImageRequestHandlerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSScribbleUtilities.m", 22, @"Unable to find class %s", "VNImageRequestHandler");

  __break(1u);
}

void VisionLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *VisionLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSScribbleUtilities.m", 21, @"%s", *a1);

  __break(1u);
}

void __getVNRecognizeTextRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getVNRecognizeTextRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSScribbleUtilities.m", 23, @"Unable to find class %s", "VNRecognizeTextRequest");

  __break(1u);
}

void getkSymptomAnalyticsServiceEndpoint_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getkSymptomAnalyticsServiceEndpoint(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrivacyTransparencyController.m", 30, @"%s", dlerror());

  __break(1u);
}

void getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"const NSString *getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrivacyTransparencyController.m", 29, @"%s", dlerror());

  __break(1u);
}

void getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"const NSString *getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrivacyTransparencyController.m", 26, @"%s", dlerror());

  __break(1u);
}

void getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"const NSString *getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrivacyTransparencyController.m", 27, @"%s", dlerror());

  __break(1u);
}

void getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"const NSString *getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrivacyTransparencyController.m", 28, @"%s", dlerror());

  __break(1u);
}

void logCompletionMatchToDebugChannel(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "%@: [%{public}@]", buf, 0x16u);
}

{
  *(_DWORD *)buf = 138412547;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2117;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "%@: \"%{sensitive}@\"", buf, 0x16u);
}

void __getSYLinkContextClientClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSYLinkContextClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSSystemNoteTakingController.m", 20, @"Unable to find class %s", "SYLinkContextClient");

  __break(1u);
}

void SynapseLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SynapseLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSSystemNoteTakingController.m", 19, @"%s", *a1);

  __break(1u);
}

void __getSYFeatureEligibilityClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSYFeatureEligibilityClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSSystemNoteTakingController.m", 22, @"Unable to find class %s", "SYFeatureEligibility");

  __break(1u);
}

void __getSYNotesActivationObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSYNotesActivationObserverClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSSystemNoteTakingController.m", 21, @"Unable to find class %s", "SYNotesActivationObserver");

  __break(1u);
}

void __getLPMetadataProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLPMetadataProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSSystemNoteTakingLinkMetadataFetcher.m", 17, @"Unable to find class %s", "LPMetadataProvider");

  __break(1u);
}

void LinkPresentationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *LinkPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSSystemNoteTakingLinkMetadataFetcher.m", 16, @"%s", *a1);

  __break(1u);
}

void __getLPImageClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLPImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSSystemNoteTakingLinkMetadataFetcher.m", 18, @"Unable to find class %s", "LPImage");

  __break(1u);
}

void __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  long long v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to load content rule list from WebPrivacy with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void TranslationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *TranslationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSTranslationAvailability.m", 18, @"%s", *a1);

  __break(1u);
}

void get_LTTranslationErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"typeof (((typeof (_LTTranslationErrorDomain) (*)(void))0)()) get_LTTranslationErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSTranslationAvailability.m", 29, @"%s", dlerror());

  __break(1u);
}

void getkLTUnknownLanguageCode_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"typeof (((typeof (kLTUnknownLanguageCode) (*)(void))0)()) getkLTUnknownLanguageCode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSTranslationAvailability.m", 30, @"%s", dlerror());

  __break(1u);
}

void localizationDictionaryAtURL_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  long long v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Could not parse localization dictionary: %{public}@", (uint8_t *)&v5, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3 = MEMORY[0x1F40D88F8](url, component, rangeIncludingSeparators);
  result.length = v4;
  result.id location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8900](url, buffer, bufferLength);
}

uint64_t CFURLProtocolGetClient()
{
  return MEMORY[0x1F40D5418]();
}

uint64_t CFURLProtocolGetRequest()
{
  return MEMORY[0x1F40D5420]();
}

uint64_t CFURLProtocolRegisterImplementation()
{
  return MEMORY[0x1F40D5428]();
}

uint64_t CFURLRequestGetURL()
{
  return MEMORY[0x1F40D5478]();
}

uint64_t CFURLResponseCreate()
{
  return MEMORY[0x1F40D54E0]();
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1F40D8958](url, key, propertyValue, error);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size)
{
  MEMORY[0x1F40D9D90](c, (__n128)size, *(__n128 *)&size.height);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGContextDrawImageFromRect()
{
  return MEMORY[0x1F40D9E90]();
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetUserSpaceToDeviceSpaceTransform(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA038](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DA870](image);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1F40DA988](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9798](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1F40E9850](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E9918](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1F40DB090]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x1F4114E50]();
}

uint64_t CGSVGDocumentRelease()
{
  return MEMORY[0x1F4114E70]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CFArrayRef)MEMORY[0x1F40DF3F8](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return MEMORY[0x1F40DF468](descriptors, mandatoryAttributes, progressBlock);
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1F40DF788]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1F40DF7A0]();
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1 = MEMORY[0x1F40DF940](run);
  result.length = v2;
  result.id location = v1;
  return result;
}

uint64_t IMSPIQueryMessageWithGUIDAndLoadAttachments()
{
  return MEMORY[0x1F4122F88]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

uint64_t WBSBrowsingAssistantContentOptionsEnumerateOptionsUsingBlock()
{
  return MEMORY[0x1F414A280]();
}

uint64_t WBSBrowsingAssistantContentOptionsMostProminentRemoteOption()
{
  return MEMORY[0x1F414A288]();
}

uint64_t WBSBrowsingAssistantContentTypeAvailabilityLabel()
{
  return MEMORY[0x1F414A290]();
}

uint64_t WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties()
{
  return MEMORY[0x1F414A298]();
}

uint64_t WBSDispatchGroupNotifyWithTimeout()
{
  return MEMORY[0x1F414A2A0]();
}

uint64_t WBSExpirationDateWithDayMonthYear()
{
  return MEMORY[0x1F414A2A8]();
}

uint64_t WBSHideMyEmailRecordStateStringForRecordState()
{
  return MEMORY[0x1F414A2B0]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x1F414A2B8]();
}

uint64_t WBSLocalizedDeviceName()
{
  return MEMORY[0x1F414A2C0]();
}

uint64_t WBSReleaseOnMainQueueImpl()
{
  return MEMORY[0x1F414A2C8]();
}

uint64_t WBSTimestampForBiomeEventDonation()
{
  return MEMORY[0x1F414A2D8]();
}

uint64_t WBSUnifiedFieldInputTypeForString()
{
  return MEMORY[0x1F414A2E8]();
}

uint64_t WTFLogAlways()
{
  return MEMORY[0x1F40E9EE8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFNetworkCopyHSTSPolicies()
{
  return MEMORY[0x1F40D56C8]();
}

uint64_t _CFNetworkResetHSTS()
{
  return MEMORY[0x1F40D5710]();
}

uint64_t _EXIFOrientationForUIImageOrientation()
{
  return MEMORY[0x1F4102E50]();
}

uint64_t _UIImageGetCGImageRepresentation()
{
  return MEMORY[0x1F4102F00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x1F414A2F0]();
}

uint64_t SafariShared::ExtensionURLTranslator::addExtension()
{
  return MEMORY[0x1F414A2F8]();
}

uint64_t SafariShared::ExtensionURLTranslator::removeExtension(SafariShared::ExtensionURLTranslator *this, NSURL *a2)
{
  return MEMORY[0x1F414A300](this, a2);
}

uint64_t SafariShared::ExtensionURLTranslator::shared(SafariShared::ExtensionURLTranslator *this)
{
  return MEMORY[0x1F414A308](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  return MEMORY[0x1F414A310](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  return MEMORY[0x1F414A318](this, a2);
}

uint64_t WTF::fastMalloc(WTF *this)
{
  return MEMORY[0x1F40EADC0](this);
}

uint64_t WTF::fastZeroedMalloc(WTF *this)
{
  return MEMORY[0x1F40EB420](this);
}

uint64_t WTF::fastFree(WTF *this, void *a2)
{
  return MEMORY[0x1F40EBCA8](this, a2);
}

uint64_t SafariShared::ExtensionURLTranslator::fileURLForExtensionURL()
{
  return MEMORY[0x1F414A320]();
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

void objc_moveWeak(id *to, id *from)
{
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
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

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  MEMORY[0x1F40CE268](a1, a2, a3);
  return result;
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1F40D22A0](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

Boolean vImageCGImageFormat_IsEqual(const vImage_CGImageFormat *f1, const vImage_CGImageFormat *f2)
{
  return MEMORY[0x1F40D2318](f1, f2);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A8](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageConverter_MustOperateOutOfPlace(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, vImage_Flags flags)
{
  return MEMORY[0x1F40D27C8](converter, srcs, dests, *(void *)&flags);
}

void vImageConverter_Release(vImageConverterRef converter)
{
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2950](src, histogram, *(void *)&flags);
}

uint64_t vfx_script_get_arguments_buffer_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167688]();
}

uint64_t vfx_script_clock_time_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
  return MEMORY[0x1F4167630]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_VFX(double a1)
{
  return a1;
}

void gotLoadHelper_x22__OBJC_CLASS___VFXView(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    dlopenHelper_VFX(a1);
  }
}

double gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    return dlopenHelper_VFX(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_VFX)) {
    return dlopenHelper_VFX(result);
  }
  return result;
}