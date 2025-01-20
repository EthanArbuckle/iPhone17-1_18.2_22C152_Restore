void sub_23D2F00B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D2F2820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23D2F575C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D2F6EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t lockStateChanged(uint64_t a1, void *a2)
{
  return [a2 updateFooterViewsIfNecessary];
}

void sub_23D2FC6C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D2FC844(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void HardwareKeyboardAvailabilityChanged(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __HardwareKeyboardAvailabilityChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __HardwareKeyboardAvailabilityChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hardwareKeyboardAvailabilityChangedAnimated:1];
}

uint64_t homeScreenPrefChanged(uint64_t a1, void *a2)
{
  v3 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D2E6000, v3, OS_LOG_TYPE_DEFAULT, "toggling zkw pref", v5, 2u);
  }

  return [a2 _refreshRequested];
}

void lockStateChanged_0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x263F67C78];
  v4 = [v2 view];
  int v5 = [v3 deviceIsAuthenticatedForView:v4];

  if (![v2 lastQueryWasAuthenticated] || (v5 & 1) != 0)
  {
    if (([v2 lastQueryWasAuthenticated] & 1) == 0 && ((v5 ^ 1) & 1) == 0)
    {
      v8 = [v2 navigationController];
      int v9 = [v8 _appearState];

      if (v9)
      {
        v10 = [v2 navigationController];
        id v11 = [v10 topViewController];

        if (v11 == v2)
        {
          v12 = [v2 searchHeader];
          [v12 triggerSearchForUnlock];
        }
      }
    }
  }
  else
  {
    v6 = (NSObject **)MEMORY[0x263F79148];
    v7 = *MEMORY[0x263F79148];
    if (!*MEMORY[0x263F79148])
    {
      SPUIInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23D2E6000, v7, OS_LOG_TYPE_DEFAULT, "clearing since last query was authenticated but looks to be no longer authenticated", v13, 2u);
    }
    [v2 clearSearchResultsAndFetchZKW:1];
  }
}

void sub_23D306748(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t PS_PSKillProcessNamed()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  v0 = (uint64_t (*)(__CFString *))getPSKillProcessNamedSymbolLoc_ptr;
  v6 = getPSKillProcessNamedSymbolLoc_ptr;
  if (!getPSKillProcessNamedSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getPSKillProcessNamedSymbolLoc_block_invoke;
    v2[3] = &unk_264E90F18;
    v2[4] = &v3;
    __getPSKillProcessNamedSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(__CFString *))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    PS_PSKillProcessNamed_cold_1();
  }
  return v0(@"parsecd");
}

