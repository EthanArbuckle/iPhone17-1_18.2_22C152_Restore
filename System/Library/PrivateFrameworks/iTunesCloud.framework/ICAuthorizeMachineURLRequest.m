@interface ICAuthorizeMachineURLRequest
- (NSData)tokenData;
- (NSString)keybagPath;
- (NSString)reason;
- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5;
- (void)setKeybagPath:(id)a3;
- (void)setReason:(id)a3;
- (void)setTokenData:(id)a3;
@end

@implementation ICAuthorizeMachineURLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_keybagPath, 0);
}

- (void)setTokenData:(id)a3
{
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setKeybagPath:(id)a3
{
}

- (NSString)keybagPath
{
  return self->_keybagPath;
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, id))a5;
  v11 = [v9 DSID];
  uint64_t v12 = [v11 unsignedLongLongValue];

  if (!v12)
  {
    uint64_t v48 = *MEMORY[0x1E4F28228];
    v34 = [NSString stringWithFormat:@"Unable to build URL Request [no DSID in builder properties] - builderProperties=%@", v9];
    v49 = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v35];

LABEL_30:
    v33 = 0;
    goto LABEL_31;
  }
  BOOL v13 = [(NSString *)self->_reason isEqualToString:@"refetch"];
  unsigned int v47 = 0;
  keybagPath = self->_keybagPath;
  id v46 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(keybagPath, &v47, &v46);
  v16 = (NSString *)v46;
  if (!ContextIdentifierForFolderPath)
  {
    v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_1A2D01000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting context ID failed with error: %{public}@", buf, 0x16u);
    }

    goto LABEL_26;
  }
  if (v13) {
    uint64_t v17 = 8;
  }
  else {
    uint64_t v17 = 1;
  }
  v44 = v16;
  id v45 = 0;
  BOOL v18 = ICFairPlayCopyKeyBagSyncDataWithContextID(v47, v12, v17, &v45, &v44);
  id v19 = v45;
  v41 = v44;

  if (!v18)
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_keybagPath;
      *(_DWORD *)buf = 138543874;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v21;
      __int16 v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Copying keybag sync data for path %{public}@ failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (!v19)
  {
    v16 = v41;
LABEL_26:
    v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = self;
      _os_log_impl(&dword_1A2D01000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Missing kbsync data, failing request.", buf, 0xCu);
    }

    if (!v16)
    {
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7502 userInfo:0];
    }
    goto LABEL_30;
  }
  v40 = v8;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v23 = v19;
  id v24 = v22;
  v39 = v23;
  objc_msgSend(v22, "setObject:forKey:");
  v25 = [NSNumber numberWithUnsignedLongLong:v12];
  [v24 setObject:v25 forKey:@"ownerDsid"];

  tokenData = self->_tokenData;
  if (tokenData) {
    [v24 setObject:tokenData forKey:@"token"];
  }
  v27 = [(ICURLRequest *)self requestContext];
  v28 = [v27 deviceInfo];

  v29 = [v28 deviceGUID];
  if ([v29 length])
  {
    v30 = [v29 uppercaseString];
    [v24 setObject:v30 forKey:@"guid"];
  }
  v31 = [v28 deviceName];
  if (v31) {
    [v24 setObject:v31 forKey:@"machineName"];
  }
  if ([(NSString *)self->_reason length]) {
    [v24 setObject:self->_reason forKey:@"reason"];
  }
  id v43 = 0;
  v32 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v24 format:100 options:0 error:&v43];
  v16 = (NSString *)v43;

  if (v32)
  {
    v33 = (void *)[v40 mutableCopy];
    [v33 setHTTPMethod:@"POST"];
    [v33 setHTTPBody:v32];
    [v33 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  }
  else
  {
    v38 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_1A2D01000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to serialize request with error: %{public}@", buf, 0x16u);
    }

    if (!v16)
    {
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    }
    v33 = 0;
  }

  if (v33)
  {
    id v8 = v40;
    if (!v16)
    {
      v42.receiver = self;
      v42.super_class = (Class)ICAuthorizeMachineURLRequest;
      [(ICStoreURLRequest *)&v42 buildStoreURLRequestWithURLRequest:v33 builderProperties:v9 completionHandler:v10];
      goto LABEL_32;
    }
  }
  else
  {
    id v8 = v40;
  }
LABEL_31:
  v10[2](v10, 0, v16);

LABEL_32:
}

@end