@interface MFAttachmentSecurityScope
+ (id)securityScopedURL:(id)a3;
+ (id)securityScopedURL:(id)a3 withToken:(id)a4;
- (BOOL)isBundle;
- (BOOL)isReadable;
- (MFAttachmentSecurityScope)initWithSecurityScopedURL:(id)a3 withToken:(id)a4;
- (id)_temporaryReadURL:(id)a3 error:(id *)a4;
- (id)data;
- (id)securityScopeToken;
- (id)startReadAccess;
- (id)startWriteAccess;
- (void)_attachSecurityScope;
- (void)_removeTemporaryReadURL;
- (void)dealloc;
- (void)startReadAccess;
- (void)startWriteAccess;
- (void)stopAccess;
@end

@implementation MFAttachmentSecurityScope

+ (id)securityScopedURL:(id)a3
{
  id v3 = a3;
  v4 = [[MFAttachmentSecurityScope alloc] initWithSecurityScopedURL:v3 withToken:0];

  return v4;
}

+ (id)securityScopedURL:(id)a3 withToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MFAttachmentSecurityScope alloc] initWithSecurityScopedURL:v5 withToken:v6];

  return v7;
}

- (MFAttachmentSecurityScope)initWithSecurityScopedURL:(id)a3 withToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentSecurityScope;
  v9 = [(MFAttachmentSecurityScope *)&v13 init];
  if (v9)
  {
    v10 = (NSFileCoordinator *)objc_alloc_init(MEMORY[0x1E4F28CA0]);
    fileCoordinator = v9->_fileCoordinator;
    v9->_fileCoordinator = v10;

    objc_storeStrong((id *)&v9->_securityScopedURL, a3);
    objc_storeStrong((id *)&v9->_securityScopeToken, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(MFAttachmentSecurityScope *)self stopAccess];
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentSecurityScope;
  [(MFAttachmentSecurityScope *)&v3 dealloc];
}

- (id)startWriteAccess
{
  v26[4] = *(id *)MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    objc_super v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachmentSecurityScope startWriteAccess](v3);
    }
  }
  if (!self->_secureWriteURL)
  {
    [(MFAttachmentSecurityScope *)self _attachSecurityScope];
    if (self->_securedWrite
      || (p_securityScopedURL = &self->_securityScopedURL,
          BOOL v5 = [(NSURL *)self->_securityScopedURL startAccessingSecurityScopedResource], self->_securedWrite = v5, v5))
    {
      fileCoordinator = self->_fileCoordinator;
      securityScopedURL = self->_securityScopedURL;
      v25[4] = self;
      v26[0] = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke;
      v25[3] = &unk_1E5D3E020;
      [(NSFileCoordinator *)fileCoordinator coordinateWritingItemAtURL:securityScopedURL options:8 error:v26 byAccessor:v25];
      id v8 = v26[0];
      if (!self->_secureWriteURL)
      {
        v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MFAttachmentSecurityScope startWriteAccess]();
        }

        [(MFAttachmentSecurityScope *)self stopAccess];
      }
      goto LABEL_17;
    }
    v10 = [(NSURL *)*p_securityScopedURL path];
    id v8 = [v10 stringByDeletingLastPathComponent];

    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [(NSURL *)*p_securityScopedURL path];
    if ([v11 isWritableFileAtPath:v12])
    {
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v14 = [v13 isWritableFileAtPath:v8];

      if (!v14)
      {
        p_super = MFLogGeneral();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          [(MFAttachmentSecurityScope *)(uint64_t)&self->_securityScopedURL startWriteAccess];
        }
        goto LABEL_16;
      }
    }
    v15 = self->_securityScopedURL;
    p_super = &self->_secureWriteURL->super;
    self->_secureWriteURL = v15;
LABEL_16:

LABEL_17:
  }
  secureWriteURL = self->_secureWriteURL;
  return secureWriteURL;
}

void __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke(uint64_t a1, void *a2)
{
}

- (id)startReadAccess
{
  v36[4] = *(id *)MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    objc_super v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[MFAttachmentSecurityScope startWriteAccess](v3);
    }
  }
  if (!self->_secureReadURL)
  {
    [(MFAttachmentSecurityScope *)self _attachSecurityScope];
    if (self->_securedRead
      || (BOOL v4 = [(NSURL *)self->_securityScopedURL startAccessingSecurityScopedResource], self->_securedRead = v4, v4))
    {
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__9;
      v35 = __Block_byref_object_dispose__9;
      v36[0] = 0;
      securityScopedURL = self->_securityScopedURL;
      id obj = 0;
      BOOL v6 = [(NSURL *)securityScopedURL checkPromisedItemIsReachableAndReturnError:&obj];
      objc_storeStrong(v36, obj);
      if (v6)
      {
        fileCoordinator = self->_fileCoordinator;
        id v8 = self->_securityScopedURL;
        v10 = (id *)(v32 + 5);
        v9 = (void *)v32[5];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke;
        v28[3] = &unk_1E5D3E048;
        v28[4] = self;
        v28[5] = &v31;
        id v29 = v9;
        [(NSFileCoordinator *)fileCoordinator coordinateReadingItemAtURL:v8 options:8 error:&v29 byAccessor:v28];
        objc_storeStrong(v10, v29);
      }
      if (!self->_secureReadURL)
      {
        v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v32[5], "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MFAttachmentSecurityScope startReadAccess]();
        }

        [(MFAttachmentSecurityScope *)self stopAccess];
      }
      _Block_object_dispose(&v31, 8);
    }
    else
    {
      int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      v15 = [(NSURL *)self->_securityScopedURL path];
      int v16 = [v14 isReadableFileAtPath:v15];

      if (v16)
      {
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__9;
        v35 = __Block_byref_object_dispose__9;
        v36[0] = 0;
        v17 = self->_fileCoordinator;
        v18 = self->_securityScopedURL;
        id v26[5] = &v31;
        id v27 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_129;
        v26[3] = &unk_1E5D3E048;
        v26[4] = self;
        [(NSFileCoordinator *)v17 coordinateReadingItemAtURL:v18 options:8 error:&v27 byAccessor:v26];
        objc_storeStrong(v36, v27);
        _Block_object_dispose(&v31, 8);
      }
      else
      {
        uint64_t v19 = MFLogGeneral();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          [(MFAttachmentSecurityScope *)(uint64_t)&self->_securityScopedURL startReadAccess];
        }
      }
    }
  }
  secureReadURL = self->_secureReadURL;
  return secureReadURL;
}

