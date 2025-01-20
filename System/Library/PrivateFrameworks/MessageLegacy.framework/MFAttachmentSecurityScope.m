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
  v3 = [[MFAttachmentSecurityScope alloc] initWithSecurityScopedURL:a3 withToken:0];
  return v3;
}

+ (id)securityScopedURL:(id)a3 withToken:(id)a4
{
  v4 = [[MFAttachmentSecurityScope alloc] initWithSecurityScopedURL:a3 withToken:a4];
  return v4;
}

- (MFAttachmentSecurityScope)initWithSecurityScopedURL:(id)a3 withToken:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentSecurityScope;
  v6 = [(MFAttachmentSecurityScope *)&v8 init];
  if (v6)
  {
    v6->_fileCoordinator = (NSFileCoordinator *)objc_alloc_init(MEMORY[0x1E4F28CA0]);
    v6->_securityScopedURL = (NSURL *)a3;
    v6->_securityScopeToken = (NSData *)a4;
  }
  return v6;
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
      v13[4] = self;
      id v14 = 0;
      fileCoordinator = self->_fileCoordinator;
      securityScopedURL = self->_securityScopedURL;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke;
      v13[3] = &unk_1E68671D0;
      [(NSFileCoordinator *)fileCoordinator coordinateWritingItemAtURL:securityScopedURL options:8 error:&v14 byAccessor:v13];
      if (!self->_secureWriteURL)
      {
        objc_super v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(MFAttachmentSecurityScope *)&v14 startWriteAccess];
        }
        [(MFAttachmentSecurityScope *)self stopAccess];
      }
    }
    else
    {
      uint64_t v9 = [(NSString *)[(NSURL *)*p_securityScopedURL path] stringByDeletingLastPathComponent];
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isWritableFileAtPath:", -[NSURL path](*p_securityScopedURL, "path")) & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isWritableFileAtPath:", v9))
      {
        self->_secureWriteURL = self->_securityScopedURL;
      }
      else
      {
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          [(MFAttachmentSecurityScope *)(uint64_t *)&self->_securityScopedURL startWriteAccess];
        }
      }
    }
  }
  return self->_secureWriteURL;
}

id __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

- (id)startReadAccess
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3052000000;
      v18 = __Block_byref_object_copy__1;
      v19 = __Block_byref_object_dispose__1;
      uint64_t v20 = 0;
      if ([(NSURL *)self->_securityScopedURL checkPromisedItemIsReachableAndReturnError:&v20])
      {
        fileCoordinator = self->_fileCoordinator;
        securityScopedURL = self->_securityScopedURL;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke;
        v14[3] = &unk_1E68671F8;
        v14[4] = self;
        v14[5] = &v15;
        [(NSFileCoordinator *)fileCoordinator coordinateReadingItemAtURL:securityScopedURL options:8 error:v16 + 5 byAccessor:v14];
      }
      if (!self->_secureReadURL)
      {
        v7 = MFLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[MFAttachmentSecurityScope startReadAccess](objc_msgSend((id)v16[5], "ef_publicDescription"), (uint64_t)v21, v7);
        }
        [(MFAttachmentSecurityScope *)self stopAccess];
      }
      goto LABEL_15;
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](self->_securityScopedURL, "path")))
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3052000000;
      v18 = __Block_byref_object_copy__1;
      v19 = __Block_byref_object_dispose__1;
      uint64_t v20 = 0;
      objc_super v8 = self->_fileCoordinator;
      uint64_t v9 = self->_securityScopedURL;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_64;
      v13[3] = &unk_1E68671F8;
      v13[4] = self;
      void v13[5] = &v15;
      [(NSFileCoordinator *)v8 coordinateReadingItemAtURL:v9 options:8 error:&v20 byAccessor:v13];
LABEL_15:
      _Block_object_dispose(&v15, 8);
      return self->_secureReadURL;
    }
    uint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MFAttachmentSecurityScope *)(uint64_t *)&self->_securityScopedURL startReadAccess];
    }
  }
  return self->_secureReadURL;
}