void sub_23D30A48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D30B260(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23D30B38C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23D30B8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D30BEF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_23D30C154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_23D30C3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D30C634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_23D30D1CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void *__getPSKillProcessNamedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!PreferencesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __PreferencesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264E90F38;
    uint64_t v7 = 0;
    PreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
    if (PreferencesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "PSKillProcessNamed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPSKillProcessNamedSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t sub_23D30E774()
{
  return sub_23D310CB8();
}

uint64_t sub_23D30E798(uint64_t a1)
{
  sub_23D310C88();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23D310CC8();
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

id sub_23D30E8A4()
{
  type metadata accessor for SPUIFTEView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26AC2F818 = (uint64_t)result;
  return result;
}

uint64_t sub_23D30E8F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F6B8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F670);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F678);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_23D310D28();
  *((void *)v5 + 1) = 0;
  uint8_t v5[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F638);
  sub_23D30EB98(v1, (uint64_t *)&v5[*(int *)(v13 + 44)]);
  uint64_t v14 = sub_23D310D48();
  uint64_t KeyPath = swift_getKeyPath();
  sub_23D31070C((uint64_t)v5, (uint64_t)v8, &qword_26AC2F6B8);
  v16 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  uint64_t *v16 = KeyPath;
  v16[1] = v14;
  sub_23D310780((uint64_t)v5, &qword_26AC2F6B8);
  sub_23D30F9B4();
  sub_23D310D68();
  sub_23D310780((uint64_t)v8, &qword_26AC2F670);
  v17 = self;
  objc_msgSend(v17, sel_standardTableCellContentInset);
  uint64_t v19 = v18;
  objc_msgSend(v17, sel_standardTableCellContentInset);
  uint64_t v21 = v20;
  LOBYTE(v17) = sub_23D310D38();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(a1, v12, v9);
  uint64_t v22 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F660) + 36);
  *(unsigned char *)uint64_t v22 = (_BYTE)v17;
  *(void *)(v22 + 8) = 0x402E000000000000;
  *(void *)(v22 + 16) = v19;
  *(void *)(v22 + 24) = 0;
  *(void *)(v22 + 32) = v21;
  *(unsigned char *)(v22 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_23D30EB98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v76 = a1;
  v74 = a2;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F630);
  uint64_t v65 = *(void *)(v66 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v64 = (char *)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F688);
  uint64_t v79 = *(void *)(v3 - 8);
  uint64_t v80 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v63 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F690);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v83 = (uint64_t)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v84 = (uint64_t)&v62 - v7;
  uint64_t v8 = type metadata accessor for FTEView();
  uint64_t v68 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v68 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v75 = (uint64_t)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F6A0);
  uint64_t v10 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F680);
  uint64_t v81 = *(void *)(v78 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v78);
  v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v17 = (char *)&v62 - v16;
  sub_23D310D18();
  if (qword_26AC2F6E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v18 = (id)qword_26AC2F818;
  LOWORD(v61) = 256;
  uint64_t v60 = 0;
  uint64_t v19 = sub_23D310D58();
  uint64_t v72 = v20;
  uint64_t v73 = v19;
  int v70 = v21;
  uint64_t v82 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v23 = v75;
  sub_23D30FB0C(v76, v75);
  uint64_t v24 = *(unsigned __int8 *)(v68 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  uint64_t v68 = v24 | 7;
  uint64_t v26 = swift_allocObject();
  sub_23D3105D0(v23, v26 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F648);
  sub_23D310698();
  sub_23D310DC8();
  sub_23D310988(&qword_26AC2F698, &qword_26AC2F6A0);
  uint64_t v27 = v69;
  sub_23D310D78();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
  uint64_t v28 = v81;
  uint64_t v29 = v78;
  (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v17, v15, v78);
  unsigned int v30 = objc_msgSend(self, sel_shouldDisplayTapToRadar);
  uint64_t v31 = 1;
  v32 = v15;
  v33 = v17;
  v77 = v17;
  if (v30)
  {
    uint64_t v34 = sub_23D310D18();
    uint64_t v36 = v35;
    v37 = v15;
    char v39 = v38;
    uint64_t v41 = v40;
    uint64_t v42 = v75;
    sub_23D30FB0C(v76, v75);
    uint64_t v43 = swift_allocObject();
    uint64_t v44 = sub_23D3105D0(v42, v43 + v25);
    MEMORY[0x270FA5388](v44);
    *(&v62 - 6) = v34;
    *(&v62 - 5) = v36;
    *((unsigned char *)&v62 - 32) = v39 & 1;
    *(&v62 - 3) = v41;
    uint64_t v60 = 0x6C6C69662E746E61;
    unint64_t v61 = 0xE800000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F628);
    sub_23D310988(&qword_26AC2F620, &qword_26AC2F628);
    v45 = v64;
    v32 = v37;
    sub_23D310DC8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23D310988(&qword_26AC2F6A8, &qword_26AC2F630);
    v46 = v63;
    uint64_t v47 = v66;
    sub_23D310D78();
    v33 = v77;
    uint64_t v29 = v78;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v45, v47);
    (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v84, v46, v80);
    uint64_t v31 = 0;
  }
  uint64_t v48 = v84;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v84, v31, 1, v80);
  char v49 = v70 & 1;
  char v85 = v70 & 1;
  v50 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v50(v32, v33, v29);
  uint64_t v51 = v29;
  v67 = v32;
  sub_23D31070C(v48, v83, &qword_26AC2F690);
  uint64_t v53 = v73;
  v52 = v74;
  uint64_t v55 = KeyPath;
  uint64_t v54 = v72;
  uint64_t *v74 = v73;
  v52[1] = v54;
  *((unsigned char *)v52 + 16) = v49;
  v52[3] = v82;
  v52[4] = v55;
  *((unsigned char *)v52 + 40) = 1;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F650);
  v50((char *)v52 + *(int *)(v56 + 48), v32, v51);
  uint64_t v57 = v83;
  sub_23D31070C(v83, (uint64_t)v52 + *(int *)(v56 + 64), &qword_26AC2F690);
  sub_23D310770(v53, v54, v49);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23D310770(v53, v54, v49);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23D310780(v84, &qword_26AC2F690);
  v58 = *(void (**)(char *, uint64_t))(v81 + 8);
  v58(v77, v51);
  sub_23D3107DC(v53, v54, v49);
  swift_release();
  swift_bridgeObjectRelease();
  sub_23D310780(v57, &qword_26AC2F690);
  v58(v67, v51);
  sub_23D3107DC(v53, v54, v85);
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_23D30F484@<D0>(uint64_t a1@<X8>)
{
  sub_23D310D18();
  if (qword_26AC2F6E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v2 = (id)qword_26AC2F818;
  uint64_t v3 = sub_23D310D58();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  char v10 = sub_23D310D38();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  double result = 20.0;
  *(_OWORD *)(a1 + 56) = xmmword_23D3147C0;
  *(unsigned char *)(a1 + 72) = 0;
  return result;
}

uint64_t sub_23D30F5B0()
{
  return sub_23D310DA8();
}

id sub_23D30F5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for FTEView();
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (id *)((char *)&v23.receiver - v15);
  void *v16 = a1;
  v16[1] = a2;
  v16[2] = a3;
  v16[3] = a4;
  v17 = (uint64_t *)((char *)&v23 + *(int *)(v14 + 32) - v15);
  uint64_t *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
  swift_storeEnumTagMultiPayload();
  sub_23D30FB0C((uint64_t)v16, (uint64_t)v13);
  id v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F608));
  swift_retain();
  swift_retain();
  uint64_t v19 = (void *)sub_23D310CA8();
  v23.receiver = v5;
  v23.super_class = (Class)SPUIFTEView;
  id v20 = objc_msgSendSuper2(&v23, sel_initWithHostedView_, v19);
  id v21 = objc_msgSend(v20, sel_layer);
  objc_msgSend(v21, sel_setAllowsGroupOpacity_, 0);

  swift_release();
  swift_release();

  sub_23D30FB70((uint64_t)v16);
  return v20;
}

