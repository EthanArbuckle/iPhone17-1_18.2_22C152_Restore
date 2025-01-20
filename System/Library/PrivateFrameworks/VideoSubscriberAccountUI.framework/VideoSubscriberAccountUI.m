void VSAuthenticationViewControllerViewDidLoad(void *a1)
{
  id v1;
  uint64_t vars8;

  v1 = [a1 viewModel];
  [v1 setViewState:1];
}

void VSAuthenticationViewControllerViewWillAppear(void *a1)
{
  id v1 = [a1 viewModel];
  [v1 setViewState:2];
}

void VSAuthenticationViewControllerViewDidAppear(void *a1)
{
  id v1 = [a1 viewModel];
  [v1 setViewState:3];
}

void VSAuthenticationViewControllerViewWillDisappear(void *a1)
{
  id v1 = [a1 viewModel];
  [v1 setViewState:4];
}

void VSAuthenticationViewControllerViewDidDisappear(void *a1)
{
  id v3 = a1;
  id v1 = [v3 viewModel];
  [v1 setViewState:5];

  if (([v3 isBeingDismissed] & 1) != 0
    || [v3 isMovingFromParentViewController])
  {
    v2 = [v3 viewModel];
    [v2 setViewState:6];
  }
}

void sub_23F9AF540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9B0CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location,char a36)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v37 - 232), 8);
  _Block_object_dispose((const void *)(v37 - 184), 8);
  _Block_object_dispose((const void *)(v37 - 136), 8);
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

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_23F9B1EC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23F9B24AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t VSDestinationFromResourceDictionary(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"path"];
}

id VSDestinationError(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x263F08338];
    v9[0] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v5 = 0;
  }
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"VSDestinationErrorDomain" code:a1 userInfo:v5];

  return v6;
}

id VSIconForBundleWithIdentifier(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1C920];
  id v2 = a1;
  id v3 = [v1 mainScreen];
  [v3 scale];
  double v5 = v4;

  v6 = [MEMORY[0x263F1C6B0] _applicationIconImageForBundleIdentifier:v2 format:2 scale:v5];

  return v6;
}

void sub_23F9B500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_23F9B51CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F9B52F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F9B8320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9B89EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9B9304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location,id a32)
{
}

void sub_23F9BA6A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_23F9BB910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
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

void commonInit(void *a1)
{
  id v1 = a1;
  VSRequireMainThread();
  [v1 _updateTitleTextColor];
}

id VSAlertForError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = [v3 localizedDescription];
  v6 = [v3 localizedRecoverySuggestion];
  v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
  uint64_t v8 = [v3 localizedRecoveryOptions];
  if ([v8 count])
  {
    uint64_t v9 = [v3 recoveryAttempter];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __VSAlertForError_block_invoke;
    v22[3] = &unk_265077118;
    v10 = &v23;
    id v11 = v3;
    id v26 = v4;
    id v23 = v11;
    id v24 = v9;
    id v25 = v7;
    id v12 = v9;
    id v13 = v4;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v22];

    uint64_t v14 = v26;
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v13 = [v15 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

    v16 = (void *)MEMORY[0x263F1C3F0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __VSAlertForError_block_invoke_3;
    v20[3] = &unk_265077140;
    v10 = &v21;
    id v21 = v4;
    id v12 = v4;
    uint64_t v14 = [v16 actionWithTitle:v13 style:0 handler:v20];
    [v7 addAction:v14];
  }

  v17 = [v7 actions];
  v18 = [v17 lastObject];
  [v7 setPreferredAction:v18];

  return v7;
}

void __VSAlertForError_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a1[4];
  id v6 = a2;
  v7 = [v5 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F1E428]];

  if ([v8 containsIndex:a3]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __VSAlertForError_block_invoke_2;
  uint64_t v15 = &unk_2650770F0;
  id v18 = a1[7];
  id v16 = a1[5];
  id v17 = a1[4];
  uint64_t v19 = a3;
  id v11 = [v10 actionWithTitle:v6 style:v9 handler:&v12];

  objc_msgSend(a1[6], "addAction:", v11, v12, v13, v14, v15);
}

void __VSAlertForError_block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1E1F8] sharedDelegate];
  objc_msgSend(*(id *)(a1 + 32), "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", *(void *)(a1 + 40), *(void *)(a1 + 56), v2, sel_didPresentErrorWithRecovery_contextInfo_, objc_msgSend(*(id *)(a1 + 48), "copy"));
}

uint64_t __VSAlertForError_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_23F9BDE70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_23F9BEDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_23F9C0A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)a1[12];
  a1[12] = v7;
  id v10 = v7;
  id v11 = a4;
  id v16 = a1;

  uint64_t v12 = (void *)v16[10];
  v16[10] = v8;
  id v13 = v8;

  uint64_t v14 = [v11 copy];
  uint64_t v15 = (void *)v16[3];
  v16[3] = v14;

  setDisplayNameIfAvailable(v16);
}

void setDisplayNameIfAvailable(void *a1)
{
  id v2 = a1;
  id v1 = VSDisplayNameForBundleWithIdentifier();
  if (v1) {
    objc_storeStrong(v2 + 5, v1);
  }
}

void sub_23F9C494C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F9C725C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9C7A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9C84C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_23F9C885C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F9C9448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
}

void sub_23F9CA474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_23F9CA6DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F9CBF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23F9CE7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v18 - 48));
  _Unwind_Resume(a1);
}

void commonInit_1(id *a1, void *a2, char a3, double a4, double a5)
{
  objc_storeStrong(a1 + 34, a2);
  id v10 = a2;
  id v11 = a1;
  *((unsigned char *)v11 + 256) = a3;
  *((double *)v11 + 37) = a4;
  *((double *)v11 + 38) = a5;
  uint64_t v12 = (void *)MEMORY[0x263F08A48];
  id v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v12 queueWithName:v16];
  id v15 = v11[33];
  v11[33] = (id)v14;
}

void sub_23F9D33B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(&a26);
  objc_destroyWeak((id *)(v26 - 160));
  _Unwind_Resume(a1);
}

void sub_23F9D3658(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_23F9D8528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void commonInit_2(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08A48];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  uint64_t v4 = (void *)*((void *)v2 + 37);
  *((void *)v2 + 37) = v3;

  [*((id *)v2 + 37) setName:@"VSIdentityProviderFetchOperation"];
  id v5 = objc_alloc_init(MEMORY[0x263F1E250]);
  id v6 = (id)*((void *)v2 + 36);
  *((void *)v2 + 36) = v5;
}

void sub_23F9D8E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9DA1F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
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

