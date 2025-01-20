@interface XBLaunchImageProviderClient
+ (void)preheatServiceWithTimeout:(double)a3;
- (XBLaunchImageProviderClient)init;
- (XBLaunchImageProviderClient)initWithApplicationInfo:(id)a3;
- (unsigned)generateImageWithContext:(id)a3 captureInfo:(id *)a4 error:(id *)a5;
@end

@implementation XBLaunchImageProviderClient

- (XBLaunchImageProviderClient)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"XBLaunchImageProviderClient.m" lineNumber:35 description:@"use initWithDefaultService"];

  return 0;
}

- (XBLaunchImageProviderClient)initWithApplicationInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XBLaunchImageProviderClient;
  v6 = [(BSBaseXPCClient *)&v9 initWithServiceName:@"com.apple.splashboard.launchimage" endpoint:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appInfo, a3);
  }

  return v7;
}

- (unsigned)generateImageWithContext:(id)a3 captureInfo:(id *)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v57 = a3;
  v58 = [v57 launchRequest];
  v7 = [v57 applicationCompatibilityInfo];
  uint64_t v81 = 0;
  v82 = (id *)&v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__4;
  v85 = __Block_byref_object_dispose__4;
  id v86 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  int v80 = -1;
  if (!v57)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"XBLaunchImageProviderClient.m", 55, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];
  }
  if (!v58)
  {
    v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"XBLaunchImageProviderClient.m", 56, @"Invalid parameter not satisfying: %@", @"launchRequest != nil" object file lineNumber description];
  }
  if (!v7)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"XBLaunchImageProviderClient.m", 57, @"Invalid parameter not satisfying: %@", @"appInfo != nil" object file lineNumber description];
  }
  if (!self->_appInfo)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"XBLaunchImageProviderClient.m" lineNumber:58 description:@"This API cannot be used if the client was not initialized with an app info"];
  }
  v8 = [v7 bundleIdentifier];
  objc_super v9 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
  char v10 = BSEqualStrings();

  if ((v10 & 1) == 0)
  {
    v50 = [MEMORY[0x263F08690] currentHandler];
    v51 = [v7 bundleIdentifier];
    v52 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
    [v50 handleFailureInMethod:a2, self, @"XBLaunchImageProviderClient.m", 59, @"app info bundle ID: %@ doesn't match ivar app info bundle ID: %@", v51, v52 object file lineNumber description];
  }
  v11 = [v7 launchInterfaceIdentifierForRequest:v58];
  [v58 setLaunchInterfaceIdentifier:v11];

  v12 = (void *)MEMORY[0x263F01890];
  v13 = [v7 bundleIdentifier];
  id v76 = 0;
  v55 = [v12 bundleRecordWithBundleIdentifier:v13 allowPlaceholder:0 error:&v76];
  id v56 = v76;

  if (v56)
  {
    v14 = [XBLaunchImageError alloc];
    id v15 = [v7 bundleIdentifier];
    uint64_t v16 = [(XBLaunchImageError *)v14 initWithCode:4 bundleID:v15 reason:@"Failed to get LSBundleRecord" fatal:0];
    char v17 = 0;
    v18 = v82[5];
    v82[5] = (id)v16;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v17 = 0;
    goto LABEL_15;
  }
  id v15 = v55;
  int v28 = [v15 isDeletableSystemApplication];
  char v17 = v28;
  if (v28)
  {
    v18 = XBLogCapture();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2232AB000, v18, OS_LOG_TYPE_DEFAULT, "Skipping validation", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  id v19 = v82[5];
  if (v19 || (v17 & 1) != 0) {
    goto LABEL_33;
  }
  [(BSBaseXPCClient *)self _sendMessage:&__block_literal_global_8];
  id v20 = [(BSBaseXPCClient *)self _connection];
  v21 = [v58 launchInterfaceIdentifier];
  v22 = [v7 launchInterfaceWithIdentifier:v21];

  v23 = self;
  v24 = [v7 bundlePath];
  v25 = [MEMORY[0x263F086E0] bundleWithPath:v24];
  if (v25)
  {
    if ([v22 isStoryboard])
    {
      v26 = [v22 name];
      v27 = v82;
      id v75 = v82[5];
      XBValidateStoryboard(v26, v25, &v75);
      objc_storeStrong(v27 + 5, v75);
    }
    else if ([v22 isXIB])
    {
      v26 = [v22 name];
      v36 = v82;
      id obj = v82[5];
      XBValidateNib(v26, v25, &obj);
      objc_storeStrong(v36 + 5, obj);
    }
    else
    {
      v26 = XBLogCapture();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2232AB000, v26, OS_LOG_TYPE_DEFAULT, "Nothing to validate", buf, 2u);
      }
    }

    if (v82[5]) {
      goto LABEL_32;
    }
    v30 = XBLogCapture();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2232AB000, v30, OS_LOG_TYPE_DEFAULT, "Validated OK", buf, 2u);
    }
  }
  else
  {
    v29 = [XBLaunchImageError alloc];
    v30 = [(XBApplicationLaunchCompatibilityInfo *)v23->_appInfo bundleIdentifier];
    v31 = NSString;
    v32 = [v58 launchInterfaceIdentifier];
    v33 = [v31 stringWithFormat:@"Validation failed to construct NSBundle for %@ at %@.", v32, v24];
    uint64_t v34 = [(XBLaunchImageError *)v29 initWithCode:4 bundleID:v30 reason:v33 fatal:0];
    id v35 = v82[5];
    v82[5] = (id)v34;

    self = v23;
  }