void __swiftcall SPUIFTEView.init(hostedView:)(SPUIFTEView *__return_ptr retstr, UIView_optional *hostedView)
{
}

void SPUIFTEView.init(hostedView:)()
{
}

uint64_t sub_23D30F8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return MEMORY[0x270F04760](a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23D30F95C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D310CF8();
  *a1 = result;
  return result;
}

uint64_t sub_23D30F988()
{
  return sub_23D310D08();
}

unint64_t sub_23D30F9B4()
{
  unint64_t result = qword_26AC2F668;
  if (!qword_26AC2F668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC2F670);
    sub_23D310988(&qword_26AC2F6B0, &qword_26AC2F6B8);
    sub_23D310988(&qword_26AC2F610, &qword_26AC2F618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC2F668);
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

uint64_t type metadata accessor for FTEView()
{
  uint64_t result = qword_26AC2F770;
  if (!qword_26AC2F770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23D30FB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D30FB70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23D30FBCC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for FTEConstants()
{
  return &type metadata for FTEConstants;
}

uint64_t sub_23D30FBF8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)a1 = v5;
    uint64_t v6 = a2[3];
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_23D310C88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23D30FD30(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_23D310C88();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_23D30FDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_23D310C88();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_23D30FED4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    sub_23D310780((uint64_t)a1 + v8, &qword_26AC2F5F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_23D310C88();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_23D30FFE0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_23D310C88();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_23D3100B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_23D310780((uint64_t)a1 + v6, &qword_26AC2F5F8);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_23D310C88();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23D3101C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23D3101D4);
}

uint64_t sub_23D3101D4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C07D58);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_23D310288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23D31029C);
}

