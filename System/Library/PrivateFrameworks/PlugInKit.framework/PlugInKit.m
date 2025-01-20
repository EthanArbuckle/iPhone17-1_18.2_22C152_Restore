void sub_1B38B1240(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t vars8;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;
}

void sub_1B38B13D0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) discoveryMap];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v6 = [[PKHostPlugIn alloc] initWithForm:*(void *)(a1 + 48) host:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v11 = [*(id *)(a1 + 32) discoveryMap];
    v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v10 = [v9 uuid];
    [v11 setObject:v9 forKey:v10];
  }
}

void sub_1B38B1684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_1B38B1850(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[a1 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:v7];

  v9 = (void *)[v8 copy];
  return v9;
}

void sub_1B38B2140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B38B220C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) daemon];
  v5 = [v4 errorInReply:v3];

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) daemon];
    id v7 = xpc_dictionary_get_value(v3, "matches");
    v8 = [v6 convertFromXPC:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    v10 = [v8 objectForKeyedSubscript:@"uuid"];
    id v11 = (void *)[v9 initWithUUIDString:v10];

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_1B38B78AC;
    v37 = sub_1B38B7874;
    id v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v12 = [*(id *)(a1 + 32) hostQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38B13D0;
    block[3] = &unk_1E6059198;
    uint64_t v13 = *(void *)(a1 + 32);
    v27 = &v33;
    block[4] = v13;
    id v14 = v11;
    id v25 = v14;
    v28 = &v29;
    id v15 = v8;
    id v26 = v15;
    dispatch_sync(v12, block);

    if (*((unsigned char *)v30 + 24))
    {
      v17 = [(id)v34[5] _syncQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1B38B7A84;
      v20[3] = &unk_1E60591C0;
      v23 = &v33;
      id v18 = v15;
      uint64_t v19 = *(void *)(a1 + 32);
      id v21 = v18;
      uint64_t v22 = v19;
      dispatch_sync(v17, v20);
    }
    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v34[5], 0, v16);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
  }
}

void sub_1B38B24E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B38B2640()
{
  os_log_t v0 = os_log_create("com.apple.PlugInKit", "unspecified");
  v1 = (void *)qword_1EB2BE140[0];
  qword_1EB2BE140[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.PlugInKit", "xpc");
  id v3 = (void *)qword_1EB2BE148;
  qword_1EB2BE148 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.PlugInKit", "nsextension");
  v5 = (void *)qword_1EB2BE150;
  qword_1EB2BE150 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.PlugInKit", "ls");
  id v7 = (void *)qword_1EB2BE158;
  qword_1EB2BE158 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.PlugInKit", "sandbox");
  id v9 = (void *)qword_1EB2BE160;
  qword_1EB2BE160 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.PlugInKit", "assertions");
  id v11 = (void *)qword_1EB2BE168;
  qword_1EB2BE168 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.PlugInKit", "discovery");
  uint64_t v13 = (void *)qword_1EB2BE170;
  qword_1EB2BE170 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.PlugInKit", "lifecycle");
  id v15 = (void *)qword_1EB2BE178;
  qword_1EB2BE178 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.PlugInKit", "subsystems");
  uint64_t v17 = (void *)qword_1EB2BE180;
  qword_1EB2BE180 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.PlugInKit", "cache");
  uint64_t v19 = (void *)qword_1EB2BE188;
  qword_1EB2BE188 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.PlugInKit", "annotations");
  id v21 = (void *)qword_1EB2BE190;
  qword_1EB2BE190 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.PlugInKit", "holds");
  v23 = (void *)qword_1EB2BE198;
  qword_1EB2BE198 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.PlugInKit", "manager");
  id v25 = (void *)qword_1EB2BE1A0;
  qword_1EB2BE1A0 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.PlugInKit", "persona");
  v27 = (void *)qword_1EB2BE1A8;
  qword_1EB2BE1A8 = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.PlugInKit", "capture");
  uint64_t v29 = (void *)qword_1EB2BE1B0;
  qword_1EB2BE1B0 = (uint64_t)v28;

  qword_1EB2BE1B8 = (uint64_t)os_log_create("com.apple.PlugInKit", "api_misuse");
  return MEMORY[0x1F41817F8]();
}

void sub_1B38B2838(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)PKDiscoveryDriver;
  id v2 = objc_msgSendSuper2(&v9, sel_init);
  if (v2)
  {
    id v3 = +[PKCapabilities frameworkQueueAttr];
    dispatch_queue_t v4 = dispatch_queue_create("discovery driver", v3);
    [v2 setQueue:v4];

    dispatch_queue_t v5 = dispatch_queue_create("discovery sync", v3);
    [v2 setSync:v5];

    [v2 setAttributes:*(void *)(a1 + 40)];
    [v2 setFlags:*(void *)(a1 + 80)];
    [v2 setReport:*(void *)(a1 + 64)];
    [v2 setRelatedActivity:*(void *)(a1 + 48)];
    [v2 setHost:*(void *)(a1 + 56)];
    os_log_t v6 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v11 = v2;
      _os_log_impl(&dword_1B38B0000, v6, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> created discovery driver", buf, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  os_log_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v2;
}

void sub_1B38B29FC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) annotations];
  id v2 = [v3 objectForKeyedSubscript:@"election"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

void sub_1B38B2F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38B31A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) discoveryMap];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_queue_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    os_log_t v6 = [[PKHostPlugIn alloc] initWithForm:*(void *)(a1 + 48) host:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    os_log_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v11 = [*(id *)(a1 + 32) discoveryMap];
    objc_super v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    os_log_t v10 = [v9 uuid];
    [v11 setObject:v9 forKey:v10];
  }
}

id pkIssueSandboxExtensionForMachService(void *a1, long long *a2)
{
  id v3 = a1;
  [v3 UTF8String];
  long long v9 = *a2;
  long long v10 = a2[1];
  uint64_t v4 = sandbox_extension_issue_mach_to_process();
  if (v4)
  {
    dispatch_queue_t v5 = (void *)v4;
    os_log_t v6 = pklog_handle_for_category(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D38F0(v3);
    }

    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", v5, v9, v10);
    free(v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1B38B354C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1B38B3564(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (![WeakRetained annotationNotifyToken]) {
      [v3 installWatchers];
    }
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1B38B387C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B38B38DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_t v8 = WeakRetained;
  if (WeakRetained)
  {
    long long v9 = [WeakRetained report];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38B3A38;
    block[3] = &unk_1E6059008;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v13 = v5;
    id v14 = v6;
    id v15 = *(id *)(a1 + 32);
    char v17 = *(unsigned char *)(a1 + 48);
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }
}

void sub_1B38B3A38(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained report];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      if ([v5 isEqual:*(void *)(a1 + 48)] && !*(unsigned char *)(a1 + 64))
      {
        uint64_t v12 = pklog_handle_for_category(6);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          id v16 = WeakRetained;
          _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_INFO, "<PKDiscoveryDriver:%p> no visible outcome changes", buf, 0xCu);
        }
      }
      else
      {
        [WeakRetained setLastResults:*(void *)(a1 + 32)];
        id v6 = pklog_handle_for_category(6);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = [*(id *)(a1 + 32) count];
          *(_DWORD *)buf = 134218240;
          id v16 = WeakRetained;
          __int16 v17 = 1024;
          int v18 = v7;
          _os_log_impl(&dword_1B38B0000, v6, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)", buf, 0x12u);
        }

        os_log_t v8 = [WeakRetained report];
        v8[2](v8, *(void *)(a1 + 32), 0);

        long long v9 = [WeakRetained sync];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B38B3564;
        block[3] = &unk_1E6058E80;
        objc_copyWeak(&v14, v2);
        dispatch_async(v9, block);

        objc_destroyWeak(&v14);
      }
    }
    else
    {
      BOOL v10 = pklog_handle_for_category(6);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1B38D3534((uint64_t)WeakRetained, a1, v10);
      }

      id v11 = [WeakRetained report];
      v11[2](v11, 0, *(void *)(a1 + 40));
    }
  }
}

BOOL sub_1B38B3CAC(int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  uint32_t v3 = notify_register_dispatch((const char *)qword_1E9CD24D8, out_token, queue, handler);
  if (v3)
  {
    uint64_t v4 = pklog_handle_for_category(10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B38D39C0();
    }
  }
  return v3 == 0;
}

void sub_1B38B3E04(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) host];
  uint32_t v3 = [*(id *)(a1 + 32) attributes];
  uint64_t v4 = [*(id *)(a1 + 32) flags];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B38B38DC;
  v5[3] = &unk_1E6059030;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 48);
  [v2 discoverPlugInsForAttributes:v3 flags:v4 found:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_1B38B3F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B38B4308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38B4744(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3 != (id)MEMORY[0x1E4F14520] || (*(unsigned char *)(a1 + 56) ? (BOOL v6 = WeakRetained == 0) : (BOOL v6 = 1), v6))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = pklog_handle_for_category(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D516C();
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "flags");
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
    objc_initWeak(&location, v5);
    BOOL v10 = v5[3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B38CC2D4;
    v11[3] = &unk_1E6059568;
    objc_copyWeak(&v14, &location);
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void sub_1B38B48C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1B3EBBC90]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    uint64_t v4 = pklog_handle_for_category(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B38D50E8(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B38B496C(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) rewriteDiscoveryAttributes:*(void *)(a1 + 32) flags:*(void *)(a1 + 64)];
  id v3 = [v2 objectForKeyedSubscript:@"NSExtensionPointName"];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v3 = @"multiple";
    }
  }
  int v4 = PKGetThreadPriority();
  unsigned int v5 = *(_DWORD *)(a1 + 64);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  BOOL v6 = pklog_handle_for_category(6);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 48));

  char v8 = pklog_handle_for_category(6);
  long long v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138478595;
    v37 = v3;
    __int16 v38 = 2114;
    uint64_t v39 = v10;
    __int16 v40 = 1026;
    *(_DWORD *)v41 = (v5 >> 10) & 1;
    *(_WORD *)&v41[4] = 1026;
    *(_DWORD *)&v41[6] = v4;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HostDiscovery", " identifier=%{private, signpost.description:attribute}@  discoveryUUID=%{public, signpost.description:attribute}@  sync=%{public, signpost.description:attribute}d  priority=%{public, signpost.description:attribute}d ", buf, 0x22u);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1B38B552C;
  v31[3] = &unk_1E6059238;
  uint64_t v33 = v35;
  os_signpost_id_t v34 = v7;
  id v32 = *(id *)(a1 + 56);
  id v11 = (void (**)(void, void, void))MEMORY[0x1B3EBB710](v31);
  id v12 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = *(__CFString **)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    v37 = v13;
    __int16 v38 = 2048;
    uint64_t v39 = v14;
    __int16 v40 = 2048;
    *(void *)v41 = v15;
    *(_WORD *)&v41[8] = 2114;
    v42 = v3;
    _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_DEFAULT, "[d %@] <PKHost:%p> Beginning discovery for flags: %lu, point: %{public}@", buf, 0x2Au);
  }

  id v16 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 40);
    __int16 v17 = *(__CFString **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v37 = v17;
    __int16 v38 = 2048;
    uint64_t v39 = v18;
    __int16 v40 = 2114;
    *(void *)v41 = v19;
    _os_log_impl(&dword_1B38B0000, v16, OS_LOG_TYPE_INFO, "[d %@] <PKHost:%p> Query: %{public}@", buf, 0x20u);
  }

  if ((*(void *)(a1 + 64) & 0x100) != 0)
  {
    os_log_t v22 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1B38D361C();
    }

    v23 = pkError(3, @"cannot request embedded plug-ins without using the \"UsesEmbeddedCode\" key");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v23);
  }
  else if ((~*(_WORD *)(a1 + 64) & 0x480) != 0)
  {
    os_log_t v24 = [*(id *)(a1 + 40) daemon];
    uint64_t v25 = *(void *)(a1 + 64);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B38B4E34;
    v27[3] = &unk_1E6059260;
    os_log_t v26 = *(void **)(a1 + 48);
    v27[4] = *(void *)(a1 + 40);
    id v28 = v26;
    uint64_t v29 = v11;
    v30 = v35;
    [v24 matchPlugIns:v2 flags:v25 uuid:v28 reply:v27];
  }
  else
  {
    os_log_t v20 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1B38D35C0();
    }

    id v21 = pkError(18, @"PKDiscoverContinuous and PKDiscoverSynchronous incompatible");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v21);
  }
  _Block_object_dispose(v35, 8);
}