id __44__MFAttachmentSecurityScope_startReadAccess__block_invoke(uint64_t a1, uint64_t a2)
{
  id result = (id)[*(id *)(a1 + 32) _temporaryReadURL:a2 error:*(void *)(*(void *)(a1 + 40) + 8) + 40];
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

id __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_64(uint64_t a1, uint64_t a2)
{
  id result = (id)[*(id *)(a1 + 32) _temporaryReadURL:a2 error:*(void *)(*(void *)(a1 + 40) + 8) + 40];
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (id)_temporaryReadURL:(id)a3 error:(id *)a4
{
  v6 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"));
  uint64_t v7 = [a3 lastPathComponent];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4))
  {
    uint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MFAttachmentSecurityScope _temporaryReadURL:error:]((uint64_t)v6, v11, v12);
    }
    return 0;
  }
  uint64_t v8 = [(NSString *)v6 stringByAppendingPathComponent:v7];
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8 isDirectory:0];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "linkItemAtURL:toURL:error:", a3, v9, a4) & 1) == 0)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MFAttachmentSecurityScope _temporaryReadURL:error:]((uint64_t)v9, a4, v10);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v6, 0);
    return 0;
  }
  return v9;
}

- (void)_removeTemporaryReadURL
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, (uint64_t)a2, a3, "Failed to remove temporary read URL [%@] error [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)stopAccess
{
  if (self->_securedRead) {
    [(NSURL *)self->_securityScopedURL stopAccessingSecurityScopedResource];
  }
  if (self->_secureReadURL)
  {
    [(MFAttachmentSecurityScope *)self _removeTemporaryReadURL];

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
  id result = self->_securityScopeToken;
  if (!result)
  {
    [(NSString *)[(NSURL *)self->_securityScopedURL path] fileSystemRepresentation];
    BOOL v4 = (const char *)sandbox_extension_issue_file();
    if (v4)
    {
      id result = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v4 length:strlen(v4) + 1];
      self->_securityScopeToken = (NSData *)result;
    }
    else
    {
      return self->_securityScopeToken;
    }
  }
  return result;
}

- (void)_attachSecurityScope
{
  if ([(MFAttachmentSecurityScope *)self securityScopeToken])
  {
    [(MFAttachmentSecurityScope *)self securityScopeToken];
    JUMPOUT(0x1D25DD630);
  }
}

- (id)data
{
  secureReadURL = self->_secureReadURL;
  if (!secureReadURL)
  {
    [(MFAttachmentSecurityScope *)self startReadAccess];
    secureReadURL = self->_secureReadURL;
  }
  uint64_t v5 = 0;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:secureReadURL options:3 error:&v5];
}

- (BOOL)isReadable
{
  uint64_t v4 = 0;
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](self->_securityScopedURL, "path")) & 1) != 0|| -[NSURL checkPromisedItemIsReachableAndReturnError:](self->_securityScopedURL, "checkPromisedItemIsReachableAndReturnError:", &v4);
}

- (BOOL)isBundle
{
  char v5 = 0;
  BOOL v3 = [(MFAttachmentSecurityScope *)self isReadable];
  BOOL result = 0;
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", -[NSURL path](self->_secureReadURL, "path"), &v5);
    return v5 != 0;
  }
  return result;
}

- (void)startWriteAccess
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_DEBUG, "NSFileCoordinator ops can block, the caller should move to a background thread", v1, 2u);
}

- (void)startReadAccess
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1CFCFE000, a2, a3, "#Attachments Error confirming URL is readable [%@]", (uint8_t *)&v4);
}

- (void)_temporaryReadURL:(os_log_t)log error:.cold.1(uint64_t a1, id *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v5 = (__CFString *)objc_msgSend(*a2, "ef_publicDescription");
  }
  else {
    uint64_t v5 = @"unknown";
  }
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary read URL [%@] error [%{public}@]", (uint8_t *)&v6, 0x16u);
}

- (void)_temporaryReadURL:(uint64_t)a3 error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1CFCFE000, a2, a3, "#Attachments Failed to create temporary read directory [%@]", (uint8_t *)&v3);
}

@end