void sub_23F9DA6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9DADF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9DB000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void VSExportCompressionToContext(void *a1)
{
  v28[3] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSJavaScriptDataValueTransformer"];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1E278]) initWithValueTransformer:v2];
    uint64_t v4 = [MEMORY[0x263F08D50] valueTransformerForName:*MEMORY[0x263F1E400]];
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F1E1D8]);
      v28[0] = v2;
      v28[1] = v4;
      v28[2] = v3;
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
      [v5 setValueTransformers:v6];

      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v22 = v4;
      v26[2] = __VSExportCompressionToContext_block_invoke;
      v26[3] = &unk_265077BB8;
      id v7 = v5;
      id v27 = v7;
      v20 = (void *)MEMORY[0x2455D84D0](v26);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __VSExportCompressionToContext_block_invoke_2;
      v24[3] = &unk_265077BB8;
      id v25 = v7;
      id v21 = v7;
      uint64_t v19 = (void *)MEMORY[0x2455D84D0](v24);
      id v8 = [v1 globalObject];
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v10 = (void *)MEMORY[0x2455D84D0](v20);
      uint64_t v11 = *MEMORY[0x263F10368];
      [v9 setObject:v10 forKey:*MEMORY[0x263F10368]];

      id v23 = v3;
      id v12 = v1;
      uint64_t v13 = *MEMORY[0x263F10370];
      uint64_t v14 = MEMORY[0x263EFFA80];
      [v9 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F10370]];
      uint64_t v15 = *MEMORY[0x263F10350];
      [v9 setObject:v14 forKey:*MEMORY[0x263F10350]];
      [v9 setObject:v14 forKey:v15];
      [v8 defineProperty:@"deflate" descriptor:v9];
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v17 = (void *)MEMORY[0x2455D84D0](v19);
      [v16 setObject:v17 forKey:v11];

      uint64_t v18 = v13;
      id v1 = v12;
      id v3 = v23;
      [v16 setObject:v14 forKey:v18];
      [v16 setObject:v14 forKey:v15];
      [v16 setObject:v14 forKey:v15];
      [v8 defineProperty:@"inflate" descriptor:v16];

      uint64_t v4 = v22;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Unable to obtain compression value transformer."];
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Unable to obtain data value transformer."];
  }
}

uint64_t __VSExportCompressionToContext_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transformedValue:a2];
}

uint64_t __VSExportCompressionToContext_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reverseTransformedValue:a2];
}

uint64_t VSIsScriptMessageNotificationURL(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = VSScriptMessageNotificationURL();
    id v5 = [v4 scheme];
    id v6 = [v3 scheme];
    id v7 = v6;
    uint64_t v8 = 0;
    if (v5 && v6)
    {
      if ([v6 compare:v5 options:1])
      {
        uint64_t v8 = 0;
      }
      else
      {
        id v9 = [v4 resourceSpecifier];
        id v10 = [v3 resourceSpecifier];
        id v11 = v9;
        id v12 = v10;
        uint64_t v13 = v12;
        if (v11 == v12)
        {
          uint64_t v8 = 1;
        }
        else
        {
          uint64_t v8 = 0;
          if (v11 && v12) {
            uint64_t v8 = [v11 isEqual:v12];
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id VSScriptMessageNotificationURL()
{
  if (VSScriptMessageNotificationURL___vs_lazy_init_predicate != -1) {
    dispatch_once(&VSScriptMessageNotificationURL___vs_lazy_init_predicate, &__block_literal_global_16);
  }
  v0 = (void *)VSScriptMessageNotificationURL___vs_lazy_init_variable;
  return v0;
}

id VSScriptMessageSupportInjection(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  id v3 = [v2 URLForResource:@"VideoSubscriberAccount" withExtension:@"js"];
  if (v3)
  {
    uint64_t v13 = 0;
    uint64_t v4 = [MEMORY[0x263F089D8] stringWithContentsOfURL:v3 encoding:4 error:&v13];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = @"ITML";
  if (a1 != 1) {
    id v5 = 0;
  }
  if (a1) {
    id v6 = v5;
  }
  else {
    id v6 = @"web";
  }
  id v7 = [MEMORY[0x263F1E250] optionalWithObject:v6];
  uint64_t v8 = [v7 forceUnwrapObject];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"____VS_MESSAGE_ENVIRONMENT_NAME____", v8, 0, 0, objc_msgSend(v4, "length"));
  id v9 = VSScriptMessageNotificationURL();
  id v10 = [v9 absoluteString];

  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"____VS_MESSAGE_NOTIFICATION_URL____", v11, 0, 0, objc_msgSend(v4, "length"));
  }
  if (!v4)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Unable to obtain script source."];
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The scriptSourceOrNil parameter must not be nil."];
  }

  return v4;
}

id VSScriptMessageDispatchInjection(void *a1)
{
  id v1 = a1;
  id v2 = [v1 body];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"'" withString:@"'"];

  uint64_t v4 = [v1 source];

  id v5 = NSString;
  id v6 = [v4 scheme];
  id v7 = [v6 lowercaseString];
  uint64_t v8 = [v4 host];
  id v9 = [v5 stringWithFormat:@"%@://%@", v7, v8];

  uint64_t v10 = [v4 port];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(v9, "stringByAppendingFormat:", @":%ld", v10);

    id v9 = (void *)v11;
  }
  id v12 = [v9 stringByReplacingOccurrencesOfString:@"'" withString:@"'"];
  objc_msgSend(NSString, "stringWithFormat:", @"(function () {var m = {};m.data = '%@';m.origin = '%@';VideoSubscriberAccount._dispatchMessage(m);})();",
    v3,
  uint64_t v13 = v12);

  return v13;
}