void sub_1B38B4E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38B4E34(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  xpc_object_t xdict = a2;
  uint64_t v48 = a1;
  id v3 = [*(id *)(a1 + 32) daemon];
  v41 = [v3 errorInReply:xdict];

  if (v41)
  {
    int v4 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(v48 + 32);
      uint64_t v38 = *(void *)(v48 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v74 = v41;
      _os_log_error_impl(&dword_1B38B0000, v4, OS_LOG_TYPE_ERROR, "[d %@] <PKHost:%p> Failed discovery: %@.", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(v48 + 48) + 16))();
  }
  else
  {
    unsigned int v5 = [*(id *)(v48 + 32) daemon];
    BOOL v6 = xpc_dictionary_get_value(xdict, "matches");
    os_signpost_id_t v7 = [v5 convertFromXPC:v6];

    id v46 = [MEMORY[0x1E4F1CA80] set];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v7;
    unint64_t v8 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v8)
    {
      uint64_t v44 = *(void *)v68;
      do
      {
        uint64_t v9 = 0;
        if (v8 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v8;
        }
        do
        {
          if (*(void *)v68 != v44) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v67 + 1) + 8 * v9);
          id v12 = objc_alloc(MEMORY[0x1E4F29128]);
          id v13 = [v11 objectForKeyedSubscript:@"uuid"];
          uint64_t v14 = (void *)[v12 initWithUUIDString:v13];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v74 = sub_1B38B78AC;
          v75 = sub_1B38B7874;
          id v76 = 0;
          uint64_t v63 = 0;
          v64 = &v63;
          uint64_t v65 = 0x2020000000;
          char v66 = 0;
          uint64_t v15 = [*(id *)(v48 + 32) hostQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B38B31A4;
          block[3] = &unk_1E6059198;
          uint64_t v16 = *(void *)(v48 + 32);
          v61 = buf;
          void block[4] = v16;
          id v17 = v14;
          v62 = &v63;
          id v59 = v17;
          v60 = v11;
          dispatch_sync(v15, block);

          if (*((unsigned char *)v64 + 24))
          {
            uint64_t v18 = [*(id *)(*(void *)&buf[8] + 40) _syncQueue];
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = sub_1B38B7A6C;
            v57[3] = &unk_1E60591C0;
            uint64_t v19 = *(void *)(v48 + 32);
            v57[4] = v11;
            v57[5] = v19;
            v57[6] = buf;
            dispatch_sync(v18, v57);
          }
          [v46 addObject:*(void *)(*(void *)&buf[8] + 40)];

          _Block_object_dispose(&v63, 8);
          _Block_object_dispose(buf, 8);

          ++v9;
        }
        while (v10 != v9);
        unint64_t v8 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v8);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v47 = v46;
    unint64_t v20 = [v47 countByEnumeratingWithState:&v53 objects:v72 count:16];
    if (v20)
    {
      uint64_t v43 = *(void *)v54;
      do
      {
        uint64_t v21 = 0;
        if (v20 <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = v20;
        }
        uint64_t v45 = v22;
        do
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(v47);
          }
          v23 = *(void **)(*((void *)&v53 + 1) + 8 * v21);
          os_log_t v24 = [v23 supersedingUUID];

          if (v24)
          {
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v25 = v47;
            unint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v71 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v50;
              do
              {
                uint64_t v28 = 0;
                if (v26 <= 1) {
                  uint64_t v29 = 1;
                }
                else {
                  uint64_t v29 = v26;
                }
                do
                {
                  if (*(void *)v50 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v49 + 1) + 8 * v28);
                  uint64_t v31 = [v30 uuid];
                  id v32 = [v23 supersedingUUID];
                  int v33 = [v31 isEqual:v32];

                  if (v33) {
                    [v23 setSupersededBy:v30];
                  }
                  ++v28;
                }
                while (v29 != v28);
                unint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v71 count:16];
              }
              while (v26);
            }
          }
          else
          {
            [v23 setSupersededBy:0];
          }
          ++v21;
        }
        while (v21 != v45);
        unint64_t v20 = [v47 countByEnumeratingWithState:&v53 objects:v72 count:16];
      }
      while (v20);
    }

    *(void *)(*(void *)(*(void *)(v48 + 56) + 8) + 24) = [obj count];
    os_signpost_id_t v34 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(v48 + 32);
      uint64_t v35 = *(void *)(v48 + 40);
      v37 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v48 + 56) + 8) + 24);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2048;
      v74 = v37;
      _os_log_impl(&dword_1B38B0000, v34, OS_LOG_TYPE_DEFAULT, "[d %@] <PKHost:%p> Completed discovery. Final # of matches: %lu", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(v48 + 48) + 16))();
  }
}

void sub_1B38B54C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1B38B552C(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = pklog_handle_for_category(6);
  unint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
    int v12 = 134349056;
    uint64_t v13 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HostDiscovery", " count=%{public, signpost.description:attribute}lu ", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = a1[4];
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

void sub_1B38B5CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id pklog_handle_for_category(int a1)
{
  if (qword_1EB2BE1C0 != -1) {
    dispatch_once(&qword_1EB2BE1C0, &unk_1F0C154D0);
  }
  id v2 = (id)qword_1EB2BE140[a1];
  return v2;
}

uint64_t PKGetThreadPriority()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)thread_info_out = 0u;
  mach_msg_type_number_t thread_info_outCnt = 28;
  thread_inspect_t v0 = MEMORY[0x1B3EBB440]();
  if (thread_info(v0, 5u, thread_info_out, &thread_info_outCnt)) {
    uint64_t v1 = 4294966296;
  }
  else {
    uint64_t v1 = DWORD1(v6);
  }
  mach_port_deallocate(*MEMORY[0x1E4F14960], v0);
  return v1;
}

void sub_1B38B7864(uint64_t a1)
{
}

void sub_1B38B786C(uint64_t a1)
{
}

void sub_1B38B7874(uint64_t a1)
{
}

void sub_1B38B787C(uint64_t a1)
{
}

void sub_1B38B7884(uint64_t a1)
{
}

uint64_t sub_1B38B788C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B38B789C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B38B78AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B38B78BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B38B78CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id pkIssueSandboxExtensionForURL(void *a1, long long *a2)
{
  id v3 = a1;
  [v3 fileSystemRepresentation];
  long long v9 = *a2;
  long long v10 = a2[1];
  uint64_t v4 = sandbox_extension_issue_file_to_process();
  if (v4)
  {
    long long v5 = (void *)v4;
    long long v6 = pklog_handle_for_category(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D386C(v3);
    }

    long long v7 = objc_msgSend(NSString, "stringWithUTF8String:", v5, v9, v10);
    free(v5);
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

uint64_t pklog_get_persona_type_and_name(uint64_t result, uint64_t a2, const char **a3, const char **a4)
{
  long long v6 = "<unknown>";
  long long v7 = "NOPERSONA";
  if (result != -1 && a2)
  {
    result = kpersona_info();
    if ((result & 0x80000000) != 0)
    {
      long long v6 = "<unknown>";
      long long v7 = "NOPERSONA";
    }
    else
    {
      unsigned int v9 = *(_DWORD *)(a2 + 8) - 2;
      if (v9 > 4) {
        long long v7 = "<unknown>";
      }
      else {
        long long v7 = off_1E60595D8[v9];
      }
      long long v6 = (const char *)(a2 + 88);
    }
  }
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = v6;
  }
  return result;
}

uint64_t sub_1B38B7A6C(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

uint64_t sub_1B38B7A84(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

uint64_t sub_1B38B7A9C()
{
  qword_1EB2BE0F8 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1B38B7AD8()
{
  qword_1EB2BE108 = objc_alloc_init(PKHost);
  return MEMORY[0x1F41817F8]();
}

void sub_1B38B8620(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v1 setAnnotation:@"election" value:v2];
}

void sub_1B38B87A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38B87C0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) annotations];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"extension"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_1B38B8900(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnnotation:@"extension" value:*(void *)(a1 + 40)];
}

uint64_t sub_1B38B8A90(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void sub_1B38B8C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38B8CA8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sourceForm];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1B38B9240(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = pklog_handle_for_category(7);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7[0] = 67240192;
    v7[1] = v3 == 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HostBeginUsing", " success=%{public, signpost.description:attribute}d ", (uint8_t *)v7, 8u);
  }

  __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__((uint64_t)v3, *(void *)(a1 + 32));
}

uint64_t sub_1B38B9328(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPlugInRequest:*(void *)(a1 + 40) synchronously:0 subsystemOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_1B38B9680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B38B96A0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B38B9714;
  v5[3] = &unk_1E6058D68;
  uint64_t v3 = a1[6];
  void v5[4] = a1[7];
  return [v2 startPlugInRequest:v1 synchronously:1 subsystemOptions:v3 completion:v5];
}

void sub_1B38B9714(uint64_t a1, void *a2)
{
}

void sub_1B38BA5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a50);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1B38BA660(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  switch([*(id *)(a1 + 32) state])
  {
    case 1:
      uint64_t v2 = [*(id *)(a1 + 32) isData];
      char v3 = v2;
      if (v2)
      {
        BOOL v4 = 0;
      }
      else
      {
        uint64_t v2 = [*(id *)(a1 + 32) plugInPrincipal];
        BOOL v4 = v2 == 0;
      }
      if (v4) {
        sub_1B38D1FFC();
      }
      if ((v3 & 1) == 0) {

      }
      objc_msgSend(*(id *)(a1 + 32), "setUseCount:", objc_msgSend(*(id *)(a1 + 32), "useCount") + 1);
      int v12 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [*(id *)(a1 + 32) uuid];
        uint64_t v14 = [*(id *)(a1 + 32) multipleInstanceUUID];
        uint64_t v15 = [*(id *)(a1 + 32) identifier];
        uint64_t v16 = [*(id *)(a1 + 32) version];
        int v17 = [*(id *)(a1 + 32) useCount];
        int v18 = 138544386;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        __int16 v24 = 2112;
        id v25 = v16;
        __int16 v26 = 1024;
        int v27 = v17;
        _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] plugin reference count incremented to %d, and ready for host.", (uint8_t *)&v18, 0x30u);
      }
      [*(id *)(a1 + 32) addRequestUUID:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_21;
    case 2:
      id v5 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1B38D2028(a1 + 32, v5);
      }

      uint64_t v6 = *(void *)(a1 + 48);
      long long v7 = @"plugin has died and must be rediscovered";
      uint64_t v8 = 5;
      goto LABEL_13;
    case 3:
      unsigned int v9 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1B38D21A0(a1 + 32, v9);
      }

      return;
    case 4:
      long long v10 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1B38D20E4(a1 + 32, v10);
      }

      uint64_t v6 = *(void *)(a1 + 48);
      long long v7 = @"plugin is spent and cannot be used anymore";
      uint64_t v8 = 17;
LABEL_13:
      uint64_t v11 = pkError(v8, v7);
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v11);

LABEL_21:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      break;
    default:
      return;
  }
}

void sub_1B38BA940(uint64_t a1, void *a2, int a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      if (!a3)
      {
LABEL_5:
        long long v7 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_1B38D22A0(WeakRetained, v7);
        }

        uint64_t v8 = [WeakRetained _startQueue];
        dispatch_resume(v8);

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_11;
      }
    }
    else
    {
      int v17 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [WeakRetained uuid];
        uint64_t v19 = [WeakRetained multipleInstanceUUID];
        __int16 v20 = [WeakRetained identifier];
        uint64_t v21 = [WeakRetained version];
        int v22 = 138544130;
        v23 = v18;
        __int16 v24 = 2114;
        id v25 = v19;
        __int16 v26 = 2112;
        int v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = v21;
        _os_log_impl(&dword_1B38B0000, v17, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] plugin loaded and ready for host", (uint8_t *)&v22, 0x2Au);
      }
      if (!a3) {
        goto LABEL_5;
      }
    }
    [*(id *)(a1 + 32) deactivatePlugIn:WeakRetained];
    goto LABEL_5;
  }
  unsigned int v9 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1B38D225C(v9);
  }

LABEL_11:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v10 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [WeakRetained uuid];
      int v12 = [WeakRetained multipleInstanceUUID];
      uint64_t v13 = [WeakRetained identifier];
      uint64_t v14 = [WeakRetained version];
      int v22 = 138544130;
      v23 = v11;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2112;
      int v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl(&dword_1B38B0000, v10, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] invalidating startup assertion", (uint8_t *)&v22, 0x2Au);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

uint64_t sub_1B38BAC3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeState:3];
}

