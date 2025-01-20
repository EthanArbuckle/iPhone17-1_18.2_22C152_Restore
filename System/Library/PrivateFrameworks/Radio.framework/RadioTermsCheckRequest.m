@interface RadioTermsCheckRequest
- (unint64_t)acceptedTermsVersion;
- (void)cancel;
- (void)setAcceptedTermsVersion:(unint64_t)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation RadioTermsCheckRequest

- (void).cxx_destruct
{
}

- (void)setAcceptedTermsVersion:(unint64_t)a3
{
  self->_acceptedTermsVersion = a3;
}

- (unint64_t)acceptedTermsVersion
{
  return self->_acceptedTermsVersion;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RadioRequest *)self requestContext];
  id v6 = objc_alloc(MEMORY[0x263F89360]);
  v7 = [MEMORY[0x263F893C0] activeAccount];
  v8 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  v9 = (void *)[v6 initWithIdentity:v7 clientInfo:v8];

  v10 = [MEMORY[0x263F893A0] sharedBagProvider];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke;
  v13[3] = &unk_2643AA588;
  v13[4] = self;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 getBagForRequestContext:v9 withCompletionHandler:v13];
}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 stringForBagKey:@"terms-check"];
  if ([v4 length])
  {
    v5 = [NSURL URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }
  id v6 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 absoluteString];
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_21B56B000, v6, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Terms check URL: %@", buf, 0xCu);
  }
  v8 = (void *)[MEMORY[0x263F7B290] newForRadioRequestURL:v5];
  v9 = (void *)MEMORY[0x263F08900];
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    v24[0] = @"accepted";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    v24[1] = @"context";
    v25[0] = v10;
    v25[1] = @"radio";
    id v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v23 = 0;
    id v12 = [v9 dataWithJSONObject:v11 options:0 error:&v23];
    id v13 = v23;

    if (v12)
    {
      [v8 setHTTPBody:v12];
    }
    else
    {
      id v14 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v13;
        _os_log_impl(&dword_21B56B000, v14, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Unable to serialize JSON body data (%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F08900] dataWithJSONObject:&unk_26CB5DEC0 options:0 error:0];
    [v8 setHTTPBody:v13];
  }

  id v15 = [[RadioStoreBag alloc] _initWithURLBag:v3];
  uint64_t v16 = [MEMORY[0x263F7B360] newRadioRequestWithRequestContext:*(void *)(a1 + 40) requestProperties:v8 storeBag:v15];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 72);
  *(void *)(v17 + 72) = v16;

  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 72);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_21;
  v21[3] = &unk_2643AA560;
  v21[4] = v19;
  id v22 = *(id *)(a1 + 48);
  [v20 startWithConnectionResponseBlock:v21];
}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 statusCode];
  }
  else
  {
    v9 = [v6 userInfo];
    v10 = [v9 objectForKey:*MEMORY[0x263F7B760]];
    uint64_t v8 = [v10 integerValue];
  }
  id v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v8;
    _os_log_impl(&dword_21B56B000, v11, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) > 0xFFFFFFFFFFFFFF9BLL)
  {
    id v14 = objc_msgSend(v5, "radio_decompressedBodyData");
    if (![v14 length])
    {
      [*(id *)(a1 + 32) setStatus:3];
      uint64_t v16 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B56B000, v16, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] No response for terms check.", buf, 2u);
      }
      v20 = 0;
      char v21 = 0;
      uint64_t v22 = 0;
      goto LABEL_44;
    }
    id v38 = 0;
    id v15 = [MEMORY[0x263F08900] JSONObjectWithData:v14 options:0 error:&v38];
    uint64_t v16 = v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v15)
      {
        v20 = 0;
        char v21 = 0;
        uint64_t v22 = 0;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      [*(id *)(a1 + 32) setStatus:3];
      id v23 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v16;
        _os_log_impl(&dword_21B56B000, v23, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Unable to unserialize JSON body data (%@)", buf, 0xCu);
      }
      v20 = 0;
      char v21 = 0;
      uint64_t v22 = 0;
LABEL_42:

      goto LABEL_43;
    }
    uint64_t v17 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v15;
      _os_log_impl(&dword_21B56B000, v17, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Terms response: %@", buf, 0xCu);
    }

    v18 = [v15 objectForKey:@"status"];
    v31 = v18;
    if (objc_opt_respondsToSelector())
    {
      if (![v18 integerValue])
      {
        uint64_t v19 = [v15 objectForKey:@"latestTermsVersionId"];
        if (objc_opt_respondsToSelector()) {
          uint64_t v22 = [v19 longLongValue];
        }
        else {
          uint64_t v22 = 0;
        }
        id v27 = [v15 objectForKey:@"isCurrent"];
        if (objc_opt_respondsToSelector()) {
          char v21 = [v27 BOOLValue];
        }
        else {
          char v21 = 0;
        }
        v30 = v27;
        uint64_t v28 = [v15 objectForKey:@"termsContentText"];
        objc_opt_class();
        v29 = v28;
        if (objc_opt_isKindOfClass()) {
          v20 = (void *)[v28 copy];
        }
        else {
          v20 = 0;
        }
        [*(id *)(a1 + 32) setStatus:1];

        goto LABEL_38;
      }
      [*(id *)(a1 + 32) setStatus:3];
      uint64_t v19 = [v15 objectForKey:@"errorNumber"];
      if (v19
        && (objc_opt_respondsToSelector() & 1) != 0
        && ([v19 intValue] == 5300
         || [v19 intValue] == 5601))
      {
        [*(id *)(a1 + 32) setStatus:2];
      }
    }
    else
    {
      [*(id *)(a1 + 32) setStatus:3];
      uint64_t v19 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v18;
        _os_log_impl(&dword_21B56B000, v19, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Status object doesn't response to integerValue (%@)", buf, 0xCu);
      }
    }
    v20 = 0;
    char v21 = 0;
    uint64_t v22 = 0;
LABEL_38:

    id v23 = v31;
    goto LABEL_42;
  }
  id v12 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = (uint64_t)v7;
    _os_log_impl(&dword_21B56B000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to fetch terms (%@)", buf, 0xCu);
  }

  if (v8 <= 399)
  {
    uint64_t v13 = 1;
    if (v8 == 200 || v8 == 204) {
      goto LABEL_34;
    }
LABEL_27:
    uint64_t v13 = 3;
    goto LABEL_34;
  }
  if (v8 != 404)
  {
    if (v8 == 401)
    {
      uint64_t v13 = 2;
      goto LABEL_34;
    }
    if (v8 != 400) {
      goto LABEL_27;
    }
  }
  uint64_t v13 = 4;
LABEL_34:
  [*(id *)(a1 + 32) setStatus:v13];
  v20 = 0;
  char v21 = 0;
  uint64_t v22 = 0;
LABEL_45:
  v24 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_44;
  block[3] = &unk_2643AA538;
  id v35 = *(id *)(a1 + 40);
  uint64_t v36 = v22;
  char v37 = v21;
  uint64_t v25 = *(void *)(a1 + 32);
  id v33 = v20;
  uint64_t v34 = v25;
  id v26 = v20;
  dispatch_async(v24, block);
}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"RadioRequestDidFinishNotification" object:*(void *)(a1 + 40)];
}

- (void)cancel
{
}

@end