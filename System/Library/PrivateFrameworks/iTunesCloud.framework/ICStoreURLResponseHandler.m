@interface ICStoreURLResponseHandler
+ (void)_updateDefaultStorefrontIdentifier:(id)a3 usingIdentityStore:(id)a4;
- (BOOL)_isAuthenticationError:(id)a3;
- (void)_verifyMescalSignatureForResponse:(id)a3 toRequest:(id)a4 completionHandler:(id)a5;
- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICStoreURLResponseHandler

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  v101[3] = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__36918;
  v88 = __Block_byref_object_dispose__36919;
  id v7 = a4;
  id v89 = v7;
  id v8 = a1[4];
  v65 = [v8 storeRequestContext];
  uint64_t v63 = a2;
  v9 = [a1[5] urlResponse];
  if ([v8 shouldParseBodyData])
  {
    v10 = [a1[5] parsedBodyDictionary];
  }
  else
  {
    v10 = 0;
  }
  v67 = [v10 objectForKey:@"invalidate-url-bags"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v67 BOOLValue])
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = a1[4];
      *(_DWORD *)buf = 138543362;
      id v91 = v12;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating bag cache because invalidate-url-bags is set in the response", buf, 0xCu);
    }

    v13 = +[ICURLBagProvider sharedBagProvider];
    [v13 invalidateCache];
  }
  uint64_t v14 = [v9 statusCode];
  if (!v85[5])
  {
    uint64_t v15 = v14;
    if (v14 >= 400)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      v100[0] = *MEMORY[0x1E4F28228];
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Received HTTP error status code %ld", v14);
      v101[0] = v17;
      v100[1] = @"ICStoreURLRequestHTTPStatusCodeUserInfoKey";
      uint64_t v18 = [NSNumber numberWithInteger:v15];
      v19 = (void *)v18;
      v100[2] = @"ICStoreURLRequestParsedBodyInfoKey";
      v20 = (void *)MEMORY[0x1E4F1CC08];
      if (v10) {
        v20 = v10;
      }
      v101[1] = v18;
      v101[2] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
      uint64_t v22 = [v16 errorWithDomain:@"ICError" code:-7101 userInfo:v21];
      v23 = (void *)v85[5];
      v85[5] = v22;
    }
  }
  v24 = objc_msgSend(v9, "ic_valueForHTTPHeaderField:", @"x-apple-jingle-correlation-key");
  if (v85[5])
  {
    v25 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)v85[5];
      id v27 = a1[4];
      v28 = [a1[5] parsedBodyText];
      *(_DWORD *)buf = 138544386;
      id v91 = v27;
      __int16 v92 = 2114;
      v93 = v26;
      __int16 v94 = 2114;
      v95 = v24;
      __int16 v96 = 2114;
      v97 = v9;
      __int16 v98 = 2114;
      v99 = v28;
      _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ completed with:\nerror: %{public}@\ncorrelationKey: %{public}@\nresponse: \n%{public}@\nbody: \n%{public}@", buf, 0x34u);
    }
  }
  else
  {
    v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v91 = v29;
      __int16 v92 = 2114;
      v93 = v24;
      _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ completed successfully. correlationKey=%{public}@", buf, 0x16u);
    }
  }

  if (!v85[5])
  {
    uint64_t v30 = objc_msgSend(v10, "ic_integerValueForKey:", @"failureType");
    if (v30
      || (uint64_t v30 = objc_msgSend(v10, "ic_integerValueForKey:", @"errorNumber")) != 0
      || (uint64_t v30 = 510005, objc_msgSend(v10, "ic_integerValueForKey:", @"status") == 510005))
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = a1[6];
        id v33 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v91 = v32;
        __int16 v92 = 2114;
        v93 = v33;
        __int16 v94 = 2114;
        v95 = v10;
        _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Found error in response body %{public}@", buf, 0x20u);
      }

      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICStoreServerError", v30, v10, @"Found error in response body. correlation-key: %@", v24);
    }
    else
    {
      v59 = [v10 objectForKey:@"dialog"];
      BOOL v60 = v59 == 0;

      if (v60)
      {
LABEL_28:
        v36 = [v10 objectForKey:@"dialog"];
        if (v36)
        {
          v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = a1[6];
            id v39 = a1[4];
            *(_DWORD *)buf = 138543874;
            id v91 = v38;
            __int16 v92 = 2114;
            v93 = v39;
            __int16 v94 = 2114;
            v95 = v36;
            _os_log_impl(&dword_1A2D01000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Received store dialog response %{public}@", buf, 0x20u);
          }

          v40 = [v65 storeDialogResponseHandler];
          BOOL v41 = v40 == 0;

          if (!v41)
          {
            v42 = [[ICStoreDialogResponse alloc] initWithResponseDictionary:v36];
            v43 = [v65 storeDialogResponseHandler];
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v80[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_44;
            v80[3] = &unk_1E5ACCB38;
            id v81 = a1[4];
            id v82 = a1[7];
            v83 = &v84;
            [v43 handleStoreDialogResponse:v42 usingRequestContext:v65 withCompletionHandler:v80];

LABEL_41:
LABEL_48:

            goto LABEL_49;
          }
          v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            id v54 = a1[4];
            *(_DWORD *)buf = 138543362;
            id v91 = v54;
            v55 = "%{public}@ Response contains a dialog but there's no response handler set - treating as error";
LABEL_46:
            _os_log_impl(&dword_1A2D01000, v53, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);
          }
        }
        else
        {
          if (![a1[6] _isAuthenticationError:v85[5]])
          {
            v56 = +[ICMachineDataActionHandler sharedHandler];
            v57 = [v8 storeRequestContext];
            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v68[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_47;
            v68[3] = &unk_1E5ACCB88;
            v74 = &v84;
            v69 = (ICStoreDialogResponse *)a1[4];
            id v70 = v8;
            id v73 = a1[7];
            int8x16_t v62 = *(int8x16_t *)(a1 + 5);
            id v58 = (id)v62.i64[0];
            int8x16_t v71 = vextq_s8(v62, v62, 8uLL);
            uint64_t v75 = v63;
            id v72 = v66;
            [v56 processActionFromResponse:v9 withRequestContext:v57 withCompletionHandler:v68];

            v42 = v69;
            goto LABEL_41;
          }
          v44 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            id v45 = a1[6];
            id v46 = a1[4];
            *(_DWORD *)buf = 138543874;
            id v91 = v45;
            __int16 v92 = 2114;
            v93 = v46;
            __int16 v94 = 2114;
            v95 = v10;
            _os_log_impl(&dword_1A2D01000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Received authentication error. server response=%{public}@", buf, 0x20u);
          }

          v47 = [a1[4] requestContext];
          v48 = [v47 authenticationProvider];
          BOOL v49 = v48 == 0;

          if (!v49)
          {
            v50 = [a1[4] requestContext];
            v51 = [v50 authenticationProvider];
            id v52 = a1[4];
            id v64 = a1[5];
            v76[0] = MEMORY[0x1E4F143A8];
            v76[1] = 3221225472;
            v76[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_45;
            v76[3] = &unk_1E5ACCB38;
            v78 = (ICStoreDialogResponse *)a1[7];
            id v77 = a1[4];
            v79 = &v84;
            [v51 performAuthenticationToHandleResponse:v64 toRequest:v52 withCompletionHandler:v76];

            v42 = v78;
            goto LABEL_41;
          }
          v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            id v61 = a1[4];
            *(_DWORD *)buf = 138543362;
            id v91 = v61;
            v55 = "%{public}@ Not attempting reauthentication because no provider was specified";
            goto LABEL_46;
          }
        }

        (*((void (**)(void))a1[7] + 2))();
        goto LABEL_48;
      }
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICStoreServerError", 0, v10, @"Found dialog in response body without an error code - treating as an error. correlation-key: %@", v24);
    }
    v35 = (void *)v85[5];
    v85[5] = v34;

    goto LABEL_28;
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_49:

  _Block_object_dispose(&v84, 8);
}