void sub_1B38BAC48(uint64_t a1, void *a2, void *a3, void *a4)
{
  v192[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v127 = a3;
  id v128 = a4;
  uint64_t v8 = pklog_handle_for_category(7);
  unsigned int v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 88);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "HostToDaemonReadyPlugIns", "", buf, 2u);
  }

  if (!v7)
  {
    v125 = [v127 objectAtIndexedSubscript:0];
    uint64_t v12 = [v128 count];
    if (v12)
    {
      uint64_t v13 = [v128 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v126 = v13;
    if (v12) {

    }
    uint64_t v14 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 32) uuid];
      uint64_t v16 = [*(id *)(a1 + 32) multipleInstanceUUID];
      int v17 = [*(id *)(a1 + 32) identifier];
      int v18 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v17;
      LOWORD(v174[0]) = 2112;
      *(void *)((char *)v174 + 2) = v18;
      HIWORD(v174[2]) = 2112;
      *(void *)&v174[3] = v125;
      _os_log_impl(&dword_1B38B0000, v14, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] got pid from ready request: %@", buf, 0x34u);
    }
    if (v126)
    {
      uint64_t v19 = [*(id *)(a1 + 32) uuid];
      int v20 = [v19 isEqual:v126] ^ 1;
    }
    else
    {
      int v20 = 0;
    }
    if (v20)
    {
      uint64_t v21 = [*(id *)(a1 + 40) discoveryMap];
      int v22 = [v21 objectForKey:v126];

      if (v22)
      {
        v23 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1B38D2AB8(a1, (uint64_t)v22, (uint64_t)v23, v24, v25, v26, v27, v28, v118, v120, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124, (uint64_t)v125, (uint64_t)v126, (uint64_t)v127, (uint64_t)v128, v129, v130,
        }
            (uint64_t)v131,
            (uint64_t)v132,
            v133,
            (uint64_t)v134,
            (uint64_t)v135);

        uint64_t v29 = @"stale";
      }
      else
      {
        uint64_t v29 = @"invalid";
      }
      uint64_t v30 = pklog_handle_for_category(15);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_1B38D29F0(a1, (uint64_t)v29, (uint64_t)v30, v31, v32, v33, v34, v35, v118, v120, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124, (uint64_t)v125, (uint64_t)v126, (uint64_t)v127, (uint64_t)v128, v129, v130,
      }
          (uint64_t)v131,
          (uint64_t)v132,
          v133,
          (uint64_t)v134,
          (uint64_t)v135);
    }
    if (!v125 || !objc_opt_class())
    {
LABEL_69:
      if (![*(id *)(a1 + 32) isData])
      {
        v85 = [*(id *)(a1 + 32) serviceExtension];

        if (v85)
        {
          v86 = *(void **)(a1 + 32);
          v87 = [v86 serviceExtension];
          v192[0] = v87;
          v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:1];
          id v148 = 0;
          LOBYTE(v86) = [v86 loadExtensions:v88 error:&v148];
          id v7 = v148;

          if ((v86 & 1) == 0)
          {
            v89 = pklog_handle_for_category(7);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
              sub_1B38D2350(a1 + 32, v7, v89);
            }

            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
            goto LABEL_89;
          }
        }
        else
        {
          id v7 = 0;
        }
        [*(id *)(a1 + 48) setDelegate:*(void *)(a1 + 32)];
        v90 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C24450];
        [*(id *)(a1 + 48) setRemoteObjectInterface:v90];

        [*(id *)(a1 + 48) setExportedObject:*(void *)(a1 + 40)];
        v91 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C29530];
        [*(id *)(a1 + 48) setExportedInterface:v91];

        objc_initWeak(&location, *(id *)(a1 + 32));
        v144[0] = MEMORY[0x1E4F143A8];
        v144[1] = 3221225472;
        v144[2] = sub_1B38BBF24;
        v144[3] = &unk_1E6058E30;
        objc_copyWeak(&v146, &location);
        id v145 = *(id *)(a1 + 72);
        uint64_t v92 = MEMORY[0x1B3EBB710](v144);
        v93 = [*(id *)(a1 + 48) synchronousRemoteObjectProxyWithErrorHandler:v92];
        [*(id *)(a1 + 32) setSyncService:v93];

        v94 = [*(id *)(a1 + 32) syncService];
        objc_msgSend(v94, "set_userInfo:", &unk_1F0C20760);

        v95 = [*(id *)(a1 + 48) remoteObjectProxyWithErrorHandler:v92];
        [*(id *)(a1 + 32) setService:v95];

        v96 = *(void **)(a1 + 32);
        if (*(unsigned char *)(a1 + 96)) {
          [v96 syncService];
        }
        else {
        v97 = [v96 service];
        }
        id v121 = v97;

        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = sub_1B38BBFB4;
        v142[3] = &unk_1E6058E80;
        objc_copyWeak(&v143, &location);
        [*(id *)(a1 + 48) setInterruptionHandler:v142];
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = sub_1B38BC330;
        v140[3] = &unk_1E6058E80;
        objc_copyWeak(&v141, &location);
        [*(id *)(a1 + 48) setInvalidationHandler:v140];
        v98 = [*(id *)(a1 + 32) multipleInstanceUUID];

        if (v98)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          v99 = [*(id *)(a1 + 32) multipleInstanceUUID];
          [v99 getUUIDBytes:buf];

          v100 = [*(id *)(a1 + 32) pluginConnection];
          v101 = [v100 _xpcConnection];
          xpc_connection_set_oneshot_instance();
        }
        [*(id *)(a1 + 32) resume];
        v119 = (void *)v92;
        long long v190 = 0u;
        memset(v191, 0, sizeof(v191));
        long long v188 = 0u;
        long long v189 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v175 = 0u;
        memset(v174, 0, sizeof(v174));
        memset(buf, 0, sizeof(buf));
        v138 = 0;
        v139 = 0;
        uint64_t current_persona = voucher_get_current_persona();
        int v103 = current_persona;
        memset(buf, 0, sizeof(buf));
        memset(v174, 0, sizeof(v174));
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        memset(v191, 0, sizeof(v191));
        *(_DWORD *)buf = 1;
        pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v139, &v138);
        v104 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          v105 = [*(id *)(a1 + 32) uuid];
          v106 = [*(id *)(a1 + 32) multipleInstanceUUID];
          v107 = [*(id *)(a1 + 32) identifier];
          v108 = [*(id *)(a1 + 32) version];
          uid_t v109 = geteuid();
          uid_t v110 = getuid();
          *(_DWORD *)v155 = 138545410;
          v156 = v105;
          __int16 v157 = 2114;
          v158 = v106;
          __int16 v159 = 2112;
          v160 = v107;
          __int16 v161 = 2112;
          v162 = v108;
          __int16 v163 = 1024;
          uid_t v164 = v109;
          __int16 v165 = 1024;
          uid_t v166 = v110;
          __int16 v167 = 1024;
          int v168 = v103;
          __int16 v169 = 2080;
          v170 = v139;
          __int16 v171 = 2080;
          v172 = v138;
          _os_log_impl(&dword_1B38B0000, v104, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Prepare using sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v155, 0x50u);
        }
        v111 = pklog_handle_for_category(7);
        v112 = v111;
        os_signpost_id_t v113 = *(void *)(a1 + 88);
        if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
        {
          v114 = [*(id *)(a1 + 32) identifier];
          v115 = [*(id *)(a1 + 32) uuid];
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v114;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v115;
          _os_signpost_emit_with_name_impl(&dword_1B38B0000, v112, OS_SIGNPOST_INTERVAL_BEGIN, v113, "HostToExtensionPrepareUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);
        }
        v116 = *(void **)(a1 + 32);
        uint64_t v129 = MEMORY[0x1E4F143A8];
        uint64_t v130 = 3221225472;
        v131 = sub_1B38BC59C;
        v132 = &unk_1E6058ED0;
        uint64_t v137 = *(void *)(a1 + 88);
        uint64_t v133 = (uint64_t)v116;
        id v136 = *(id *)(a1 + 72);
        id v117 = v121;
        id v134 = v117;
        id v135 = *(id *)(a1 + 64);
        [v116 preparePlugInUsingService:v117 completion:&v129];

        objc_destroyWeak(&v141);
        objc_destroyWeak(&v143);

        objc_destroyWeak(&v146);
        objc_destroyWeak(&location);
        goto LABEL_89;
      }
      uint64_t v82 = *(void *)(a1 + 56);
      uint64_t v83 = *(unsigned __int8 *)(a1 + 96);
      v149[0] = MEMORY[0x1E4F143A8];
      v149[1] = 3221225472;
      v149[2] = sub_1B38BBDAC;
      v149[3] = &unk_1E6058E08;
      v84 = *(void **)(a1 + 40);
      v149[4] = *(void *)(a1 + 32);
      id v151 = *(id *)(a1 + 72);
      id v150 = *(id *)(a1 + 64);
      [v84 accessPlugIns:v82 synchronously:v83 flags:0 extensions:v149];

LABEL_71:
      id v7 = 0;
LABEL_89:

      goto LABEL_90;
    }
    uint64_t v36 = [v125 intValue];
    v37 = [*(id *)(a1 + 32) external];
    uint64_t v38 = [v37 runningboard];
    uint64_t v39 = [v38 processAssertionWithPID:v36 flags:7 reason:9 name:@"com.apple.extension.session"];
    uint64_t v40 = *(void *)(*(void *)(a1 + 80) + 8);
    v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;

    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = sub_1B38BBD54;
    v153[3] = &unk_1E6058CC8;
    v153[4] = *(void *)(a1 + 32);
    id v154 = *(id *)(a1 + 48);
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setInvalidationHandler:v153];
    LOBYTE(v36) = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) acquire];
    v42 = pklog_handle_for_category(7);
    uint64_t v43 = v42;
    if ((v36 & 1) == 0)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1B38D293C(a1 + 32, v43);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
      uint64_t v73 = *(void *)(*(void *)(a1 + 80) + 8);
      v74 = *(void **)(v73 + 40);
      *(void *)(v73 + 40) = 0;

      pkError(4, @"could not acquire startup assertion");
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      int v75 = 1;
LABEL_68:

      if (v75) {
        goto LABEL_71;
      }
      goto LABEL_69;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = [*(id *)(a1 + 32) uuid];
      uint64_t v45 = [*(id *)(a1 + 32) multipleInstanceUUID];
      id v46 = [*(id *)(a1 + 32) identifier];
      id v47 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v46;
      LOWORD(v174[0]) = 2112;
      *(void *)((char *)v174 + 2) = v47;
      _os_log_impl(&dword_1B38B0000, v43, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] acquired startup assertion", buf, 0x2Au);
    }
    uint64_t v48 = pklog_handle_for_category(7);
    os_signpost_id_t v49 = os_signpost_id_make_with_pointer(v48, *(const void **)(a1 + 32));

    long long v50 = pklog_handle_for_category(7);
    long long v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      long long v52 = [*(id *)(a1 + 32) identifier];
      long long v53 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138478083;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v53;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "HostRBExtensionCheck", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);
    }
    long long v54 = [*(id *)(a1 + 32) external];
    long long v55 = [v54 runningboard];
    long long v56 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v125, "intValue"));
    id v152 = 0;
    v57 = [v55 taskStatesForPID:v56 error:&v152];
    id v58 = v152;

    id v59 = pklog_handle_for_category(7);
    v60 = v59;
    if (v49 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v59))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v60, OS_SIGNPOST_INTERVAL_END, v49, "HostRBExtensionCheck", "", buf, 2u);
    }

    if (v57)
    {
      uint64_t v61 = [v57 count];
      uint64_t v62 = v61;
      if (v61)
      {
        if (v61 != 1)
        {
          char v66 = pklog_handle_for_category(7);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_1B38D2620(a1 + 32, v62, v66);
          }
          goto LABEL_65;
        }
        uint64_t v63 = [v57 objectAtIndexedSubscript:0];
        int v64 = [v63 isRunning];

        uint64_t v65 = pklog_handle_for_category(7);
        char v66 = v65;
        if (v64)
        {
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
            sub_1B38D2710(a1 + 32, (uint64_t)v66, v67, v68, v69, v70, v71, v72, v118, v120, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124, (uint64_t)v125, (uint64_t)v126, (uint64_t)v127, (uint64_t)v128, v129, v130,
          }
              (uint64_t)v131,
              (uint64_t)v132,
              v133,
              (uint64_t)v134,
              (uint64_t)v135);
LABEL_65:
          int v75 = 0;
LABEL_66:

          goto LABEL_67;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_1B38D27D4(a1 + 32, v66);
        }
      }
      else
      {
        char v66 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_1B38D2888(a1 + 32, v66);
        }
      }
LABEL_60:

      v79 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_1B38D2404(a1 + 32, v79);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
      uint64_t v80 = *(void *)(*(void *)(a1 + 80) + 8);
      v81 = *(void **)(v80 + 40);
      *(void *)(v80 + 40) = 0;

      char v66 = pkError(4, @"Extension process exited while/after acquiring startup assertion");
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      int v75 = 1;
      goto LABEL_66;
    }
    if (!v58)
    {
      int v75 = 0;
LABEL_67:

      goto LABEL_68;
    }
    id v76 = [v58 domain];
    v77 = v76;
    if (v76 == (void *)*MEMORY[0x1E4F964D0])
    {
      BOOL v78 = [v58 code] == 1;

      if (v78)
      {
        char v66 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_1B38D24B8(a1 + 32, v66);
        }
        goto LABEL_60;
      }
    }
    else
    {
    }
    char v66 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_1B38D256C(a1 + 32, v58, v66);
    }
    goto LABEL_65;
  }
  uint64_t v11 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1B38D2B78(a1, v7, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_90:
}

void sub_1B38BBCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45)
{
}

uint64_t sub_1B38BBD54(uint64_t a1)
{
  uint64_t v2 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1B38D2C30(a1, v2);
  }

  return [*(id *)(a1 + 40) invalidate];
}

void sub_1B38BBDAC(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)(a1 + 32);
  id v11 = 0;
  char v4 = [v3 loadExtensions:a2 error:&v11];
  id v5 = v11;
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38BBED4;
    block[3] = &unk_1E6058CC8;
    id v7 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v10 = v7;
    dispatch_sync(v6, block);

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setBeganUsingAt:v8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_1B38BBED4(uint64_t a1)
{
  [*(id *)(a1 + 32) addRequestUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) changeState:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setUseCount:1];
}

void sub_1B38BBF24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1B38D2CF0(WeakRetained, v3, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B38BBFB4(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1B38B788C;
    v17[4] = sub_1B38B7864;
    id v18 = [WeakRetained service];
    id v3 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v2 uuid];
      id v7 = [v2 multipleInstanceUUID];
      uint64_t v8 = [v2 identifier];
      unsigned int v9 = [v2 version];
      *(_DWORD *)buf = 138544130;
      int v20 = v6;
      __int16 v21 = 2114;
      int v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_debug_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEBUG, "[u %{public}@:m %{public}@] [%@(%@)] interrupted", buf, 0x2Au);
    }
    if (([v2 terminating] & 1) == 0)
    {
      char v4 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v2 uuid];
        id v11 = [v2 multipleInstanceUUID];
        uint64_t v12 = [v2 identifier];
        uint64_t v13 = [v2 version];
        *(_DWORD *)buf = 138544130;
        int v20 = v10;
        __int16 v21 = 2114;
        int v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = v13;
        _os_log_error_impl(&dword_1B38B0000, v4, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Connection to plugin interrupted while in use.", buf, 0x2Au);
      }
    }
    id v5 = [v2 _syncQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B38BC2D4;
    v14[3] = &unk_1E6058E58;
    id v15 = v2;
    uint64_t v16 = v17;
    dispatch_async(v5, v14);

    _Block_object_dispose(v17, 8);
  }
}

void sub_1B38BC2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38BC2D4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state]) {
    [*(id *)(a1 + 32) unwind:2 force:0];
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_1B38BC330(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D2E5C(WeakRetained, v2);
    }

    if (([WeakRetained terminating] & 1) == 0)
    {
      id v3 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1B38D2DAC(WeakRetained, v3);
      }
    }
    char v4 = [WeakRetained _syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38BC440;
    block[3] = &unk_1E6058CF0;
    id v6 = WeakRetained;
    dispatch_async(v4, block);
  }
}

uint64_t sub_1B38BC440(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    char v4 = [*(id *)(a1 + 32) multipleInstanceUUID];
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = [*(id *)(a1 + 32) version];
    int v9 = 138544130;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1B38B0000, v2, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Emptying requests set", (uint8_t *)&v9, 0x2Au);
  }
  id v7 = [*(id *)(a1 + 32) requests];
  [v7 removeAllObjects];

  uint64_t result = [*(id *)(a1 + 32) state];
  if (result) {
    return [*(id *)(a1 + 32) unwind:2 force:0];
  }
  return result;
}