VSScriptMessage *VSScriptMessageForValueFromContextWithOrigin(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 objectForKey:@"target"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = (void *)MEMORY[0x263EFF940];
        uint64_t v9 = *MEMORY[0x263EFF4A0];
        uint64_t v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        [v8 raise:v9, @"Unexpectedly, target was %@, instead of NSString.", v11 format];
      }
      id v12 = v7;
      uint64_t v13 = [v3 objectForKey:@"body"];
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = v13;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v16 = (void *)MEMORY[0x263EFF940];
            uint64_t v17 = *MEMORY[0x263EFF4A0];
            uint64_t v18 = (objc_class *)objc_opt_class();
            uint64_t v19 = NSStringFromClass(v18);
            [v16 raise:v17, @"Unexpectedly, bodyValue was %@, instead of NSString.", v19 format];
          }
          id v20 = v15;
          id v21 = objc_alloc_init(VSScriptMessage);
          [(VSScriptMessage *)v21 setBody:v20];

          [(VSScriptMessage *)v21 setSource:v4];
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
      if ([v12 isEqual:@"*"])
      {
        v22 = 0;
      }
      else if ([v12 isEqual:@"/"])
      {
        v22 = (VSScriptSecurityOrigin *)v4;
      }
      else
      {
        id v23 = [MEMORY[0x263F08BA0] componentsWithString:v12];
        if (v23)
        {
          v22 = objc_alloc_init(VSScriptSecurityOrigin);
          id v24 = [v23 scheme];
          [(VSScriptSecurityOrigin *)v22 setScheme:v24];

          id v25 = [v23 host];
          [(VSScriptSecurityOrigin *)v22 setHost:v25];

          uint64_t v26 = [v23 port];
          -[VSScriptSecurityOrigin setPort:](v22, "setPort:", [v26 integerValue]);
        }
        else
        {
          id v27 = VSErrorLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            VSScriptMessageForValueFromContextWithOrigin_cold_1((uint64_t)v12, v27);
          }

          v22 = 0;
          id v21 = 0;
        }
      }
      [(VSScriptMessage *)v21 setTarget:v22];
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t VSShouldSendScriptMessageToContextWithOrigin(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 target];
  id v6 = v5;
  if (v5 && ([v5 isEqual:v4] & 1) == 0)
  {
    uint64_t v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v3 body];
      uint64_t v11 = [v3 source];
      int v12 = 138413058;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_ERROR, "Discarding message (%@) from %@ with target (%@) mis-match for origin: %@", (uint8_t *)&v12, 0x2Au);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __VSScriptMessageNotificationURL_block_invoke()
{
  uint64_t v0 = __VSScriptMessageNotificationURL_block_invoke_2();
  uint64_t v1 = VSScriptMessageNotificationURL___vs_lazy_init_variable;
  VSScriptMessageNotificationURL___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __VSScriptMessageNotificationURL_block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v0 setScheme:@"com.apple.VideoSubscriberAccount"];
  uint64_t v1 = [MEMORY[0x263F08C38] UUID];
  id v2 = [v1 UUIDString];
  [v0 setPath:v2];

  id v3 = [v0 URL];

  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [components URL] parameter must not be nil."];
  }
  id v4 = [v0 URL];

  return v4;
}

void sub_23F9E61DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VSSpecifierForFooter(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F5FC40];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v5 emptyGroupSpecifier];
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v9 setProperty:v11 forKey:*MEMORY[0x263F600C0]];

  int v12 = (void *)[v8 copy];
  [v9 setProperty:v12 forKey:@"VSFooterPrimaryMessage"];

  uint64_t v13 = (void *)[v7 copy];
  [v9 setProperty:v13 forKey:@"VSFooterSecondaryMessage"];

  __int16 v14 = (void *)[v6 copy];
  [v9 setProperty:v14 forKey:@"VSFooterTertiaryMessage"];

  return v9;
}

void sub_23F9E8258(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_23F9E8AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9E8D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_3(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263F1C3D8];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithActivityIndicatorStyle:100];
  id v4 = (void *)v2[124];
  v2[124] = v3;
  id v5 = v3;

  *((unsigned char *)v2 + 977) = 1;
  id v6 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v6 setAdjustsFontForContentSizeCategory:1];
  id v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  [v6 setFont:v11];
  [v6 setMaximumContentSizeCategory:*MEMORY[0x263F1D150]];
  [v6 setNumberOfLines:0];
  id v7 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v6 setTextColor:v7];

  [v6 setTextAlignment:1];
  id v8 = +[VSLoadingViewController_iOS defaultLoadingTitle];
  uint64_t v9 = [v8 uppercaseString];
  [v6 setText:v9];

  uint64_t v10 = (void *)v2[125];
  v2[125] = v6;
}

__CFString *VSAppSettingsSectionLocalizedTitle(void *a1)
{
  id v1 = a1;
  if ([v1 isEqual:@"decided"])
  {
    id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v3 = v2;
    id v4 = @"ACCOUNT_ACCESS_DECIDED_GROUP_NAME";
LABEL_9:
    id v5 = [v2 localizedStringForKey:v4 value:0 table:0];

    goto LABEL_10;
  }
  if ([v1 isEqual:@"available"])
  {
    id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v3 = v2;
    id v4 = @"ACCOUNT_ACCESS_AVAILABLE_GROUP_NAME";
    goto LABEL_9;
  }
  if ([v1 isEqual:@"subscribed"])
  {
    id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v3 = v2;
    id v4 = @"ACCOUNT_ACCESS_SUBSCRIBED_GROUP_NAME";
    goto LABEL_9;
  }
  if ([v1 isEqual:@"upgrade"])
  {
    id v2 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    uint64_t v3 = v2;
    id v4 = @"ACCOUNT_ACCESS_AVAILABLE_WITH_UPGRADE_GROUP_NAME";
    goto LABEL_9;
  }
  id v5 = &stru_26F361E90;
LABEL_10:

  return v5;
}

void sub_23F9EA8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_4(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F1C6D0];
  id v5 = a1;
  id v2 = objc_alloc_init(v1);
  [v2 setContentMode:1];
  uint64_t v3 = (void *)v5[51];
  v5[51] = v2;
  id v4 = v2;

  [v5 addSubview:v4];
}

void commonInit_5(void *a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [[VSFontCenter alloc] initWithTraitEnvironment:v1];
  uint64_t v3 = (void *)v1[134];
  v1[134] = v2;

  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  id v5 = (id)[v1 registerForTraitChanges:v4 withHandler:&__block_literal_global_19];
}

void __commonInit_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v17 = v4;
  id v6 = [v17 traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    uint64_t v9 = [v17 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    id v11 = [v17 viewModel];
    [v17 preferredLogoSize];
    objc_msgSend(v17, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v11, v10);
  }
  int v12 = [v17 traitCollection];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  __int16 v14 = [v5 preferredContentSizeCategory];

  if (v13 != v14)
  {
    id v15 = [v17 fontCenter];
    __int16 v16 = [v17 traitCollection];
    [v15 setTraitCollection:v16];
  }
}

void sub_23F9EFE88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F9F0334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_23F9F07EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_23F9F121C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9F19F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23F9F1F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id VSAppDescriptionValueType()
{
  if (VSAppDescriptionValueType___vs_lazy_init_predicate != -1) {
    dispatch_once(&VSAppDescriptionValueType___vs_lazy_init_predicate, &__block_literal_global_23);
  }
  id v0 = (void *)VSAppDescriptionValueType___vs_lazy_init_variable;
  return v0;
}

