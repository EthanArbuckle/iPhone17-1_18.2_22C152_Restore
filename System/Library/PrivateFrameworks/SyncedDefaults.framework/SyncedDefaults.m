void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21858A2C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21858A478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21858A684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_21858ACF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a48, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v48 - 240));
  _Unwind_Resume(a1);
}

id SYDGetConnectionLog()
{
  if (SYDGetConnectionLog_onceToken != -1) {
    dispatch_once(&SYDGetConnectionLog_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)SYDGetConnectionLog_log;
  return v0;
}

id SYDGetAccessorSignpostsLog()
{
  if (SYDGetAccessorSignpostsLog_onceToken != -1) {
    dispatch_once(&SYDGetAccessorSignpostsLog_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)SYDGetAccessorSignpostsLog_log;
  return v0;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = 1752392040;
  *(_WORD *)(a3 + 12) = 2113;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

__CFString *SYDStringForStoreType(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_2643292E0[a1];
  }
}

uint64_t SYDObjectsAreBothNilOrEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqual:v4];
    }
  }

  return v6;
}

void sub_21858BA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 64));
  _Unwind_Resume(a1);
}

void sub_21858C070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id SYDErrorUserInfoClasses()
{
  if (SYDErrorUserInfoClasses_onceToken != -1) {
    dispatch_once(&SYDErrorUserInfoClasses_onceToken, &__block_literal_global_175);
  }
  v0 = (void *)SYDErrorUserInfoClasses_sAcceptableClasses;
  return v0;
}

void sub_21858CAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v11 - 80));
  _Unwind_Resume(a1);
}

void sub_21858CE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21858D1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 128));
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

void sub_21858D738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, id location)
{
}

