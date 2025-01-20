@interface UISUISecurityScopedResource
+ (BOOL)_isValidURLForIssuingSandboxExtension:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_sandboxExtensionClassForAllowedAccess:(int64_t)a3;
+ (id)_scopedResourcesForAncestorsOfItemWithAbsolutePath:(id)a3 traversalStopPaths:(id)a4 allowedAccess:(int64_t)a5;
+ (id)readonlySandboxExtensionClassString;
+ (id)readwriteSandboxExtensionClassString;
+ (id)sandboxingURLWrapperWithFileURL:(id)a3 allowedAccess:(int64_t)a4;
+ (id)scopedResourceWithAbsolutePath:(id)a3 allowedAccess:(int64_t)a4;
+ (id)scopedResourceWithFileURL:(id)a3 allowedAccess:(int64_t)a4;
+ (id)scopedResourceWithURL:(id)a3 allowedAccess:(int64_t)a4;
+ (id)uniquedSecurityScopedResources:(id)a3;
- (BOOL)_isEqualAccessToSecurityScopedResource:(id)a3;
- (BOOL)hasActiveAccessAssertion;
- (BOOL)isContentManaged;
- (BOOL)startAccessing;
- (FPSandboxingURLWrapper)sandboxExtensionWrapper;
- (NSURL)url;
- (UISUISecurityScopedResource)initWithAbsoluteURL:(id)a3 sandboxExtensionWrapper:(id)a4 allowedAccess:(int64_t)a5;
- (UISUISecurityScopedResource)initWithCoder:(id)a3;
- (id)description;
- (int64_t)allowedAccess;
- (int64_t)underlyingSandboxAssertionHandle;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedAccess:(int64_t)a3;
- (void)setHasActiveAccessAssertion:(BOOL)a3;
- (void)setSandboxExtensionWrapper:(id)a3;
- (void)setUnderlyingSandboxAssertionHandle:(int64_t)a3;
- (void)stopAccessing;
@end

@implementation UISUISecurityScopedResource

+ (id)scopedResourceWithAbsolutePath:(id)a3 allowedAccess:(int64_t)a4
{
  id v6 = a3;
  if ([v6 isAbsolutePath])
  {
    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = canonicalPathForPath(v6);
    v9 = [v7 fileURLWithPath:v8];

    v10 = [a1 scopedResourceWithFileURL:v9 allowedAccess:a4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)scopedResourceWithFileURL:(id)a3 allowedAccess:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 isFileURL]) {
    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_9;
  }
  if (![a1 _isValidURLForIssuingSandboxExtension:v6])
  {
    v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring URL %{public}@ for sandbox purposes since the corresponding file doesn't exist", (uint8_t *)&v14, 0xCu);
    }

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v7 = [a1 _sandboxExtensionClassForAllowedAccess:a4];
  Class FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  id v9 = v7;
  v10 = -[objc_class wrapperWithURL:extensionClass:error:](FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v6, [v9 UTF8String], 0);

  if (!v10)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_11;
  }
LABEL_10:
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAbsoluteURL:v6 sandboxExtensionWrapper:v10 allowedAccess:a4];

LABEL_11:
  return v11;
}

+ (id)sandboxingURLWrapperWithFileURL:(id)a3 allowedAccess:(int64_t)a4
{
  v4 = +[UISUISecurityScopedResource scopedResourceWithFileURL:a3 allowedAccess:a4];
  v5 = [v4 sandboxExtensionWrapper];

  return v5;
}

+ (id)scopedResourceWithURL:(id)a3 allowedAccess:(int64_t)a4
{
  id v6 = a3;
  if ([v6 isFileURL])
  {
    uint64_t v7 = [a1 scopedResourceWithFileURL:v6 allowedAccess:a4];
  }
  else
  {
    uint64_t v7 = [objc_alloc((Class)objc_opt_class()) initWithAbsoluteURL:v6 sandboxExtensionWrapper:0 allowedAccess:a4];
  }
  v8 = (void *)v7;

  return v8;
}

- (UISUISecurityScopedResource)initWithAbsoluteURL:(id)a3 sandboxExtensionWrapper:(id)a4 allowedAccess:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISUISecurityScopedResource;
  v10 = [(UISUISecurityScopedResource *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    objc_storeStrong((id *)&v10->_sandboxExtensionWrapper, a4);
    v10->_allowedAccess = a5;
    if (v10->_sandboxExtensionWrapper)
    {
      uint64_t v13 = [v9 url];
      int v14 = v10->_url;
      v10->_url = (NSURL *)v13;
    }
  }

  return v10;
}

- (BOOL)isContentManaged
{
  return [(NSURL *)self->_url ui_isContentManaged];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUISecurityScopedResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  if (FileProviderLibrary_sOnce != -1) {
    dispatch_once(&FileProviderLibrary_sOnce, &__block_literal_global_20);
  }
  getFPSandboxingURLWrapperClass();
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityScopedData"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"allowedAccess"];
  objc_msgSend(v5, "ui_setIsContentManaged:", objc_msgSend(v4, "decodeBoolForKey:", @"isContentManaged"));
  id v8 = [(UISUISecurityScopedResource *)self initWithAbsoluteURL:v5 sandboxExtensionWrapper:v6 allowedAccess:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(UISUISecurityScopedResource *)self url];
  [v5 encodeObject:v4 forKey:@"url"];

  [v5 encodeObject:self->_sandboxExtensionWrapper forKey:@"securityScopedData"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[UISUISecurityScopedResource allowedAccess](self, "allowedAccess"), @"allowedAccess");
  objc_msgSend(v5, "encodeBool:forKey:", -[UISUISecurityScopedResource isContentManaged](self, "isContentManaged"), @"isContentManaged");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(UISUISecurityScopedResource *)self url];
  id v6 = [v5 path];
  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "_sandboxExtensionClassForAllowedAccess:", -[UISUISecurityScopedResource allowedAccess](self, "allowedAccess"));
  BOOL v8 = [(UISUISecurityScopedResource *)self hasActiveAccessAssertion];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  v10 = [v3 stringWithFormat:@"<%@: %p> path = %@, allowedAccess = %@, accessActive = %@", v4, self, v6, v7, v9];

  return v10;
}

