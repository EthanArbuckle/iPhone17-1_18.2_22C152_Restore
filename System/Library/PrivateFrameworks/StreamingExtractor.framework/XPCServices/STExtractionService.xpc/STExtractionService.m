void *sub_100001720()
{
  if (qword_10000D338 != -1) {
    dispatch_once(&qword_10000D338, &stru_1000082D8);
  }
  return off_10000D0E0;
}

void sub_100001760(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor", v1);
  v3 = off_10000D0E0;
  off_10000D0E0 = v2;
}

void *sub_100001790()
{
  if (qword_10000D340 != -1) {
    dispatch_once(&qword_10000D340, &stru_1000082F8);
  }
  return off_10000D0E8;
}

void sub_1000017D0(id a1)
{
  v1 = STGetLoggingCategory();
  os_log_t v2 = os_log_create("com.apple.StreamingExtractor.signposts", v1);
  v3 = off_10000D0E8;
  off_10000D0E8 = v2;
}

id sub_100001800(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a3;
  v17 = a4;
  id v18 = a5;
  v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"[%s:%d][%s] %@", a7, a8, a6, v16]);
  v20 = sub_100001720();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v26 = &stru_1000086C0;
    *(_DWORD *)buf = 136448002;
    v28 = "STCreateErrorWithInfo";
    __int16 v29 = 2080;
    if (v17) {
      CFStringRef v26 = v17;
    }
    uint64_t v30 = a7;
    __int16 v31 = 1024;
    int v32 = a8;
    __int16 v33 = 2080;
    uint64_t v34 = a6;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2048;
    uint64_t v38 = a2;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 2112;
    CFStringRef v42 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n", buf, 0x4Eu);
  }

  if (v18) {
    id v22 = [v18 mutableCopy];
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:2]);
  }
  v23 = v22;
  [v22 setObject:v19 forKey:NSDebugDescriptionErrorKey];
  if (v17) {
    [v23 setObject:v17 forKey:NSUnderlyingErrorKey];
  }
  v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:v15 code:a2 userInfo:v23]);

  return v24;
}

id sub_100001A14(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100001800(a1, a2, a3, a4, 0, a5, a6, a7);
}

const char *STGetLoggingCategory()
{
  return "STExtractionService";
}

id sub_100001E54(uint64_t a1)
{
  os_log_t v2 = sub_100001720();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sessionID]);
    int v7 = 136446722;
    v8 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Connection interrupted [%@ - %@]", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(a1 + 40) connectionInterrupted];
}

id sub_100001F34(uint64_t a1)
{
  os_log_t v2 = sub_100001720();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sessionID]);
    int v7 = 136446722;
    v8 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Connection invalidated [%@ - %@]", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 40) connectionInvalidated];
  return [*(id *)(a1 + 40) setXpcConnection:0];
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = sub_100001720();
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446722;
    v12 = "main";
    __int16 v13 = 2080;
    v14 = "Nov 10 2024";
    __int16 v15 = 2080;
    id v16 = "02:19:23";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Service started (built at %s %s)", (uint8_t *)&v11, 0x20u);
  }

  _set_user_dir_suffix("com.apple.STExtractionService");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);

  dispatch_source_set_event_handler(v7, &stru_100008388);
  dispatch_resume(v7);
  v8 = objc_opt_new(STExtractionServiceDelegate);
  __int16 v9 = objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener]);
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

void sub_10000218C(id a1)
{
  v1 = sub_100001720();
  os_log_t v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446210;
    uint64_t v4 = "main_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: SIGTERM received - suspending active extractions.", (uint8_t *)&v3, 0xCu);
  }

  xpc_transaction_exit_clean();
  +[STExtractionService setProcessTerminated];
}

void sub_100002240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002404(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000025A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000026C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000026EC(id a1, id a2, BOOL *a3)
{
}

id sub_10000292C(uint64_t a1)
{
  os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    if ([*(id *)(a1 + 32) extractionValid]
      && [*(id *)(a1 + 32) extractionPrepared])
    {
      int v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      [v3 suspendStreamWithCompletionBlock:&stru_100008408];
    }
    uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    char v5 = objc_opt_respondsToSelector(v4, "invalidate");

    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      [v6 invalidate];
    }
  }
  return [*(id *)(a1 + 32) invalidate];
}

