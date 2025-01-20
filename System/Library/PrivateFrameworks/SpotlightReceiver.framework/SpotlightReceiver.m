void sub_21B5E787C()
{
  objc_end_catch();
  JUMPOUT(0x21B5E7890);
}

void SpotlightReceiverRegister(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __SpotlightReceiverRegister_block_invoke;
  v8[3] = &unk_2643AE640;
  id v9 = v4;
  id v10 = v3;
  uint64_t v5 = SpotlightReceiverRegister_onceToken;
  id v6 = v3;
  id v7 = v4;
  if (v5 != -1) {
    dispatch_once(&SpotlightReceiverRegister_onceToken, v8);
  }
}

void __SpotlightReceiverRegister_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [CSReceiverConnection alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v3 = (uint64_t *)(a1 + 40);
  uint64_t v5 = [(CSReceiverConnection *)v2 initWithReceiver:*(v3 - 1) forServiceName:v4];
  id v6 = (void *)SpotlightReceiverRegister_sCSReceiverConnection;
  SpotlightReceiverRegister_sCSReceiverConnection = v5;

  if (SpotlightReceiverRegister_sCSReceiverConnection)
  {
    [(id)SpotlightReceiverRegister_sCSReceiverConnection startListener];
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *v3;
      int v9 = 134218242;
      uint64_t v10 = SpotlightReceiverRegister_sCSReceiverConnection;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21B5E5000, v7, OS_LOG_TYPE_INFO, "CSReceiver %p running for %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __SpotlightReceiverRegister_block_invoke_cold_1(v3, v7);
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void SpotlightDaemonClientRegister(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __SpotlightDaemonClientRegister_block_invoke;
  v8[3] = &unk_2643AE640;
  id v9 = v4;
  id v10 = v3;
  uint64_t v5 = SpotlightDaemonClientRegister_onceToken;
  id v6 = v3;
  id v7 = v4;
  if (v5 != -1) {
    dispatch_once(&SpotlightDaemonClientRegister_onceToken, v8);
  }
}

void __SpotlightDaemonClientRegister_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [SpotlightDaemonClientConnection alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v3 = (id *)(a1 + 40);
  uint64_t v5 = [(SpotlightDaemonClientConnection *)v2 initWithClient:*(v3 - 1) forServiceName:v4];
  id v6 = (void *)SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection;
  SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection = v5;

  if (SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection)
  {
    [(id)SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection startListener];
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *v3;
      int v14 = 134218242;
      uint64_t v15 = SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_21B5E5000, v7, OS_LOG_TYPE_INFO, "spotlight_daemon %p running for %@", (uint8_t *)&v14, 0x16u);
    }

    id v9 = logForCSLogCategoryDaemonClient();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    __int16 v11 = logForCSLogCategoryDaemonClient();
    uint64_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      if (*v3) {
        uint64_t v13 = (void *)[*v3 UTF8String];
      }
      else {
        uint64_t v13 = &unk_21B5EB0FF;
      }
      int v14 = 136315138;
      uint64_t v15 = (uint64_t)v13;
      _os_signpost_emit_with_name_impl(&dword_21B5E5000, v12, OS_SIGNPOST_EVENT, v10, "ClientRegister", "%s", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __SpotlightDaemonClientRegister_block_invoke_cold_1((uint64_t *)v3, v12);
    }
  }
}