void sub_1B38BC59C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = pklog_handle_for_category(7);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HostToExtensionPrepareUsing", "", buf, 2u);
  }

  if (v5)
  {
    id v10 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = [*(id *)(a1 + 32) uuid];
      uint64_t v12 = [*(id *)(a1 + 32) multipleInstanceUUID];
      __int16 v13 = [*(id *)(a1 + 32) identifier];
      uint64_t v14 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v13;
      LOWORD(v74[0]) = 2112;
      *(void *)((char *)v74 + 2) = v14;
      WORD5(v74[0]) = 2114;
      *(void *)((char *)v74 + 12) = v5;
      WORD2(v74[1]) = 2114;
      *(void *)((char *)&v74[1] + 6) = v6;
      __int16 v15 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; prepareUsing returned error: %{public}@, response: %{public}@";
LABEL_15:
      _os_log_error_impl(&dword_1B38B0000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x3Eu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = [v6 objectForKeyedSubscript:@"sandboxExtensions"];
  id v54 = 0;
  LOBYTE(v16) = [v16 loadExtensions:v17 error:&v54];
  id v5 = v54;

  if ((v16 & 1) == 0)
  {
    id v10 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = [*(id *)(a1 + 32) uuid];
      uint64_t v12 = [*(id *)(a1 + 32) multipleInstanceUUID];
      __int16 v13 = [*(id *)(a1 + 32) identifier];
      uint64_t v14 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v13;
      LOWORD(v74[0]) = 2112;
      *(void *)((char *)v74 + 2) = v14;
      WORD5(v74[0]) = 2114;
      *(void *)((char *)v74 + 12) = v5;
      WORD2(v74[1]) = 2114;
      *(void *)((char *)&v74[1] + 6) = v6;
      __int16 v15 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; could not consume sandbox file extensions: %{pu"
            "blic}@, response: %{public}@";
      goto LABEL_15;
    }
LABEL_16:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  id v18 = [*(id *)(a1 + 32) protocolSpec];
  id v53 = v5;
  uint64_t v19 = sub_1B38C32E8(v18, &v53);
  id v20 = v53;

  if (v19)
  {
    __int16 v21 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v19];
    int v22 = [*(id *)(a1 + 32) pluginConnection];
    __int16 v23 = [v22 remoteObjectInterface];
    [v23 setInterface:v21 forSelector:sel_beginUsingPlugIn_ready_ argumentIndex:1 ofReply:1];

    uint64_t v24 = [*(id *)(a1 + 32) augmentInterface:v21];

    if (v24)
    {
      __int16 v25 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1B38D3018(a1 + 32, v24, v25);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      long long v90 = 0u;
      memset(v91, 0, sizeof(v91));
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v75 = 0u;
      memset(v74, 0, sizeof(v74));
      memset(buf, 0, sizeof(buf));
      long long v51 = 0;
      long long v52 = 0;
      uint64_t current_persona = voucher_get_current_persona();
      int v28 = current_persona;
      memset(buf, 0, sizeof(buf));
      memset(v74, 0, sizeof(v74));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      memset(v91, 0, sizeof(v91));
      *(_DWORD *)buf = 1;
      pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v52, &v51);
      uint64_t v29 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 32) uuid];
        v30 = int v45 = v28;
        uint64_t v31 = [*(id *)(a1 + 32) multipleInstanceUUID];
        uint64_t v32 = [*(id *)(a1 + 32) identifier];
        [*(id *)(a1 + 32) version];
        uint64_t v33 = v46 = v21;
        uid_t v44 = geteuid();
        uid_t v34 = getuid();
        *(_DWORD *)long long v55 = 138545410;
        long long v56 = v30;
        __int16 v57 = 2114;
        id v58 = v31;
        __int16 v59 = 2112;
        v60 = v32;
        __int16 v61 = 2112;
        uint64_t v62 = v33;
        __int16 v63 = 1024;
        uid_t v64 = v44;
        __int16 v65 = 1024;
        uid_t v66 = v34;
        __int16 v67 = 1024;
        int v68 = v45;
        __int16 v69 = 2080;
        uint64_t v70 = v52;
        __int16 v71 = 2080;
        uint64_t v72 = v51;
        _os_log_impl(&dword_1B38B0000, v29, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Begin using sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v55, 0x50u);

        __int16 v21 = v46;
      }

      uint64_t v35 = pklog_handle_for_category(7);
      uint64_t v36 = v35;
      os_signpost_id_t v37 = *(void *)(a1 + 64);
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        uint64_t v38 = [*(id *)(a1 + 32) identifier];
        uint64_t v39 = [*(id *)(a1 + 32) uuid];
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        _os_signpost_emit_with_name_impl(&dword_1B38B0000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "HostToExtensionBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);
      }
      uint64_t v40 = *(void **)(a1 + 40);
      v41 = [*(id *)(a1 + 32) queuedHostPrincipal];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = sub_1B38BCCC0;
      v47[3] = &unk_1E6058EA8;
      uint64_t v42 = *(void *)(a1 + 32);
      uint64_t v43 = *(void **)(a1 + 56);
      uint64_t v50 = *(void *)(a1 + 64);
      v47[4] = v42;
      id v49 = v43;
      id v48 = *(id *)(a1 + 48);
      [v40 beginUsingPlugIn:v41 ready:v47];
    }
    id v20 = (id)v24;
  }
  else
  {
    uint64_t v26 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1B38D2F0C(a1 + 32, v26);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  id v5 = v20;
LABEL_17:
}

void sub_1B38BCCC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pklog_handle_for_category(7);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HostToExtensionBeginUsing", "", buf, 2u);
  }

  if (v4)
  {
    uint64_t v8 = [*(id *)(a1 + 32) protocolSpec];
    int v9 = [v8 isEqual:@"NSObject"];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];

      id v4 = (id)v10;
    }
    [*(id *)(a1 + 32) setUseCount:1];
    [*(id *)(a1 + 32) setPlugInPrincipal:v4];
    [*(id *)(a1 + 32) setEmbeddedPrincipal:0];
    __int16 v11 = [*(id *)(a1 + 32) _syncQueue];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_1B38BCFFC;
    __int16 v25 = &unk_1E6058CC8;
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = v12;
    dispatch_sync(v11, &v22);

    __int16 v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v22, v23, v24, v25, v26);
    [*(id *)(a1 + 32) setBeganUsingAt:v13];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v14 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [*(id *)(a1 + 32) uuid];
      uint64_t v16 = [*(id *)(a1 + 32) multipleInstanceUUID];
      uint64_t v17 = [*(id *)(a1 + 32) identifier];
      id v18 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v15;
      __int16 v30 = 2114;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      _os_log_impl(&dword_1B38B0000, v14, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] telling plugin that host has control", buf, 0x2Au);
    }
    uint64_t v19 = [*(id *)(a1 + 32) service];
    [v19 hostHasControl];
  }
  else
  {
    id v20 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1B38D30D4(a1, v20);
    }

    uint64_t v21 = *(void *)(a1 + 48);
    pkError(5, @"plug-in failed to initialize");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t))(v21 + 16))(v21, v4, 1);
  }
}

uint64_t sub_1B38BCFFC(uint64_t a1)
{
  [*(id *)(a1 + 32) addRequestUUID:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 changeState:1];
}

void sub_1B38BD598(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"sandboxExtensions"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1B38BD62C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1B38BD96C()
{
  getpid();
  uint64_t result = sandbox_check();
  byte_1E9CD2B40 = result != 0;
  return result;
}

void sub_1B38BDD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38BDD28(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
LABEL_8:
    if ([*(id *)(a1 + 40) useCount] <= 1) {
      [*(id *)(a1 + 40) setTerminating:1];
    }
    [*(id *)(a1 + 40) unwind:0 force:0];
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 40) requests];
  char v3 = [v2 containsObject:*(void *)(a1 + 32)];

  id v4 = pklog_handle_for_category(7);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 40) uuid];
      os_signpost_id_t v7 = [*(id *)(a1 + 40) multipleInstanceUUID];
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      int v9 = [*(id *)(a1 + 40) version];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v44 = (uint64_t)v8;
      *(_WORD *)int v45 = 2112;
      *(void *)&v45[2] = v9;
      *(_WORD *)&v45[10] = 2112;
      *(void *)&v45[12] = v10;
      _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] ending request: %@", buf, 0x34u);
    }
    __int16 v11 = [*(id *)(a1 + 40) requests];
    [v11 removeObject:*(void *)(a1 + 32)];

    uint64_t v12 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D3258(a1 + 40, (uint64_t)v12, v13, v14, v15, v16, v17, v18, v36, v37, v38, v39, v41, v42, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], v44, *(uint64_t *)v45,
    }
        *(uint64_t *)&v45[8],
        *(uint64_t *)&v45[16],
        v46,
        v47,
        v48);

    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [*(id *)(a1 + 40) uuid];
    id v20 = [*(id *)(a1 + 40) multipleInstanceUUID];
    uint64_t v21 = [*(id *)(a1 + 40) identifier];
    uint64_t v22 = [*(id *)(a1 + 40) version];
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v44 = (uint64_t)v21;
    *(_WORD *)int v45 = 2112;
    *(void *)&v45[2] = v22;
    *(_WORD *)&v45[10] = 2112;
    *(void *)&v45[12] = v23;
    _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] ignoring expired end request: [%@]", buf, 0x34u);
  }
  uint64_t v24 = [*(id *)(a1 + 40) uuid];
  __int16 v25 = [*(id *)(a1 + 40) multipleInstanceUUID];
  uint64_t v26 = [*(id *)(a1 + 40) identifier];
  uint64_t v40 = [*(id *)(a1 + 40) version];
  uint64_t v33 = pkErrorf(15, @"[u %@:m %@] [%@(%@)] endUsingRequest: called with unknown/expired request [%@]", v27, v28, v29, v30, v31, v32, (uint64_t)v24);
  uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v33;
}

void sub_1B38BE160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38BE178(uint64_t a1, void *a2)
{
}

uint64_t sub_1B38BE8D0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_1B38BEEA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t sub_1B38BEF84(uint64_t a1)
{
  return *(void *)a1;
}

void sub_1B38BEF90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1B38BEFB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t sub_1B38BF030()
{
  return *(void *)v0;
}

uint64_t sub_1B38BF03C()
{
  return *(void *)v0;
}

uint64_t sub_1B38BF048()
{
  return *(void *)v0;
}

uint64_t sub_1B38BF054()
{
  return *(void *)v0;
}

uint64_t sub_1B38BF060()
{
  return *(void *)v0;
}

uint64_t sub_1B38BF06C()
{
  return *(void *)v0;
}

void sub_1B38BF090(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x34u);
}

uint64_t sub_1B38BF0A8()
{
  return v0;
}

uint64_t sub_1B38BF0B4()
{
  return v0;
}

uint64_t sub_1B38BF0C0()
{
  return v0;
}

void sub_1B38BF0CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1B38BF0EC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t sub_1B38BF458(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B38B0000, v2, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> destroying discovery driver", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) removeWatchers];
}

void sub_1B38BF5FC(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count] && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    uint64_t v2 = (void *)MEMORY[0x1B3EBB4E0]();
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v4 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1B38BF8A8;
    v21[3] = &unk_1E6059080;
    id v5 = v3;
    id v22 = v5;
    [v4 enumerateObjectsUsingBlock:v21];
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_1B38BF900;
    uint64_t v19 = &unk_1E60590A8;
    id v7 = v5;
    id v20 = v7;
    uint64_t v8 = [v6 objectsPassingTest:&v16];
    uint64_t v9 = objc_msgSend(v8, "count", v16, v17, v18, v19);
    if (v9 == [*(id *)(a1 + 40) count] && !*(unsigned char *)(a1 + 56))
    {
      uint64_t v14 = pklog_handle_for_category(6);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v15;
        _os_log_impl(&dword_1B38B0000, (os_log_t)v14, OS_LOG_TYPE_INFO, "<PKDiscoveryDriver:%p> no relevant uninstalled plugins", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 48) queue];
      dispatch_assert_queue_V2(v10);

      [*(id *)(a1 + 48) setLastResults:v8];
      __int16 v11 = pklog_handle_for_category(6);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = [v8 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v24 = v12;
        __int16 v25 = 1024;
        int v26 = v13;
        _os_log_impl(&dword_1B38B0000, v11, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)", buf, 0x12u);
      }

      uint64_t v14 = [*(id *)(a1 + 48) report];
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v8, 0);
    }
  }
}

void sub_1B38BF8A8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 pluginUUID];
  [v2 addObject:v3];
}

uint64_t sub_1B38BF900(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 effectiveUUID];
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    id v5 = pklog_handle_for_category(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_DEFAULT, "removing uninstalled plugin %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 ^ 1u;
}

uint64_t sub_1B38BFBA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeWatchers];
}

void sub_1B38BFBA8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastResults];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);

    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      pkError(13, @"query cancelled");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
    }
  }
}

void sub_1B38BFC44(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained report];
  uint64_t v3 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)MEMORY[0x1B3EBB710](v2);
    int v6 = 134217984;
    int v7 = v4;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "Annotations changed, re-performing query for continuous discovery, report block = <%p>.", (uint8_t *)&v6, 0xCu);
  }
  if (v2)
  {
    id v5 = [WeakRetained lastResults];
    [WeakRetained performWithPreviousResults:v5 forceNotify:1];
  }
}

void sub_1B38BFD48(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained report];
  uint64_t v3 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)MEMORY[0x1B3EBB710](v2);
    int v6 = 134217984;
    int v7 = v4;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration effective settings changed, re-performing query for continuous discovery, report block = <%p>.", (uint8_t *)&v6, 0xCu);
  }
  if (v2)
  {
    id v5 = [WeakRetained lastResults];
    [WeakRetained performWithPreviousResults:v5 forceNotify:1];
  }
}

void sub_1B38BFE4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_1B38BFF1C;
    v7[3] = &unk_1E6058FB8;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t sub_1B38BFF1C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1B38C0418(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) wdriver];
  if (v2)
  {
    id v5 = v2;
    uint64_t v3 = [*(id *)(a1 + 40) count];
    uint64_t v4 = [v5 lastResults];
    if (v3) {
      [v5 _performWithPreviousResults:v4 forceNotify:0 uninstalledProxies:*(void *)(a1 + 40)];
    }
    else {
      [v5 performWithPreviousResults:v4 forceNotify:0];
    }

    uint64_t v2 = v5;
  }
}

