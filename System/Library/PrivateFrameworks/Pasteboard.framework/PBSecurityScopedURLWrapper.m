@interface PBSecurityScopedURLWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackedByFileProvider;
- (BOOL)isReadonly;
- (FPItem)fpItem;
- (NSURL)url;
- (PBSecurityScopedURLWrapper)initWithCoder:(id)a3;
- (PBSecurityScopedURLWrapper)initWithFPItem:(id)a3;
- (PBSecurityScopedURLWrapper)initWithNSURLWrapper:(id)a3;
- (PBSecurityScopedURLWrapper)initWithURL:(id)a3;
- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 issueExtension:(BOOL)a4 readonly:(BOOL)a5 extensionClass:(id)a6;
- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4;
- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5;
- (PBSecurityScopedURLWrapper)initWithURLWithoutIssuingExtension:(id)a3;
- (id)description;
- (id)nsURLWrapper;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBSecurityScopedURLWrapper

- (PBSecurityScopedURLWrapper)initWithFPItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBSecurityScopedURLWrapper;
  v6 = [(PBSecurityScopedURLWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fpItem, a3);
    *(_WORD *)&v7->_readonly = 257;
  }

  return v7;
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3
{
  return [(PBSecurityScopedURLWrapper *)self initWithURL:a3 readonly:0];
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return [(PBSecurityScopedURLWrapper *)self initWithURL:a3 readonly:a4 extensionClass:0];
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5
{
  return [(PBSecurityScopedURLWrapper *)self initWithURL:a3 issueExtension:1 readonly:a4 extensionClass:a5];
}

- (PBSecurityScopedURLWrapper)initWithURLWithoutIssuingExtension:(id)a3
{
  return [(PBSecurityScopedURLWrapper *)self initWithURL:a3 issueExtension:0 readonly:1 extensionClass:0];
}

- (PBSecurityScopedURLWrapper)initWithURL:(id)a3 issueExtension:(BOOL)a4 readonly:(BOOL)a5 extensionClass:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PBSecurityScopedURLWrapper;
  v13 = [(PBSecurityScopedURLWrapper *)&v26 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v13->_url, a3);
  v14->_readonly = v7;
  if (softLinkFPIsFileProviderBookmark((uint64_t)v11, 0))
  {
    v14->_backedByFileProvider = 1;
    goto LABEL_15;
  }
  if (!v8) {
    goto LABEL_15;
  }
  if (v12)
  {
    v15 = (void *)[v12 UTF8String];
  }
  else
  {
    if (!v7)
    {
      id v22 = v11;
      if (v22)
      {
        getpid();
        id v23 = [v22 path];
        [v23 fileSystemRepresentation];
        int v24 = sandbox_check();

        if (v24) {
          OnlySandboxExtensionTypeForURL = _bestReadOnlySandboxExtensionTypeForURL(v22);
        }
        else {
          OnlySandboxExtensionTypeForURL = (void *)*MEMORY[0x1E4F14008];
        }
      }
      else
      {
        OnlySandboxExtensionTypeForURL = 0;
      }

      goto LABEL_10;
    }
    v15 = _bestReadOnlySandboxExtensionTypeForURL(v11);
  }
  OnlySandboxExtensionTypeForURL = v15;
LABEL_10:
  id v25 = 0;
  uint64_t v17 = _issueSandboxExtension(v11, (uint64_t)OnlySandboxExtensionTypeForURL, &v25);
  id v18 = v25;
  scope = v14->_scope;
  v14->_scope = (NSData *)v17;

  if (v18)
  {
    v20 = _PBLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v18;
      _os_log_fault_impl(&dword_18D208000, v20, OS_LOG_TYPE_FAULT, "Could not create sandbox extension. Error: %@", buf, 0xCu);
    }
  }
LABEL_15:

  return v14;
}

