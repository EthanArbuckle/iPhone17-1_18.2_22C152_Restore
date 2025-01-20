@interface SLSecurityScopedURL
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSandboxExtendedURL:(id)a3;
- (BOOL)isReadonly;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)sandboxExtensionClass;
- (NSString)sandboxExtensionToken;
- (NSURL)URL;
- (SLSecurityScopedURL)init;
- (SLSecurityScopedURL)initWithBSXPCCoder:(id)a3;
- (SLSecurityScopedURL)initWithCoder:(id)a3;
- (SLSecurityScopedURL)initWithURL:(id)a3;
- (SLSecurityScopedURL)initWithURL:(id)a3 extensionType:(int64_t)a4;
- (SLSecurityScopedURL)initWithURL:(id)a3 readonly:(BOOL)a4;
- (id)_issueSandboxExtension;
- (int64_t)sandboxExtensionHandle;
- (unint64_t)hash;
- (void)URL;
- (void)_issueSandboxExtension;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setSandboxExtensionClass:(id)a3;
- (void)setSandboxExtensionHandle:(int64_t)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SLSecurityScopedURL

- (SLSecurityScopedURL)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLSecurityScopedURL;
  v6 = [(SLSecurityScopedURL *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (SLSecurityScopedURL)initWithURL:(id)a3 extensionType:(int64_t)a4
{
  id v5 = [(SLSecurityScopedURL *)self initWithURL:a3];
  v6 = v5;
  if (v5)
  {
    if (a4 == 1)
    {
      v5->_readonly = 0;
      v7 = NSString;
      v8 = (void *)MEMORY[0x1E4F14008];
      goto LABEL_6;
    }
    if (!a4)
    {
      v5->_readonly = 1;
      v7 = NSString;
      v8 = (void *)MEMORY[0x1E4F14000];
LABEL_6:
      uint64_t v9 = [v7 stringWithUTF8String:*v8];
      sandboxExtensionClass = v6->_sandboxExtensionClass;
      v6->_sandboxExtensionClass = (NSString *)v9;
    }
  }
  return v6;
}

- (SLSecurityScopedURL)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return [(SLSecurityScopedURL *)self initWithURL:a3 extensionType:!a4];
}

- (SLSecurityScopedURL)init
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p URL=%@ isReadonly=%d>", objc_opt_class(), self, self->_URL, -[SLSecurityScopedURL isReadonly](self, "isReadonly")];
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  URL = self->_URL;
  v6 = [(SLSecurityScopedURL *)self sandboxExtensionClass];
  v7 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
  v8 = [v3 stringWithFormat:@"<%@ %p URL=%@ sandboxExtensionClass=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>", v4, self, URL, v6, v7, -[SLSecurityScopedURL sandboxExtensionHandle](self, "sandboxExtensionHandle")];

  return (NSString *)v8;
}