void __44__MFAttachmentSecurityScope_startReadAccess__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 _temporaryReadURL:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;
}

void __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_129(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 _temporaryReadURL:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;
}

- (id)_temporaryReadURL:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = NSTemporaryDirectory();
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  v9 = [v6 stringByAppendingPathComponent:v8];

  v10 = [v5 lastPathComponent];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v8) = [v11 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];

  if (v8)
  {
    v12 = [v9 stringByAppendingPathComponent:v10];
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v12 isDirectory:0];
    int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v15 = [v14 linkItemAtURL:v5 toURL:v13 error:a4];

    if (v15) {
      goto LABEL_8;
    }
    int v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (a4)
      {
        objc_msgSend(*a4, "ef_publicDescription");
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v19 = @"unknown";
      }
      int v20 = 138412546;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      uint64_t v23 = v19;
      _os_log_error_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary read URL [%@] error [%{public}@]", (uint8_t *)&v20, 0x16u);
      if (a4) {
    }
      }
    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 removeItemAtPath:v9 error:0];
  }
  else
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFAttachmentSecurityScope _temporaryReadURL:error:]();
    }
  }
  objc_super v13 = 0;
LABEL_8:

  return v13;
}

- (void)_removeTemporaryReadURL
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_8_0(&dword_1A7EFF000, a2, a3, "Failed to remove temporary read URL [%@] error [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)stopAccess
{
  if (self->_securedRead) {
    [(NSURL *)self->_securityScopedURL stopAccessingSecurityScopedResource];
  }
  if (self->_secureReadURL)
  {
    [(MFAttachmentSecurityScope *)self _removeTemporaryReadURL];
    secureReadURL = self->_secureReadURL;
    self->_secureReadURL = 0;

    self->_securedRead = 0;
  }
  if (self->_securedWrite) {
    [(NSURL *)self->_securityScopedURL stopAccessingSecurityScopedResource];
  }
  secureWriteURL = self->_secureWriteURL;
  if (secureWriteURL)
  {
    self->_secureWriteURL = 0;

    self->_securedWrite = 0;
  }
}

- (id)securityScopeToken
{
  if (!self->_securityScopeToken)
  {
    id v3 = [(NSURL *)self->_securityScopedURL path];
    [v3 fileSystemRepresentation];
    BOOL v4 = (const char *)sandbox_extension_issue_file();

    if (v4)
    {
      id v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v4 length:strlen(v4) + 1];
      securityScopeToken = self->_securityScopeToken;
      self->_securityScopeToken = v5;
    }
  }
  uint64_t v7 = self->_securityScopeToken;
  return v7;
}

- (void)_attachSecurityScope
{
  id v3 = [(MFAttachmentSecurityScope *)self securityScopeToken];

  if (v3)
  {
    securityScopedURL = self->_securityScopedURL;
    id v5 = [(MFAttachmentSecurityScope *)self securityScopeToken];
    MEMORY[0x1AD0E3090](securityScopedURL);
  }
}

- (id)data
{
  secureReadURL = self->_secureReadURL;
  if (!secureReadURL)
  {
    id v4 = [(MFAttachmentSecurityScope *)self startReadAccess];
    secureReadURL = self->_secureReadURL;
  }
  uint64_t v7 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:secureReadURL options:3 error:&v7];
  return v5;
}

- (BOOL)isReadable
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(NSURL *)self->_securityScopedURL path];
  char v5 = [v3 isReadableFileAtPath:v4];

  if (v5) {
    return 1;
  }
  securityScopedURL = self->_securityScopedURL;
  id v9 = 0;
  BOOL v6 = [(NSURL *)securityScopedURL checkPromisedItemIsReachableAndReturnError:&v9];

  return v6;
}

- (BOOL)isBundle
{
  char v7 = 0;
  BOOL v3 = [(MFAttachmentSecurityScope *)self isReadable];
  BOOL result = 0;
  if (v3)
  {
    char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v6 = [(NSURL *)self->_secureReadURL path];
    [v5 fileExistsAtPath:v6 isDirectory:&v7];

    return v7 != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureWriteURL, 0);
  objc_storeStrong((id *)&self->_secureReadURL, 0);
  objc_storeStrong((id *)&self->_securityScopeToken, 0);
  objc_storeStrong((id *)&self->_securityScopedURL, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
}

- (void)startWriteAccess
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "NSFileCoordinator ops can block, the caller should move to a background thread", v1, 2u);
}

- (void)startReadAccess
{
}

- (void)_temporaryReadURL:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#Attachments Failed to create temporary read directory [%@]", v2, v3, v4, v5, v6);
}

@end