void sub_1B38C0600(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) daemon];
  id v5 = [v4 errorInReply:v3];

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) daemon];
    int v7 = xpc_dictionary_get_value(v3, "matches");
    id v8 = [v6 convertFromXPC:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v10 = [v8 objectForKeyedSubscript:@"uuid"];
    __int16 v11 = (void *)[v9 initWithUUIDString:v10];

    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint8_t v36 = sub_1B38B78AC;
    uint64_t v37 = sub_1B38B7874;
    id v38 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v12 = [*(id *)(a1 + 32) hostQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38C08F8;
    block[3] = &unk_1E6059198;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v27 = &v33;
    void block[4] = v13;
    id v14 = v11;
    id v25 = v14;
    uint64_t v28 = &v29;
    id v15 = v8;
    id v26 = v15;
    dispatch_sync(v12, block);

    if (*((unsigned char *)v30 + 24))
    {
      uint64_t v17 = [(id)v34[5] _syncQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1B38C0A04;
      v20[3] = &unk_1E60591C0;
      uint64_t v23 = &v33;
      id v18 = v15;
      uint64_t v19 = *(void *)(a1 + 32);
      id v21 = v18;
      uint64_t v22 = v19;
      dispatch_sync(v17, v20);
    }
    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v34[5], 0, v16);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
  }
}

void sub_1B38C08D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B38C08F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) discoveryMap];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    int v6 = [[PKHostPlugIn alloc] initWithForm:*(void *)(a1 + 48) host:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v11 = [*(id *)(a1 + 32) discoveryMap];
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v10 = [v9 uuid];
    [v11 setObject:v9 forKey:v10];
  }
}

uint64_t sub_1B38C0A04(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

void sub_1B38C0AF0(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_array(xdict, "extensions");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1B38C0CB8(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = xpc_dictionary_get_array(xdict, "pidarray");
  uint64_t v4 = xpc_dictionary_get_array(xdict, "uuids");
  id v5 = (void *)v4;
  if (v3)
  {
    int v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  int v6 = 0;
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v7 = objc_opt_new();
  if (xpc_array_get_count(v5))
  {
    size_t v8 = 0;
    do
    {
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", xpc_array_get_uuid(v5, v8));
      [v7 addObject:v9];

      ++v8;
    }
    while (v8 < xpc_array_get_count(v5));
  }
LABEL_9:
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) daemon];
  uint64_t v12 = [v11 errorInReply:xdict];
  (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v12, v6, v7);
}

void sub_1B38C1290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38C12A8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activePlugIns];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v6 && [v6 state] != 1)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    size_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void sub_1B38C1474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38C148C(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) discoveryMap];
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 objectForKey:v3];

  id v5 = [*(id *)(a1 + 40) multipleInstanceUUID];
  if (v5) {
    goto LABEL_2;
  }
  int v6 = *(void **)(a1 + 40);

  if (v4 != v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PKHost.m", 408, @"plugin %@ activating but discovery map contains %@", *(void *)(a1 + 40), v4 object file lineNumber description];
LABEL_2:
  }
  uint64_t v7 = [*(id *)(a1 + 32) activePlugIns];
  size_t v8 = [*(id *)(a1 + 40) identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v12)
  {
    if ([v12 state]) {
      goto LABEL_16;
    }
    uint64_t v13 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3678(a1 + 48, v13);
    }

    id v14 = [*(id *)(a1 + 32) activePlugIns];
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
    [v14 removeObjectForKey:v15];

    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
  id v18 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [*(id *)(a1 + 40) uuid];
    id v20 = [*(id *)(a1 + 40) multipleInstanceUUID];
    id v21 = [*(id *)(a1 + 40) identifier];
    uint64_t v22 = [*(id *)(a1 + 40) version];
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = v19;
    __int16 v40 = 2114;
    uint64_t v41 = v20;
    __int16 v42 = 2112;
    uint64_t v43 = v21;
    __int16 v44 = 2112;
    int v45 = v22;
    _os_log_impl(&dword_1B38B0000, v18, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] activating plugin", buf, 0x2Au);
  }
  uint64_t v23 = [*(id *)(a1 + 40) multipleInstanceUUID];

  if (!v23)
  {
    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = [*(id *)(a1 + 32) activePlugIns];
    id v26 = [*(id *)(a1 + 40) identifier];
    [v25 setObject:v24 forKeyedSubscript:v26];
  }
  uint64_t v27 = [*(id *)(a1 + 32) activeOneShots];
  uint64_t v28 = [*(id *)(a1 + 40) effectiveUUID];
  uint64_t v29 = [v27 objectForKeyedSubscript:v28];

  if (v29)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v34 = *(void *)(a1 + 56);
    uint64_t v35 = *(void *)(a1 + 32);
    uint8_t v36 = [*(id *)(a1 + 40) effectiveUUID];
    uint64_t v37 = [v36 UUIDString];
    [v33 handleFailureInMethod:v34, v35, @"PKHost.m", 423, @"superseding active UUID: %@", v37 object file lineNumber description];
  }
  uint64_t v30 = *(void *)(a1 + 40);
  uint64_t v31 = [*(id *)(a1 + 32) activeOneShots];
  char v32 = [*(id *)(a1 + 40) effectiveUUID];
  [v31 setObject:v30 forKeyedSubscript:v32];

LABEL_16:
}

void sub_1B38C1934(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    uint64_t v4 = [*(id *)(a1 + 32) multipleInstanceUUID];
    id v5 = [*(id *)(a1 + 32) identifier];
    int v6 = [*(id *)(a1 + 32) version];
    *(_DWORD *)buf = 138544130;
    uint64_t v28 = v3;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    __int16 v31 = 2112;
    char v32 = v5;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    _os_log_impl(&dword_1B38B0000, v2, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] deactivating plugin", buf, 0x2Au);
  }
  uint64_t v7 = [*(id *)(a1 + 32) multipleInstanceUUID];

  if (!v7)
  {
    size_t v8 = [*(id *)(a1 + 40) activePlugIns];
    uint64_t v9 = [*(id *)(a1 + 32) identifier];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v11 = [v10 identifier];
      uint64_t v12 = [*(id *)(a1 + 32) identifier];
      int v13 = [v11 isEqualToString:v12] ^ 1;
    }
    else
    {
      int v13 = 0;
    }
    if (v13)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PKHost.m", 435, @"deactivating plugin %@ but encountered %@", *(void *)(a1 + 32), v10 object file lineNumber description];
    }
    id v15 = [*(id *)(a1 + 40) activePlugIns];
    uint64_t v16 = [*(id *)(a1 + 32) identifier];
    [v15 removeObjectForKey:v16];
  }
  uint64_t v17 = [*(id *)(a1 + 40) activeOneShots];
  id v18 = [*(id *)(a1 + 32) effectiveUUID];
  uint64_t v19 = [v17 objectForKeyedSubscript:v18];

  if (!v19)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    id v25 = [*(id *)(a1 + 32) effectiveUUID];
    id v26 = [v25 UUIDString];
    [v22 handleFailureInMethod:v23, v24, @"PKHost.m", 438, @"deactivating inactive UUID: %@", v26 object file lineNumber description];
  }
  id v20 = [*(id *)(a1 + 40) activeOneShots];
  id v21 = [*(id *)(a1 + 32) effectiveUUID];
  [v20 removeObjectForKey:v21];
}

void sub_1B38C1CEC(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v5 infoDictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + _Block_object_dispose(&STACK[0x2A0], 8) = v2;
}

void sub_1B38C1DEC(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x2A0], 8) = a1;
}

uint64_t sub_1B38C1E18()
{
  return *(void *)(*(void *)(*(void *)v0 + 8) + 40);
}

void sub_1B38C1E28(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1B38C1E48(void *a1, uint64_t a2, void *a3, unsigned int a4, void *a5, void *a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v24 = a6;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v22 = v9;
  [v11 setObject:v9 forKeyedSubscript:MEMORY[0x1E4F1CBF0]];
  if ([v11 count])
  {
    uint64_t v27 = v11;
    do
    {
      context = (void *)MEMORY[0x1B3EBB4E0]();
      uint64_t v12 = [v11 allKeys];
      int v13 = [v12 firstObject];

      id v14 = [v11 objectForKeyedSubscript:v13];
      [v11 removeObjectForKey:v13];
      id v15 = [a1 _mutableDictionaryAtKeyPath:v13];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = [v14 allKeys];
      unint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v32;
        do
        {
          uint64_t v18 = 0;
          if (v16 <= 1) {
            uint64_t v19 = 1;
          }
          else {
            uint64_t v19 = v16;
          }
          do
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
            id v21 = [v13 arrayByAddingObject:v20];
            if (v10 && [v10 containsObject:v21])
            {
              [a1 _overlayCustomValueAtKeyPath:v21 intoTargetDictionary:v15 fromSourceDictionary:v14 handler:v24];
            }
            else
            {
              v28[0] = MEMORY[0x1E4F143A8];
              v28[1] = 3221225472;
              v28[2] = sub_1B38C211C;
              v28[3] = &unk_1E6059370;
              id v29 = v27;
              id v30 = v21;
              [a1 _overlayValueAtKey:v20 intoTargetDictionary:v15 fromSourceDictionary:v14 targetTakePrecedent:a4 nestedDictionaryHandler:v28];
            }
            ++v18;
          }
          while (v19 != v18);
          unint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v16);
      }

      id v11 = v27;
    }
    while ([v27 count]);
  }
}

uint64_t sub_1B38C211C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_1B38C212C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      if (v5 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v5;
      }
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v7) mutableCopy];
        id v10 = [v9 lastObject];
        [v9 removeLastObject];
        id v11 = [a1 _mutableDictionaryAtKeyPath:v9];
        [v11 removeObjectForKey:v10];

        ++v7;
      }
      while (v8 != v7);
      unint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void sub_1B38C2274(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6, void *a7)
{
  id v16 = a3;
  id v11 = a4;
  long long v12 = a7;
  long long v13 = [a5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12[2](v12, v13);
  }
  else
  {
    if (a6)
    {
      long long v14 = [v11 objectForKeyedSubscript:v16];
      BOOL v15 = v14 == 0;
    }
    else
    {
      BOOL v15 = 1;
    }
    if (v15) {
      [v11 setObject:v13 forKeyedSubscript:v16];
    }
  }
}

void sub_1B38C237C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  long long v12 = [v17 lastObject];
  long long v13 = [v9 objectForKeyedSubscript:v12];
  long long v14 = [v11 objectForKeyedSubscript:v12];

  if (v10)
  {
    BOOL v15 = v10[2](v10, v17, v13, v14);
    id v16 = v9;
    if (v15)
    {
      [v9 setObject:v15 forKeyedSubscript:v12];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v15 = 0;
    id v16 = v9;
  }
  [v16 removeObjectForKey:v12];
LABEL_6:
}

id sub_1B38C2498(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = v5;
    do
    {
      uint64_t v9 = 0;
      if (v6 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v6;
      }
      id v11 = v8;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        long long v13 = [v11 objectForKeyedSubscript:v12];
        uint64_t v8 = [v5 _createOrConvertToMutableDictionaryFromDictionary:v13];
        [v11 setObject:v8 forKeyedSubscript:v12];

        ++v9;
        id v11 = v8;
      }
      while (v10 != v9);
      unint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

id sub_1B38C260C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || (id v5 = (void *)[v3 mutableCopy]) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  return v5;
}

id __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [a1 initForPlugInKitWithOptions:v3];
  }
  else {
  id v4 = [a1 initForPlugInKit];
  }

  return v4;
}

void __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(a2 + 16);
    v2(a2, a1);
  }
  else
  {
    id v3 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1B38D3828(v3);
    }
  }
}

uint64_t __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__(uint64_t a1)
{
  return MEMORY[0x1F4181798](a1, sel_beginUsing_withBundle_);
}

uint64_t pkUseInternalDiagnostics()
{
  if (qword_1E9CD2AF8 != -1) {
    dispatch_once(&qword_1E9CD2AF8, &unk_1F0C15450);
  }
  return byte_1E9CD2B00;
}

uint64_t sub_1B38C29D8()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_1E9CD2B00 = result;
  return result;
}

uint64_t pkRunningboardManaged()
{
  return 1;
}

uint64_t PKAnnotationNotificationSetName(uint64_t result)
{
  qword_1E9CD24D8 = result;
  return result;
}

BOOL PKAnnotationNotificationPost()
{
  uint32_t v0 = notify_post((const char *)qword_1E9CD24D8);
  if (v0)
  {
    uint64_t v1 = pklog_handle_for_category(10);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3964();
    }
  }
  return v0 == 0;
}

BOOL sub_1B38C2AA0(int a1)
{
  uint32_t v1 = notify_cancel(a1);
  if (v1)
  {
    uint64_t v2 = pklog_handle_for_category(10);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3A1C();
    }
  }
  return v1 == 0;
}

id sub_1B38C2B00(void *a1)
{
  id v1 = a1;
  return v1;
}

id pkError(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  if (a2)
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = a2;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a2;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v3 errorWithDomain:@"PlugInKit" code:a1 userInfo:v6];
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = [v3 errorWithDomain:@"PlugInKit" code:a1 userInfo:0];
  }

  return v7;
}

id pkErrorf(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  if (v10)
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = v11;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    long long v14 = [v12 errorWithDomain:@"PlugInKit" code:a1 userInfo:v13];
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PlugInKit" code:a1 userInfo:0];
  }

  return v14;
}

id sub_1B38C2D80(void *a1, uint64_t a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [v5 componentsSeparatedByString:@","];
  unint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v48;
    id v33 = v5;
    id v34 = v4;
    uint64_t v36 = v6;
    uint64_t v39 = *(void *)v48;
LABEL_3:
    uint64_t v9 = 0;
    if (v7 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7;
    }
    uint64_t v40 = v10;
    while (1)
    {
      if (*(void *)v48 != v8) {
        objc_enumerationMutation(v6);
      }
      id v11 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v9), "componentsSeparatedByString:", @":", v33, v34);
      if ([v11 count] != 3)
      {
        uint64_t v42 = pkError(6, v5);

LABEL_45:
        long long v31 = (void *)v42;
        goto LABEL_46;
      }
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      int v13 = [v12 isEqualToString:@"request"];
      uint64_t v41 = v12;
      if (v13 & 1) != 0 || ([v12 isEqualToString:@"reply"]) {
        break;
      }
      uint64_t v42 = pkError(6, v12);
      int v30 = 1;