id sub_100002A88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_100002C48(uint64_t a1)
{
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_100003930;
  v124[3] = &unk_100008478;
  os_log_t v2 = (id *)(a1 + 32);
  v124[4] = *(void *)(a1 + 32);
  id v125 = *(id *)(a1 + 64);
  v114 = objc_retainBlock(v124);
  int v3 = objc_claimAutoreleasedReturnValue([v2[1] objectForKeyedSubscript:@"STRemoteExtractorSessionID"]);
  if (!v3 || (uint64_t v4 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    char v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    int v3 = (void *)v6;
  }
  v113 = v3;
  [*(id *)(a1 + 32) setSessionID:v3];
  id v7 = [*(id *)(a1 + 40) mutableCopy];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keyEnumerator]);
  id v9 = [v8 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v121;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v121 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        if ([v13 containsString:@"<Private>"]) {
          [v7 setObject:@"<redacted>" forKeyedSubscript:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v120 objects:v135 count:16];
    }
    while (v10);
  }

  v14 = sub_100001720();
  __int16 v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionID]);
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413059;
    v128 = v16;
    __int16 v129 = 2082;
    v130 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v131 = 2113;
    uint64_t v132 = v17;
    __int16 v133 = 2112;
    id v134 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: sandbox_token: %{private}@ - options: %@", buf, 0x2Au);
  }
  [(id)objc_opt_class(*(void *)(a1 + 32)) addActiveExtractionService:*(void *)(a1 + 32)];
  id v18 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundlePath"]);
  if (v18)
  {
    uint64_t v19 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
    {
      v90 = sub_100001720();
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        sub_100004E30();
      }

      v92 = STExtractorErrorDomain;
      v115 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"bundle path option is not an NSString"]);
      id v93 = sub_100001A14(v92, 3, v115, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 274);
      id v37 = (id)objc_claimAutoreleasedReturnValue(v93);
      goto LABEL_74;
    }
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:v18]);
    if (v20)
    {
      v21 = (void *)v20;
      v115 = 0;
      goto LABEL_27;
    }
  }
  uint64_t v22 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"]);
  uint64_t v23 = objc_opt_class(NSString);
  v115 = (void *)v22;
  if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
  {
    v104 = sub_100001720();
    v105 = objc_claimAutoreleasedReturnValue(v104);
    v49 = v113;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      sub_100004D94();
    }

    v106 = STExtractorErrorDomain;
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"bundle name option is not an NSString"]);
    id v107 = sub_100001A14(v106, 3, v25, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 282);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v107);
    v47 = (void (**)(void, void, void, void))v114;
    goto LABEL_84;
  }
  uint64_t v24 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginDirectory"]);
  if (v24)
  {
    v25 = (__CFString *)v24;
    uint64_t v26 = objc_opt_class(NSString);
    if (objc_opt_isKindOfClass(v25, v26))
    {
      v27 = v18;
      goto LABEL_24;
    }
    v108 = sub_100001720();
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      sub_100004CF8();
    }

    v110 = STExtractorErrorDomain;
    v111 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"plugin directory option is not an NSString"]);
    id v112 = sub_100001A14(v110, 3, v111, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 286);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v112);

    v49 = v113;
    v47 = (void (**)(void, void, void, void))v114;
LABEL_84:

    goto LABEL_46;
  }
  v27 = v18;
  v25 = @"/System/Library/StreamingExtractorPlugins";
LABEL_24:
  v126[0] = v25;
  v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%@.bundle", v115]);
  v126[1] = v28;
  __int16 v29 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:v126 count:2]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:v29]);
  v21 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:v30]);

  __int16 v31 = sub_100001720();
  int v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = (char *)objc_claimAutoreleasedReturnValue([v21 path]);
    *(_DWORD *)buf = 136446466;
    v128 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v129 = 2112;
    v130 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: pluginURL: %@", buf, 0x16u);
  }
  id v18 = v27;
  if (!v21)
  {
    v58 = sub_100001720();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_100004758();
    }

    v60 = STExtractorErrorDomain;
    v61 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"unable to get plugin URL"]);
    id v62 = sub_100001A14(v60, 6, v61, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 299);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v62);

    goto LABEL_74;
  }
LABEL_27:
  uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:v21]);
  if (!v34)
  {
    v63 = sub_100001720();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_1000047F4();
    }

    v65 = STExtractorErrorDomain;
    v66 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"unable to get plugin bundle: %@", v21]);
    id v67 = sub_100001A14(v65, 6, v66, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 302);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v67);

    goto LABEL_60;
  }
  __int16 v35 = v34;
  id v119 = 0;
  unsigned __int8 v36 = [v34 loadAndReturnError:&v119];
  id v37 = v119;
  if ((v36 & 1) == 0)
  {
    v68 = sub_100001720();
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_100004C5C();
    }

    v70 = sub_100001720();
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_100004B9C(v2, (uint64_t)v37, v71);
    }

LABEL_60:
LABEL_74:
    v47 = (void (**)(void, void, void, void))v114;