id SYDGetSyncSignpostsLog()
{
  if (SYDGetSyncSignpostsLog_onceToken != -1) {
    dispatch_once(&SYDGetSyncSignpostsLog_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)SYDGetSyncSignpostsLog_log;
  return v0;
}

void sub_21858D8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_21858DC48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SYDIsDataSeparatedPersona()
{
  v0 = [MEMORY[0x263F841B8] currentPersona];
  uint64_t v1 = [v0 isDataSeparatedPersona];

  return v1;
}

void sub_21858EBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __SYDGetConnectionLog_block_invoke()
{
  SYDGetConnectionLog_log = (uint64_t)os_log_create("com.apple.kvs", "Connection");
  return MEMORY[0x270F9A758]();
}

uint64_t __SYDGetAccessorSignpostsLog_block_invoke()
{
  SYDGetAccessorSignpostsLog_log = (uint64_t)os_log_create("com.apple.kvs", "AccessorSignposts");
  return MEMORY[0x270F9A758]();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t __SYDErrorUserInfoClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  SYDErrorUserInfoClasses_sAcceptableClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

uint64_t __SYDGetSyncSignpostsLog_block_invoke()
{
  SYDGetSyncSignpostsLog_log = (uint64_t)os_log_create("com.apple.kvs", "SyncSignposts");
  return MEMORY[0x270F9A758]();
}

id SYDGetMiscLog()
{
  if (SYDGetMiscLog_onceToken != -1) {
    dispatch_once(&SYDGetMiscLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)SYDGetMiscLog_log;
  return v0;
}

uint64_t __SYDGetMiscLog_block_invoke()
{
  SYDGetMiscLog_log = (uint64_t)os_log_create("com.apple.kvs", "Misc");
  return MEMORY[0x270F9A758]();
}

id SYDGetCloudKitLog()
{
  if (SYDGetCloudKitLog_onceToken != -1) {
    dispatch_once(&SYDGetCloudKitLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SYDGetCloudKitLog_log;
  return v0;
}

uint64_t __SYDGetCloudKitLog_block_invoke()
{
  SYDGetCloudKitLog_log = (uint64_t)os_log_create("com.apple.kvs", "CloudKit");
  return MEMORY[0x270F9A758]();
}

id SYDGetCoreDataLog()
{
  if (SYDGetCoreDataLog_onceToken != -1) {
    dispatch_once(&SYDGetCoreDataLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)SYDGetCoreDataLog_log;
  return v0;
}

uint64_t __SYDGetCoreDataLog_block_invoke()
{
  SYDGetCoreDataLog_log = (uint64_t)os_log_create("com.apple.kvs", "CoreData");
  return MEMORY[0x270F9A758]();
}

id SYDGetAnalyticsLog()
{
  if (SYDGetAnalyticsLog_onceToken != -1) {
    dispatch_once(&SYDGetAnalyticsLog_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)SYDGetAnalyticsLog_log;
  return v0;
}

uint64_t __SYDGetAnalyticsLog_block_invoke()
{
  SYDGetAnalyticsLog_log = (uint64_t)os_log_create("com.apple.kvs", "Analytics");
  return MEMORY[0x270F9A758]();
}

id SYDGetAccountsLog()
{
  if (SYDGetAccountsLog_onceToken != -1) {
    dispatch_once(&SYDGetAccountsLog_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)SYDGetAccountsLog_log;
  return v0;
}

uint64_t __SYDGetAccountsLog_block_invoke()
{
  SYDGetAccountsLog_log = (uint64_t)os_log_create("com.apple.kvs", "Accounts");
  return MEMORY[0x270F9A758]();
}

id SYDGetMigrationLog()
{
  if (SYDGetMigrationLog_onceToken != -1) {
    dispatch_once(&SYDGetMigrationLog_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)SYDGetMigrationLog_log;
  return v0;
}

uint64_t __SYDGetMigrationLog_block_invoke()
{
  SYDGetMigrationLog_log = (uint64_t)os_log_create("com.apple.kvs", "Migration");
  return MEMORY[0x270F9A758]();
}

id SYDGetTCCLog()
{
  if (SYDGetTCCLog_onceToken != -1) {
    dispatch_once(&SYDGetTCCLog_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)SYDGetTCCLog_log;
  return v0;
}

uint64_t __SYDGetTCCLog_block_invoke()
{
  SYDGetTCCLog_log = (uint64_t)os_log_create("com.apple.kvs", "TCC");
  return MEMORY[0x270F9A758]();
}

void sub_2185910E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v8 - 80));
  _Unwind_Resume(a1);
}

void sub_218591CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_2185925AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_218592DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,id location)
{
}

void sub_218593378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 64));
  _Unwind_Resume(a1);
}

void sub_218593518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_218593878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_218593A24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218593A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185942B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_2185944D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  os_activity_scope_leave((os_activity_scope_state_t)(v16 - 80));
  _Unwind_Resume(a1);
}

void sub_21859474C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id SYDClientToDaemonConnection.object<A>(forKey:)@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  v34[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_218597BF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = (void *)sub_218597BC8();
  id v33 = 0;
  v34[0] = 0;
  unsigned int v10 = objc_msgSend(v2, sel_getObject_forKey_error_, v34, v9, &v33);

  id v12 = v33;
  uint64_t v11 = v34[0];
  if (v10)
  {
    if (!v34[0])
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
      return v12;
    }
    v32 = a2;
    swift_unknownObjectRetain_n();
    id v13 = v12;
    int v14 = swift_dynamicCast();
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 - 8);
      v15(v8, 0, 1, a1);
      swift_unknownObjectRelease();
      v17 = v32;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v32, v8, a1);
      v15(v17, 0, 1, a1);
      return (id)swift_unknownObjectRelease();
    }
    v15(v8, 1, 1, a1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_218595A30();
    v20 = (void *)swift_allocError();
    v22 = v21;
    v21[3] = swift_getObjectType();
    void *v22 = v11;
  }
  else
  {
    id v19 = v33;
    swift_unknownObjectRetain();
    v20 = (void *)sub_218597B88();
  }
  swift_willThrow();
  swift_unknownObjectRelease();
  if (qword_267BD5730 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_218597BB8();
  __swift_project_value_buffer(v23, (uint64_t)static Logger.client);
  id v24 = v20;
  id v25 = v20;
  v26 = sub_218597B98();
  os_log_type_t v27 = sub_218597BE8();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    *(_DWORD *)v28 = 138412290;
    id v30 = v20;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    v34[0] = v31;
    sub_218597C08();
    *uint64_t v29 = v31;

    _os_log_impl(&dword_218588000, v26, v27, "Error getting object for key: %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD5740);
    swift_arrayDestroy();
    MEMORY[0x21D46D2F0](v29, -1, -1);
    MEMORY[0x21D46D2F0](v28, -1, -1);
  }
  else
  {
  }
  return (id)swift_willThrow();
}

id SYDClientToDaemonConnection.set(_:forKey:)(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sub_218595A84(a1, (uint64_t)v13);
  uint64_t v2 = v14;
  if (v14)
  {
    uint64_t v3 = __swift_project_boxed_opaque_existential_0(v13, v14);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x270FA5388](v3, v3);
    uint64_t v6 = (char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    uint64_t v7 = sub_218597C18();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)sub_218597BC8();
  v13[0] = 0;
  unsigned int v9 = objc_msgSend(v1, sel_setObject_forKey_error_, v7, v8, v13);
  swift_unknownObjectRelease();

  id result = v13[0];
  if (!v9)
  {
    uint64_t v11 = result;
    sub_218597B88();

    return (id)swift_willThrow();
  }
  return result;
}

uint64_t SYDClientToDaemonConnection.sync()()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_218595418, 0, 0);
}