LABEL_41:

      if (v30) {
        goto LABEL_45;
      }
      if (++v9 == v10)
      {
        unint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_44;
      }
    }
    uint64_t v14 = v13 ^ 1u;
    long long v15 = [v11 objectAtIndexedSubscript:1];
    uint64_t v16 = [v15 integerValue];

    long long v17 = [v11 objectAtIndexedSubscript:2];
    if ([v17 characterAtIndex:0] == 123)
    {
      if (objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v17, "length") - 1) == 125)
      {
        uint64_t v37 = v16;
        long long v18 = [MEMORY[0x1E4F1CA80] set];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        int v19 = 1;
        uint64_t v20 = objc_msgSend(v17, "substringWithRange:", 1, objc_msgSend(v17, "length") - 2);
        id v21 = [v20 componentsSeparatedByString:@"+"];

        unint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v22)
        {
          unsigned int v35 = v14;
          uint64_t v23 = *(void *)v44;
          do
          {
            uint64_t v24 = 0;
            if (v22 <= 1) {
              uint64_t v25 = 1;
            }
            else {
              uint64_t v25 = v22;
            }
            do
            {
              if (*(void *)v44 != v23) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(id *)(*((void *)&v43 + 1) + 8 * v24);
              Class v27 = objc_lookUpClass((const char *)[v26 UTF8String]);
              if (!v27)
              {
                uint64_t v42 = pkError(6, v26);
                int v19 = 0;
                goto LABEL_35;
              }
              [v18 addObject:v27];
              ++v24;
            }
            while (v25 != v24);
            unint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v22);
          int v19 = 1;
LABEL_35:
          id v5 = v33;
          id v4 = v34;
          uint64_t v14 = v35;
        }

        uint64_t v8 = v39;
        if (!v19)
        {

          int v30 = 1;
          id v6 = v36;
          goto LABEL_40;
        }
        [v4 setClasses:v18 forSelector:a2 argumentIndex:v37 ofReply:v14];

        id v6 = v36;
        goto LABEL_38;
      }
      uint64_t v42 = pkError(6, v17);
      int v30 = 1;
      uint64_t v8 = v39;
    }
    else
    {
      uint64_t v28 = sub_1B38C3200(v17, 0);
      if (v28)
      {
        id v29 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v28];
        [v4 setInterface:v29 forSelector:a2 argumentIndex:v16 ofReply:v14];
      }
      else
      {
        uint64_t v42 = pkError(6, v17);
      }
      uint64_t v8 = v39;

      if (v28)
      {
LABEL_38:
        int v30 = 0;
        goto LABEL_40;
      }
      int v30 = 1;
    }
LABEL_40:

    uint64_t v10 = v40;
    goto LABEL_41;
  }
LABEL_44:
  long long v31 = 0;
LABEL_46:

  return v31;
}

id sub_1B38C3200(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_getProtocol((const char *)[v3 UTF8String]);
  if (!v4)
  {
    id v5 = [NSString stringWithFormat:@"unable to locate protocol [%@] - check that it is defined and not inadvertently optimized away", v3];
    id v6 = pklog_handle_for_category(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1B38D3A78((uint64_t)v5, v6);

      if (!a2) {
        goto LABEL_5;
      }
    }
    else
    {

      if (!a2)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    pkError(12, v5);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

id sub_1B38C32E8(void *a1, void *a2)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_1B38C3200(v3, a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    id v4 = v4;
    id v26 = v4;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = 0;
    goto LABEL_33;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  unint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    uint64_t v8 = @"__XX_COMPOUND";
    do
    {
      uint64_t v9 = 0;
      if (v6 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v6;
      }
      id v11 = v8;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = [(__CFString *)v11 stringByAppendingFormat:@"__%@", *(void *)(*((void *)&v32 + 1) + 8 * v9)];

        ++v9;
        id v11 = v8;
      }
      while (v10 != v9);
      unint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = @"__XX_COMPOUND";
  }

  uint64_t v12 = v8;
  uint64_t v13 = objc_allocateProtocol((const char *)[(__CFString *)v12 UTF8String]);
  if (v13)
  {
    id v4 = (id)v13;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v5;
    unint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        uint64_t v17 = 0;
        if (v15 <= 1) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v15;
        }
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          sub_1B38C3200(*(void **)(*((void *)&v28 + 1) + 8 * v17), a2);
          int v19 = (Protocol *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {

            int v20 = 0;
            goto LABEL_32;
          }
          protocol_addProtocol((Protocol *)v4, v19);

          ++v17;
        }
        while (v18 != v17);
        unint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    objc_registerProtocol((Protocol *)v4);
    int v20 = 1;
  }
  else
  {
    uint64_t v21 = objc_getProtocol((const char *)[(__CFString *)v12 UTF8String]);
    id v4 = (id)v21;
    int v20 = 1;
    if (a2 && !v21)
    {
      unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39[0] = @"unable to create compound protocol";
      int v20 = 1;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      uint64_t v24 = [v22 errorWithDomain:@"PlugInKit" code:12 userInfo:v23];

      id v25 = v24;
      id v4 = 0;
      *a2 = v25;
    }
  }
LABEL_32:

  if (v20) {
    goto LABEL_33;
  }
  id v26 = 0;
LABEL_34:

  return v26;
}

uint64_t pkIsInSpecialSession()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint32_t v0 = pklog_handle_for_category(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    uint64_t v3 = 0;
    __int16 v4 = 1024;
    int v5 = 0;
    _os_log_impl(&dword_1B38B0000, v0, OS_LOG_TYPE_INFO, "vproc manager: [%s], in special session: %d", (uint8_t *)&v2, 0x12u);
  }

  return 0;
}

uint64_t pkIsServiceAccount()
{
  return 0;
}

uint64_t sub_1B38C370C()
{
  return 0;
}

id sub_1B38C3714(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  unint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      if (v9 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v9;
      }
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * v11));
        if (v13) {
          objc_msgSend(v7, "addObject:", v13, (void)v15);
        }

        ++v11;
      }
      while (v12 != v11);
      unint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

uint64_t sub_1B38C3888(uint64_t a1)
{
  return MEMORY[0x1F4181798](a1, sel_compare_options_);
}

id sub_1B38C3890(void *a1)
{
  if (([a1 conformsToProtocol:&unk_1F0C295B0] & 1) == 0) {
    sub_1B38D3AF0();
  }
  int v2 = sub_1B38C38E0(a1);
  return v2;
}

__CFString *sub_1B38C38E0(void *a1)
{
  id v1 = a1;
  int v2 = (const _xpc_type_s *)MEMORY[0x1B3EBBC90]();
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"(%s)", xpc_type_get_name(v2));
  if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14570])
  {
    if (v1 == (id)MEMORY[0x1E4F14518]) {
      id v5 = @"true";
    }
    else {
      id v5 = @"false";
    }
    uint64_t v6 = v5;
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145C0])
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:xpc_int64_get_value(v1)];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145F8])
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedLongLong:xpc_uint64_get_value(v1)];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14598])
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithDouble:xpc_double_get_value(v1)];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14588])
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)xpc_date_get_value(v1) / 1000000000.0];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14580])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    uint64_t v6 = (__CFString *)[v7 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F145F0])
  {
    uint64_t v6 = (__CFString *)[[NSString alloc] initWithCString:xpc_string_get_string_ptr(v1) encoding:4];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14600])
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14590])
  {
    sub_1B38C3E48(v1);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14568])
  {
    sub_1B38C3EF8(v1);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != (const _xpc_type_s *)MEMORY[0x1E4F145A8])
    {
      __int16 v4 = 0;
      goto LABEL_28;
    }
    id v9 = [NSString alloc];
    uint64_t v6 = (__CFString *)objc_msgSend(v9, "initWithFormat:", @"%s", xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E4F14530]));
  }
  __int16 v4 = v6;
LABEL_28:
  if (v4)
  {
    if (v2 == (const _xpc_type_s *)MEMORY[0x1E4F14590] || v2 == (const _xpc_type_s *)MEMORY[0x1E4F14568]) {
      uint64_t v10 = v4;
    }
    else {
      uint64_t v10 = (__CFString *)[[NSString alloc] initWithFormat:@"%@: %@", v3, v4];
    }
  }
  else
  {
    uint64_t v10 = v3;
  }
  uint64_t v11 = v10;

  return v11;
}

id sub_1B38C3C40(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [a1 pluginUUID];
  id v14 = 0;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithUUID:v2 error:&v14];
  id v4 = v14;
  if (v3)
  {
    id v5 = [v3 containingBundleRecord];
    uint64_t v6 = [v5 managedPersonas];

    if ([v6 count])
    {
      id v7 = v6;
      id v8 = pklog_handle_for_category(13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [a1 pluginUUID];
        uint64_t v10 = [a1 pluginIdentifier];
        uint64_t v11 = [a1 bundleVersion];
        *(_DWORD *)buf = 138544130;
        long long v16 = v9;
        __int16 v17 = 2112;
        long long v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        unint64_t v22 = v7;
        _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] added persona strings: %@", buf, 0x2Au);
      }
    }
    else
    {
      id v7 = 0;
    }
    id v12 = [v7 copy];
  }
  else
  {
    uint64_t v6 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3B0C((uint64_t)v2, (uint64_t)v4, v6);
    }
    id v7 = 0;
    id v12 = 0;
  }

  return v12;
}

id sub_1B38C3E48(void *a1)
{
  id v1 = a1;
  int v2 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = sub_1B38C3FA8;
  applier[3] = &unk_1E6059398;
  id v3 = v2;
  id v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id sub_1B38C3EF8(void *a1)
{
  id v1 = a1;
  int v2 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = sub_1B38C401C;
  applier[3] = &unk_1E60593C0;
  id v3 = v2;
  id v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t sub_1B38C3FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = sub_1B38C38E0(a3);
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

uint64_t sub_1B38C401C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = sub_1B38C38E0(a3);
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];

  return 1;
}

void sub_1B38C4084(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1B38C40B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

#error "1B38C4C20: call analysis failed (funcsize=111)"

void sub_1B38C4C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1B38C4F88(uint64_t a1, void *a2, void *a3, void *a4)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15[0] = @"NSExtension";
  v15[1] = @"Shared";
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a2;
  uint64_t v11 = [v9 arrayWithObjects:v15 count:2];
  int v12 = [v10 isEqual:v11];

  uint64_t v13 = v8;
  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) mergeSharedResources:v8 into:v7];
  }
  return v13;
}

void sub_1B38C50F8()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint32_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"NSExtension";
  v6[1] = @"CleanTimeout";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v5[0] = @"NSExtension";
  v5[1] = @"NSExtensionSandboxProfile";
  int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, 0);
  id v4 = (void *)qword_1EB2BE130;
  qword_1EB2BE130 = v3;
}

void sub_1B38C54B4()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  size_t v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", &unk_1E9CD2B10, &v5, 0, 0) < 0)
  {
    uint32_t v0 = pklog_handle_for_category(10);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_1B38D3E1C(v0);
    }
  }
  id v1 = [NSString alloc];
  uint64_t v2 = [v1 initWithBytesNoCopy:&unk_1E9CD2B10 length:v5 - 1 encoding:4 freeWhenDone:0];
  uint64_t v3 = (void *)qword_1E9CD2B38;
  qword_1E9CD2B38 = v2;

  id v4 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = qword_1E9CD2B38;
    _os_log_impl(&dword_1B38B0000, v4, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }
}

void sub_1B38C5F48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38C6228(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"NSExtensionFileProviderActionName"];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) localizedStringForKey:v3 value:v3 table:0];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  else
  {
    id v4 = pklog_handle_for_category(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4424();
    }
  }
}

void sub_1B38C6714(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

void sub_1B38C6734(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t sub_1B38C6754()
{
  return v0;
}

uint64_t sub_1B38C6760()
{
  return v0;
}

void sub_1B38C6A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_1B38C6A64(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = pklog_handle_for_category(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [WeakRetained uuid];
    uint64_t v5 = [WeakRetained identifier];
    id v6 = [WeakRetained version];
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    int v8 = 138544130;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 1024;
    int v15 = [v7 processIdentifier];
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] host connection from pid %d interrupted", (uint8_t *)&v8, 0x26u);
  }
}

void sub_1B38C6B9C(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v4 = pklog_handle_for_category(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained uuid];
    id v6 = [WeakRetained identifier];
    id v7 = [WeakRetained version];
    id v8 = objc_loadWeakRetained(a1 + 6);
    *(_DWORD *)buf = 138544130;
    unint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 1024;
    int v28 = [v8 processIdentifier];
    _os_log_impl(&dword_1B38B0000, v4, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] host connection from pid %d invalidated", buf, 0x26u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = objc_msgSend(a1[4], "subsystems", 0);
  unint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      if (v10 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v10;
      }
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          id v15 = objc_loadWeakRetained(v2);
          [v14 communicationsFailed:v15];
        }
        ++v12;
      }
      while (v13 != v12);
      unint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

void sub_1B38C7920(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D45B0();
    }
  }
  id v8 = [v6 objectForKeyedSubscript:@"sandboxExtensions"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1B38C88B8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1B38C891C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_1B38C893C()
{
  return v0;
}

uint64_t sub_1B38C8948()
{
  return v0;
}

void sub_1B38C8B08(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v2 = pklog_handle_for_category(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(a1 + 32) uuid];
      id v4 = [*(id *)(a1 + 32) identifier];
      id v5 = [*(id *)(a1 + 32) version];
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v3;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      __int16 v15 = 2112;
      long long v16 = v5;
      _os_log_impl(&dword_1B38B0000, v2, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] invalidating checkin assertion", buf, 0x20u);
    }
    id v6 = [*(id *)(a1 + 40) external];
    id v7 = [v6 runningboard];
    [v7 plugInHandshakeComplete];
  }
  id v8 = [*(id *)(a1 + 40) timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38C8D14;
  block[3] = &unk_1E6058CF0;
  void block[4] = *(void *)(a1 + 40);
  dispatch_sync(v8, block);

  uint64_t v9 = pklog_handle_for_category(7);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", "", buf, 2u);
  }
}

void sub_1B38C8D14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstHostRequestTimer];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) firstHostRequestTimer];
    dispatch_source_cancel(v3);

    id v4 = *(void **)(a1 + 32);
    [v4 setFirstHostRequestTimer:0];
  }
}