- (BOOL)_isAuthenticationError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"ICStoreServerError"];

  if (!v5)
  {
    BOOL v7 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [v3 code];
  BOOL v7 = 0;
  if (v6 > 2033)
  {
    if (((unint64_t)(v6 - 2034) > 0x26 || ((1 << (v6 + 14)) & 0x7000001001) == 0)
      && v6 != 510005)
    {
      goto LABEL_12;
    }
LABEL_11:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  if ((unint64_t)(v6 - 1001) <= 3 && v6 != 1002 || v6 == 2002) {
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5ACCBB0;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v10;
  v14.receiver = self;
  v14.super_class = (Class)ICStoreURLResponseHandler;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(ICURLResponseHandler *)&v14 processCompletedResponse:v12 toRequest:v13 withCompletionHandler:v15];
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_47(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  id v11 = v9;
  if (!v9) {
    id v11 = *(void **)(v10 + 40);
  }
  objc_storeStrong((id *)(v10 + 40), v11);
  if (v7)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after machine data action %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setMachineDataSyncState:v8];
    uint64_t v14 = *(void *)(a1 + 72);
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      (*(void (**)(void, uint64_t, __CFString *))(v14 + 16))(*(void *)(a1 + 72), 1, @"machine-data-action-performed");
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7103 userInfo:0];
      (*(void (**)(uint64_t, uint64_t, __CFString *, void *))(v14 + 16))(v14, 1, @"machine-data-action-performed", v22);
    }
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) {
         || (char v15 = [*(id *)(a1 + 40) shouldUseMescalSigning], v16 = *(void *)(a1 + 80), (v15 & 1) == 0))
  }
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v18 = *(void **)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_48;
    v23[3] = &unk_1E5ACCB60;
    uint64_t v27 = v16;
    uint64_t v19 = *(void *)(a1 + 40);
    id v24 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 72);
    uint64_t v21 = *(void *)(a1 + 88);
    id v26 = v20;
    uint64_t v28 = v21;
    id v25 = *(id *)(a1 + 64);
    [v18 _verifyMescalSignatureForResponse:v17 toRequest:v19 completionHandler:v23];
  }
}