uint64_t __VSAppDescriptionValueType_block_invoke()
{
  uint64_t v0 = __VSAppDescriptionValueType_block_invoke_2();
  uint64_t v1 = VSAppDescriptionValueType___vs_lazy_init_variable;
  VSAppDescriptionValueType___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __VSAppDescriptionValueType_block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1E2D0]);
  [v0 setImplementationClass:objc_opt_class()];
  id v1 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v2 = (void *)MEMORY[0x263F1E2D8];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v4 = [v2 valueTypePropertyWithName:@"displayName" kind:2 allowedClasses:v3 initialValue:0];
  [v1 addObject:v4];

  id v5 = (void *)MEMORY[0x263F1E2D8];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v7 = [v5 valueTypePropertyWithName:@"adamID" kind:2 allowedClasses:v6 initialValue:0];
  [v1 addObject:v7];

  uint64_t v8 = (void *)MEMORY[0x263F1E2D8];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v10 = [v8 valueTypePropertyWithName:@"buyParams" kind:2 allowedClasses:v9 initialValue:0];
  [v1 addObject:v10];

  id v11 = (void *)MEMORY[0x263F1E2D8];
  int v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v13 = [v11 valueTypePropertyWithName:@"bundleID" kind:2 allowedClasses:v12 initialValue:0];
  [v1 addObject:v13];

  __int16 v14 = (void *)MEMORY[0x263F1E2D8];
  id v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  __int16 v16 = [v14 valueTypePropertyWithName:@"sellerName" kind:2 allowedClasses:v15 initialValue:0];
  [v1 addObject:v16];

  id v17 = (void *)MEMORY[0x263F1E2D8];
  __int16 v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v19 = [v17 valueTypePropertyWithName:@"externalVersionID" kind:2 allowedClasses:v18 initialValue:0];
  [v1 addObject:v19];

  uint64_t v20 = (void *)MEMORY[0x263F1E2D8];
  id v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v22 = [v20 valueTypePropertyWithName:@"icon" kind:2 allowedClasses:v21 initialValue:0];
  [v1 addObject:v22];

  id v23 = (void *)MEMORY[0x263F1E2D8];
  id v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v25 = [v23 valueTypePropertyWithName:@"appStoreURL" kind:2 allowedClasses:v24 initialValue:0];
  [v1 addObject:v25];

  uint64_t v26 = (void *)MEMORY[0x263F1E2D8];
  id v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v28 = [v26 valueTypePropertyWithName:@"privacyPolicyEndpointURL" kind:2 allowedClasses:v27 initialValue:0];
  [v1 addObject:v28];

  v29 = (void *)MEMORY[0x263F1E2D8];
  v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v31 = [v29 valueTypePropertyWithName:@"licenseAgreementEndpointURL" kind:2 allowedClasses:v30 initialValue:0];
  [v1 addObject:v31];

  v32 = (void *)MEMORY[0x263F1E2D8];
  v33 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v34 = [v32 valueTypePropertyWithName:@"rating" kind:2 allowedClasses:v33 initialValue:0];
  [v1 addObject:v34];

  v35 = (void *)MEMORY[0x263F1E2D8];
  v36 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v37 = [v35 valueTypePropertyWithName:@"contentRank" kind:2 allowedClasses:v36 initialValue:0];
  [v1 addObject:v37];

  v38 = [MEMORY[0x263F1E2D8] valueTypePropertyWithName:@"offersInAppPurchases" kind:0 allowedClasses:0 initialValue:0];
  [v1 addObject:v38];

  v39 = [MEMORY[0x263F1E2D8] valueTypePropertyWithName:@"appType" kind:1 allowedClasses:0 initialValue:0];
  [v1 addObject:v39];

  v40 = [MEMORY[0x263F1E2D8] valueTypePropertyWithName:@"defaultAppForProvider" kind:0 allowedClasses:0 initialValue:0];
  [v1 addObject:v40];

  v41 = (void *)MEMORY[0x263F1E2D8];
  v42 = (void *)MEMORY[0x263EFFA08];
  uint64_t v43 = objc_opt_class();
  v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v45 = [v41 valueTypePropertyWithName:@"deviceFamilies" kind:2 allowedClasses:v44 initialValue:MEMORY[0x263EFFA68]];
  [v1 addObject:v45];

  v46 = (void *)MEMORY[0x263F1E2D8];
  v47 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v48 = [v46 valueTypePropertyWithName:@"visionOSCompatible" kind:2 allowedClasses:v47 initialValue:0];
  [v1 addObject:v48];

  [v0 setProperties:v1];
  return v0;
}

void sub_23F9F40D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9F48B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(v33);
  objc_destroyWeak(&a28);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v36 - 144), 8);
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

