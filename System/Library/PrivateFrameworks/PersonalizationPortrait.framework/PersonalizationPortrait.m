uint64_t kPPDateComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __Block_byref_object_dispose__4767(uint64_t a1)
{
}

id pp_social_highlights_signpost_handle()
{
  if (pp_social_highlights_signpost_handle__pasOnceToken28 != -1) {
    dispatch_once(&pp_social_highlights_signpost_handle__pasOnceToken28, &__block_literal_global_71);
  }
  v0 = (void *)pp_social_highlights_signpost_handle__pasExprOnceResult;
  return v0;
}

void __Block_byref_object_dispose__1846(uint64_t a1)
{
}

id pp_xpc_server_log_handle()
{
  if (pp_xpc_server_log_handle__pasOnceToken11 != -1) {
    dispatch_once(&pp_xpc_server_log_handle__pasOnceToken11, &__block_literal_global_29);
  }
  v0 = (void *)pp_xpc_server_log_handle__pasExprOnceResult;
  return v0;
}

uint64_t __Block_byref_object_copy__4766(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id pp_connections_signpost_handle()
{
  if (pp_connections_signpost_handle__pasOnceToken25 != -1) {
    dispatch_once(&pp_connections_signpost_handle__pasOnceToken25, &__block_literal_global_65);
  }
  v0 = (void *)pp_connections_signpost_handle__pasExprOnceResult;
  return v0;
}

id pp_connections_log_handle()
{
  if (pp_connections_log_handle__pasOnceToken8 != -1) {
    dispatch_once(&pp_connections_log_handle__pasOnceToken8, &__block_literal_global_20);
  }
  v0 = (void *)pp_connections_log_handle__pasExprOnceResult;
  return v0;
}

uint64_t __Block_byref_object_copy__1845(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x192F975A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_18CAA81C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18CAA8CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAA8F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAA97F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_18CAA9C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_sync_exit(v20);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v21 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_18CAAA054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id pp_xpc_client_log_handle()
{
  if (pp_xpc_client_log_handle__pasOnceToken12 != -1) {
    dispatch_once(&pp_xpc_client_log_handle__pasOnceToken12, &__block_literal_global_32);
  }
  v0 = (void *)pp_xpc_client_log_handle__pasExprOnceResult;
  return v0;
}

void sub_18CAAA804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAAAE50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pp_default_log_handle()
{
  if (pp_default_log_handle__pasOnceToken2 != -1) {
    dispatch_once(&pp_default_log_handle__pasOnceToken2, &__block_literal_global_7453);
  }
  v0 = (void *)pp_default_log_handle__pasExprOnceResult;
  return v0;
}

id pp_social_highlights_log_handle()
{
  if (pp_social_highlights_log_handle__pasOnceToken15 != -1) {
    dispatch_once(&pp_social_highlights_log_handle__pasOnceToken15, &__block_literal_global_41);
  }
  v0 = (void *)pp_social_highlights_log_handle__pasExprOnceResult;
  return v0;
}

void sub_18CAAC04C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pp_events_log_handle()
{
  if (pp_events_log_handle__pasOnceToken7 != -1) {
    dispatch_once(&pp_events_log_handle__pasOnceToken7, &__block_literal_global_17);
  }
  v0 = (void *)pp_events_log_handle__pasExprOnceResult;
  return v0;
}

id pp_entities_log_handle()
{
  if (pp_entities_log_handle__pasOnceToken4 != -1) {
    dispatch_once(&pp_entities_log_handle__pasOnceToken4, &__block_literal_global_8);
  }
  v0 = (void *)pp_entities_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_xpc_client_log_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "XPCClient");
  v2 = (void *)pp_xpc_client_log_handle__pasExprOnceResult;
  pp_xpc_client_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_events_signpost_handle()
{
  if (pp_events_signpost_handle__pasOnceToken24 != -1) {
    dispatch_once(&pp_events_signpost_handle__pasOnceToken24, &__block_literal_global_63);
  }
  v0 = (void *)pp_events_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_social_highlights_log_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "SocialHighlights");
  v2 = (void *)pp_social_highlights_log_handle__pasExprOnceResult;
  pp_social_highlights_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_default_log_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Default");
  v2 = (void *)pp_default_log_handle__pasExprOnceResult;
  pp_default_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id PPNewEKEventStore()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getEKEventStoreClass_softClass;
  uint64_t v8 = getEKEventStoreClass_softClass;
  if (!getEKEventStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getEKEventStoreClass_block_invoke;
    v4[3] = &unk_1E550F408;
    v4[4] = &v5;
    __getEKEventStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  os_log_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = (void *)[[v1 alloc] initWithEKOptions:128 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:0];
  return v2;
}

void sub_18CAAD200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __pp_events_log_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Events");
  v2 = (void *)pp_events_log_handle__pasExprOnceResult;
  pp_events_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void sub_18CAB46C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_18CAB494C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_18CAB4C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_18CAB50D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__401(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__402(uint64_t a1)
{
}

void sub_18CAB6E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__507(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__508(uint64_t a1)
{
}

void sub_18CAB7170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_18CAB74B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__569(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__570(uint64_t a1)
{
}

void PPEncodeCalendarColor(void *a1, CGColor *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (a2)
  {
    ColorSpace = CGColorGetColorSpace(a2);
    CFPropertyListRef v5 = CGColorSpaceCopyPropertyList(ColorSpace);
    CFErrorRef error = 0;
    CFDataRef v6 = CFPropertyListCreateData(0, v5, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFRelease(v5);
    if (!v6 || error)
    {
      if (error) {
        uint64_t v8 = (__CFString *)CFErrorCopyDescription(error);
      }
      else {
        uint64_t v8 = @"Unknown reason";
      }
      v9 = pp_events_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v8;
        _os_log_error_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_ERROR, "failed to create space plist data from plist: %@", buf, 0xCu);
      }

      if (error) {
        CFRelease(error);
      }
      if (v6) {
        CFRelease(v6);
      }
      [v3 encodeBool:0 forKey:@"sup_hcc"];
    }
    else
    {
      Components = CGColorGetComponents(a2);
      [v3 encodeDouble:@"sup_cc0" forKey:*Components];
      [v3 encodeDouble:@"sup_cc1" forKey:Components[1]];
      [v3 encodeDouble:@"sup_cc2" forKey:Components[2]];
      [v3 encodeDouble:@"sup_cc3" forKey:Components[3]];
      [v3 encodeBool:1 forKey:@"sup_hcc"];
      [v3 encodeObject:v6 forKey:@"sup_csd"];
      uint64_t v8 = (__CFString *)v6;
    }
  }
}

CGColorRef PPCreateCalendarColorWithDecoder(void *a1)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  os_log_t v1 = a1;
  if ([(__CFString *)v1 decodeBoolForKey:@"sup_hcc"])
  {
    [(__CFString *)v1 decodeDoubleForKey:@"sup_cc0"];
    components[0] = v2;
    [(__CFString *)v1 decodeDoubleForKey:@"sup_cc1"];
    components[1] = v3;
    [(__CFString *)v1 decodeDoubleForKey:@"sup_cc2"];
    components[2] = v4;
    [(__CFString *)v1 decodeDoubleForKey:@"sup_cc3"];
    components[3] = v5;
    CFDataRef v6 = [(__CFString *)v1 decodeObjectOfClass:objc_opt_class() forKey:@"sup_csd"];
    uint64_t v7 = v6;
    if (v6)
    {
      CFDataRef v8 = v6;
      CFErrorRef error = 0;
      CFPropertyListRef v9 = CFPropertyListCreateWithData(0, v8, 0, 0, &error);
      CFRelease(v8);
      if (!v9 || error)
      {
        if (error) {
          uint64_t v16 = (__CFString *)CFErrorCopyDescription(error);
        }
        else {
          uint64_t v16 = @"Unknown reason";
        }
        uint64_t v17 = pp_events_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v16;
          _os_log_error_impl(&dword_18CAA6000, v17, OS_LOG_TYPE_ERROR, "failed to create space plist from data: %@", buf, 0xCu);
        }

        if (error) {
          CFRelease(error);
        }
        if (v9) {
          CFRelease(v9);
        }

        goto LABEL_24;
      }
      uint64_t v10 = CGColorSpaceCreateWithPropertyList(v9);
      CFRelease(v9);
      if (v10)
      {
        CGColorRef v11 = CGColorCreate(v10, components);
        CGColorSpaceRelease(v10);
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v12 = pp_events_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "failed to create color space from property list";
        uint64_t v14 = v12;
        uint32_t v15 = 2;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v12 = pp_events_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v1;
        uint64_t v13 = "failed to get space data from decoder %@";
        uint64_t v14 = v12;
        uint32_t v15 = 12;
LABEL_22:
        _os_log_error_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }

LABEL_24:
    CGColorRef v11 = 0;
    goto LABEL_25;
  }
  CGColorRef v11 = 0;
LABEL_26:

  return v11;
}

void sub_18CAB8D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAB9368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CABCFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CABD164(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18CABD4C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18CABDD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1192(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1193(uint64_t a1)
{
}

void sub_18CABE060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CABEB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CABF14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getEKObjectIDClass()
{
  uint64_t v4 = 0;
  CGFloat v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getEKObjectIDClass_softClass;
  uint64_t v7 = getEKObjectIDClass_softClass;
  if (!getEKObjectIDClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getEKObjectIDClass_block_invoke;
    v3[3] = &unk_1E550F408;
    v3[4] = &v4;
    __getEKObjectIDClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18CAC0C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKObjectIDClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __EventKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E550E1C0;
    uint64_t v8 = 0;
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    CGFloat v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *EventKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPEvent.m", 22, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("EKObjectID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    CGFloat v3 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v5 = [NSString stringWithUTF8String:"Class getEKObjectIDClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPEvent.m", 23, @"Unable to find class %s", "EKObjectID");

LABEL_10:
    __break(1u);
  }
  getEKObjectIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EventKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EventKitLibraryCore_frameworkLibrary = result;
  return result;
}

PPAttendee *internUsingSet(void *a1, void *a2)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3 || !malloc_size(v3))
  {
    CGFloat v5 = (PPAttendee *)v3;
    goto LABEL_8;
  }
  CGFloat v5 = [v4 member:v3];
  if (v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    v54[0] = 0;
    uint64_t v7 = objc_msgSend(v6, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, v54);
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [NSString alloc];
      size_t v10 = v54[0];
      uint64_t v11 = v8;
      uint64_t v12 = 4;
    }
    else
    {
      size_t v18 = [v6 lengthOfBytesUsingEncoding:2483028224];
      uint64_t v19 = [v6 _fastCharacterContents];
      if (!v19)
      {
        unint64_t v28 = v18 + 1;
        memptr = 0;
        uint64_t v53 = 0;
        if (v18 + 1 > 0x4000)
        {
          int v40 = malloc_type_posix_memalign(&memptr, 8uLL, v18, 0x56EFB4B4uLL);
          LOBYTE(v53) = 0;
          if (v40)
          {
            id v45 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
            objc_exception_throw(v45);
          }
          v29 = (char *)memptr;
        }
        else
        {
          MEMORY[0x1F4188790]();
          v29 = (char *)&v46 - ((v18 + 16) & 0xFFFFFFFFFFFFFFF0);
          bzero(v29, v18 + 1);
        }
        [v6 getCharacters:v29];
        CGFloat v5 = (PPAttendee *)[[NSString alloc] initWithBytes:v29 length:v18 encoding:2483028224];
        if (v28 > 0x4000) {
          free(v29);
        }
        goto LABEL_31;
      }
      uint64_t v20 = v19;
      id v9 = [NSString alloc];
      uint64_t v11 = v20;
      size_t v10 = v18;
      uint64_t v12 = 2483028224;
    }
    CGFloat v5 = (PPAttendee *)[v9 initWithBytes:v11 length:v10 encoding:v12];
LABEL_31:

    goto LABEL_32;
  }
  getEKObjectIDClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    int v14 = [v6 isTemporary];
    uint32_t v15 = (void *)MEMORY[0x192F97350]();
    if (v14)
    {
      uint64_t v16 = (PPAttendee *)v6;
    }
    else
    {
      objc_msgSend(getEKObjectIDClass(), "objectIDWithEntityType:rowID:databaseID:", objc_msgSend(v6, "entityType"), objc_msgSend(v6, "rowID"), objc_msgSend(v6, "databaseID"));
      uint64_t v16 = (PPAttendee *)objc_claimAutoreleasedReturnValue();
    }
    CGFloat v5 = v16;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v3 timeIntervalSinceReferenceDate];
    CGFloat v5 = (PPAttendee *)objc_msgSend(v17, "initWithTimeIntervalSinceReferenceDate:");
LABEL_32:
    [v4 addObject:v5];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = v3;
      v47 = [PPAttendee alloc];
      id v49 = [v30 name];
      v31 = internUsingSet(v49, v4);
      id v48 = [v30 emailAddress];
      v32 = internUsingSet(v48, v4);
      v33 = -[PPAttendee _plist]((uint64_t)v30);
      v34 = [v33 objectForKeyedSubscript:@"url"];
      v35 = internUsingSet(v34, v4);
      uint64_t v36 = [v30 isCurrentUser];
      uint64_t v37 = [v30 status];

      CGFloat v5 = [(PPAttendee *)v47 initWithName:v31 emailAddress:v32 urlString:v35 isCurrentUser:v36 status:v37];
    }
    else
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
      [v38 handleFailureInFunction:v39, @"PPEvent.m", 319, @"unexpected type %@", objc_opt_class() file lineNumber description];

      CGFloat v5 = 0;
    }
    goto LABEL_32;
  }
  uint64_t v21 = (void *)MEMORY[0x192F97350]();
  id v51 = 0;
  v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v51];
  id v23 = v51;
  if (!v22)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
    [v41 handleFailureInFunction:v42, @"PPEvent.m", 305, @"failed to archive: %@", v23 file lineNumber description];
  }
  v24 = (void *)MEMORY[0x1E4F28DC0];
  v25 = (void *)MEMORY[0x192F97350]();
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  id v50 = v23;
  CGFloat v5 = [v24 unarchivedObjectOfClasses:v26 fromData:v22 error:&v50];
  id v27 = v50;

  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
    [v43 handleFailureInFunction:v44, @"PPEvent.m", 309, @"failed to unarchive: %@", v27 file lineNumber description];
  }