uint64_t _SpotlightDaemonClientHandleCommand(const char *a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v82 = (uint64_t)a1;
    __int16 v83 = 2048;
    uint64_t v84 = (uint64_t)v5;
    _os_log_impl(&dword_21B5E5000, v7, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _SpotlightDaemonClientHandleCommand daemon client command %s info:%p", buf, 0x16u);
  }

  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = ___SpotlightDaemonClientHandleCommand_block_invoke;
  v78[3] = &unk_2643AE668;
  id v8 = v5;
  id v79 = v8;
  id v9 = (void (**)(void, void, void, void, void))MEMORY[0x21D491620](v78);
  if (!strcmp(a1, "s"))
  {
    v9[2](v9, 0, 0, 0, 0);
    uint64_t v20 = 1;
    goto LABEL_50;
  }
  if (!strcmp(a1, "ri"))
  {
    id obj = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v8];
    v51 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v8];
    v26 = (void *)MEMORY[0x263F02B30];
    v27 = xpc_dictionary_get_value(v8, "idsa");
    v21 = (void *)[v26 copyNSStringArrayFromXPCArray:v27];

    v22 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"rire" fromXPCDictionary:v8];
    if (v21)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_43;
      }
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_2;
      v76[3] = &unk_2643AE690;
      v24 = (id *)&v77;
      v77 = v9;
      dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v76);
      [v6 reindexItemsWithIdentifiers:v21 bundleID:v51 protectionClass:obj acknowledgementHandler:v25];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (objc_opt_respondsToSelector())
        {
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_4;
          v72[3] = &unk_2643AE690;
          v24 = (id *)&v73;
          v73 = v9;
          dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v72);
          [v6 reindexAllItemsForBundleID:v51 protectionClass:obj acknowledgementHandler:v25];
          goto LABEL_42;
        }
        goto LABEL_43;
      }
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_3;
      v74[3] = &unk_2643AE690;
      v24 = (id *)&v75;
      v75 = v9;
      dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v74);
      [v6 reindexAllItemsForBundleID:v51 protectionClass:obj reason:v22 acknowledgementHandler:v25];
    }
    goto LABEL_42;
  }
  int v10 = strcmp(a1, "pd");
  if (!v10 || !strcmp(a1, "pu"))
  {
    id obj = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"id" fromXPCDictionary:v8];
    if (!obj) {
      goto LABEL_45;
    }
    v51 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v8];
    if (!v51) {
      goto LABEL_44;
    }
    v21 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v8];
    v22 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"t" fromXPCDictionary:v8];
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "po");
    if (!v10)
    {
      if (objc_opt_respondsToSelector())
      {
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_36;
        v68[3] = &unk_2643AE6E0;
        v24 = (id *)&v69;
        v69 = v9;
        dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v68);
        [v6 provideDataForBundleID:v51 protectionClass:v21 itemIdentifier:obj typeIdentifier:v22 options:uint64 completionHandler:v25];
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_43;
    }
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_2_41;
    v66[3] = &unk_2643AE708;
    v24 = (id *)&v67;
    v67 = v9;
    dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v66);
    [v6 provideFileURLForBundleID:v51 protectionClass:v21 itemIdentifier:obj typeIdentifier:v22 options:uint64 completionHandler:v25];