LABEL_40:
    v49 = v113;
    goto LABEL_46;
  }
  uint64_t v38 = (objc_class *)[v35 principalClass];
  if (!v38)
  {
    v72 = sub_100001720();
    v73 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      sub_100004890();
    }

    v74 = STExtractorErrorDomain;
    v75 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"unable to get principal class from plugin: %@", v21]);
    v76 = v74;
    v77 = v75;
    uint64_t v78 = 306;
    goto LABEL_67;
  }
  __int16 v39 = v38;
  if (([(objc_class *)v38 conformsToProtocol:&OBJC_PROTOCOL___STExtractionPlugin] & 1) == 0)
  {
    v79 = sub_100001720();
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100004B00();
    }

    v81 = STExtractorErrorDomain;
    v75 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"principal class for plugin does not conform to STExtractorPlugin protocol: %@", v21]);
    v76 = v81;
    v77 = v75;
    uint64_t v78 = 307;
LABEL_67:
    id v82 = sub_100001A14(v76, 6, v77, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", v78);
    uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);

    id v37 = (id)v83;
    goto LABEL_74;
  }
  id v40 = *(void **)(a1 + 48);
  if (v40
    && (objc_msgSend(*v2, "setSandboxToken:", sandbox_extension_consume(objc_msgSend(v40, "UTF8String"))), objc_msgSend(*v2, "sandboxToken") == (id) -1))
  {
    v94 = v18;
    v95 = sub_100001720();
    v96 = objc_claimAutoreleasedReturnValue(v95);
    v47 = (void (**)(void, void, void, void))v114;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_100004A64();
    }

    v97 = STExtractorErrorDomain;
    v98 = __error();
    v99 = strerror(*v98);
    v100 = +[NSString stringWithFormat:@"failed to consume sandbox token: %s (%d)", v99, *__error()];
    v101 = objc_claimAutoreleasedReturnValue(v100);
    id v102 = sub_100001A14(v97, 10, v101, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 311);
    uint64_t v103 = objc_claimAutoreleasedReturnValue(v102);

    id v37 = (id)v103;
    v49 = v113;
    id v18 = v94;
  }
  else
  {
    if (![*v2 hasConnection]) {
      goto LABEL_38;
    }
    if (*v2) {
      [*v2 auditToken];
    }
    else {
      memset(v118, 0, sizeof(v118));
    }
    uint64_t v41 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_CANONICAL | 1u;
    [*(id *)(a1 + 56) fileSystemRepresentation];
    int v42 = sandbox_check_by_audit_token(v118, "file-write-create", v41);
    if (!v42)
    {
LABEL_38:
      id v43 = [[v39 alloc] initWithOptions:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setPlugin:v43];

      v44 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
      if (v44)
      {
        v45 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
        uint64_t v46 = *(void *)(a1 + 56);
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_1000039B4;
        v116[3] = &unk_1000084A0;
        v47 = (void (**)(void, void, void, void))v114;
        v48 = v114;
        v116[4] = *(void *)(a1 + 32);
        id v117 = v48;
        [v45 prepareForExtractionToPath:v46 withCompletionBlock:v116];
      }
      else
      {
        v84 = sub_100001720();
        v85 = objc_claimAutoreleasedReturnValue(v84);
        v47 = (void (**)(void, void, void, void))v114;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_1000049C8();
        }

        v86 = STExtractorErrorDomain;
        v87 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"failed to initialize plugin class: %@", v39]);
        id v88 = sub_100001A14(v86, 6, v87, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 323);
        uint64_t v89 = objc_claimAutoreleasedReturnValue(v88);

        id v37 = (id)v89;
      }
      goto LABEL_40;
    }
    if (v42 == -1) {
      uint64_t v50 = *__error();
    }
    else {
      uint64_t v50 = 1;
    }
    v51 = sub_100001720();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v47 = (void (**)(void, void, void, void))v114;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10000492C();
    }

    v53 = STExtractorErrorDomain;
    v54 = +[NSString stringWithFormat:@"cannot write to path: %s (%d)", strerror(v50), v50];
    v55 = objc_claimAutoreleasedReturnValue(v54);
    id v56 = sub_100001A14(v53, 14, v55, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 319);
    uint64_t v57 = objc_claimAutoreleasedReturnValue(v56);

    id v37 = (id)v57;
    v49 = v113;
  }
LABEL_46:

  if (v37) {
    ((void (**)(void, void, void, id))v47)[2](v47, 0, 0, v37);
  }
}

void sub_100003930(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6) {
    [(id)objc_opt_class(v7) removeExtractionService:*(void *)(a1 + 32)];
  }
  else {
    *(unsigned char *)(v7 + 18) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000039B4(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 plugin]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 extractionMemoryFootprint]));
  id v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:v7 forKey:@"STRemoteExtractorMemoryFootprint"]);
  (*(void (**)(uint64_t, void *, uint64_t, id))(v4 + 16))(v4, v8, a2, v6);
}