LABEL_8:

  return v5;
}

void PPSetContactStoreFactoryForTesting(void *a1)
{
  id v1 = a1;
  __assert_rtn("PPSetContactStoreFactoryForTesting", "PPContactsUtilities.m", 63, "0");
}

id PPNewCNContactStore()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1B980]);
  id v1 = objc_opt_new();
  [v1 setIncludeDonatedContacts:1];
  uint64_t v2 = (void *)[v0 initWithConfiguration:v1];

  return v2;
}

id PPSharedCNContactStore()
{
  if (PPSharedCNContactStore__pasOnceToken3 != -1) {
    dispatch_once(&PPSharedCNContactStore__pasOnceToken3, &__block_literal_global_1611);
  }
  id v0 = (void *)PPSharedCNContactStore__pasExprOnceResult;
  return v0;
}

void __PPSharedCNContactStore_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = PPNewCNContactStore();
  uint64_t v2 = (void *)PPSharedCNContactStore__pasExprOnceResult;
  PPSharedCNContactStore__pasExprOnceResult = v1;
}

void PPSetSuggestionsContactServiceFactoryForTesting(void *a1)
{
  id v1 = a1;
  __assert_rtn("PPSetSuggestionsContactServiceFactoryForTesting", "PPContactsUtilities.m", 81, "0");
}