void sub_23F9F58F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23F9F6064(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__112(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x2455D84D0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__113(uint64_t a1)
{
}

void sub_23F9F6F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29)
{
}

void sub_23F9F7308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_23F9F754C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9F8790(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_23F9F8FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23F9F90D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23F9F95A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9FB00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9FBAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F9FCF00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_23FA00BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_6(void *a1)
{
  v182[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  VSRequireMainThread();
  uint64_t v2 = (void *)*((void *)v1 + 54);
  *((void *)v1 + 54) = &stru_26F361E90;

  uint64_t v3 = (void *)*((void *)v1 + 55);
  *((void *)v1 + 55) = &stru_26F361E90;

  id v4 = (void *)*((void *)v1 + 56);
  *((void *)v1 + 56) = &stru_26F361E90;

  uint64_t v5 = (void *)*((void *)v1 + 57);
  *((void *)v1 + 57) = &stru_26F361E90;

  id v6 = (void *)*((void *)v1 + 58);
  *((void *)v1 + 58) = &stru_26F361E90;

  uint64_t v7 = (void *)*((void *)v1 + 59);
  *((void *)v1 + 59) = &stru_26F361E90;

  uint64_t v8 = (void *)*((void *)v1 + 60);
  *((void *)v1 + 60) = &stru_26F361E90;

  uint64_t v9 = (void *)*((void *)v1 + 61);
  *((void *)v1 + 61) = &stru_26F361E90;

  uint64_t v10 = (void *)*((void *)v1 + 64);
  *((void *)v1 + 64) = &stru_26F361E90;

  id v11 = [[VSFontCenter alloc] initWithTraitEnvironment:v1];
  objc_storeStrong((id *)v1 + 65, v11);
  id v12 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  objc_storeStrong((id *)v1 + 69, v12);
  [v12 setAxis:1];
  [v12 setAlignment:3];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = v12;
  [v1 addSubview:v12];
  id v14 = objc_alloc_init(MEMORY[0x263F1C768]);
  id v15 = VSMainConcurrencyBindingOptions();
  v178 = v11;
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"title1Font", v15);

  __int16 v16 = [MEMORY[0x263F1C658] systemFontOfSize:76.0 weight:*MEMORY[0x263F1D318]];
  [v14 setFont:v16];

  id v17 = objc_msgSend(MEMORY[0x263F1C550], "vsa_opacityBDynamicColor");
  [v14 setTextColor:v17];

  [v14 setTextAlignment:1];
  [v14 setLineBreakMode:0];
  [v14 setNumberOfLines:0];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  __int16 v18 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", @"text", v1, @"title", v18);

  [v13 addArrangedSubview:v14];
  id v19 = [v13 layer];
  [v19 setAllowsGroupBlending:0];

  uint64_t v20 = [v14 traitCollection];
  uint64_t v21 = [v20 userInterfaceStyle];

  v22 = [v14 layer];
  id v23 = v22;
  uint64_t v24 = *MEMORY[0x263F15D58];
  uint64_t v25 = *MEMORY[0x263F15D50];
  if (v21 == 2) {
    uint64_t v26 = *MEMORY[0x263F15D58];
  }
  else {
    uint64_t v26 = *MEMORY[0x263F15D50];
  }
  [v22 setCompositingFilter:v26];

  id v27 = objc_alloc_init(MEMORY[0x263F1C768]);
  v28 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v27, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"headlineFont", v28);

  v29 = objc_msgSend(MEMORY[0x263F1C550], "vsa_opacityCDynamicColor");
  [v27 setTextColor:v29];

  [v27 setTextAlignment:1];
  [v27 setLineBreakMode:0];
  [v27 setNumberOfLines:0];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v27, "vs_bind:toObject:withKeyPath:options:", @"text", v1, @"message", v30);

  [v13 addArrangedSubview:v27];
  v31 = [v27 traitCollection];
  uint64_t v32 = [v31 userInterfaceStyle];

  v33 = [v27 layer];
  v34 = v33;
  if (v32 == 2) {
    uint64_t v35 = v24;
  }
  else {
    uint64_t v35 = v25;
  }
  [v33 setCompositingFilter:v35];

  v177 = v27;
  [v13 setCustomSpacing:v27 afterView:44.0];
  v176 = v14;
  uint64_t v36 = [v14 font];
  [v36 descender];
  double v38 = ceil(v37) + 50.0;

  v39 = [v27 font];
  [v39 ascender];
  double v41 = v40;
  v42 = [v27 font];
  [v42 capHeight];
  double v44 = v38 - ceil(v41 - v43);

  [v13 setCustomSpacing:v14 afterView:v44];
  v45 = [MEMORY[0x263F1C488] buttonWithType:1];
  v46 = (void *)*((void *)v1 + 70);
  *((void *)v1 + 70) = v45;
  id v47 = v45;

  v48 = [MEMORY[0x263F1C550] clearColor];
  [v47 _setVisualEffectViewEnabled:0 backgroundColor:v48];

  [v47 addTarget:v1 action:sel__beginButtonPressed_ forControlEvents:0x2000];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  v49 = (void *)MEMORY[0x263F1C550];
  v50 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  v51 = [MEMORY[0x263F1C550] whiteColor];
  v52 = objc_msgSend(v49, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v50, v51);
  [v47 setTitleColor:v52 forState:0];

  v53 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v47 setTitleColor:v53 forState:8];

  v54 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v47 setTitleColor:v54 forState:1];

  LODWORD(v55) = 1148846080;
  [v47 setContentHuggingPriority:0 forAxis:v55];
  v56 = [v47 titleLabel];
  v57 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v56, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"headlineFont", v57);

  v58 = VSMainConcurrencyBindingOptions();
  v180 = v47;
  objc_msgSend(v47, "vs_bind:toObject:withKeyPath:options:", @"vs_normalTitle", v1, @"beginButtonTitle", v58);

  [v13 addArrangedSubview:v47];
  [v13 setCustomSpacing:v47 afterView:14.0];
  v59 = [MEMORY[0x263F1C488] buttonWithType:1];
  v60 = (void *)*((void *)v1 + 71);
  *((void *)v1 + 71) = v59;
  id v61 = v59;

  v62 = [MEMORY[0x263F1C550] clearColor];
  [v61 _setVisualEffectViewEnabled:0 backgroundColor:v62];

  [v61 addTarget:v1 action:sel__skipButtonPressed_ forControlEvents:0x2000];
  [v61 setTranslatesAutoresizingMaskIntoConstraints:0];
  v63 = (void *)MEMORY[0x263F1C550];
  v64 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  v65 = [MEMORY[0x263F1C550] whiteColor];
  v66 = objc_msgSend(v63, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v64, v65);
  [v61 setTitleColor:v66 forState:0];

  v67 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v61 setTitleColor:v67 forState:8];

  v68 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v61 setTitleColor:v68 forState:1];

  LODWORD(v69) = 1132068864;
  [v61 setContentHuggingPriority:0 forAxis:v69];
  v70 = [v61 titleLabel];
  [v70 setLineBreakMode:5];

  uint64_t v71 = [(VSFontCenter *)v11 headlineFont];
  v72 = (void *)*((void *)v1 + 66);
  *((void *)v1 + 66) = v71;

  uint64_t v73 = [(VSFontCenter *)v11 headlineFont];
  v74 = (void *)*((void *)v1 + 67);
  *((void *)v1 + 67) = v73;

  *((void *)v1 + 68) = 0x402E000000000000;
  v75 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v61, "vs_bind:toObject:withKeyPath:options:", @"vs_normalTitle", v1, @"skipButtonTitle", v75);

  v76 = [v61 titleLabel];
  v77 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v76, "vs_bind:toObject:withKeyPath:options:", @"font", v1, @"skipButtonFont", v77);

  v181 = v61;
  [v13 addArrangedSubview:v61];
  [v13 setCustomSpacing:v61 afterView:20.0];
  v78 = [MEMORY[0x263F1C488] buttonWithType:1];
  v79 = (void *)*((void *)v1 + 72);
  *((void *)v1 + 72) = v78;
  id v80 = v78;

  v81 = [MEMORY[0x263F1C550] clearColor];
  [v80 _setVisualEffectViewEnabled:0 backgroundColor:v81];

  [v80 addTarget:v1 action:sel__appsButtonPressed_ forControlEvents:0x2000];
  [v80 setTranslatesAutoresizingMaskIntoConstraints:0];
  v82 = (void *)MEMORY[0x263F1C550];
  v83 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  v84 = [MEMORY[0x263F1C550] whiteColor];
  v85 = objc_msgSend(v82, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v83, v84);
  [v80 setTitleColor:v85 forState:0];

  v86 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v80 setTitleColor:v86 forState:8];

  v87 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.8];
  [v80 setTitleColor:v87 forState:1];

  v88 = [v80 titleLabel];
  v89 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v88, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"bodyFont", v89);

  v90 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v80, "vs_bind:toObject:withKeyPath:options:", @"vs_normalTitle", v1, @"appsButtonTitle", v90);

  v91 = VSMainConcurrencyBindingOptions();
  v92 = (void *)[v91 mutableCopy];

  uint64_t v93 = *MEMORY[0x263F083F8];
  uint64_t v94 = *MEMORY[0x263F1E498];
  uint64_t v169 = *MEMORY[0x263F1E498];
  [v92 setObject:*MEMORY[0x263F083F8] forKey:*MEMORY[0x263F1E498]];
  v175 = v80;
  objc_msgSend(v80, "vs_bind:toObject:withKeyPath:options:", @"hidden", v1, @"shouldShowAppsButton", v92);

  [v80 _setFocusSpeedBumpEdges:1];
  [v13 addArrangedSubview:v80];
  [v13 setCustomSpacing:v80 afterView:20.0];
  id v95 = objc_alloc_init(MEMORY[0x263F1CB60]);
  v96 = (void *)*((void *)v1 + 62);
  *((void *)v1 + 62) = v95;
  id v97 = v95;

  [v97 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v97 _setFocusSpeedBumpEdges:1];
  v174 = v97;
  [v13 addArrangedSubview:v97];
  v98 = VSMainConcurrencyBindingOptions();
  v99 = (void *)[v98 mutableCopy];

  [v99 setObject:v93 forKey:v94];
  objc_msgSend(v97, "vs_bind:toObject:withKeyPath:options:", @"hidden", v1, @"shouldShowAboutButton", v99);

  id v179 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v13 addArrangedSubview:v179];
  id v173 = objc_alloc_init(MEMORY[0x263F1C768]);
  v100 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v173, "vs_bind:toObject:withKeyPath:options:", @"text", v1, @"footer", v100);

  v101 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v173, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"bodyFont", v101);

  v102 = objc_msgSend(MEMORY[0x263F1C550], "vsa_opacityCDynamicColor");
  [v173 setTextColor:v102];

  [v173 setTextAlignment:1];
  [v173 setLineBreakMode:0];
  [v173 setNumberOfLines:0];
  [v173 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 addArrangedSubview:v173];
  id v103 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [v103 _setContinuousCornerRadius:14.0];
  [v103 setClipsToBounds:1];
  [v103 setTranslatesAutoresizingMaskIntoConstraints:0];
  v104 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v103, "vs_bind:toObject:withKeyPath:options:", @"image", v1, @"image", v104);

  [v1 addSubview:v103];
  id v105 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v105 setAxis:0];
  [v105 setAlignment:3];
  [v105 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v105];
  id v106 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v106 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v106 setTextAlignment:1];
  v107 = VSMainConcurrencyBindingOptions();
  v172 = v106;
  objc_msgSend(v106, "vs_bind:toObject:withKeyPath:options:", @"text", v1, @"appName", v107);

  v108 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v106, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"calloutFont", v108);

  [v105 addArrangedSubview:v106];
  [v105 setCustomSpacing:v106 afterView:8.0];
  id v109 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v109 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v109 setTextAlignment:1];
  v110 = objc_msgSend(MEMORY[0x263F1C550], "vsa_opacityCDynamicColor");
  [v109 setTextColor:v110];

  v111 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v109, "vs_bind:toObject:withKeyPath:options:", @"text", v1, @"appAgeRatingBadge", v111);

  v112 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v109, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"appAgeRatingFont", v112);

  [v105 addArrangedSubview:v109];
  v113 = [v109 layer];
  [v113 setCornerRadius:6.0];

  v114 = [v109 layer];
  [v114 setMasksToBounds:1];

  v115 = [v109 layer];
  [v115 setBorderWidth:2.0];

  id v116 = [MEMORY[0x263F1C550] grayColor];
  uint64_t v117 = [v116 CGColor];
  v118 = [v109 layer];
  [v118 setBorderColor:v117];

  id v119 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v119 setTranslatesAutoresizingMaskIntoConstraints:0];
  v120 = objc_msgSend(MEMORY[0x263F1C550], "vsa_opacityCDynamicColor");
  [v119 setTextColor:v120];

  [v119 setNumberOfLines:0];
  id v171 = objc_alloc_init(MEMORY[0x263F1E1D0]);
  [v171 setTransformationBlock:&__block_literal_global_25];
  v121 = VSMainConcurrencyBindingOptions();
  v122 = (void *)[v121 mutableCopy];

  [v122 setObject:v171 forKey:v169];
  objc_msgSend(v119, "vs_bind:toObject:withKeyPath:options:", @"attributedText", v1, @"footnote", v122);

  v123 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v119, "vs_bind:toObject:withKeyPath:options:", @"font", v11, @"caption2Font", v123);

  [v1 addSubview:v119];
  id v124 = objc_alloc_init(MEMORY[0x263EFF980]);
  v125 = [v13 centerXAnchor];
  v126 = [v1 leadingAnchor];
  v127 = [v125 constraintEqualToAnchor:v126 constant:662.0];
  [v124 addObject:v127];

  v128 = [v13 centerYAnchor];
  v129 = [v1 centerYAnchor];
  v130 = [v128 constraintEqualToAnchor:v129];

  LODWORD(v131) = 1144733696;
  v170 = v130;
  [v130 setPriority:v131];
  [v124 addObject:v130];
  v132 = [v13 widthAnchor];
  v133 = [v132 constraintLessThanOrEqualToConstant:846.0];
  [v124 addObject:v133];

  v134 = [v180 heightAnchor];
  v135 = [v134 constraintEqualToConstant:75.0];
  [v124 addObject:v135];

  v136 = [v181 heightAnchor];
  v137 = [v136 constraintEqualToConstant:75.0];
  [v124 addObject:v137];

  v138 = [v180 widthAnchor];
  v139 = [v138 constraintGreaterThanOrEqualToConstant:380.0];
  [v124 addObject:v139];

  v140 = [v180 centerXAnchor];
  v141 = [v13 centerXAnchor];
  v142 = [v140 constraintEqualToAnchor:v141];
  [v124 addObject:v142];

  v143 = [v179 heightAnchor];
  v144 = [v143 constraintEqualToConstant:5.0];
  [v124 addObject:v144];

  v145 = [v103 widthAnchor];
  v146 = [v145 constraintEqualToConstant:550.0];
  [v124 addObject:v146];

  v147 = [v103 heightAnchor];
  v148 = [v147 constraintEqualToConstant:330.0];
  [v124 addObject:v148];

  v149 = [v103 topAnchor];
  v150 = [v1 topAnchor];
  v151 = [v149 constraintEqualToAnchor:v150 constant:348.0];
  [v124 addObject:v151];

  v152 = [v103 trailingAnchor];
  v153 = [v1 trailingAnchor];
  v154 = [v152 constraintEqualToAnchor:v153 constant:-138.0];
  [v124 addObject:v154];

  v155 = [v105 centerXAnchor];
  v156 = [v103 centerXAnchor];
  v157 = [v155 constraintEqualToAnchor:v156];
  [v124 addObject:v157];

  v158 = [v105 firstBaselineAnchor];
  v159 = [v103 bottomAnchor];
  v160 = [v158 constraintEqualToAnchor:v159 constant:42.0];
  [v124 addObject:v160];

  v161 = [v119 centerXAnchor];
  v162 = [v103 centerXAnchor];
  v163 = [v161 constraintEqualToAnchor:v162];
  [v124 addObject:v163];

  v164 = [v119 firstBaselineAnchor];
  v165 = [v172 lastBaselineAnchor];
  v166 = [v164 constraintEqualToAnchor:v165 constant:36.0];
  [v124 addObject:v166];

  [MEMORY[0x263F08938] activateConstraints:v124];
  v182[0] = objc_opt_class();
  v182[1] = objc_opt_class();
  v167 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:2];

  id v168 = (id)[v1 registerForTraitChanges:v167 withHandler:&__block_literal_global_249];
}