void sub_1B38C91FC()
{
  Class v0 = NSClassFromString(&cfstr_Expkservice.isa);
  if (_os_feature_enabled_impl()) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    uint64_t v2 = objc_alloc_init(PKService);
  }
  else
  {
    uint64_t v3 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Using EXPKService", v6, 2u);
    }

    uint64_t v2 = [(objc_class *)v0 defaultService];
  }
  id v5 = (void *)qword_1EB2BE118;
  qword_1EB2BE118 = (uint64_t)v2;
}

void sub_1B38C9464(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timerQueue];
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2);
  [*(id *)(a1 + 32) setFirstHostRequestTimer:v3];

  id v4 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_source_set_event_handler(v4, &unk_1F0C15550);

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  id v6 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  id v7 = [*(id *)(a1 + 32) firstHostRequestTimer];
  dispatch_resume(v7);
}

void sub_1B38C9558()
{
  Class v0 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_1B38D4A60(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void sub_1B38CAD6C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) terminationTimer];

  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    uint64_t v4 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_set_timer(v4, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) timerQueue];
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
    [*(id *)(a1 + 32) setTerminationTimer:v6];

    uint64_t v7 = [*(id *)(a1 + 32) terminationTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1B38CAF04;
    handler[3] = &unk_1E6058CF0;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v7, handler);

    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    uint64_t v9 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_set_timer(v9, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    uint64_t v4 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_resume(v4);
  }
}

void sub_1B38CAF04(uint64_t a1)
{
  uint64_t v2 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B38B0000, v2, OS_LOG_TYPE_DEFAULT, "Exiting when clean", v5, 2u);
  }

  dispatch_time_t v3 = [*(id *)(a1 + 32) external];
  uint64_t v4 = [v3 sys];
  objc_msgSend(v4, "xpc_transaction_exit_clean");
}

void sub_1B38CB01C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) external];
  dispatch_time_t v3 = [v2 sys];
  objc_msgSend(v3, "xpc_transaction_interrupt_clean_exit");

  uint64_t v4 = [*(id *)(a1 + 32) terminationTimer];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) terminationTimer];
    dispatch_source_cancel(v5);

    dispatch_source_t v6 = *(void **)(a1 + 32);
    [v6 setTerminationTimer:0];
  }
}

void sub_1B38CB228(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x2A0], 8) = a1;
}

void sub_1B38CB240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B38CB430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B38CB448(uint64_t a1, void *a2)
{
}

void sub_1B38CB7A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1B3EBBC90]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    uint64_t v4 = pklog_handle_for_category(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4FFC(a1);
    }
  }
}

uint64_t sub_1B38CC2D4(xpc_object_t *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained) {
    xpc_connection_send_message_with_reply(*((xpc_connection_t *)WeakRetained + 2), a1[4], *((dispatch_queue_t *)WeakRetained + 3), a1[5]);
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1B38CC474(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)uuid = 0;
  uint64_t v11 = 0;
  uint64_t v4 = [v3 uuid];
  [v4 getUUIDBytes:uuid];

  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, uuid);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v3 path];
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v6 UTF8String]);

  uint64_t v7 = [v3 multipleInstanceUUID];

  if (v7)
  {
    dispatch_time_t v8 = [v3 multipleInstanceUUID];
    uint64_t v9 = uuid;
    [v8 getUUIDBytes:uuid];
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)&unk_1B38DE35D;
  }
  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v9);
}

void sub_1B38CC774(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x2A0], 8) = a1;
}

void sub_1B38CC78C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B38CCE2C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B38CD584(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1B38CD8E0()
{
  return 1;
}

uint64_t sub_1B38CE0D4()
{
  qword_1EB2BE0E8 = [[PKManager alloc] initForService:0];
  return MEMORY[0x1F41817F8]();
}

void sub_1B38CE1F4()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)qword_1E9CD2AE8;
  qword_1E9CD2AE8 = (uint64_t)v0;

  dword_1E9CD2AF0 = 0;
}

void sub_1B38CE658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_1B38CE69C(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = [*(id *)(a1 + 32) path];
    int v10 = 134218498;
    id v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugin at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1B38CE9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_1B38CEA3C(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = [*(id *)(a1 + 32) path];
    int v10 = 134218498;
    id v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugin at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1B38CF030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v22 - 144));
  _Unwind_Resume(a1);
}

void sub_1B38CF06C(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = [*(id *)(a1 + 32) bundlePath];
    int v10 = 134218498;
    id v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1B38CF584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 128));
  _Unwind_Resume(a1);
}

void sub_1B38CF5C0(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = [*(id *)(a1 + 32) path];
    int v10 = 134218498;
    id v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1B38CFE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B38CFEB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B38D00E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B38D0104(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B38D0338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B38D035C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B38D059C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B38D05C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B38D07E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B38D080C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B38D0BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B38D0C1C(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  if (v6)
  {
    uint64_t v7 = xpc_dictionary_get_value(v4, "conflicts");

    if (v7)
    {
      uint64_t v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v9 = [v6 userInfo];
      uint64_t v10 = (void *)[v9 mutableCopy];

      [v10 setObject:v8 forKeyedSubscript:@"busyPlugInUUIDs"];
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = [v6 domain];
      uint64_t v13 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(v6, "code"), v10);

      id v6 = (void *)v13;
    }
    uint64_t v14 = pklog_handle_for_category(11);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1B38D56EC();
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(v4, "uuids");

    if (uuid)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      uint64_t v16 = pklog_handle_for_category(11);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = a1[4];
        uint64_t v18 = a1[5];
        uint64_t v19 = a1[8];
        int v23 = 134218754;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2048;
        uint64_t v28 = v19;
        __int16 v29 = 2114;
        long long v30 = v6;
        _os_log_impl(&dword_1B38B0000, v16, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with hold token: [%{public}@]", (uint8_t *)&v23, 0x2Au);
      }

      uint64_t v20 = *(void (**)(void))(a1[6] + 16);
    }
    else
    {
      __int16 v21 = pklog_handle_for_category(11);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_1B38D5668();
      }

      uint64_t v22 = a1[6];
      id v6 = pkError(4, @"missing hold UUID in apparently successful hold request");
      uint64_t v20 = *(void (**)(void))(v22 + 16);
    }
    v20();
  }
}

void sub_1B38D1044(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B38D1068(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(11);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D577C();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 134218242;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v11, 0x16u);
  }
}

void sub_1B38D1304(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B38D1328(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(11);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D57D8();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    int v11 = 134218242;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1B38D163C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1B38D166C(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v10 = pklog_handle_for_category(11);
  int v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1B38D5834((uint64_t)a1, (uint64_t)(a1 + 6), v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = a1[5];
    int v14 = 134218242;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1B38B0000, v11, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v14, 0x16u);
  }
}

void sub_1B38D1958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B38D1984(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained errorInReply:v4];

  uint64_t v7 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v10 = 134218498;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> bulk update extension states completed with error: %@ for %@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1B38D1AF8(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x2A0], 8) = a1;
}

void sub_1B38D1B2C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1B38D1D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v29;
  a24 = v30;
  sub_1B38BF008();
  a16 = *MEMORY[0x1E4F143B8];
  [v31 uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF0C0() multipleInstanceUUID];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF0B4() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF0A8() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEDCC();
  _os_log_fault_impl(&dword_1B38B0000, v25, OS_LOG_TYPE_FAULT, "[u %{public}@:m %{public}@] [%@(%@)] beginUsing called with system or unspecific persona when using an extension that uses the host's persona", &a9, 0x2Au);

  sub_1B38BEE7C();
}

void sub_1B38D1DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v26;
  a24 = v27;
  sub_1B38BF020();
  a16 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = [v28 uuid];
  uint64_t v30 = [v25 multipleInstanceUUID];
  id v31 = [v25 identifier];
  [v25 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEF04();
  _os_log_fault_impl(&dword_1B38B0000, v24, OS_LOG_TYPE_FAULT, "[u %{public}@:m %{public}@] [%@(%@)] Failed to encode subsystem options: %@.", &a9, 0x34u);

  sub_1B38BEE7C();
}

void sub_1B38D1E98(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_FAULT, "Failed to encode subsystem options: %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1B38D1F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v24;
  a24 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  a16 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = [v28 uuid];
  id v31 = [v29 multipleInstanceUUID];
  long long v32 = [v29 identifier];
  long long v33 = [v29 version];
  long long v34 = [v29 requests];
  [v34 count];
  sub_1B38BEFE0();
  a12 = v32;
  sub_1B38BF078();
  sub_1B38BF090(&dword_1B38B0000, v27, v35, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_1B38BEE7C();
}

void sub_1B38D1FFC()
{
}

#error "1B38D20A0: call analysis failed (funcsize=45)"

#error "1B38D215C: call analysis failed (funcsize=45)"

#error "1B38D2218: call analysis failed (funcsize=45)"

void sub_1B38D225C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "Could not report plugin ready to client because the id<PKPlugIn> object went away!", v1, 2u);
}

#error "1B38D230C: call analysis failed (funcsize=42)"

#error "1B38D23BC: call analysis failed (funcsize=42)"

#error "1B38D2470: call analysis failed (funcsize=42)"

#error "1B38D2524: call analysis failed (funcsize=42)"

#error "1B38D25D8: call analysis failed (funcsize=42)"

#error "1B38D26C8: call analysis failed (funcsize=56)"

void sub_1B38D2710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v29;
  a24 = v30;
  sub_1B38BF014();
  [(id)sub_1B38BEF84(v31) uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF03C() multipleInstanceUUID];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF048() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF030() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEE04();
  _os_log_debug_impl(&dword_1B38B0000, v26, OS_LOG_TYPE_DEBUG, "[u %{public}@:m %{public}@] [%@(%@)] Extension process is running", &a9, 0x2Au);

  sub_1B38BEE7C();
}

#error "1B38D2840: call analysis failed (funcsize=42)"

#error "1B38D28F4: call analysis failed (funcsize=42)"

#error "1B38D29A8: call analysis failed (funcsize=42)"

void sub_1B38D29F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v29;
  a24 = v30;
  sub_1B38BEFD0();
  a16 = *MEMORY[0x1E4F143B8];
  [*(id *)(v28 + 32) uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF060() multipleInstanceUUID];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF06C() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF054() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEE3C();
  _os_log_fault_impl(&dword_1B38B0000, v26, OS_LOG_TYPE_FAULT, "[u %{public}@:m %{public}@] [%@(%@)] %@ plugin object used for launch; launched plugin UUID differs from the UUID in"
    " the plugin object used for the request (most likely due to path-based fallback)",
    &a9,
    0x34u);

  sub_1B38BEE7C();
}

void sub_1B38D2AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v29;
  a24 = v30;
  sub_1B38BEFD0();
  a16 = *MEMORY[0x1E4F143B8];
  [*(id *)(v28 + 32) uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF060() multipleInstanceUUID];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF06C() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF054() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEE3C();
  sub_1B38BF090(&dword_1B38B0000, v26, v31, "[u %{public}@:m %{public}@] [%@(%@)] stale plugin object used for launch, but launched plugin found in discovery map: %@", &a9);

  sub_1B38BEE7C();
}

#error "1B38D2BE8: call analysis failed (funcsize=43)"

#error "1B38D2CAC: call analysis failed (funcsize=46)"

#error "1B38D2D68: call analysis failed (funcsize=45)"

#error "1B38D2E18: call analysis failed (funcsize=42)"

#error "1B38D2EC8: call analysis failed (funcsize=42)"

#error "1B38D2FD0: call analysis failed (funcsize=64)"

#error "1B38D3090: call analysis failed (funcsize=45)"

#error "1B38D3150: call analysis failed (funcsize=46)"

void sub_1B38D3194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v26;
  a24 = v27;
  sub_1B38BF020();
  a16 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = [v28 uuid];
  uint64_t v30 = [v25 multipleInstanceUUID];
  uint64_t v31 = [v25 identifier];
  [v25 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38BEF04();
  sub_1B38BF090(&dword_1B38B0000, v24, v32, "[u %{public}@:m %{public}@] [%@(%@)] useBundle: [%@]", &a9);

  sub_1B38BEE7C();
}

void sub_1B38D3258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B38BEE90();
  a23 = v29;
  a24 = v30;
  sub_1B38BF014();
  [(id)sub_1B38BEF84(v31) uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF03C() multipleInstanceUUID];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38BF048() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [(id)sub_1B38BF030() version];
  long long v33 = [*v28 requests];
  [v33 count];
  sub_1B38BEFE0();
  a12 = v27;
  sub_1B38BF078();
  sub_1B38BF090(&dword_1B38B0000, v26, v34, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_1B38BEE7C();
}

void sub_1B38D3334(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 url];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B38B0000, a3, OS_LOG_TYPE_ERROR, "unable to terminate plugin at %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1B38D33E4()
{
}

void sub_1B38D3410(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "could not create extension point record for %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1B38D3498(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_ERROR, "Unexpected class for extension point record: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1B38D3534(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "<PKDiscoveryDriver:%p> error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1B38D35C0()
{
  sub_1B38C1DEC(*MEMORY[0x1E4F143B8]);
  sub_1B38C1E28(&dword_1B38B0000, v0, v1, "[d %@] <PKHost:%p> Failed discovery: PKDiscoverContinuous and PKDiscoverSynchronous incompatible.");
}

void sub_1B38D361C()
{
  sub_1B38C1DEC(*MEMORY[0x1E4F143B8]);
  sub_1B38C1E28(&dword_1B38B0000, v0, v1, "[d %@] <PKHost:%p> Failed discovery: cannot request embedded plug-ins without using the \"UsesEmbeddedCode\" key.");
}

void sub_1B38D3678(uint64_t a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) uuid];
  int v4 = [(id)sub_1B38C1E18() multipleInstanceUUID];
  uint64_t v5 = [(id)sub_1B38C1E18() identifier];
  __int16 v6 = [(id)sub_1B38C1E18() version];
  int v7 = 138544386;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  __int16 v12 = v5;
  __int16 v13 = 2112;
  __int16 v14 = v6;
  __int16 v15 = 2048;
  uint64_t v16 = [(id)sub_1B38C1E18() state];
  _os_log_error_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] purging stale active plugin from state: %lu", (uint8_t *)&v7, 0x34u);
}