uint64_t PPNewSuggestionsContactService()
{
  return [MEMORY[0x1E4F5DB70] serviceForContacts];
}

id PPSharedSuggestionsContactService()
{
  if (PPSharedSuggestionsContactService__pasOnceToken4 != -1) {
    dispatch_once(&PPSharedSuggestionsContactService__pasOnceToken4, &__block_literal_global_6);
  }
  id v0 = (void *)PPSharedSuggestionsContactService__pasExprOnceResult;
  return v0;
}

void __PPSharedSuggestionsContactService_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = [MEMORY[0x1E4F5DB70] serviceForContacts];
  uint64_t v2 = (void *)PPSharedSuggestionsContactService__pasExprOnceResult;
  PPSharedSuggestionsContactService__pasExprOnceResult = v1;
}

void PPSetEventStoreFactoryForTesting(void *a1)
{
  id v1 = a1;
  __assert_rtn("PPSetEventStoreFactoryForTesting", "PPEventsSupport.m", 39, "0");
}

Class __getEKEventStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!EventKitLibraryCore_frameworkLibrary_1620)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __EventKitLibraryCore_block_invoke_1621;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E550E240;
    uint64_t v8 = 0;
    EventKitLibraryCore_frameworkLibrary_1620 = _sl_dlopen();
  }
  if (!EventKitLibraryCore_frameworkLibrary_1620)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *EventKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PPEventsSupport.m", 20, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("EKEventStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v5 = [NSString stringWithUTF8String:"Class getEKEventStoreClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PPEventsSupport.m", 21, @"Unable to find class %s", "EKEventStore");