void __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke(id *a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a1[4];
  id v9 = [v8 storeRequestContext];
  uint64_t v10 = [a1[5] urlResponse];
  id v11 = [a1[4] currentURLRequest];
  v55 = [v11 URL];
  char v66 = 0;
  id v12 = +[ICAuthenticationUtilities sharedAuthKitSession];
  [v12 handleResponse:v10 forRequest:v11 shouldRetry:&v66];

  if (v66)
  {
    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[4];
      *(_DWORD *)buf = 138543362;
      id v72 = v14;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ retry requested by authkit", buf, 0xCu);
    }

    char v15 = @"authentication-performed";
    a3 = 1;
    id v7 = @"authentication-performed";
    a2 = 1;
  }
  char v52 = a2;
  uint64_t v53 = a3;
  uint64_t v16 = [v9 identityStore];
  uint64_t v17 = [v9 identity];
  id v65 = 0;
  id v54 = [v16 getPropertiesForUserIdentity:v17 error:&v65];
  id v18 = v65;

  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v72 = v21;
      __int16 v73 = 2114;
      v74 = v19;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch identity properties to process the response. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v49 = v8;
    v47 = v9;
    v48 = v7;
    id v20 = [v10 allHeaderFields];
    uint64_t v22 = +[ICHTTPCookieStore sharedCookieStore];
    v23 = [MEMORY[0x1E4F18D28] cookiesWithResponseHeaderFields:v20 forURL:v55];
    if ([v23 count])
    {
      id v24 = [v54 DSID];
      [v22 saveCookies:v23 forURL:v55 userIdentifier:v24];
    }
    uint64_t v25 = objc_msgSend(v10, "ic_valueForHTTPHeaderField:", @"X-Apple-Set-Cookie");
    id v26 = (void *)v25;
    if (v25)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F18D28];
      v69 = @"X-Apple-Set-Cookie";
      uint64_t v70 = v25;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v29 = [v27 cookiesWithResponseHeaderFields:v28 forURL:v55];

      [v22 saveGlobalAccountCookies:v29 forURL:v55];
    }
    uint64_t v30 = objc_msgSend(v10, "ic_valueForHTTPHeaderField:", @"X-Apple-Set-User-Cookie");
    __int16 v31 = (void *)v30;
    if (v30)
    {
      id v32 = (void *)MEMORY[0x1E4F18D28];
      v67 = @"X-Apple-Set-User-Cookie";
      uint64_t v68 = v30;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      uint64_t v34 = [v32 cookiesWithResponseHeaderFields:v33 forURL:v55];

      v35 = [v54 DSID];
      [v22 saveCookies:v34 forURL:v55 userIdentifier:v35];
    }
    id v7 = v48;
    id v8 = v49;
    id v9 = v47;
    uint64_t v19 = 0;
  }

  v36 = objc_msgSend(v10, "ic_valueForHTTPHeaderField:", @"X-Set-Apple-Store-Front");
  if (!v36) {
    goto LABEL_19;
  }
  v37 = objc_msgSend(v11, "ic_valueForHTTPHeaderField:", @"X-Apple-Store-Front");
  if (([v36 isEqual:v37] & 1) == 0)
  {
    id v38 = objc_msgSend(v11, "ic_valueForHTTPHeaderField:", @"X-Enqueuer-DSID");

    if (v38) {
      goto LABEL_19;
    }
    v51 = v19;
    id v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v72 = v40;
      __int16 v73 = 2114;
      v74 = v36;
      _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Server response included an updated storefront %{public}@", buf, 0x16u);
    }

    v37 = [v9 identity];
    BOOL v41 = v9;
    uint64_t v42 = [v9 identityStore];
    v43 = (void *)v42;
    if (v37 && v42)
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_7;
      v62[3] = &unk_1E5ACCAA8;
      id v63 = v36;
      id v64 = v43;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_2;
      v56[3] = &unk_1E5ACCAD0;
      id v57 = a1[4];
      id v44 = a1[6];
      char v61 = v52;
      id v59 = v44;
      uint64_t v60 = v53;
      id v58 = v7;
      id v45 = v43;
      [v45 updatePropertiesForUserIdentity:v37 usingBlock:v62 completionHandler:v56];

      id v9 = v41;
      uint64_t v19 = v51;
      goto LABEL_20;
    }
    if (v42)
    {
      +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:v36 usingIdentityStore:v42];
    }
    else
    {
      +[ICUserIdentityStore defaultIdentityStore];
      id v46 = v50 = v8;
      +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:v36 usingIdentityStore:v46];

      id v8 = v50;
    }

    id v9 = v41;
    uint64_t v19 = v51;
  }