id __commonInit_block_invoke_0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v4 setLineSpacing:7.0];
    [v4 setAlignment:1];
    [v3 setObject:v4 forKey:*MEMORY[0x263F1C268]];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v2 attributes:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __commonInit_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v19 = v4;
  id v6 = [v19 traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  uint64_t v8 = [v5 preferredContentSizeCategory];

  if (v7 != v8)
  {
    uint64_t v9 = [v19 fontCenter];
    uint64_t v10 = [v19 traitCollection];
    [v9 setTraitCollection:v10];
  }
  id v11 = [v19 traitCollection];
  uint64_t v12 = [v11 userInterfaceStyle];
  uint64_t v13 = [v5 userInterfaceStyle];

  if (v12 != v13)
  {
    id v14 = [v19 traitCollection];
    uint64_t v15 = [v14 userInterfaceStyle];

    __int16 v16 = [v19 layer];
    id v17 = v16;
    __int16 v18 = (void *)MEMORY[0x263F15D58];
    if (v15 != 2) {
      __int16 v18 = (void *)MEMORY[0x263F15D50];
    }
    [v16 setCompositingFilter:*v18];
  }
}

void __swiftcall NSURL.init(vsString:)(NSURL_optional *__return_ptr retstr, Swift::String vsString)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithVsString_, v3);
}