LABEL_10:
    __break(1u);
  }
  getEKEventStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EventKitLibraryCore_block_invoke_1621()
{
  uint64_t result = _sl_dlopen();
  EventKitLibraryCore_frameworkLibrary_1620 = result;
  return result;
}

id PPNextMidnight()
{
  id v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
  uint64_t v2 = [v0 startOfDayForDate:v1];

  return v2;
}

id PPPreviousMidnight()
{
  id v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v1 = objc_opt_new();
  uint64_t v2 = [v0 startOfDayForDate:v1];

  return v2;
}

void sub_18CAC602C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAC6744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_18CAC6DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
}

void sub_18CACD25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPIsServerContext()
{
  if (PPIsServerContext__pasOnceToken7 != -1) {
    dispatch_once(&PPIsServerContext__pasOnceToken7, &__block_literal_global_123);
  }
  return PPIsServerContext__pasExprOnceResult;
}

void __PPIsServerContext_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  id v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.suggestd"];

  PPIsServerContext__pasExprOnceResult = v4;
}

id PPGetStringInternPool()
{
  if (PPGetStringInternPool__pasOnceToken8 != -1) {
    dispatch_once(&PPGetStringInternPool__pasOnceToken8, &__block_literal_global_129);
  }
  id v0 = (void *)PPGetStringInternPool__pasExprOnceResult;
  return v0;
}

void __PPGetStringInternPool_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  if (PPIsServerContext__pasOnceToken7 != -1) {
    dispatch_once(&PPIsServerContext__pasOnceToken7, &__block_literal_global_123);
  }
  int v1 = PPIsServerContext__pasExprOnceResult;
  id v2 = objc_alloc(MEMORY[0x1E4F93B38]);
  if (v1) {
    id v3 = &__block_literal_global_133;
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = [v2 initWithBehavior:0 copyWithZone:v3];
  CGFloat v5 = (void *)PPGetStringInternPool__pasExprOnceResult;
  PPGetStringInternPool__pasExprOnceResult = v4;
}

id __PPGetStringInternPool_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[MEMORY[0x1E4F93BE0] copyString:a2 toZone:a3];
  return v3;
}

id PPGetSourceInternPool()
{
  if (PPGetSourceInternPool__pasOnceToken9 != -1) {
    dispatch_once(&PPGetSourceInternPool__pasOnceToken9, &__block_literal_global_136);
  }
  id v0 = (void *)PPGetSourceInternPool__pasExprOnceResult;
  return v0;
}

void __PPGetSourceInternPool_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B38]) initWithBehavior:0 copyWithZone:0];
  id v2 = (void *)PPGetSourceInternPool__pasExprOnceResult;
  PPGetSourceInternPool__pasExprOnceResult = v1;
}

void sub_18CACEB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2857(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2858(uint64_t a1)
{
}

void sub_18CACF448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18CAD05F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAD06CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18CAD0A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3145(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3146(uint64_t a1)
{
}

void sub_18CAD4854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3461(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3462(uint64_t a1)
{
}

void sub_18CAD4B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18CAD4DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18CAD6524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3712(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3713(uint64_t a1)
{
}

void sub_18CAD7140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18CADA884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CADBE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

uint64_t __Block_byref_object_copy__4332(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4333(uint64_t a1)
{
}

void sub_18CADC15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_18CADC584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_18CADD61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CADE22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CADE304(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18CADE9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4502(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4503(uint64_t a1)
{
}

uint64_t qidStringToNumeric(void *a1)
{
  id v1 = a1;
  if (([v1 hasPrefix:@"Q"] & 1) == 0)
  {
    CGFloat v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"uint32_t qidStringToNumeric(NSString *__strong)"];
    [v5 handleFailureInFunction:v6, @"PPSpotlightScoringFeatureVector.m", 95, @"Invalid Qid: %@", v1 file lineNumber description];
  }
  id v2 = [v1 substringFromIndex:1];
  uint64_t v3 = [v2 intValue];

  return v3;
}

void sub_18CAE2A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAE33DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAE415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5375(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5376(uint64_t a1)
{
}

void sub_18CAE4E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5445(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5446(uint64_t a1)
{
}

void sub_18CAE51CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18CAE54BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_18CAE67E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5768(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5769(uint64_t a1)
{
}

void sub_18CAE6B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAE6C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAE706C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAE78D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6144(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6145(uint64_t a1)
{
}

void sub_18CAE824C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAE8BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAE9640(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_18CAE98C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6355(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6356(uint64_t a1)
{
}

void sub_18CAE9B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v15 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getEKCalendarVisibilityManagerClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKCalendarVisibilityManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKCalendarVisibilityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKCalendarVisibilityManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 41, @"Unable to find class %s", "EKCalendarVisibilityManager");

    __break(1u);
  }
}

void *EventKitLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!EventKitLibraryCore_frameworkLibrary_6364)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __EventKitLibraryCore_block_invoke_6365;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E550F428;
    uint64_t v6 = 0;
    EventKitLibraryCore_frameworkLibrary_6364 = _sl_dlopen();
  }
  id v0 = (void *)EventKitLibraryCore_frameworkLibrary_6364;
  if (!EventKitLibraryCore_frameworkLibrary_6364)
  {
    id v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *EventKitLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 37, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __EventKitLibraryCore_block_invoke_6365()
{
  uint64_t result = _sl_dlopen();
  EventKitLibraryCore_frameworkLibrary_6364 = result;
  return result;
}

void sub_18CAEA44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void *__getEKEventStoreChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = EventKitLibrary();
  uint64_t result = dlsym(v2, "EKEventStoreChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getEKEventStoreChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18CAEA9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

void *__getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = EventKitLibrary();
  uint64_t result = dlsym(v2, "EKEventStoreCalendarDataChangedUserInfoKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18CAEAD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAEB0D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __getEKObjectChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKObjectChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKObjectChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKObjectChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 43, @"Unable to find class %s", "EKObjectChange");

    __break(1u);
  }
}

void sub_18CAEB4D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_18CAEB838(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_18CAEBC74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18CAEC198(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_18CAECCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getEKCalendarItemChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKCalendarItemChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKCalendarItemChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKCalendarItemChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 45, @"Unable to find class %s", "EKCalendarItemChange");

    __break(1u);
  }
}

void __getEKExceptionDateChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKExceptionDateChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKExceptionDateChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKExceptionDateChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 46, @"Unable to find class %s", "EKExceptionDateChange");

    __break(1u);
  }
}

void __getEKRecurrenceChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKRecurrenceChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKRecurrenceChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKRecurrenceChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 47, @"Unable to find class %s", "EKRecurrenceChange");

    __break(1u);
  }
}

void __getEKEventChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKEventChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKEventChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKEventChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 48, @"Unable to find class %s", "EKEventChange");

    __break(1u);
  }
}