LABEL_42:

    id v9 = 0;
    goto LABEL_43;
  }
  if (strcmp(a1, "pus"))
  {
    if (!strcmp(a1, "siu"))
    {
      __int16 v11 = (void *)MEMORY[0x263F02B30];
      uint64_t v12 = xpc_dictionary_get_value(v8, "si");
      uint64_t v13 = (void *)[v11 copyNSArrayFromXPCArray:v12];

      id v14 = v8;
      uint64_t v15 = xpc_dictionary_get_uint64(v8, "iam");
      __int16 v16 = [MEMORY[0x263EFF980] array];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_5;
      v70[3] = &unk_2643AE6B8;
      id v17 = v16;
      id v71 = v17;
      [v13 enumerateObjectsUsingBlock:v70];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v18 = [v17 firstObject];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || !v17)
        {

          goto LABEL_54;
        }
        uint64_t v19 = [v17 count];

        if (!v19)
        {
LABEL_54:
          v42 = logForCSLogCategoryDaemonClient();
          os_signpost_id_t v43 = os_signpost_id_generate(v42);

          v44 = logForCSLogCategoryDaemonClient();
          v45 = v44;
          if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            uint64_t v46 = [v17 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v82 = v46;
            __int16 v83 = 2048;
            uint64_t v84 = v15;
            _os_signpost_emit_with_name_impl(&dword_21B5E5000, v45, OS_SIGNPOST_EVENT, v43, "ClientNotified", "count:%ld, mask:0x%lx", buf, 0x16u);
          }

          [v6 searchableItemsDidUpdate:v17 mask:v15];
        }
      }
      v9[2](v9, 0, 0, 0, 0);

      uint64_t v20 = 1;
      id v9 = (void (**)(void, void, void, void, void))v13;
      id v8 = v14;
      goto LABEL_50;
    }
    goto LABEL_46;
  }
  v28 = (void *)MEMORY[0x263F02B30];
  v29 = xpc_dictionary_get_array(v8, "idsa");
  v30 = (void *)[v28 copyNSStringArrayFromXPCArray:v29];

  id obj = v30;
  if (v30)
  {
    v51 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v8];
    if (v51)
    {
      v21 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v8];
      v22 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"t" fromXPCDictionary:v8];
      uint64_t v31 = xpc_dictionary_get_uint64(v8, "po");
      if (objc_opt_respondsToSelector())
      {
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_3_47;
        v64[3] = &unk_2643AE730;
        v24 = (id *)&v65;
        v65 = v9;
        dispatch_group_t v25 = (dispatch_group_t)MEMORY[0x21D491620](v64);
        [v6 provideFileURLsForBundleID:v51 protectionClass:v21 itemIdentifiers:v30 typeIdentifier:v22 options:v31 completionHandler:v25];
        goto LABEL_42;
      }
      if (objc_opt_respondsToSelector())
      {
        v48 = a1;
        v50 = v6;
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_4_51;
        v62[3] = &unk_2643AE730;
        v63 = v9;
        v47 = (void *)MEMORY[0x21D491620](v62);
        dispatch_group_t v25 = dispatch_group_create();
        v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v30, "count"));
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id obj = v30;
        uint64_t v33 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v59 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v37 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              dispatch_group_enter(v25);
              v55[0] = MEMORY[0x263EF8330];
              v55[1] = 3221225472;
              v55[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_5_52;
              v55[3] = &unk_2643AE758;
              id v56 = v32;
              v57 = v25;
              [v50 provideFileURLForBundleID:v51 protectionClass:v21 itemIdentifier:v37 typeIdentifier:v22 options:v31 completionHandler:v55];
            }
            uint64_t v34 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
          }
          while (v34);
        }

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_6;
        block[3] = &unk_2643AE780;
        id v53 = v32;
        id v54 = v47;
        id v38 = v32;
        id v39 = v47;
        dispatch_group_notify(v25, MEMORY[0x263EF83A0], block);

        id v6 = v50;
        a1 = v48;
        v24 = (id *)&v63;
        goto LABEL_42;
      }
LABEL_43:
    }
LABEL_44:
  }
LABEL_45:

LABEL_46:
  if (!v9)
  {
    uint64_t v20 = 1;
    goto LABEL_52;
  }
  v40 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v82 = (uint64_t)a1;
    __int16 v83 = 2048;
    uint64_t v84 = (uint64_t)v8;
    _os_log_impl(&dword_21B5E5000, v40, OS_LOG_TYPE_DEFAULT, "command not handled: %s info:%p", buf, 0x16u);
  }

  uint64_t v20 = 0;
LABEL_50:

LABEL_52:
  return v20;
}

void __SpotlightReceiverRegister_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21B5E5000, a2, OS_LOG_TYPE_ERROR, "Error setting up receiver for %@", (uint8_t *)&v3, 0xCu);
}

void __SpotlightDaemonClientRegister_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21B5E5000, a2, OS_LOG_TYPE_ERROR, "Error setting up reciever for %@", (uint8_t *)&v3, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x270F4A6D8]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x270F4A6E0]();
}

uint64_t _MDPlistArrayIterate()
{
  return MEMORY[0x270F4A6E8]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x270F4A730]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x270F4A7A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

uint64_t logForCSLogCategoryDaemonClient()
{
  return MEMORY[0x270EE8638]();
}

uint64_t logForCSLogCategoryDefault()
{
  return MEMORY[0x270EE8640]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBE88](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC070](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
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

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}