- (BOOL)startAccessing
{
  if (![(UISUISecurityScopedResource *)self hasActiveAccessAssertion])
  {
    v3 = [(UISUISecurityScopedResource *)self url];
    -[UISUISecurityScopedResource setHasActiveAccessAssertion:](self, "setHasActiveAccessAssertion:", [v3 startAccessingSecurityScopedResource]);
  }
  return [(UISUISecurityScopedResource *)self hasActiveAccessAssertion];
}

- (void)stopAccessing
{
  if ([(UISUISecurityScopedResource *)self hasActiveAccessAssertion])
  {
    [(UISUISecurityScopedResource *)self setHasActiveAccessAssertion:0];
    id v3 = [(UISUISecurityScopedResource *)self url];
    [v3 stopAccessingSecurityScopedResource];
  }
}

+ (id)readonlySandboxExtensionClassString
{
  return (id)[NSString stringWithUTF8String:*MEMORY[0x1E4F14000]];
}

+ (id)readwriteSandboxExtensionClassString
{
  return (id)[NSString stringWithUTF8String:*MEMORY[0x1E4F14008]];
}

- (BOOL)_isEqualAccessToSecurityScopedResource:(id)a3
{
  id v4 = a3;
  url = self->_url;
  id v6 = [v4 url];
  if ([(NSURL *)url isEqual:v6])
  {
    uint64_t v7 = [(id)objc_opt_class() _sandboxExtensionClassForAllowedAccess:self->_allowedAccess];
    BOOL v8 = objc_msgSend((id)objc_opt_class(), "_sandboxExtensionClassForAllowedAccess:", objc_msgSend(v4, "allowedAccess"));
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)_isValidURLForIssuingSandboxExtension:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = (void *)_CFURLPromiseCopyPhysicalURL();
    if (v8)
    {
      char v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      v10 = [v8 path];
      char v7 = [v9 fileExistsAtPath:v10];
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

+ (id)_sandboxExtensionClassForAllowedAccess:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [a1 readwriteSandboxExtensionClassString];
  }
  else if (a3 == 1)
  {
    id v3 = [a1 readonlySandboxExtensionClassString];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)uniquedSecurityScopedResources:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke;
  v20[3] = &unk_1E5A22A28;
  id v6 = v5;
  id v21 = v6;
  id v7 = v4;
  id v22 = v7;
  BOOL v8 = (void (**)(void, void))MEMORY[0x1A6229A90](v20);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v8[2](v8, *(void *)(*((void *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v11);
  }

  id v14 = v7;
  return v14;
}

void __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 url];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
  }
  id v9 = v8;

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v3 url];
  [v10 setObject:v9 forKeyedSubscript:v11];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke_2;
  v13[3] = &unk_1E5A22A00;
  id v12 = v3;
  id v14 = v12;
  if ([v9 indexOfObjectPassingTest:v13] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 addObject:v12];
    [*(id *)(a1 + 40) addObject:v12];
  }
}

uint64_t __62__UISUISecurityScopedResource_uniquedSecurityScopedResources___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isEqualAccessToSecurityScopedResource:a2];
}

+ (id)_scopedResourcesForAncestorsOfItemWithAbsolutePath:(id)a3 traversalStopPaths:(id)a4 allowedAccess:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isAbsolutePath])
  {
    id v9 = canonicalPathForPath(v7);
    uint64_t v10 = [v9 stringByDeletingLastPathComponent];

    id v23 = v8;
    id v11 = v8;
    id v12 = [MEMORY[0x1E4F1CA80] set];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = canonicalPathForPath(*(void **)(*((void *)&v24 + 1) + 8 * i));
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [v12 addObject:@"/"];
    [v12 addObject:&stru_1EF308000];

    long long v19 = [MEMORY[0x1E4F1CA48] array];
    if ([v10 length])
    {
      id v8 = v23;
      while (([v12 containsObject:v10] & 1) == 0)
      {
        v20 = [(id)objc_opt_class() scopedResourceWithAbsolutePath:v10 allowedAccess:a5];
        if (v20) {
          [v19 insertObject:v20 atIndex:0];
        }
        id v21 = [v10 stringByDeletingLastPathComponent];

        uint64_t v10 = v21;
        if (![v21 length]) {
          goto LABEL_19;
        }
      }
      id v21 = v10;
    }
    else
    {
      id v21 = v10;
      id v8 = v23;
    }
LABEL_19:
  }
  else
  {
    long long v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)allowedAccess
{
  return self->_allowedAccess;
}

- (void)setAllowedAccess:(int64_t)a3
{
  self->_allowedAccess = a3;
}

- (FPSandboxingURLWrapper)sandboxExtensionWrapper
{
  return self->_sandboxExtensionWrapper;
}

- (void)setSandboxExtensionWrapper:(id)a3
{
}

- (BOOL)hasActiveAccessAssertion
{
  return self->_hasActiveAccessAssertion;
}

- (void)setHasActiveAccessAssertion:(BOOL)a3
{
  self->_hasActiveAccessAssertion = a3;
}

- (int64_t)underlyingSandboxAssertionHandle
{
  return self->_underlyingSandboxAssertionHandle;
}

- (void)setUnderlyingSandboxAssertionHandle:(int64_t)a3
{
  self->_underlyingSandboxAssertionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end