- (PBSecurityScopedURLWrapper)initWithNSURLWrapper:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PBSecurityScopedURLWrapper;
    id v5 = [(PBSecurityScopedURLWrapper *)&v16 init];
    if (v5)
    {
      v6 = [v4 url];
      uint64_t v7 = [v6 copy];
      BOOL v8 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v7;

      *((unsigned char *)v5 + 16) = [v4 isReadonly];
      objc_super v9 = [v4 _scope];
      uint64_t v10 = [v9 copy];
      id v11 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v10;

      uint64_t v12 = objc_getAssociatedObject(v4, &kFPItemObjectKey);
      v13 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v12;

      if (*((void *)v5 + 4)) {
        *((unsigned char *)v5 + 17) = 1;
      }
      else {
        *((unsigned char *)v5 + 17) = softLinkFPIsFileProviderBookmark(*((void *)v5 + 3), 0);
      }
    }
    self = (PBSecurityScopedURLWrapper *)v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)nsURLWrapper
{
  if (self->_fpItem)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28FF8]);
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"fpitem://"];
    id v5 = (void *)[v3 initWithURL:v4 readonly:1];

    objc_setAssociatedObject(v5, &kFPItemObjectKey, self->_fpItem, (void *)0x301);
  }
  else
  {
    if (self->_scope || self->_backedByFileProvider) {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:self->_url readonly:self->_readonly scope:self->_scope];
    }
    else {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:self->_url readonly:self->_readonly];
    }
    id v5 = (void *)v6;
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PBSecurityScopedURLWrapper;
  id v3 = [(PBSecurityScopedURLWrapper *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"URL: %@\n", self->_url];
  objc_msgSend(v4, "appendFormat:", @"Readonly: %d\n", self->_readonly);
  objc_msgSend(v4, "appendFormat:", @"Has security scope: %d\n", self->_scope != 0);
  objc_msgSend(v4, "appendFormat:", @"Is backed by FP: %d\n", self->_backedByFileProvider);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeBool:self->_readonly forKey:@"readonly"];
  if (!self->_backedByFileProvider)
  {
    url = self->_url;
    if (url) {
      [v4 encodeObject:url forKey:@"url"];
    }
    scope = self->_scope;
    if (scope) {
      [v4 encodeObject:scope forKey:@"scope"];
    }
    BOOL v8 = [(PBSecurityScopedURLWrapper *)self url];
    objc_super v9 = (void *)_CFURLPromiseCopyPhysicalURL();

    if (v9)
    {
      [v4 encodeObject:v9 forKey:@"promiseURL"];
      uint64_t v10 = (void *)MEMORY[0x192F9A580](v9);
      if (v10
        || (_issueSandboxExtension(v9, *MEMORY[0x1E4F14008], 0),
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v4 encodeObject:v10 forKey:@"promiseScope"];
      }
    }
    goto LABEL_18;
  }
  [v4 encodeBool:1 forKey:@"isFileProviderFile"];
  fpItem = self->_fpItem;
  if (!fpItem)
  {
    CFTypeRef cf = 0;
    objc_super v9 = (void *)((uint64_t (*)(uint64_t, uint64_t))softLinkFPCreateBookmarkableStringFromDocumentURL[0])((uint64_t)self->_url, (uint64_t)&cf);
    if (cf)
    {
      id v11 = _PBLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v14 = cf;
        _os_log_fault_impl(&dword_18D208000, v11, OS_LOG_TYPE_FAULT, "Could not create bookmarkable string from file provider URL. Error: %@", buf, 0xCu);
      }

      CFRelease(cf);
    }
    if (v9) {
      [v4 encodeObject:v9 forKey:@"bookmarkableString"];
    }
LABEL_18:

    goto LABEL_19;
  }
  [v4 encodeObject:fpItem forKey:@"FPItem"];
LABEL_19:
}

- (PBSecurityScopedURLWrapper)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PBSecurityScopedURLWrapper;
  id v5 = [(PBSecurityScopedURLWrapper *)&v21 init];
  if (v5)
  {
    v5->_readonly = [v4 decodeBoolForKey:@"readonly"];
    int v6 = [v4 decodeBoolForKey:@"isFileProviderFile"];
    v5->_backedByFileProvider = v6;
    if (!v6)
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
      url = v5->_url;
      v5->_url = (NSURL *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scope"];
      scope = v5->_scope;
      v5->_scope = (NSData *)v16;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promiseURL"];
      id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promiseScope"];
      if (v5->_url)
      {
        if (v5->_scope) {
          MEMORY[0x192F9A570]();
        }
        if (v10 && v18) {
          MEMORY[0x192F9A570](v10, v18);
        }
        _CFURLPromiseSetPhysicalURL();
      }

      goto LABEL_17;
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FPItem"];
    fpItem = v5->_fpItem;
    v5->_fpItem = (FPItem *)v7;

    if (!v5->_fpItem)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkableString"];
      uint64_t v10 = (void *)v9;
      if (v9)
      {
        CFTypeRef cf = 0;
        ((void (*)(uint64_t, uint64_t))softLinkFPCreateDocumentURLFromBookmarkableString[0])(v9, (uint64_t)&cf);
        id v11 = v5->_url;
        v5->_url = v12;

        if (cf)
        {
          v13 = _PBLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFTypeRef v23 = cf;
            _os_log_fault_impl(&dword_18D208000, v13, OS_LOG_TYPE_FAULT, "Could not resolve file provider-backed URL. Error: %@", buf, 0xCu);
          }

          CFRelease(cf);
        }
      }
LABEL_17:
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isBackedByFileProvider
{
  return self->_backedByFileProvider;
}

- (FPItem)fpItem
{
  return self->_fpItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpItem, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end