LABEL_32:
  id v19 = v82[5];
LABEL_33:
  if (v19) {
    goto LABEL_49;
  }
  id v37 = objc_alloc_init(MEMORY[0x263F3F630]);
  [v57 timeout];
  if (v38 > 0.0)
  {
    dispatch_time_t v39 = dispatch_time(0, (uint64_t)(v38 * 1000000000.0));
    v40 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_38;
    block[3] = &unk_2646A6448;
    id v70 = v37;
    v72 = self;
    v73 = &v81;
    id v71 = v7;
    dispatch_after(v39, v40, block);
  }
  *(void *)buf = 0;
  v88 = buf;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__4;
  v91 = __Block_byref_object_dispose__4;
  id v92 = 0;
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_43;
  v65[3] = &unk_2646A6470;
  id v66 = v7;
  id v67 = v58;
  BOOL v68 = a4 != 0;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_2;
  v59[3] = &unk_2646A6498;
  id v41 = v37;
  id v60 = v41;
  v62 = &v77;
  v63 = &v81;
  v64 = buf;
  id v61 = v66;
  [(BSBaseXPCClient *)self _sendMessage:v65 withReplyHandler:v59 waitForReply:1 waitDuration:-1];
  if (a4) {
    *a4 = *((id *)v88 + 5);
  }

  _Block_object_dispose(buf, 8);
  id v19 = v82[5];
  if (v19)
  {
LABEL_49:
    if ([v19 isFatal])
    {
      [(BSBaseXPCClient *)self invalidate];
      v42 = XBLogCapture();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = [v7 bundleIdentifier];
        -[XBLaunchImageProviderClient generateImageWithContext:captureInfo:error:](v43, buf, v42);
      }
    }
    *a5 = v82[5];
  }
  unsigned int v44 = *((_DWORD *)v78 + 6);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v44;
}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke(int a1, xpc_object_t xdict)
{
}

uint64_t __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_38(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setFlag:1];
  if (result)
  {
    v3 = XBLogCapture();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_38_cold_1(a1, v3);
    }

    v4 = [XBLaunchImageError alloc];
    id v5 = [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v6 = [(XBLaunchImageError *)v4 initWithCode:8 bundleID:v5 reason:@"The request timed out" fatal:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    return [*(id *)(a1 + 48) invalidate];
  }
  return result;
}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_43(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "message", 0);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "createCaptureInfo", *(unsigned char *)(a1 + 48));
}

uint64_t __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if ([*(id *)(a1 + 32) setFlag:1])
  {
    if (xdict && MEMORY[0x223CB3250](xdict, xdict) == MEMORY[0x263EF8708])
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_int64(xdict, "contextID");
      uint64_t v7 = BSDeserializeDataFromXPCDictionaryWithKey();
      uint64_t v8 = +[XBLaunchImageError bs_secureDecodedFromData:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      char v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v4 = BSDeserializeDataFromXPCDictionaryWithKey();
      uint64_t v5 = +[XBLaunchCaptureInformation bs_secureDecodedFromData:v4];
      uint64_t v6 = *(void *)(a1 + 64);
    }
    else
    {
      v3 = [XBLaunchImageError alloc];
      v4 = [*(id *)(a1 + 40) bundleIdentifier];
      uint64_t v5 = [(XBLaunchImageError *)v3 initWithCode:9 bundleID:v4 reason:@"The request failed" fatal:0];
      uint64_t v6 = *(void *)(a1 + 56);
    }
    uint64_t v11 = *(void *)(v6 + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v5;
  }
  return MEMORY[0x270F9A758]();
}

+ (void)preheatServiceWithTimeout:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"XBLaunchImageProviderClient.m", 167, @"Invalid parameter not satisfying: %@", @"timeout > 0.0" object file lineNumber description];
  }
  v4 = XBLogDaemonLifecycle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v16 = a3;
    _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "Warming up splashboardd (timeout %.1fs)", buf, 0xCu);
  }

  uint64_t v5 = [(BSBaseXPCClient *)[XBLaunchImageProviderClient alloc] initWithServiceName:@"com.apple.splashboard.launchimage"];
  [(BSBaseXPCClient *)v5 _sendMessage:&__block_literal_global_53];
  id v6 = [(BSBaseXPCClient *)v5 _connection];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  uint64_t v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke_2;
  block[3] = &unk_2646A5938;
  v14 = v5;
  uint64_t v9 = v5;
  dispatch_after(v7, v8, block);
}

void __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke(int a1, xpc_object_t xdict)
{
}

uint64_t __57__XBLaunchImageProviderClient_preheatServiceWithTimeout___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void).cxx_destruct
{
}

- (void)generateImageWithContext:(void *)a1 captureInfo:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2232AB000, log, OS_LOG_TYPE_ERROR, "Fatal error generating snapshot for %@.", buf, 0xCu);
}

void __74__XBLaunchImageProviderClient_generateImageWithContext_captureInfo_error___block_invoke_38_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [*(id *)(a1 + 40) bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2232AB000, a2, OS_LOG_TYPE_ERROR, "Request to splashboardd has timed out -- invalidating the connection for %@.", (uint8_t *)&v4, 0xCu);
}

@end