void __getEKAttendeeChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKAttendeeChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKAttendeeChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKAttendeeChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 49, @"Unable to find class %s", "EKAttendeeChange");

    __break(1u);
  }
}

void __getEKOrganizerChangeClass_block_invoke(uint64_t a1)
{
  EventKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKOrganizerChange");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKOrganizerChangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getEKOrganizerChangeClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PPNotificationManager.m", 50, @"Unable to find class %s", "EKOrganizerChange");

    __break(1u);
  }
}

void sub_18CAED568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAED67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAED948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18CAEE134(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_18CAEED38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18CAEF824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6751(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6752(uint64_t a1)
{
}

void sub_18CAEFE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18CAF1728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_18CAF1BBC(void *a1)
{
}

void sub_18CAF1BC8(_Unwind_Exception *a1)
{
}

id pp_quicktype_log_handle()
{
  if (pp_quicktype_log_handle__pasOnceToken3 != -1) {
    dispatch_once(&pp_quicktype_log_handle__pasOnceToken3, &__block_literal_global_5);
  }
  id v0 = (void *)pp_quicktype_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_quicktype_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "QuickType");
  uint64_t v2 = (void *)pp_quicktype_log_handle__pasExprOnceResult;
  pp_quicktype_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_entities_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Entities");
  uint64_t v2 = (void *)pp_entities_log_handle__pasExprOnceResult;
  pp_entities_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_topics_log_handle()
{
  if (pp_topics_log_handle__pasOnceToken5 != -1) {
    dispatch_once(&pp_topics_log_handle__pasOnceToken5, &__block_literal_global_11);
  }
  id v0 = (void *)pp_topics_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_topics_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Topics");
  uint64_t v2 = (void *)pp_topics_log_handle__pasExprOnceResult;
  pp_topics_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_contacts_log_handle()
{
  if (pp_contacts_log_handle__pasOnceToken6 != -1) {
    dispatch_once(&pp_contacts_log_handle__pasOnceToken6, &__block_literal_global_14);
  }
  id v0 = (void *)pp_contacts_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_contacts_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Contacts");
  uint64_t v2 = (void *)pp_contacts_log_handle__pasExprOnceResult;
  pp_contacts_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_connections_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Connections");
  uint64_t v2 = (void *)pp_connections_log_handle__pasExprOnceResult;
  pp_connections_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_locations_log_handle()
{
  if (pp_locations_log_handle__pasOnceToken9 != -1) {
    dispatch_once(&pp_locations_log_handle__pasOnceToken9, &__block_literal_global_23);
  }
  id v0 = (void *)pp_locations_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_locations_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Locations");
  uint64_t v2 = (void *)pp_locations_log_handle__pasExprOnceResult;
  pp_locations_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_reranker_log_handle()
{
  if (pp_reranker_log_handle__pasOnceToken10 != -1) {
    dispatch_once(&pp_reranker_log_handle__pasOnceToken10, &__block_literal_global_26);
  }
  id v0 = (void *)pp_reranker_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_reranker_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Reranker");
  uint64_t v2 = (void *)pp_reranker_log_handle__pasExprOnceResult;
  pp_reranker_log_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_xpc_server_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "XPCServer");
  uint64_t v2 = (void *)pp_xpc_server_log_handle__pasExprOnceResult;
  pp_xpc_server_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_asset_log_handle()
{
  if (pp_asset_log_handle__pasOnceToken13 != -1) {
    dispatch_once(&pp_asset_log_handle__pasOnceToken13, &__block_literal_global_35);
  }
  id v0 = (void *)pp_asset_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_asset_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Asset");
  uint64_t v2 = (void *)pp_asset_log_handle__pasExprOnceResult;
  pp_asset_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_score_interpreter_log_handle()
{
  if (pp_score_interpreter_log_handle__pasOnceToken14 != -1) {
    dispatch_once(&pp_score_interpreter_log_handle__pasOnceToken14, &__block_literal_global_38);
  }
  id v0 = (void *)pp_score_interpreter_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_score_interpreter_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "ScoreInterpreter");
  uint64_t v2 = (void *)pp_score_interpreter_log_handle__pasExprOnceResult;
  pp_score_interpreter_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_temporal_clusters_log_handle()
{
  if (pp_temporal_clusters_log_handle__pasOnceToken16 != -1) {
    dispatch_once(&pp_temporal_clusters_log_handle__pasOnceToken16, &__block_literal_global_44);
  }
  id v0 = (void *)pp_temporal_clusters_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_temporal_clusters_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "TemporalClusters");
  uint64_t v2 = (void *)pp_temporal_clusters_log_handle__pasExprOnceResult;
  pp_temporal_clusters_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_universal_search_log_handle()
{
  if (pp_universal_search_log_handle__pasOnceToken17 != -1) {
    dispatch_once(&pp_universal_search_log_handle__pasOnceToken17, &__block_literal_global_47);
  }
  id v0 = (void *)pp_universal_search_log_handle__pasExprOnceResult;
  return v0;
}

void __pp_universal_search_log_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "UniversalSearch");
  uint64_t v2 = (void *)pp_universal_search_log_handle__pasExprOnceResult;
  pp_universal_search_log_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_default_signpost_handle()
{
  if (pp_default_signpost_handle__pasOnceToken18 != -1) {
    dispatch_once(&pp_default_signpost_handle__pasOnceToken18, &__block_literal_global_50);
  }
  id v0 = (void *)pp_default_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_default_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Default");
  uint64_t v2 = (void *)pp_default_signpost_handle__pasExprOnceResult;
  pp_default_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_maintenance_signpost_handle()
{
  if (pp_maintenance_signpost_handle__pasOnceToken19 != -1) {
    dispatch_once(&pp_maintenance_signpost_handle__pasOnceToken19, &__block_literal_global_52);
  }
  id v0 = (void *)pp_maintenance_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_maintenance_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Maintenance");
  uint64_t v2 = (void *)pp_maintenance_signpost_handle__pasExprOnceResult;
  pp_maintenance_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_quicktype_signpost_handle()
{
  if (pp_quicktype_signpost_handle__pasOnceToken20 != -1) {
    dispatch_once(&pp_quicktype_signpost_handle__pasOnceToken20, &__block_literal_global_55);
  }
  id v0 = (void *)pp_quicktype_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_quicktype_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "QuickType");
  uint64_t v2 = (void *)pp_quicktype_signpost_handle__pasExprOnceResult;
  pp_quicktype_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_entities_signpost_handle()
{
  if (pp_entities_signpost_handle__pasOnceToken21 != -1) {
    dispatch_once(&pp_entities_signpost_handle__pasOnceToken21, &__block_literal_global_57);
  }
  id v0 = (void *)pp_entities_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_entities_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Entities");
  uint64_t v2 = (void *)pp_entities_signpost_handle__pasExprOnceResult;
  pp_entities_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_topics_signpost_handle()
{
  if (pp_topics_signpost_handle__pasOnceToken22 != -1) {
    dispatch_once(&pp_topics_signpost_handle__pasOnceToken22, &__block_literal_global_59);
  }
  id v0 = (void *)pp_topics_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_topics_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Topics");
  uint64_t v2 = (void *)pp_topics_signpost_handle__pasExprOnceResult;
  pp_topics_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_contacts_signpost_handle()
{
  if (pp_contacts_signpost_handle__pasOnceToken23 != -1) {
    dispatch_once(&pp_contacts_signpost_handle__pasOnceToken23, &__block_literal_global_61);
  }
  id v0 = (void *)pp_contacts_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_contacts_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Contacts");
  uint64_t v2 = (void *)pp_contacts_signpost_handle__pasExprOnceResult;
  pp_contacts_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_events_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Events");
  uint64_t v2 = (void *)pp_events_signpost_handle__pasExprOnceResult;
  pp_events_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_connections_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Connections");
  uint64_t v2 = (void *)pp_connections_signpost_handle__pasExprOnceResult;
  pp_connections_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_locations_signpost_handle()
{
  if (pp_locations_signpost_handle__pasOnceToken26 != -1) {
    dispatch_once(&pp_locations_signpost_handle__pasOnceToken26, &__block_literal_global_67);
  }
  id v0 = (void *)pp_locations_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_locations_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Locations");
  uint64_t v2 = (void *)pp_locations_signpost_handle__pasExprOnceResult;
  pp_locations_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_reranker_signpost_handle()
{
  if (pp_reranker_signpost_handle__pasOnceToken27 != -1) {
    dispatch_once(&pp_reranker_signpost_handle__pasOnceToken27, &__block_literal_global_69);
  }
  id v0 = (void *)pp_reranker_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_reranker_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "Reranker");
  uint64_t v2 = (void *)pp_reranker_signpost_handle__pasExprOnceResult;
  pp_reranker_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

void __pp_social_highlights_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "SocialHighlights");
  uint64_t v2 = (void *)pp_social_highlights_signpost_handle__pasExprOnceResult;
  pp_social_highlights_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

id pp_temporal_clusters_signpost_handle()
{
  if (pp_temporal_clusters_signpost_handle__pasOnceToken29 != -1) {
    dispatch_once(&pp_temporal_clusters_signpost_handle__pasOnceToken29, &__block_literal_global_73);
  }
  id v0 = (void *)pp_temporal_clusters_signpost_handle__pasExprOnceResult;
  return v0;
}

void __pp_temporal_clusters_signpost_handle_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  os_log_t v1 = os_log_create("com.apple.proactive", "TemporalClusters");
  uint64_t v2 = (void *)pp_temporal_clusters_signpost_handle__pasExprOnceResult;
  pp_temporal_clusters_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

void sub_18CAF550C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7525(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7526(uint64_t a1)
{
}

void sub_18CAF5814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

__CFString *PPCollapseWhitespaceAndStrip(void *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  os_log_t v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = 0;
    goto LABEL_69;
  }
  unint64_t v2 = [(__CFString *)v1 length];
  if (v2)
  {
    unint64_t v3 = v2;
    if (v2 <= 0x1FF)
    {
      MEMORY[0x1F4188790]();
      long long v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
LABEL_7:
      CFStringRef v7 = v1;
      os_log_t v1 = (__CFString *)v7;
      if (v7)
      {
        memset(buffer, 0, sizeof(buffer));
        CFIndex Length = CFStringGetLength(v7);
        v35 = v1;
        uint64_t v38 = 0;
        CFIndex v39 = Length;
        CharactersPtr = CFStringGetCharactersPtr(v1);
        CStringPtr = 0;
        uint64_t v36 = CharactersPtr;
        if (!CharactersPtr) {
          CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
        }
        unint64_t v33 = v3;
        int64_t v40 = 0;
        int64_t v41 = 0;
        uint64_t v37 = CStringPtr;
        if (Length >= 1)
        {
          uint64_t v11 = 0;
          int64_t v12 = 0;
          int64_t v13 = 0;
          char v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 64;
          char v17 = 1;
          while (1)
          {
            if ((unint64_t)v13 >= 4) {
              uint64_t v18 = 4;
            }
            else {
              uint64_t v18 = v13;
            }
            CFIndex v19 = v39;
            if (v39 <= v13)
            {
              UniChar v20 = 0;
            }
            else
            {
              if (v36)
              {
                UniChar v20 = v36[v13 + v38];
              }
              else if (v37)
              {
                UniChar v20 = v37[v38 + v13];
              }
              else
              {
                if (v41 <= v13 || v12 > v13)
                {
                  uint64_t v22 = v18 + v11;
                  uint64_t v23 = v16 - v18;
                  int64_t v24 = v13 - v18;
                  CFIndex v25 = v24 + 64;
                  if (v24 + 64 >= v39) {
                    CFIndex v25 = v39;
                  }
                  int64_t v40 = v24;
                  int64_t v41 = v25;
                  if (v39 >= v23) {
                    CFIndex v19 = v23;
                  }
                  v44.length = v19 + v22;
                  v44.location = v24 + v38;
                  CFStringGetCharacters(v35, v44, (UniChar *)buffer);
                  int64_t v12 = v40;
                }
                UniChar v20 = *((_WORD *)buffer + v13 - v12);
              }
              if (v20 == 10 || v20 == 32)
              {
LABEL_49:
                if ((v17 & 1) == 0)
                {
                  *(_WORD *)&v5[2 * v15++] = 32;
                  char v14 = v14 & 1 | (v20 != 32);
                }
                char v17 = 1;
                goto LABEL_53;
              }
            }
            if ((unsigned __int16)(v20 - 48) >= 0xAu && (unsigned __int16)((v20 & 0xFFDF) - 65) >= 0x1Au)
            {
              if (v20 > 0x9Fu)
              {
                if (v20 == 160 || v20 == 5760) {
                  goto LABEL_49;
                }
              }
              else if (v20 == 9 || v20 == 32)
              {
                goto LABEL_49;
              }
              if ((unsigned __int16)(v20 - 0x2000) < 0xCu) {
                goto LABEL_49;
              }
              if (v20 > 0x2027u)
              {
                if (v20 - 8232 <= 0x37
                  && ((1 << (v20 - 40)) & 0x80000000000083) != 0
                  || v20 == 12288)
                {
                  goto LABEL_49;
                }
              }
              else if (v20 - 10 < 4 || v20 == 133)
              {
                goto LABEL_49;
              }
            }
            char v17 = 0;
            *(_WORD *)&v5[2 * v15++] = v20;
LABEL_53:
            ++v13;
            --v11;
            ++v16;
            if (Length == v13) {
              goto LABEL_57;
            }
          }
        }
        uint64_t v15 = 0;
        char v14 = 0;
LABEL_57:
        char v26 = v14;
        unint64_t v3 = v33;
      }
      else
      {
        uint64_t v15 = 0;
        char v26 = 0;
      }

      uint64_t v27 = v15 - 1;
      while (v27 != -1)
      {
        int v28 = *(unsigned __int16 *)&v5[2 * v27--];
        if (v28 != 32)
        {
          unint64_t v29 = v27 + 2;
          if (v26) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
      }
      unint64_t v29 = 0;
      if (v26) {
        goto LABEL_65;
      }
LABEL_64:
      if (v29 >= [(__CFString *)v1 length]) {
        goto LABEL_66;
      }
LABEL_65:
      uint64_t v30 = [[NSString alloc] initWithCharacters:v5 length:v29];

      os_log_t v1 = (__CFString *)v30;
LABEL_66:
      if (v3 >= 0x200) {
        free(v5);
      }
      goto LABEL_68;
    }
    long long v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    if (v5) {
      goto LABEL_7;
    }
  }
LABEL_68:
  os_log_t v1 = v1;
  uint64_t v6 = v1;
LABEL_69:

  return v6;
}

BOOL PPStringIsWellFormed(void *a1)
{
  CFStringRef v1 = a1;
  unint64_t v2 = (__CFString *)v1;
  if (v1)
  {
    if (CFStringGetFastestEncoding(v1) == 1536)
    {
      BOOL v3 = 1;
    }
    else
    {
      size_t v4 = [(__CFString *)v2 dataUsingEncoding:10 allowLossyConversion:0];
      long long v5 = v4;
      if (v4)
      {
        id v6 = v4;
        BOOL v3 = u_strIsWellFormed((const UChar *)[v6 bytes], (unint64_t)objc_msgSend(v6, "length") >> 1) != 0;
      }
      else
      {
        BOOL v3 = 0;
      }
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

BOOL PPStringAllWhiteSpace(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (PPStringAllWhiteSpace__pasOnceToken2 != -1) {
      dispatch_once(&PPStringAllWhiteSpace__pasOnceToken2, &__block_literal_global_7560);
    }
    BOOL v2 = [v1 rangeOfCharacterFromSet:PPStringAllWhiteSpace__pasExprOnceResult] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

void __PPStringAllWhiteSpace_block_invoke()
{
  id v0 = (void *)MEMORY[0x192F97350]();
  id v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v2 = [v1 invertedSet];
  BOOL v3 = (void *)PPStringAllWhiteSpace__pasExprOnceResult;
  PPStringAllWhiteSpace__pasExprOnceResult = v2;
}

uint64_t PPStringLooksLikeNumber(void *a1)
{
  CFStringRef v1 = a1;
  uint64_t v2 = (__CFString *)v1;
  if (!v1)
  {
LABEL_30:
    uint64_t v19 = 0;
    goto LABEL_33;
  }
  memset(v21, 0, sizeof(v21));
  CFIndex Length = CFStringGetLength(v1);
  CFStringRef theString = v2;
  uint64_t v25 = 0;
  CFIndex v26 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  uint64_t v23 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  int64_t v24 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    char v9 = 0;
    uint64_t v10 = 64;
    while (1)
    {
      uint64_t v11 = (unint64_t)v8 >= 4 ? 4 : v8;
      CFIndex v12 = v26;
      if (v26 <= v8) {
        goto LABEL_30;
      }
      if (v23)
      {
        UniChar v13 = v23[v8 + v25];
      }
      else if (v24)
      {
        UniChar v13 = v24[v25 + v8];
      }
      else
      {
        if (v28 <= v8 || v7 > v8)
        {
          uint64_t v15 = v11 + v6;
          uint64_t v16 = v10 - v11;
          uint64_t v17 = v8 - v11;
          CFIndex v18 = v17 + 64;
          if (v17 + 64 >= v26) {
            CFIndex v18 = v26;
          }
          uint64_t v27 = v17;
          uint64_t v28 = v18;
          if (v26 >= v16) {
            CFIndex v12 = v16;
          }
          v29.length = v12 + v15;
          v29.location = v17 + v25;
          CFStringGetCharacters(theString, v29, (UniChar *)v21);
          uint64_t v7 = v27;
        }
        UniChar v13 = *((_WORD *)v21 + v8 - v7);
      }
      if (v13 > 0x39u) {
        goto LABEL_30;
      }
      if (((1 << v13) & 0x3FF000000000000) != 0)
      {
        char v9 = 1;
      }
      else if (((1 << v13) & 0x7B0100000200) == 0)
      {
        goto LABEL_30;
      }
      ++v8;
      --v6;
      ++v10;
      if (Length == v8) {
        goto LABEL_32;
      }
    }
  }
  char v9 = 0;
LABEL_32:
  uint64_t v19 = v9 & 1;
LABEL_33:

  return v19;
}

id PPStringFirstNumber(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_37;
  }
  BOOL v3 = (__CFString *)v1;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v47 = 0;
  CFIndex v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  id v45 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  int64_t v49 = 0;
  int64_t v50 = 0;
  uint64_t v46 = CStringPtr;
  if (Length <= 0)
  {
LABEL_36:

LABEL_37:
    v34 = 0;
    goto LABEL_38;
  }
  int64_t v7 = 0;
  int v8 = 0;
  int64_t v9 = 0;
  uint64_t v10 = 0xFFFFFFFFLL;
  unsigned int v11 = -1;
  do
  {
    int64_t v12 = -v9;
    int64_t v13 = v9 + 64;
    int v14 = v8;
    while (1)
    {
      if ((unint64_t)v9 >= 4) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = v9;
      }
      CFIndex v16 = v48;
      if (v48 <= v9)
      {
        ++v11;
        goto LABEL_27;
      }
      if (v45)
      {
        UniChar v17 = v45[v9 + v47];
      }
      else if (v46)
      {
        UniChar v17 = v46[v47 + v9];
      }
      else
      {
        if (v50 <= v9 || v7 > v9)
        {
          uint64_t v19 = v15 + v12;
          CFIndex v20 = v13 - v15;
          int64_t v21 = v9 - v15;
          uint64_t v22 = v10;
          CFIndex v23 = v21 + 64;
          if (v21 + 64 >= v48) {
            CFIndex v23 = v48;
          }
          int64_t v49 = v21;
          int64_t v50 = v23;
          if (v48 >= v20) {
            CFIndex v16 = v20;
          }
          v52.length = v16 + v19;
          v52.location = v21 + v47;
          CFStringGetCharacters(theString, v52, (UniChar *)&v36);
          uint64_t v10 = v22;
          int64_t v7 = v49;
        }
        UniChar v17 = *((_WORD *)&v36 + v9 - v7);
      }
      ++v11;
      if ((unsigned __int16)(v17 - 48) < 0xAu) {
        break;
      }
LABEL_27:
      if (v14)
      {
        v34 = -[__CFString substringWithRange:](v3, "substringWithRange:", (int)v10, v14, v36, v37, v38, v39, v40, v41, v42, v43);

        goto LABEL_38;
      }
      ++v9;
      --v12;
      ++v13;
      if (Length == v9) {
        goto LABEL_36;
      }
    }
    if ((int)v10 >= 0) {
      uint64_t v10 = v10;
    }
    else {
      uint64_t v10 = v11;
    }
    int v8 = v14 + 1;
    ++v9;
  }
  while (v9 != Length);
  int v24 = v10;

  if (v14 < 0) {
    goto LABEL_37;
  }
  unint64_t v33 = (void *)MEMORY[0x192F97350](v25, v26, v27, v28, v29, v30, v31, v32, v36, *((void *)&v36 + 1), v37, *((void *)&v37 + 1), v38, *((void *)&v38 + 1), v39, *((void *)&v39 + 1));
  v34 = -[__CFString substringWithRange:](v3, "substringWithRange:", v24, (v14 + 1));
LABEL_38:

  return v34;
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

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
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

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D8550](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x1F4146288]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
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

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

UBool u_strIsWellFormed(const UChar *s, int32_t length)
{
  return MEMORY[0x1F417F840](s, *(void *)&length);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}