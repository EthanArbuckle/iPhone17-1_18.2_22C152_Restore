id sub_1000010CC()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000D348 != -1) {
    dispatch_once(&qword_10000D348, &stru_1000082D8);
  }
  v0 = off_10000D0F0;
  return v0;
}

void sub_100001120(id a1)
{
  v1 = STGetLoggingCategory();
  off_10000D0F0 = os_log_create("com.apple.StreamingExtractor", v1);
  _objc_release_x1();
}

id sub_100001164()
{
  if (qword_10000D350 != -1) {
    dispatch_once(&qword_10000D350, &stru_1000082F8);
  }
  v0 = off_10000D0F8;
  return v0;
}

void sub_1000011B8(id a1)
{
  v1 = STGetLoggingCategory();
  off_10000D0F8 = os_log_create("com.apple.StreamingExtractor.signposts", v1);
  _objc_release_x1();
}

id sub_1000011FC(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a3;
  v17 = a4;
  id v18 = a5;
  v19 = +[NSString stringWithFormat:@"[%s:%d][%s] %@", a7, a8, a6, v16];
  v20 = sub_1000010CC();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v25 = &stru_1000086C0;
    *(_DWORD *)buf = 136448002;
    v27 = "STCreateErrorWithInfo";
    __int16 v28 = 2080;
    if (v17) {
      CFStringRef v25 = v17;
    }
    uint64_t v29 = a7;
    __int16 v30 = 1024;
    int v31 = a8;
    __int16 v32 = 2080;
    uint64_t v33 = a6;
    __int16 v34 = 2112;
    id v35 = v15;
    __int16 v36 = 2048;
    uint64_t v37 = a2;
    __int16 v38 = 2112;
    id v39 = v16;
    __int16 v40 = 2112;
    CFStringRef v41 = v25;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n", buf, 0x4Eu);
  }

  if (v18)
  {
    id v21 = [v18 mutableCopy];
  }
  else
  {
    id v21 = +[NSMutableDictionary dictionaryWithCapacity:2];
  }
  v22 = v21;
  [v21 setObject:v19 forKey:NSDebugDescriptionErrorKey];
  if (v17) {
    [v22 setObject:v17 forKey:NSUnderlyingErrorKey];
  }
  v23 = +[NSError errorWithDomain:v15 code:a2 userInfo:v22];

  return v23;
}

id sub_100001424(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1000011FC(a1, a2, a3, a4, 0, a5, a6, a7);
}

const char *STGetLoggingCategory()
{
  return "STExtractionService";
}

id sub_10000190C(uint64_t a1)
{
  v2 = sub_1000010CC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) sessionID];
    int v6 = 136446722;
    v7 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Connection interrupted [%@ - %@]", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1 + 40) connectionInterrupted];
}

id sub_1000019F0(uint64_t a1)
{
  v2 = sub_1000010CC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) sessionID];
    int v6 = 136446722;
    v7 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Connection invalidated [%@ - %@]", (uint8_t *)&v6, 0x20u);
  }
  [*(id *)(a1 + 40) connectionInvalidated];
  return [*(id *)(a1 + 40) setXpcConnection:0];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = sub_1000010CC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    __int16 v10 = "main";
    __int16 v11 = 2080;
    v12 = "Nov 10 2024";
    __int16 v13 = 2080;
    v14 = "02:19:24";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Service started (built at %s %s)", (uint8_t *)&v9, 0x20u);
  }

  _set_user_dir_suffix();
  v4 = dispatch_get_global_queue(2, 0);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);

  dispatch_source_set_event_handler(v5, &stru_100008388);
  dispatch_resume(v5);
  int v6 = objc_opt_new();
  v7 = +[NSXPCListener serviceListener];
  [v7 setDelegate:v6];
  [v7 resume];

  return 0;
}

void sub_100001C50(id a1)
{
  v1 = sub_1000010CC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446210;
    uint64_t v3 = "main_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%{public}s: SIGTERM received - suspending active extractions.", (uint8_t *)&v2, 0xCu);
  }

  xpc_transaction_exit_clean();
  +[STExtractionService setProcessTerminated];
}

void sub_100001D1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100001EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002080(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000021A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000021CC(id a1, id a2, BOOL *a3)
{
}

id sub_100002430(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) plugin];

  if (v2)
  {
    if ([*(id *)(a1 + 32) extractionValid]
      && [*(id *)(a1 + 32) extractionPrepared])
    {
      uint64_t v3 = [*(id *)(a1 + 32) plugin];
      [v3 suspendStreamWithCompletionBlock:&stru_100008408];
    }
    v4 = [*(id *)(a1 + 32) plugin];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      int v6 = [*(id *)(a1 + 32) plugin];
      [v6 invalidate];
    }
  }
  v7 = *(void **)(a1 + 32);
  return [v7 invalidate];
}