void sub_1B38D3828(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1B38B0000, log, OS_LOG_TYPE_FAULT, "Attempt to call back to client with nil completion block.", v1, 2u);
}

void sub_1B38D386C(void *a1)
{
  id v1 = [a1 path];
  [v1 UTF8String];
  sub_1B38C40A0();
  sub_1B38C40B4(&dword_1B38B0000, v2, v3, "issued file extension for [%s]", v4, v5, v6, v7, v8);
}

void sub_1B38D38F0(void *a1)
{
  [a1 UTF8String];
  sub_1B38C40A0();
  sub_1B38C40B4(&dword_1B38B0000, v1, v2, "issued mach extension for [%s]", v3, v4, v5, v6, v7);
}

void sub_1B38D3964()
{
  sub_1B38C4070();
  sub_1B38C4084(&dword_1B38B0000, v0, v1, "could not post notification: %d", v2, v3, v4, v5, v6);
}

void sub_1B38D39C0()
{
  sub_1B38C4070();
  sub_1B38C4084(&dword_1B38B0000, v0, v1, "could not register for notification: %d", v2, v3, v4, v5, v6);
}

void sub_1B38D3A1C()
{
  sub_1B38C4070();
  sub_1B38C4084(&dword_1B38B0000, v0, v1, "could not cancel notification: %d", v2, v3, v4, v5, v6);
}

void sub_1B38D3A78(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1B38D3AF0()
{
}

void sub_1B38D3B0C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "unable to get LSApplicationExtensionRecord for %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1B38D3B94()
{
}

void sub_1B38D3BC0()
{
}

void sub_1B38D3BEC(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 path];
  sub_1B38C66C4();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_1B38D3C98(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "plugin sdk [%{public}@] not registered for platform %u", (uint8_t *)&v3, 0x12u);
}

void sub_1B38D3D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, long long a10, void *a11, long long a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_1B38C66E8();
  a21 = v22;
  a22 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  a14 = *MEMORY[0x1E4F143B8];
  id v28 = [v26 uuid];
  uint64_t v29 = [v27 identifier];
  uint64_t v30 = [v27 version];
  uint64_t v31 = (objc_class *)objc_opt_class();
  uint64_t v32 = NSStringFromClass(v31);
  sub_1B38C66FC();
  *(void *)((char *)&a10 + 6) = v29;
  HIWORD(a10) = v33;
  a11 = v30;
  LOWORD(a12) = 2114;
  *(void *)((char *)&a12 + 2) = v34;
  _os_log_error_impl(&dword_1B38B0000, v25, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] invalid NSExtensionPointIdentifier: [%{public}@]", &a9, 0x2Au);

  sub_1B38C66D4();
}

void sub_1B38D3E1C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "could not get kern.bootsessionuuid", v1, 2u);
}

void sub_1B38D3E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, long long a10, void *a11, long long a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_1B38C66E8();
  a21 = v22;
  a22 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  a14 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = [v28 uuid];
  uint64_t v31 = [v29 identifier];
  uint64_t v32 = [v29 version];
  __int16 v33 = [v27 objectForKeyedSubscript:@"annotations"];
  sub_1B38C66FC();
  *(void *)((char *)&a10 + 6) = v31;
  HIWORD(a10) = v34;
  a11 = v32;
  LOWORD(a12) = 2080;
  *(void *)((char *)&a12 + 2) = "-[PKPlugInCore updateFromForm:]";
  WORD5(a12) = v34;
  *(void *)((char *)&a12 + 12) = v35;
  _os_log_debug_impl(&dword_1B38B0000, v25, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s got annotation from form: %@", &a9, 0x34u);

  sub_1B38C66D4();
}

void sub_1B38D3F70()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v0);
  sub_1B38C66C4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

#error "1B38D4064: call analysis failed (funcsize=38)"

#error "1B38D4104: call analysis failed (funcsize=38)"

void sub_1B38D4144(void *a1)
{
  os_log_t v2 = [a1 uuid];
  os_log_type_t v3 = [a1 identifier];
  [a1 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C6688();
  sub_1B38C66C4();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

#error "1B38D4288: call analysis failed (funcsize=49)"

#error "1B38D4328: call analysis failed (funcsize=38)"

void sub_1B38D4368(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 uuid];
  os_log_t v5 = [a1 identifier];
  [a1 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C6688();
  _os_log_debug_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] no actions found in pkdict", v6, 0x20u);
}

void sub_1B38D4424()
{
  sub_1B38C66E8();
  sub_1B38C66B4();
  os_log_t v2 = [*(id *)(v1 + 48) uuid];
  os_log_type_t v3 = [*(id *)(v0 + 48) identifier];
  __int16 v9 = [*(id *)(v0 + 48) version];
  sub_1B38C66C4();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);

  sub_1B38C66D4();
}

void sub_1B38D4508()
{
  sub_1B38C890C();
  [v3 uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C8948() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C893C() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C8854();
  sub_1B38C88B8(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] failed to construct service personality: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1B38D45B0()
{
  sub_1B38C890C();
  os_log_t v2 = [*(id *)(v1 + 32) uuid];
  id v3 = [v0[4] identifier];
  [v0[4] version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C88D8();
  sub_1B38C88B8(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] failed to prepare plug-in, unable to tell legacy client: %@", v6, v7, v8, v9, v10);
}

void sub_1B38D4664(void *a1)
{
  os_log_t v2 = [a1 uuid];
  id v3 = [a1 identifier];
  [a1 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C888C();
  sub_1B38C891C(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] unable to create service principal", v6, v7, v8, v9, v10);
}

void sub_1B38D4710()
{
  sub_1B38C890C();
  [v3 uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C8948() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C893C() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C88D8();
  sub_1B38C88B8(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] augmentInterface failed: %@", v6, v7, v8, v9, v10);
}

void sub_1B38D47B8(void *a1)
{
  os_log_t v2 = [a1 uuid];
  id v3 = [a1 identifier];
  [a1 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C888C();
  sub_1B38C891C(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] missing protocol specification in Info.plist", v6, v7, v8, v9, v10);
}

void sub_1B38D4864(void *a1)
{
  os_log_t v2 = [a1 uuid];
  id v3 = [a1 identifier];
  [a1 version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C888C();
  sub_1B38C891C(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] principal class not specified in Info.plist", v6, v7, v8, v9, v10);
}

void sub_1B38D4910()
{
  sub_1B38C890C();
  [v3 uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C8948() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C893C() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C8854();
  sub_1B38C88B8(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] principal class \"%{public}@\" not found", v6, v7, v8, v9, v10);
}

void sub_1B38D49B8()
{
  sub_1B38C890C();
  [v3 uuid];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C8948() identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_1B38C893C() version];
  objc_claimAutoreleasedReturnValue();
  sub_1B38C8854();
  sub_1B38C88B8(&dword_1B38B0000, v4, v5, "[u %{public}@] [%@(%@)] principal class \"%{public}@\" failed to instantiate", v6, v7, v8, v9, v10);
}

void sub_1B38D4A60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B38D4AD4()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "Bootstrapping; unable to instantiate service delegate class %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1B38D4B30()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "Bootstrapping; service delegate class %{public}@ does not conform to PKServiceDelegate",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1B38D4B8C()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "Bootstrapping; PlugInKit listener %{public}@ unexpected (rejecting)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1B38D4BE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B38B0000, log, OS_LOG_TYPE_FAULT, "Bootstrapping; Error: Unexpected class for bootstrap for key 'SUBSYSTEM_OPTIONS'. This value must be an NSDictionary.",
    v1,
    2u);
}

void sub_1B38D4C2C()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  _os_log_fault_impl(&dword_1B38B0000, v0, OS_LOG_TYPE_FAULT, "Bootstrapping; misconfigured plugin; external subsystem [%{public}@] not present; possible missing linkage",
    v1,
    0xCu);
}

void sub_1B38D4C94()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "Bootstrapping; external subsystem %{public}@ refused setup",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1B38D4CF0()
{
  sub_1B38CB228(*MEMORY[0x1E4F143B8]);
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "Bootstrapping; external subsystem initializer %{public}@ does not conform to PKModularService",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1B38D4D4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B38D4DC4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 personalities];
  sub_1B38CB25C();
  _os_log_error_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_ERROR, "WARNING! Sole personality requested when nil; THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC"
    " endpoint other than the main service endpoint; personalities: %@",
    v4,
    0xCu);
}

void sub_1B38D4E50(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 uuid];
  uint64_t v7 = [a1 identifier];
  uint64_t v8 = [a1 version];
  uint64_t v9 = [a2 personalities];
  int v10 = 138544130;
  __int16 v11 = v6;
  __int16 v12 = 2112;
  __int16 v13 = v7;
  __int16 v14 = 2112;
  __int16 v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_1B38B0000, a3, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] WARNING! Sole personality is ambiguous; this may lead to erratic behavior; personalities: %@",
    (uint8_t *)&v10,
    0x2Au);
}

void sub_1B38D4F58()
{
  sub_1B38CB25C();
  sub_1B38CB240(&dword_1B38B0000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_1B38D4FB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B38B0000, log, OS_LOG_TYPE_ERROR, "Bootstrapping; failed to get my own sandbox container",
    v1,
    2u);
}

void sub_1B38D4FFC(uint64_t a1)
{
  objc_loadWeakRetained((id *)(a1 + 32));
  sub_1B38CC750();
  sub_1B38CC78C(&dword_1B38B0000, v2, v3, "%@: XPC error talking to pkd: %{public}s", v4, v5, v6, v7, v8);
}

void sub_1B38D5080()
{
  sub_1B38CC774(*MEMORY[0x1E4F143B8]);
  _os_log_error_impl(&dword_1B38B0000, v0, OS_LOG_TYPE_ERROR, "persona missing personaUniqueString: %@", v1, 0xCu);
}

void sub_1B38D50E8(uint64_t a1)
{
  objc_loadWeakRetained((id *)(a1 + 40));
  sub_1B38CC750();
  sub_1B38CC78C(&dword_1B38B0000, v2, v3, "%@: XPC error sending request to pkd: %{public}s", v4, v5, v6, v7, v8);
}

void sub_1B38D516C()
{
  sub_1B38CC774(*MEMORY[0x1E4F143B8]);
  _os_log_error_impl(&dword_1B38B0000, v0, OS_LOG_TYPE_ERROR, "%@: retrying async request", v1, 0xCu);
}

void sub_1B38D51D4(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  sub_1B38CCE2C(&dword_1B38B0000, v2, v3, "unexpectedly succeeded in getting LSApplicationExtensionRecord : %{public}@ when initializing appex bundle at %{public}@ failed", v4, v5, v6, v7, 2u);
}

void sub_1B38D5274()
{
  xpc_strerror();
  sub_1B38CCE2C(&dword_1B38B0000, v0, v1, "failed to init PKBundle with path '%{public}@': %s", v2, v3, v4, v5, 2u);
}

void sub_1B38D5304(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1B38CCE2C(&dword_1B38B0000, v2, v3, "failed to convert Info.plist to dictionary: %@ source=%@", v4, v5, v6, v7, 2u);
}

void sub_1B38D53A4(void *a1)
{
  uint64_t v2 = [a1 path];
  uint64_t v9 = [a1 _bundle];
  sub_1B38CCE2C(&dword_1B38B0000, v3, v4, "failed to retrieve Info.plist for %@ through %@", v5, v6, v7, v8, 2u);
}

void sub_1B38D5458(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B38B0000, a1, OS_LOG_TYPE_ERROR, "failed to consume extension, errno=%{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_1B38D54E4(void *a1)
{
  [a1 handle];
  sub_1B38CD570();
  sub_1B38CD584(&dword_1B38B0000, v1, v2, "consuming extension %ld", v3, v4, v5, v6, v7);
}

void sub_1B38D5554(void *a1)
{
  [a1 handle];
  sub_1B38CD570();
  sub_1B38CD584(&dword_1B38B0000, v1, v2, "releasing extension %ld", v3, v4, v5, v6, v7);
}

void sub_1B38D55C4(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 handle];
  int v4 = *__error();
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1B38B0000, a2, OS_LOG_TYPE_ERROR, "failed to release extension %ld - errno=%{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

void sub_1B38D5668()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1B38D1B4C();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B38B0000, v1, OS_LOG_TYPE_FAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx returned no hold token", v2, 0x20u);
}

void sub_1B38D56EC()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sub_1B38D1B4C();
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_ERROR, "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with error: %@", v4, 0x2Au);
}

void sub_1B38D577C()
{
  sub_1B38D1AF8(*MEMORY[0x1E4F143B8]);
  sub_1B38D1B2C(&dword_1B38B0000, v0, v1, "<PKManager:%p> failed to release hold [%{public}@] with error: %@");
}

void sub_1B38D57D8()
{
  sub_1B38D1AF8(*MEMORY[0x1E4F143B8]);
  sub_1B38D1B2C(&dword_1B38B0000, v0, v1, "<PKManager:%p> failed to release hold [%{public}@] with error: %@");
}

void sub_1B38D5834(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)os_log_t v3 = 134218498;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(a1 + 40);
  *(_WORD *)&v3[22] = 2112;
  sub_1B38D1B2C(&dword_1B38B0000, a2, a3, "<PKManager:%p> failed to release hold [%{public}@] with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(*(void *)(*(void *)a2 + 8) + 40));
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1F40CC740]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181658](name);
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

void objc_enumerationMutation(id obj)
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

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181750](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
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

void objc_registerProtocol(Protocol *proto)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_issue_mach_to_process()
{
  return MEMORY[0x1F40CDE48]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1F40CE728]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1F40CEAA0](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1F40CEB30]();
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1F40CEB38]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1F40CEB40]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1F40CEB50]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1F40CEB58]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_set_bootstrap()
{
  return MEMORY[0x1F40CEC78]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1F40CECC0]();
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1F40CECE8]();
}

uint64_t xpc_copy_bootstrap()
{
  return MEMORY[0x1F40CED08]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_init_services()
{
  return MEMORY[0x1F40CF168]();
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}