- (NSURL)URL
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    int64_t v5 = [(SLSecurityScopedURL *)self sandboxExtensionHandle];

    if (!v5)
    {
      id v6 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
      [v6 UTF8String];
      [(SLSecurityScopedURL *)self setSandboxExtensionHandle:sandbox_extension_consume()];

      int64_t v7 = [(SLSecurityScopedURL *)self sandboxExtensionHandle];
      v8 = SLFrameworkLogHandle();
      uint64_t v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[SLSecurityScopedURL URL](self);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        URL = self->_URL;
        int v13 = 138412290;
        v14 = URL;
        _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_INFO, "Successfully consumed sandbox extension for URL: %@", (uint8_t *)&v13, 0xCu);
      }

      [(SLSecurityScopedURL *)self setSandboxExtensionToken:0];
    }
  }
  v11 = self->_URL;
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SLSecurityScopedURL *)self isEqualToSandboxExtendedURL:v4];

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  id v9 = a3;
  v10 = [(SLSecurityScopedURL *)self URL];
  if (v10 || ([v9 URL], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = [(SLSecurityScopedURL *)self URL];
    id v4 = [v9 URL];
    if (![v3 isEqual:v4])
    {
      BOOL v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  int v13 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
  if (v13 || ([v9 sandboxExtensionToken], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
    int64_t v7 = [v9 sandboxExtensionToken];
    if (![v6 isEqual:v7])
    {
      BOOL v12 = 0;
      goto LABEL_15;
    }
    int v20 = v11;
    v14 = v5;
    int v15 = 1;
  }
  else
  {
    int v20 = v11;
    v14 = v5;
    v19 = 0;
    int v15 = 0;
  }
  int64_t v16 = [(SLSecurityScopedURL *)self sandboxExtensionHandle];
  BOOL v12 = v16 == [v9 sandboxExtensionHandle];
  if (v15)
  {
    BOOL v5 = v14;
    int v11 = v20;
LABEL_15:

    if (v13) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  BOOL v5 = v14;
  int v11 = v20;
  if (v13)
  {
LABEL_16:

    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_22:

  if (v11) {
    goto LABEL_17;
  }
LABEL_18:
  if (!v10) {

  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SLSecurityScopedURL *)self URL];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SLSecurityScopedURL *)self sandboxExtensionToken];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(SLSecurityScopedURL *)self sandboxExtensionHandle];

  return v7;
}

- (id)_issueSandboxExtension
{
  uint64_t v3 = [(SLSecurityScopedURL *)self sandboxExtensionClass];

  if (v3)
  {
    id v4 = [(SLSecurityScopedURL *)self sandboxExtensionClass];
    [v4 UTF8String];
    id v5 = [(NSURL *)self->_URL path];
    [v5 fileSystemRepresentation];
    uint64_t v6 = (void *)sandbox_extension_issue_file();

    if (v6)
    {
      unint64_t v7 = [NSString stringWithUTF8String:v6];
      free(v6);
      goto LABEL_8;
    }
    v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLSecurityScopedURL _issueSandboxExtension](self);
    }
  }
  unint64_t v7 = 0;
LABEL_8:
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLSecurityScopedURL)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector("URL");
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = NSStringFromSelector(sel_isReadonly);
  uint64_t v9 = [v4 decodeBoolForKey:v8];

  v10 = [(SLSecurityScopedURL *)self initWithURL:v7 readonly:v9];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    BOOL v12 = NSStringFromSelector(sel_sandboxExtensionToken);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    sandboxExtensionToken = v10->_sandboxExtensionToken;
    v10->_sandboxExtensionToken = (NSString *)v13;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLSecurityScopedURL *)self URL];
  uint64_t v6 = NSStringFromSelector("URL");
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(SLSecurityScopedURL *)self _issueSandboxExtension];
  v8 = NSStringFromSelector(sel_sandboxExtensionToken);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(SLSecurityScopedURL *)self isReadonly];
  NSStringFromSelector(sel_isReadonly);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v9 forKey:v10];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLSecurityScopedURL)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector("URL");
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = NSStringFromSelector(sel_isReadonly);
  uint64_t v9 = [v4 decodeBoolForKey:v8];

  id v10 = [(SLSecurityScopedURL *)self initWithURL:v7 readonly:v9];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    BOOL v12 = NSStringFromSelector(sel_sandboxExtensionToken);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    sandboxExtensionToken = v10->_sandboxExtensionToken;
    v10->_sandboxExtensionToken = (NSString *)v13;
  }
  return v10;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLSecurityScopedURL *)self URL];
  uint64_t v6 = NSStringFromSelector("URL");
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(SLSecurityScopedURL *)self _issueSandboxExtension];
  v8 = NSStringFromSelector(sel_sandboxExtensionToken);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(SLSecurityScopedURL *)self isReadonly];
  NSStringFromSelector(sel_isReadonly);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v9 forKey:v10];
}

- (void)setURL:(id)a3
{
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (NSString)sandboxExtensionClass
{
  return self->_sandboxExtensionClass;
}

- (void)setSandboxExtensionClass:(id)a3
{
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionClass, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)URL
{
  v2 = [a1 sandboxExtensionToken];
  [a1 sandboxExtensionHandle];
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "Unable to consume sandbox extension with token %@, received handle %lld", v5, v6, v7, v8, 2u);
}

- (void)_issueSandboxExtension
{
  v2 = [a1 sandboxExtensionClass];
  BOOL v9 = [a1 URL];
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "Unable to issue sandbox extension of class %@ for URL %@", v5, v6, v7, v8, 2u);
}

@end