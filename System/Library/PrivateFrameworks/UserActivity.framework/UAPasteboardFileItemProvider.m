@interface UAPasteboardFileItemProvider
+ (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isDir;
- (BOOL)preferFileRep;
- (NSData)sandboxExtension;
- (NSString)type;
- (NSURL)fileURL;
- (NSUUID)uuid;
- (UAPasteboardFileItemProvider)initWithURL:(id)a3 sandboxExtension:(id)a4;
- (id)getFileName;
- (void)accessFileAtURLWithCompletion:(id)a3;
- (void)getDataWithCompletionBlock:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setIsDir:(BOOL)a3;
- (void)setPreferFileRep:(BOOL)a3;
- (void)setSandboxExtension:(id)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAPasteboardFileItemProvider

- (UAPasteboardFileItemProvider)initWithURL:(id)a3 sandboxExtension:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)UAPasteboardFileItemProvider;
  v8 = [(UAPasteboardFileItemProvider *)&v37 init];
  v9 = v8;
  if (v8)
  {
    [(UAPasteboardFileItemProvider *)v8 setFileURL:v6];
    [(UAPasteboardFileItemProvider *)v9 setPreferFileRep:1];
    [(UAPasteboardFileItemProvider *)v9 setSandboxExtension:v7];
    uint64_t v10 = [(UAPasteboardFileItemProvider *)v9 fileURL];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(UAPasteboardFileItemProvider *)v9 fileURL];
      v13 = [v12 pathExtension];

      if (v13)
      {
        v14 = [MEMORY[0x1E4F442D8] typeWithTag:v13 tagClass:*MEMORY[0x1E4F442E0] conformingToType:*MEMORY[0x1E4F44370]];
        v15 = [v14 identifier];
        [(UAPasteboardFileItemProvider *)v9 setType:v15];
      }
    }
    v16 = [(UAPasteboardFileItemProvider *)v9 type];

    if (!v16)
    {
      [(UAPasteboardFileItemProvider *)v9 setType:@"public.item"];
      id v36 = 0;
      uint64_t v17 = *MEMORY[0x1E4F1C628];
      id v35 = 0;
      int v18 = [v6 getResourceValue:&v36 forKey:v17 error:&v35];
      id v19 = v36;
      id v20 = v35;
      v21 = v20;
      if (v18)
      {
        -[UAPasteboardFileItemProvider setIsDir:](v9, "setIsDir:", [v19 BOOLValue]);
        if ([(UAPasteboardFileItemProvider *)v9 isDir]) {
          v22 = @"public.directory";
        }
        else {
          v22 = @"public.data";
        }
        [(UAPasteboardFileItemProvider *)v9 setType:v22];
      }
      else
      {
        if (v20)
        {
          v23 = [v20 domain];
          v24 = v23;
          if (v23 == (void *)*MEMORY[0x1E4F281F8])
          {
            uint64_t v25 = [v21 code];

            if (v25 == 260) {
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
        v26 = _uaGetLogForCategory(@"pasteboard-client");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138478083;
          id v39 = v6;
          __int16 v40 = 2112;
          id v41 = v21;
          _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_ERROR, "Error checking if url %{private}@ is directory: %@", buf, 0x16u);
        }
      }
LABEL_18:
      id v34 = 0;
      uint64_t v27 = *MEMORY[0x1E4F1C538];
      id v33 = 0;
      int v28 = [v6 getResourceValue:&v34 forKey:v27 error:&v33];
      id v29 = v34;
      id v30 = v33;

      if (v28)
      {
        v31 = [v29 identifier];
        [(UAPasteboardFileItemProvider *)v9 setType:v31];
      }
      else
      {
        if (!v30)
        {
LABEL_24:

          goto LABEL_25;
        }
        v31 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          id v39 = v30;
          __int16 v40 = 2113;
          id v41 = v6;
          _os_log_impl(&dword_1B3DF6000, v31, OS_LOG_TYPE_INFO, "Error %{public}@ getting content type for file item provider url=%{private}@", buf, 0x16u);
        }
      }

      goto LABEL_24;
    }
  }
LABEL_25:

  return v9;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___UAPasteboardFileItemProvider;
  id v3 = a3;
  unsigned __int8 v4 = objc_msgSendSuper2(&v6, sel_conformsToProtocol_, v3);

  if (&unk_1F0CC4200 == v3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (id)getFileName
{
  v2 = [(UAPasteboardFileItemProvider *)self fileURL];
  id v3 = [v2 lastPathComponent];

  return v3;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__UAPasteboardFileItemProvider_getDataWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6083960;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UAPasteboardFileItemProvider *)self accessFileAtURLWithCompletion:v6];
}

void __59__UAPasteboardFileItemProvider_getDataWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if ([*(id *)(a1 + 32) isDir])
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v8 options:1 error:0];
      objc_super v6 = [v5 serializedRepresentation];
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithData:v6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v8];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)accessFileAtURLWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = [(UAPasteboardFileItemProvider *)self fileURL];
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "Accessing file at URL: %@", buf, 0xCu);
  }
  id v7 = [(UAPasteboardFileItemProvider *)self sandboxExtension];

  if (v7)
  {
    id v8 = [(UAPasteboardFileItemProvider *)self sandboxExtension];
    [v8 bytes];
    sandbox_extension_consume();
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  uint64_t v10 = [(UAPasteboardFileItemProvider *)self fileURL];
  id v18 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__UAPasteboardFileItemProvider_accessFileAtURLWithCompletion___block_invoke;
  v16[3] = &unk_1E6083988;
  v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  [v9 coordinateReadingItemAtURL:v10 options:0 error:&v18 byAccessor:v16];
  id v12 = v18;

  if (v12)
  {
    v13 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_ERROR, "Error coordinating file: %@", buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:0];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
  v15 = [(UAPasteboardFileItemProvider *)self sandboxExtension];

  if (v15) {
    sandbox_extension_release();
  }
}

void __62__UAPasteboardFileItemProvider_accessFileAtURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(a1 + 32) fileURL];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "Providing URL: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)preferFileRep
{
  return self->_preferFileRep;
}

- (void)setPreferFileRep:(BOOL)a3
{
  self->_preferFileRep = a3;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileURL:(id)a3
{
}

- (NSData)sandboxExtension
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSandboxExtension:(id)a3
{
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (void)setIsDir:(BOOL)a3
{
  self->_isDir = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end