LABEL_19:
  (*((void (**)(void))a1[6] + 2))();
LABEL_20:
}

- (void)_verifyMescalSignatureForResponse:(id)a3 toRequest:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 storeRequestContext];
  id v11 = +[ICURLBagProvider sharedBagProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__ICStoreURLResponseHandler__verifyMescalSignatureForResponse_toRequest_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACCC08;
  id v17 = v7;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  [v11 getBagForRequestContext:v12 withCompletionHandler:v16];
}

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5ACCAF8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  v14.receiver = self;
  v14.super_class = (Class)ICStoreURLResponseHandler;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(ICURLResponseHandler *)&v14 processInitialResponse:v12 toRequest:v13 withCompletionHandler:v15];
}

void __91__ICStoreURLResponseHandler__verifyMescalSignatureForResponse_toRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) urlResponse];
  id v8 = [v5 mescalConfigurationForResponse:v7];

  if (!v8) {
    goto LABEL_44;
  }
  if (([v8 shouldSignBody] & 1) == 0)
  {
    id v9 = [v8 fields];
    if ([v9 count])
    {

      goto LABEL_6;
    }
    id v10 = [v8 headers];
    uint64_t v11 = [v10 count];

    if (v11) {
      goto LABEL_6;
    }
LABEL_44:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_57;
  }