id sub_1000025D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_1000027C0(uint64_t a1)
{
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_1000034E0;
  v95[3] = &unk_100008478;
  int v2 = (id *)(a1 + 32);
  v95[4] = *(void *)(a1 + 32);
  id v96 = *(id *)(a1 + 64);
  v84 = objc_retainBlock(v95);
  uint64_t v3 = [v2[1] objectForKeyedSubscript:@"STRemoteExtractorSessionID"];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = +[NSUUID UUID];
    uint64_t v5 = [v4 UUIDString];

    uint64_t v3 = (void *)v5;
  }
  v83 = v3;
  [*(id *)(a1 + 32) setSessionID:v3];
  id v6 = [*(id *)(a1 + 40) mutableCopy];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v7 = [*(id *)(a1 + 40) keyEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v92;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        if ([v12 containsString:@"<Private>"]) {
          [v6 setObject:@"<redacted>" forKeyedSubscript:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v9);
  }

  __int16 v13 = sub_1000010CC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [*(id *)(a1 + 32) sessionID];
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413059;
    v99 = v14;
    __int16 v100 = 2082;
    v101 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v102 = 2113;
    uint64_t v103 = v15;
    __int16 v104 = 2112;
    id v105 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: sandbox_token: %{private}@ - options: %@", buf, 0x2Au);
  }
  [(id)objc_opt_class() addActiveExtractionService:*(void *)(a1 + 32)];
  id v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundlePath"];
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v69 = sub_1000010CC();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_100004C54();
      }

      v70 = STExtractorErrorDomain;
      v85 = +[NSString stringWithFormat:@"bundle path option is not an NSString"];
      sub_100001424(v70, 3, v85, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 274);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    }
    uint64_t v17 = +[NSURL fileURLWithPath:v16];
    if (v17)
    {
      id v18 = (void *)v17;
      v85 = 0;
      goto LABEL_27;
    }
  }
  uint64_t v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"];
  objc_opt_class();
  v85 = (void *)v19;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v78 = sub_1000010CC();
    v42 = v83;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      sub_100004BB0();
    }

    v79 = STExtractorErrorDomain;
    id v21 = +[NSString stringWithFormat:@"bundle name option is not an NSString"];
    sub_100001424(v79, 3, v21, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 282);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v40 = (void (**)(void, void, void, void))v84;
    goto LABEL_84;
  }
  uint64_t v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"STRemoteExtractorPluginDirectory"];
  if (v20)
  {
    id v21 = (__CFString *)v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v16;
      goto LABEL_24;
    }
    v80 = sub_1000010CC();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100004B0C();
    }

    v81 = STExtractorErrorDomain;
    v82 = +[NSString stringWithFormat:@"plugin directory option is not an NSString"];
    sub_100001424(v81, 3, v82, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 286);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    v42 = v83;
    __int16 v40 = (void (**)(void, void, void, void))v84;
LABEL_84:

    goto LABEL_46;
  }
  v22 = v16;
  id v21 = @"/System/Library/StreamingExtractorPlugins";
LABEL_24:
  v97[0] = v21;
  v23 = +[NSString stringWithFormat:@"%@.bundle", v85];
  v97[1] = v23;
  v24 = +[NSArray arrayWithObjects:v97 count:2];
  CFStringRef v25 = +[NSString pathWithComponents:v24];
  id v18 = +[NSURL fileURLWithPath:v25];

  v26 = sub_1000010CC();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v18 path];
    *(_DWORD *)buf = 136446466;
    v99 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
    __int16 v100 = 2112;
    v101 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: pluginURL: %@", buf, 0x16u);
  }
  id v16 = v22;
  if (!v18)
  {
    v48 = sub_1000010CC();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100004524();
    }

    v49 = STExtractorErrorDomain;
    v50 = +[NSString stringWithFormat:@"unable to get plugin URL"];
    sub_100001424(v49, 6, v50, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 299);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_74;
  }
LABEL_27:
  __int16 v28 = +[NSBundle bundleWithURL:v18];
  if (!v28)
  {
    v51 = sub_1000010CC();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1000045C8();
    }

    v52 = STExtractorErrorDomain;
    v53 = +[NSString stringWithFormat:@"unable to get plugin bundle: %@", v18];
    sub_100001424(v52, 6, v53, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 302);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_60;
  }
  uint64_t v29 = v28;
  id v90 = 0;
  unsigned __int8 v30 = [v28 loadAndReturnError:&v90];
  id v31 = v90;
  if ((v30 & 1) == 0)
  {
    v54 = sub_1000010CC();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_100004A68();
    }

    v55 = sub_1000010CC();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_1000049A0(v2, (uint64_t)v31, v55);
    }

LABEL_60:
LABEL_74:
    __int16 v40 = (void (**)(void, void, void, void))v84;