id NSURL.init(vsString:)(uint64_t a1, unint64_t a2)
{
  sub_23FA040EC(a1, a2);
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithString_, v3);

  return v4;
}

uint64_t sub_23FA040EC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_23FA07A70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  id v9 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  swift_bridgeObjectRetain();
  id v10 = sub_23FA048C8(0x233F2F3A5E5B285ELL, 0xEE002F2F3A292B5DLL, 1);
  swift_bridgeObjectRetain();
  id v11 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_23FA07AB0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_matchesInString_options_range_, v11, 0, 0, v12);

  sub_23FA049A4();
  unint64_t v14 = sub_23FA07AE0();

  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_23FA07B50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v15)
  {
  }
  else
  {
    sub_23FA07A50();
    __int16 v16 = sub_23FA07A60();
    os_log_type_t v17 = sub_23FA07AF0();
    if (os_log_type_enabled(v16, v17))
    {
      __int16 v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)__int16 v18 = 136315138;
      id v23 = v18 + 4;
      swift_beginAccess();
      uint64_t v19 = v28;
      unint64_t v20 = v29;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_23FA049E4(v19, v20, &v26);
      sub_23FA07B00();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23F9AB000, v16, v17, "Missing scheme for URL: %s", v18, 0xCu);
      uint64_t v21 = v24;
      swift_arrayDestroy();
      MEMORY[0x2455D8750](v21, -1, -1);
      MEMORY[0x2455D8750](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    swift_beginAccess();
    uint64_t v26 = 0x2F2F3A7370747468;
    unint64_t v27 = 0xE800000000000000;
    sub_23FA07AC0();

    uint64_t v28 = v26;
    unint64_t v29 = v27;
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  return v28;
}

id sub_23FA04538(void *a1)
{
  uint64_t v2 = sub_23FA07A90();
  sub_23FA040EC(v2, v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(a1, sel_initWithString_, v4);

  return v5;
}

id static NSURL.vs_URL(withString:)()
{
  id v0 = objc_allocWithZone(NSURL);
  swift_bridgeObjectRetain();
  id v1 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithVsString_, v1);

  return v2;
}