void *sub_23D31029C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C07D58);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_23D310348()
{
  sub_23D3103E4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_23D3103E4()
{
  if (!qword_26AC2F600)
  {
    sub_23D310C88();
    unint64_t v0 = sub_23D310C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC2F600);
    }
  }
}

unint64_t type metadata accessor for SPUIFTEView()
{
  unint64_t result = qword_26AC2F780;
  if (!qword_26AC2F780)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC2F780);
  }
  return result;
}

unint64_t sub_23D310480()
{
  unint64_t result = qword_26AC2F658;
  if (!qword_26AC2F658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC2F660);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC2F670);
    sub_23D30F9B4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC2F658);
  }
  return result;
}

uint64_t sub_23D310530()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23D310568()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_23D310578@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23D310CD8();
  *a1 = result;
  return result;
}

uint64_t sub_23D3105A4()
{
  return sub_23D310CE8();
}

uint64_t sub_23D3105D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D310634()
{
  uint64_t v1 = *(void *)(type metadata accessor for FTEView() - 8);
  return (*(uint64_t (**)(void))(v0
                              + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))))();
}

unint64_t sub_23D310698()
{
  unint64_t result = qword_26AC2F640;
  if (!qword_26AC2F640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC2F648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC2F640);
  }
  return result;
}

uint64_t sub_23D31070C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23D310770(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_23D310780(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23D3107DC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for FTEView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC2F5F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_23D310C88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_23D310910()
{
  uint64_t v1 = *(void *)(type metadata accessor for FTEView() - 8);
  return (*(uint64_t (**)(void))(v0
                              + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                              + 16))();
}

uint64_t sub_23D310974()
{
  return sub_23D30F8C8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_23D310988(unint64_t *a1, uint64_t *a2)
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

void PS_PSKillProcessNamed_cold_1()
{
}

uint64_t sub_23D310C88()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_23D310C98()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23D310CA8()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_23D310CB8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_23D310CC8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_23D310CD8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_23D310CE8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_23D310CF8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23D310D08()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23D310D18()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_23D310D28()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_23D310D38()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_23D310D48()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_23D310D58()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23D310D68()
{
  return MEMORY[0x270F5CF30]();
}

uint64_t sub_23D310D78()
{
  return MEMORY[0x270F5CF38]();
}

uint64_t sub_23D310D88()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23D310D98()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23D310DA8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23D310DC8()
{
  return MEMORY[0x270F048B0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x270F30618]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SPBlueButtonBehavior()
{
  return MEMORY[0x270F5CDD0]();
}

uint64_t SPCommittedScreenMatchingBehavior()
{
  return MEMORY[0x270F5CDE0]();
}

uint64_t SPLogForSPLogCategoryDefault()
{
  return MEMORY[0x270F5CE58]();
}

uint64_t SPLogForSPLogCategoryTelemetry()
{
  return MEMORY[0x270F5CE70]();
}

uint64_t SPSetInternetDomainsEnabled()
{
  return MEMORY[0x270F5CEB8]();
}

uint64_t SPSuggestionDetailTextBehavior()
{
  return MEMORY[0x270F5CEC0]();
}

uint64_t SPUIInitLogging()
{
  return MEMORY[0x270F77080]();
}

uint64_t SSExtensionIdentifiersForSections()
{
  return MEMORY[0x270F76F10]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F82C50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sp_analytics_log_timing()
{
  return MEMORY[0x270F76D40]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}