LABEL_6:
  id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v84 = v13;
    __int16 v85 = 2114;
    uint64_t v86 = (uint64_t)v8;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ verifying mescal signature for request. configuration=%{public}@", buf, 0x16u);
  }

  objc_super v14 = [*(id *)(a1 + 32) urlResponse];
  id v15 = objc_msgSend(v14, "ic_valueForHTTPHeaderField:", @"X-Apple-ActionSignature");
  if (v15)
  {
    uint64_t v60 = v15;
    uint64_t v58 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0];
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if ([v8 shouldSignBody])
    {
      id v16 = [*(id *)(a1 + 32) bodyData];
      [v70 appendData:v16];
    }
    uint64_t v66 = a1;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v17 = objc_msgSend(v8, "headers", v58);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v80 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(v14, "ic_valueForHTTPHeaderField:", *(void *)(*((void *)&v79 + 1) + 8 * i));
          v23 = v22;
          if (v22 && [v22 length])
          {
            id v24 = [v23 dataUsingEncoding:4];
            [v70 appendData:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v79 objects:v91 count:16];
      }
      while (v19);
    }
    char v61 = v14;
    id v63 = v6;
    id v64 = v5;

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    int8x16_t v62 = v8;
    obuint64_t j = [v8 fields];
    uint64_t v25 = [obj countByEnumeratingWithState:&v75 objects:v90 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = 0;
      uint64_t v28 = *(void *)v76;
      uint64_t v29 = v66;
      uint64_t v65 = *(void *)v76;
      do
      {
        uint64_t v30 = 0;
        uint64_t v67 = v26;
        do
        {
          if (*(void *)v76 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void *)(*((void *)&v75 + 1) + 8 * v30);
          if (!v27)
          {
            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v32 = objc_alloc(MEMORY[0x1E4F29088]);
            uint64_t v33 = [*(id *)(v29 + 32) urlResponse];
            uint64_t v34 = [v33 URL];
            v35 = (void *)[v32 initWithURL:v34 resolvingAgainstBaseURL:0];

            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            v69 = v35;
            v36 = [v35 queryItems];
            uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v89 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v72;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v72 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  BOOL v41 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                  uint64_t v42 = [v41 name];
                  if (v42)
                  {
                    v43 = (void *)v42;
                    id v44 = [v41 value];

                    if (v44)
                    {
                      id v45 = [v41 value];
                      id v46 = [v41 name];
                      [v27 setObject:v45 forKeyedSubscript:v46];
                    }
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v89 count:16];
              }
              while (v38);
            }

            uint64_t v28 = v65;
            uint64_t v29 = v66;
            uint64_t v26 = v67;
          }
          v47 = [v27 objectForKey:v31];
          v48 = v47;
          if (v47 && [v47 length])
          {
            id v49 = [v48 dataUsingEncoding:4];
            [v70 appendData:v49];
          }
          ++v30;
        }
        while (v30 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v75 objects:v90 count:16];
      }
      while (v26);
    }
    else
    {
      id v27 = 0;
      uint64_t v29 = v66;
    }

    if ((unint64_t)[v70 length] <= 0x100000)
    {
      id v5 = v64;
      v55 = +[ICSAPSession sharedSAPSessionWithVersion:200 URLBag:v64 requestContext:*(void *)(v29 + 48)];
      v56 = v55;
      uint64_t v57 = *(void *)(v29 + 56);
      id v15 = v60;
      objc_super v14 = v61;
      if (v55)
      {
        v51 = v59;
        [v55 verifySignatureData:v59 forData:v70 withCompletionHandler:v57];
      }
      else
      {
        (*(void (**)(void, uint64_t, void))(v57 + 16))(*(void *)(v29 + 56), 1, 0);
        v51 = v59;
      }
    }
    else
    {
      char v52 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      id v5 = v64;
      objc_super v14 = v61;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = *(void *)(v29 + 40);
        uint64_t v54 = [v70 length];
        *(_DWORD *)buf = 138543874;
        uint64_t v84 = v53;
        __int16 v85 = 2048;
        uint64_t v86 = v54;
        __int16 v87 = 2048;
        uint64_t v88 = 0x100000;
        _os_log_impl(&dword_1A2D01000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ Not verifying mescal signature because the payload is too large. length=%lld, limit=%lld", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(v29 + 56) + 16))();
      v51 = v59;
      id v15 = v60;
    }

    id v8 = v62;
    id v6 = v63;
  }
  else
  {
    uint64_t v50 = *(void *)(a1 + 56);
    v51 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v50 + 16))(v50, 0, v51);
  }

LABEL_57:
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_48(void *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    id v7 = v5;
    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    }
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
    if (!v6) {

    }
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Mescal verification failed for the response. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_44(void *a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = a1[4];
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after action taken for dialog response", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    uint64_t v9 = a1[4];
    id v10 = v5;
    if (!v5) {
      id v10 = *(id *)(*(void *)(a1[6] + 8) + 40);
    }
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dialog action not completed - completing response handling with error %{public}@", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_45(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after successful re-authentication", (uint8_t *)&v8, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 setStorefrontIdentifier:*(void *)(a1 + 32)];
  }
  else {
    return +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:*(void *)(a1 + 32) usingIdentityStore:*(void *)(a1 + 40)];
  }
}

void __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save updated storefront value. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)_updateDefaultStorefrontIdentifier:(id)a3 usingIdentityStore:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__ICStoreURLResponseHandler__updateDefaultStorefrontIdentifier_usingIdentityStore___block_invoke;
  v7[3] = &unk_1E5ACCBD8;
  id v8 = v5;
  id v6 = v5;
  [a4 updatePropertiesForLocalStoreAccountUsingBlock:v7 completionHandler:0];
}

uint64_t __83__ICStoreURLResponseHandler__updateDefaultStorefrontIdentifier_usingIdentityStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStorefrontIdentifier:*(void *)(a1 + 32)];
}

@end