LABEL_40:
    v42 = v83;
    goto LABEL_46;
  }
  __int16 v32 = (objc_class *)[v29 principalClass];
  if (!v32)
  {
    v56 = sub_1000010CC();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_10000466C();
    }

    v57 = STExtractorErrorDomain;
    v58 = +[NSString stringWithFormat:@"unable to get principal class from plugin: %@", v18];
    v59 = v57;
    v60 = v58;
    uint64_t v61 = 306;
    goto LABEL_67;
  }
  uint64_t v33 = v32;
  if (([(objc_class *)v32 conformsToProtocol:&OBJC_PROTOCOL___STExtractionPlugin] & 1) == 0)
  {
    v62 = sub_1000010CC();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_1000048FC();
    }

    v63 = STExtractorErrorDomain;
    v58 = +[NSString stringWithFormat:@"principal class for plugin does not conform to STExtractorPlugin protocol: %@", v18];
    v59 = v63;
    v60 = v58;
    uint64_t v61 = 307;
LABEL_67:
    uint64_t v64 = sub_100001424(v59, 6, v60, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", v61);

    id v31 = (id)v64;
    goto LABEL_74;
  }
  __int16 v34 = *(void **)(a1 + 48);
  if (v34
    && ([v34 UTF8String],
        [*v2 setSandboxToken:sandbox_extension_consume()],
        [*v2 sandboxToken] == (id)-1))
  {
    v71 = v16;
    v72 = sub_1000010CC();
    __int16 v40 = (void (**)(void, void, void, void))v84;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      sub_100004858();
    }

    v73 = STExtractorErrorDomain;
    v74 = __error();
    v75 = strerror(*v74);
    v76 = +[NSString stringWithFormat:@"failed to consume sandbox token: %s (%d)", v75, *__error()];
    uint64_t v77 = sub_100001424(v73, 10, v76, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 311);

    id v31 = (id)v77;
    v42 = v83;
    id v16 = v71;
  }
  else
  {
    if (![*v2 hasConnection]) {
      goto LABEL_38;
    }
    if (*v2)
    {
      [*v2 auditToken];
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
    }
    [*(id *)(a1 + 56) fileSystemRepresentation];
    int v35 = sandbox_check_by_audit_token();
    if (!v35)
    {
LABEL_38:
      id v36 = [[v33 alloc] initWithOptions:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setPlugin:v36];

      uint64_t v37 = [*(id *)(a1 + 32) plugin];

      if (v37)
      {
        __int16 v38 = [*(id *)(a1 + 32) plugin];
        uint64_t v39 = *(void *)(a1 + 56);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_10000357C;
        v86[3] = &unk_1000084A0;
        __int16 v40 = (void (**)(void, void, void, void))v84;
        CFStringRef v41 = v84;
        v86[4] = *(void *)(a1 + 32);
        id v87 = v41;
        [v38 prepareForExtractionToPath:v39 withCompletionBlock:v86];
      }
      else
      {
        v65 = sub_1000010CC();
        __int16 v40 = (void (**)(void, void, void, void))v84;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_1000047B4();
        }

        v66 = STExtractorErrorDomain;
        v67 = +[NSString stringWithFormat:@"failed to initialize plugin class: %@", v33];
        uint64_t v68 = sub_100001424(v66, 6, v67, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 323);

        id v31 = (id)v68;
      }
      goto LABEL_40;
    }
    if (v35 == -1) {
      uint64_t v43 = *__error();
    }
    else {
      uint64_t v43 = 1;
    }
    v44 = sub_1000010CC();
    __int16 v40 = (void (**)(void, void, void, void))v84;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100004710();
    }

    v45 = STExtractorErrorDomain;
    v46 = +[NSString stringWithFormat:@"cannot write to path: %s (%d)", strerror(v43), v43];
    uint64_t v47 = sub_100001424(v45, 14, v46, 0, (uint64_t)"-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 319);

    id v31 = (id)v47;
    v42 = v83;
  }
LABEL_46:

  if (v31) {
    ((void (**)(void, void, void, id))v40)[2](v40, 0, 0, v31);
  }
}

void sub_1000034E0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v6 = a4;
  if (v6) {
    [(id)objc_opt_class() removeExtractionService:*(void *)(a1 + 32)];
  }
  else {
    *(unsigned char *)(*(void *)(a1 + 32) + 18) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000357C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v9 = [v5 plugin];
  id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 extractionMemoryFootprint]);
  id v8 = +[NSDictionary dictionaryWithObject:v7 forKey:@"STRemoteExtractorMemoryFootprint"];
  (*(void (**)(uint64_t, void *, uint64_t, id))(v4 + 16))(v4, v8, a2, v6);
}