id sub_23FA04634()
{
  sub_23FA07A90();
  id v0 = objc_allocWithZone(NSURL);
  id v1 = (void *)sub_23FA07A80();
  id v2 = objc_msgSend(v0, sel_initWithVsString_, v1);
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t URL.init(vsString:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5EB10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FA040EC(a1, a2);
  swift_bridgeObjectRelease();
  sub_23FA07A30();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_23FA07A40();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_23FA04868((uint64_t)v8);
    uint64_t v11 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
    uint64_t v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v11, 1, v9);
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

uint64_t sub_23FA04868(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C5EB10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23FA048C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_23FA07A80();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_23FA07A20();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_23FA049A4()
{
  unint64_t result = qword_268C5EB18;
  if (!qword_268C5EB18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C5EB18);
  }
  return result;
}

uint64_t sub_23FA049E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23FA04AB8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23FA0508C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23FA0508C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_23FA04AB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23FA07B10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23FA04C74(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_23FA07B30();
  if (!v8)
  {
    sub_23FA07B40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23FA07B60();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23FA04C74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23FA04D0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23FA04EEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23FA04EEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23FA04D0C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_23FA04E84(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23FA07B20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23FA07B40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23FA07AD0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23FA07B60();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23FA07B40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23FA04E84(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C5EB20);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23FA04EEC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C5EB20);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_23FA07B60();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23FA0508C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

VideoSubscriberAccountUI::VSDestination_optional __swiftcall VSDestination.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_23FA07B70();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static VSDestination.allCases.getter()
{
  return &unk_26F361DB0;
}

uint64_t VSDestination.rawValue.getter()
{
  unint64_t v1 = 0x74754F6E676973;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E496E676973;
  }
}

uint64_t sub_23FA051B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23FA051BC(*a1, *a2);
}

uint64_t sub_23FA051BC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x74754F6E676973;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE700000000000000;
    }
    else {
      unint64_t v4 = 0x800000023FA14D00;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x74754F6E676973;
      }
      else {
        unint64_t v6 = 0xD000000000000010;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE700000000000000;
      }
      else {
        unint64_t v7 = 0x800000023FA14D00;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    unint64_t v3 = 0x6E496E676973;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x6E496E676973)
  {
LABEL_21:
    char v8 = sub_23FA07B80();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23FA052D0()
{
  return sub_23FA07BA0();
}

uint64_t sub_23FA05374()
{
  sub_23FA07AA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FA05404()
{
  return sub_23FA07BA0();
}

VideoSubscriberAccountUI::VSDestination_optional sub_23FA054A4(Swift::String *a1)
{
  return VSDestination.init(rawValue:)(*a1);
}

void sub_23FA054B0(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE700000000000000;
  unint64_t v5 = 0x74754F6E676973;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000010;
    unint64_t v4 = 0x800000023FA14D00;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E496E676973;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_23FA05510(void *a1@<X8>)
{
  *a1 = &unk_26F361DD8;
}

void VSDestination.init(_:)(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_23FA07A90();
  uint64_t v6 = v5;
  if (v4 == sub_23FA07A90() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  char v9 = sub_23FA07B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_10:

    char v14 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = sub_23FA07A90();
  uint64_t v12 = v11;
  if (v10 == sub_23FA07A90() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
LABEL_13:

    char v14 = 1;
    goto LABEL_11;
  }
  char v15 = sub_23FA07B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_13;
  }
  uint64_t v16 = sub_23FA07A90();
  uint64_t v18 = v17;
  if (v16 == sub_23FA07A90() && v18 == v19)
  {
    id v20 = a1;

    char v14 = 2;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v21 = sub_23FA07B80();
    id v22 = a1;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21) {
      char v14 = 2;
    }
    else {
      char v14 = 3;
    }
  }
LABEL_11:
  *a2 = v14;
}

__CFString *VSDestination.objcValue.getter()
{
  return off_2650782B8[*v0];
}

unint64_t sub_23FA056FC()
{
  unint64_t result = qword_26AC14710;
  if (!qword_26AC14710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC14710);
  }
  return result;
}

unint64_t sub_23FA05754()
{
  unint64_t result = qword_268C5EB28;
  if (!qword_268C5EB28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268C5EB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5EB28);
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VSDestination(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VSDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23FA05964);
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

uint64_t sub_23FA0598C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23FA05998(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VSDestination()
{
  return &type metadata for VSDestination;
}

void VSScriptMessageForValueFromContextWithOrigin_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Unable to parse target origin: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_23FA07A20()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23FA07A30()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23FA07A40()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23FA07A50()
{
  return MEMORY[0x270F064D8]();
}

uint64_t sub_23FA07A60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23FA07A70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23FA07A80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23FA07A90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23FA07AA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23FA07AB0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23FA07AC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23FA07AD0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23FA07AE0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23FA07AF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23FA07B00()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23FA07B10()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23FA07B20()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23FA07B30()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23FA07B40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23FA07B50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23FA07B60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23FA07B70()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23FA07B80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23FA07B90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23FA07BA0()
{
  return MEMORY[0x270F9FC90]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t CFURLRequestSetHTTPCookieStorage()
{
  return MEMORY[0x270EE2988]();
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

size_t JSObjectGetArrayBufferByteLength(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x270EF5350](ctx, object, exception);
}

void *__cdecl JSObjectGetArrayBufferBytesPtr(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return (void *)MEMORY[0x270EF5358](ctx, object, exception);
}

JSTypedArrayType JSValueGetTypedArrayType(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return MEMORY[0x270EF5420](ctx, value, exception);
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5440](ctx, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x270F05FF0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t VSCheckEntitlementForTask()
{
  return MEMORY[0x270F064E0]();
}

uint64_t VSDefaultLogObject()
{
  return MEMORY[0x270F064E8]();
}

uint64_t VSDisplayNameForBundleWithIdentifier()
{
  return MEMORY[0x270F064F0]();
}

uint64_t VSEnqueueCompletionOperation()
{
  return MEMORY[0x270F064F8]();
}

uint64_t VSErrorIsPrivateError()
{
  return MEMORY[0x270F06500]();
}

uint64_t VSErrorIsPublicError()
{
  return MEMORY[0x270F06508]();
}

uint64_t VSErrorLogObject()
{
  return MEMORY[0x270F06510]();
}

uint64_t VSInvalidVerificationTokenError()
{
  return MEMORY[0x270F06518]();
}

uint64_t VSMainConcurrencyBindingOptions()
{
  return MEMORY[0x270F06520]();
}

uint64_t VSMainThreadOperationWithBlock()
{
  return MEMORY[0x270F06528]();
}

uint64_t VSOpenURL()
{
  return MEMORY[0x270F06530]();
}

uint64_t VSPerformBlockOnMainThread()
{
  return MEMORY[0x270F06538]();
}

uint64_t VSPerformCompletionHandler()
{
  return MEMORY[0x270F06540]();
}

uint64_t VSPrivacyServiceInterface()
{
  return MEMORY[0x270F06548]();
}

uint64_t VSPrivateAccountDeletionErrorWithRecoveryHandler()
{
  return MEMORY[0x270F06550]();
}

uint64_t VSPrivateAccountValidationErrorWithRecoveryHandler()
{
  return MEMORY[0x270F06558]();
}

uint64_t VSPrivateError()
{
  return MEMORY[0x270F06560]();
}

uint64_t VSPrivateViewServiceCrashedErrorWithRecoveryHandler()
{
  return MEMORY[0x270F06568]();
}

uint64_t VSPublicError()
{
  return MEMORY[0x270F06570]();
}

uint64_t VSPublicErrorWithDetailedErrors()
{
  return MEMORY[0x270F06578]();
}

uint64_t VSPublicProviderRejectedError()
{
  return MEMORY[0x270F06580]();
}

uint64_t VSPublicServiceTemporarilyUnavailableError()
{
  return MEMORY[0x270F06588]();
}

uint64_t VSPublicUnsupportedProviderError()
{
  return MEMORY[0x270F06590]();
}

uint64_t VSRequireKeyedCoder()
{
  return MEMORY[0x270F06598]();
}

uint64_t VSRequireMainThread()
{
  return MEMORY[0x270F065A0]();
}

uint64_t VSSharedSAMLParserController()
{
  return MEMORY[0x270F065A8]();
}

uint64_t VSValueTypeCopyWithZone()
{
  return MEMORY[0x270F065C0]();
}

uint64_t VSValueTypeDescription()
{
  return MEMORY[0x270F065C8]();
}

uint64_t VSValueTypeEncodeWithCoder()
{
  return MEMORY[0x270F065D0]();
}

uint64_t VSValueTypeHash()
{
  return MEMORY[0x270F065D8]();
}

uint64_t VSValueTypeInit()
{
  return MEMORY[0x270F065E0]();
}

uint64_t VSValueTypeInitWithCoder()
{
  return MEMORY[0x270F065E8]();
}

uint64_t VSValueTypeIsEqual()
{
  return MEMORY[0x270F065F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

void objc_moveWeak(id *to, id *from)
{
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}