uint64_t sub_218595418()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = sub_21859550C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21859591C;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_synchronizationWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21859550C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_218595634;
  }
  else {
    uint64_t v2 = sub_21859561C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21859561C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218595634()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();
  *(void *)(v0 + 80) = v1;
  uint64_t v2 = (id *)(v0 + 80);
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BD5760);
  sub_218595B80();
  if (!swift_dynamicCast())
  {

    swift_willThrow();
    goto LABEL_22;
  }

  uint64_t v4 = *(void **)(v0 + 120);
  id v5 = objc_msgSend(v4, sel_domain);
  uint64_t v6 = sub_218597BD8();
  uint64_t v8 = v7;

  if (v6 == 0x65446465636E7953 && v8 == 0xEE0073746C756166)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_218597C28();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      swift_willThrow();

      goto LABEL_22;
    }
  }
  uint64_t v11 = (uint64_t)objc_msgSend(v4, sel_code);
  if (v11 > 7776)
  {
    switch(v11)
    {
      case 7777:
        sub_218595BC0();
        swift_allocError();
        char v13 = 1;
        goto LABEL_20;
      case 121212:
        sub_218595BC0();
        swift_allocError();
        char v13 = 4;
        goto LABEL_20;
      case 8888:
        sub_218595BC0();
        swift_allocError();
        char v13 = 2;
        goto LABEL_20;
    }
  }
  else if (v11 == 6666)
  {
    sub_218595BC0();
    swift_allocError();
    char v13 = 3;
LABEL_20:
    *id v12 = v13;
    goto LABEL_21;
  }
  sub_218595BC0();
  swift_allocError();
  unsigned char *v14 = 0;
LABEL_21:
  swift_willThrow();

LABEL_22:
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_21859591C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD5760);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
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

unint64_t sub_218595A30()
{
  unint64_t result = qword_267BD5748;
  if (!qword_267BD5748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD5748);
  }
  return result;
}

uint64_t sub_218595A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BD5750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_218595B80()
{
  unint64_t result = qword_267BD5768;
  if (!qword_267BD5768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BD5768);
  }
  return result;
}

unint64_t sub_218595BC0()
{
  unint64_t result = qword_267BD5770;
  if (!qword_267BD5770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD5770);
  }
  return result;
}

BOOL static SyncError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t SyncError.hash(into:)()
{
  return sub_218597C88();
}

uint64_t SyncError.hashValue.getter()
{
  return sub_218597C98();
}

BOOL sub_218595CA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_218595CB8()
{
  return sub_218597C98();
}

uint64_t sub_218595D00()
{
  return sub_218597C88();
}

uint64_t sub_218595D2C()
{
  return sub_218597C98();
}

unint64_t sub_218595D74()
{
  unint64_t result = qword_267BD5778;
  if (!qword_267BD5778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD5778);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GetObjectError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for GetObjectError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for GetObjectError(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for GetObjectError(_OWORD *a1, _OWORD *a2)
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for GetObjectError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GetObjectError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_21859616C()
{
  return 0;
}

ValueMetadata *type metadata accessor for GetObjectError()
{
  return &type metadata for GetObjectError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SyncError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x2185962F4);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_21859631C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_218596324(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncError()
{
  return &type metadata for SyncError;
}

uint64_t Logger.client.unsafeMutableAddressor()
{
  return sub_218596578(&qword_267BD5730, (uint64_t)static Logger.client);
}

void sub_218596360()
{
  *(_WORD *)&algn_267BD5A58[6] = -4864;
}

uint64_t *Logger.loggingSubsystem.unsafeMutableAddressor()
{
  if (qword_267BD5728 != -1) {
    swift_once();
  }
  return &static Logger.loggingSubsystem;
}

uint64_t static Logger.loggingSubsystem.getter()
{
  if (qword_267BD5728 != -1) {
    swift_once();
  }
  uint64_t v0 = static Logger.loggingSubsystem;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_218596444(uint64_t a1)
{
  return sub_21859649C(a1, static Logger.client);
}

uint64_t static Logger.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2185965F0(&qword_267BD5730, (uint64_t)static Logger.client, a1);
}

uint64_t sub_218596484(uint64_t a1)
{
  return sub_21859649C(a1, static Logger.test);
}

uint64_t sub_21859649C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_218597BB8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_267BD5728 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_218597BA8();
}

uint64_t Logger.test.unsafeMutableAddressor()
{
  return sub_218596578(&qword_267BD5738, (uint64_t)static Logger.test);
}

uint64_t sub_218596578(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_218597BB8();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.test.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2185965F0(&qword_267BD5738, (uint64_t)static Logger.test, a1);
}

uint64_t sub_2185965F0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_218597BB8();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
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

uint64_t sub_218597B88()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_218597B98()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_218597BA8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_218597BB8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_218597BC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_218597BD8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_218597BE8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_218597BF8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_218597C08()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_218597C18()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_218597C28()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_218597C38()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_218597C48()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_218597C58()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_218597C68()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_218597C78()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_218597C88()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_218597C98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}