void sub_10000372C(uint64_t a1)
{
  if (processTerminated)
  {
    id v7 = sub_1000010CC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100004E40();
    }

    id v8 = STExtractorErrorDomain;
    id v9 = +[NSString stringWithFormat:@"extraction stopped - system is shutting down"];
    uint64_t v10 = sub_1000011FC(v8, 13, v9, 0, &off_100008B38, (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 351);
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) plugin];

    if (v2)
    {
      if ([*(id *)(a1 + 32) extractionValid])
      {
        uint64_t v3 = [*(id *)(a1 + 32) plugin];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000039B0;
        v19[3] = &unk_1000084F0;
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = *(id *)(a1 + 48);
        v19[4] = *(void *)(a1 + 32);
        id v20 = v5;
        [v3 supplyBytes:v4 withCompletionBlock:v19];

        id v6 = v20;
LABEL_5:

        return;
      }
      uint64_t v17 = sub_1000010CC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100004D9C();
      }

      id v18 = STExtractorErrorDomain;
      id v9 = +[NSString stringWithFormat:@"extraction is invalid - it likely has already been finished, suspended or terminated"];
      __int16 v13 = v18;
      uint64_t v14 = 8;
      uint64_t v15 = v9;
      uint64_t v16 = 353;
    }
    else
    {
      __int16 v11 = sub_1000010CC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100004CF8();
      }

      v12 = STExtractorErrorDomain;
      id v9 = +[NSString stringWithFormat:@"no plugin for -supplyBytes"];
      __int16 v13 = v12;
      uint64_t v14 = 6;
      uint64_t v15 = v9;
      uint64_t v16 = 352;
    }
    uint64_t v10 = sub_100001424(v13, v14, v15, 0, (uint64_t)"-[STExtractionService remote_supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", v16);
  }
  id v6 = (void *)v10;

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
}

void sub_1000039B0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = [*(id *)(a1 + 32) messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A50;
  block[3] = &unk_100008430;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100003A50(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkProcessTerminated];
}

void sub_100003B0C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) plugin];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) plugin];
    [v3 suspendStreamWithCompletionBlock:*(void *)(a1 + 40)];

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 invalidate];
  }
  else
  {
    id v5 = sub_1000010CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100004EE4();
    }

    id v6 = STExtractorErrorDomain;
    id v7 = +[NSString stringWithFormat:@"no plugin for -suspendStream"];
    id v8 = sub_100001424(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_suspendStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 383);

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100003CE4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) plugin];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) plugin];
    [v3 finishStreamWithCompletionBlock:*(void *)(a1 + 40)];

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 invalidate];
  }
  else
  {
    id v5 = sub_1000010CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100004F88();
    }

    id v6 = STExtractorErrorDomain;
    id v7 = +[NSString stringWithFormat:@"no plugin for -finishStream"];
    id v8 = sub_100001424(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_finishStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 408);

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100003EDC(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) plugin];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) plugin];
    [v3 terminateStreamWithError:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 invalidate];
  }
  else
  {
    id v5 = sub_1000010CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000502C();
    }

    id v6 = STExtractorErrorDomain;
    id v7 = +[NSString stringWithFormat:@"no plugin for -terminateStream"];
    id v8 = sub_100001424(v6, 6, v7, 0, (uint64_t)"-[STExtractionService remote_terminateStreamWithError:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractorService/STExtractionService/STExtractionService.m", 434);

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_100004258(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void sub_100004280()
{
  sub_100001D08();
  sub_100001D1C((void *)&_mh_execute_header, v0, v1, "%{public}s: Rejecting process %@ since it is not a platform binary.", v2, v3, v4, v5, 2u);
}

void sub_1000042F4()
{
  sub_100001D08();
  sub_100001D1C((void *)&_mh_execute_header, v0, v1, "%{public}s: Rejecting process %@ since csops_audittoken failed.", v2, v3, v4, v5, 2u);
}

void sub_100004368()
{
  sub_100001D08();
  sub_100001D1C((void *)&_mh_execute_header, v0, v1, "%{public}s: Rejecting process %@ since it is not properly entitled.", v2, v3, v4, v5, 2u);
}

void sub_1000043DC()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004480()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004524()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_1000045C8()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_10000466C()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004710()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_1000047B4()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004858()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_1000048FC()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_1000049A0(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*a1 sessionID];
  int v6 = 138412802;
  id v7 = v5;
  __int16 v8 = 2082;
  uint64_t v9 = "-[STExtractionService remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:]_block_invoke";
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[%@] %{public}s: failed to load plugin: %@", (uint8_t *)&v6, 0x20u);
}

void sub_100004A68()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004B0C()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004BB0()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004C54()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004CF8()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004D9C()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004E40()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004EE4()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_100004F88()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_10000502C()
{
  sub_10000422C();
  sub_100004274();
  sub_100004244();
  sub_100004258((void *)&_mh_execute_header, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t csops_audittoken()
{
  return _csops_audittoken();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
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

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
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