void sub_100003B30(uint64_t a1)
{
  if (processTerminated)
  {
    uint64_t v7 = sub_100001720();
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005004();
    }

    id v9 = STExtractorErrorDomain;
    id v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"extraction stopped - system is shutting down"]);
    id v11 = sub_100001800(v9, 13, v10, 0, &off_100008B38, (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 351);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

    if (v2)
    {
      if ([*(id *)(a1 + 32) extractionValid])
      {
        int v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100003D94;
        v24[3] = &unk_1000084F0;
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = *(id *)(a1 + 48);
        v24[4] = *(void *)(a1 + 32);
        id v25 = v5;
        [v3 supplyBytes:v4 withCompletionBlock:v24];

        id v6 = v25;
LABEL_5:

        return;
      }
      uint64_t v20 = sub_100001720();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100004F68();
      }

      uint64_t v22 = STExtractorErrorDomain;
      id v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"extraction is invalid - it likely has already been finished, suspended or terminated"]);
      id v16 = v22;
      uint64_t v17 = 8;
      id v18 = v10;
      uint64_t v19 = 353;
    }
    else
    {
      __int16 v13 = sub_100001720();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100004ECC();
      }

      __int16 v15 = STExtractorErrorDomain;
      id v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"no plugin for -supplyBytes"]);
      id v16 = v15;
      uint64_t v17 = 6;
      id v18 = v10;
      uint64_t v19 = 352;
    }
    id v23 = sub_100001A14(v16, v17, v18, 0, (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", v19);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v23);
  }
  id v6 = (void *)v12;

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
}

void sub_100003D94(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) messageQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003E14;
  block[3] = &unk_100008430;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100003E14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_100003EB4(uint64_t a1)
{
  os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 suspendStreamWithCompletionBlock:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) invalidate];
  }
  else
  {
    uint64_t v4 = sub_100001720();
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000050A0();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"no plugin for -suspendStream"]);
    id v8 = sub_100001A14(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_suspendStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 383);
    id v9 = objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100004058(uint64_t a1)
{
  os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 finishStreamWithCompletionBlock:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) invalidate];
  }
  else
  {
    uint64_t v4 = sub_100001720();
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000513C();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"no plugin for -finishStream"]);
    id v8 = sub_100001A14(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_finishStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 408);
    id v9 = objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_10000421C(uint64_t a1)
{
  os_log_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);

  if (v2)
  {
    int v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plugin]);
    [v3 terminateStreamWithError:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];

    [*(id *)(a1 + 32) invalidate];
  }
  else
  {
    uint64_t v4 = sub_100001720();
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000051D8();
    }

    id v6 = STExtractorErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"no plugin for -terminateStream"]);
    id v8 = sub_100001A14(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_terminateStreamWithError:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 434);
    id v9 = objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_100004508(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004540()
{
  sub_100002250();
  sub_100002240((void *)&_mh_execute_header, v0, v1, "%{public}s: Rejecting process %@ since it is not a platform binary.", v2, v3, v4, v5, 2u);
}

void sub_1000045B0()
{
  sub_100002250();
  sub_100002240((void *)&_mh_execute_header, v0, v1, "%{public}s: Rejecting process %@ since csops_audittoken failed.", v2, v3, v4, v5, 2u);
}

void sub_100004620()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_1000046BC()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004758()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_1000047F4()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004890()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_10000492C()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_1000049C8()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004A64()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004B00()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004B9C(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue([*a1 sessionID]);
  int v6 = 138412802;
  uint64_t v7 = v5;
  __int16 v8 = 2082;
  id v9 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[%@] %{public}s: failed to load plugin: %@", (uint8_t *)&v6, 0x20u);

  sub_10000452C();
}

void sub_100004C5C()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004CF8()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004D94()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004E30()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004ECC()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100004F68()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_100005004()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_1000050A0()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_10000513C()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

void sub_1000051D8()
{
  sub_1000044F0();
  sub_100004534();
  sub_100004518();
  sub_100004508((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  sub_10000452C();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_connectionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 connectionInterrupted];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_extractionMemoryFootprint(void *a1, const char *a2, ...)
{
  return [a1 extractionMemoryFootprint];
}

id objc_msgSend_extractionPrepared(void *a1, const char *a2, ...)
{
  return [a1 extractionPrepared];
}

id objc_msgSend_extractionValid(void *a1, const char *a2, ...)
{
  return [a1 extractionValid];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_hasConnection(void *a1, const char *a2, ...)
{
  return [a1 hasConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return [a1 messageQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sandboxToken(void *a1, const char *a2, ...)
{
  return [a1 sandboxToken];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_setProcessTerminated(void *a1, const char *a2, ...)
{
  return [a1 setProcessTerminated];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}