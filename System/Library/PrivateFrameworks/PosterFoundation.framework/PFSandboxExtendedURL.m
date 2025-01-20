@interface PFSandboxExtendedURL
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)sandboxExtendedURLForURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)isValid;
- (NSURL)URL;
- (PFSandboxExtendedURL)initWithBSXPCCoder:(id)a3;
- (PFSandboxExtendedURL)initWithCoder:(id)a3;
- (PFSandboxExtendedURL)initWithURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5;
- (unsigned)options;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation PFSandboxExtendedURL

+ (id)sandboxExtendedURLForURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  v8 = [[PFSandboxExtendedURL alloc] initWithURL:v7 options:v6 error:a5];

  return v8;
}

- (PFSandboxExtendedURL)initWithURL:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 checkResourceIsReachableAndReturnError:a5])
  {
    v16.receiver = self;
    v16.super_class = (Class)PFSandboxExtendedURL;
    v9 = [(PFSandboxExtendedURL *)&v16 init];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x263F29BE0] tokenForCurrentProcess];
      sandboxExtensionAuditToken = v9->_sandboxExtensionAuditToken;
      v9->_sandboxExtensionAuditToken = (BSAuditToken *)v10;

      uint64_t v12 = [v8 copy];
      sandboxExtensionURL = v9->_sandboxExtensionURL;
      v9->_sandboxExtensionURL = (NSURL *)v12;

      v9->_options = a4;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  if ((self->_options & 2) != 0) {
    [(PFSandboxExtendedURL *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)PFSandboxExtendedURL;
  [(PFSandboxExtendedURL *)&v3 dealloc];
}

- (BOOL)isValid
{
  if (self->_sandboxExtensionAuditToken) {
    return [(NSURL *)self->_sandboxExtensionURL checkResourceIsReachableAndReturnError:0];
  }
  else {
    return self->_sandboxExtensionHandle != -1;
  }
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = *__error();
  uint64_t v7 = *(void *)(a2 + 24);
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 2082;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  _os_log_error_impl(&dword_25A085000, a3, OS_LOG_TYPE_ERROR, "failed to release sandboxExtensionHandle with errno=%i (%{public}s) : %{public}@", (uint8_t *)v8, 0x1Cu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PFSandboxExtendedURL)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PFSandboxExtendedURL;
  v5 = [(PFSandboxExtendedURL *)&v19 init];
  int v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  v5->_sandboxExtensionHandle = -1;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sandboxExtensionURL"];
  sandboxExtensionURL = v6->_sandboxExtensionURL;
  v6->_sandboxExtensionURL = (NSURL *)v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    v6->_options = 2;
LABEL_6:
    __int16 v11 = v6;
    goto LABEL_7;
  }
  __int16 v9 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8798] forKey:@"sandboxToken"];
  xpc_string_get_string_ptr(v9);
  uint64_t v10 = sandbox_extension_consume();
  v6->_sandboxExtensionHandle = v10;
  if (v10 != -1)
  {

    goto LABEL_5;
  }
  uint64_t v13 = __error();
  strerror_r(*v13, __strerrbuf, 0x100uLL);
  v14 = PFLogPosterContents();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = *__error();
    objc_super v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = v6->_sandboxExtensionURL;
    *(_DWORD *)buf = 138413314;
    v21 = v9;
    __int16 v22 = 1024;
    int v23 = v15;
    __int16 v24 = 2082;
    v25 = __strerrbuf;
    __int16 v26 = 2114;
    v27 = v17;
    __int16 v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_25A085000, v14, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from coder with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);
  }
  __int16 v11 = 0;
LABEL_7:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 encodeObject:self->_sandboxExtensionURL forKey:@"_sandboxExtensionURL"];
    sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
    [(NSURL *)self->_sandboxExtensionURL fileSystemRepresentation];
    if (sandboxExtensionAuditToken)
    {
      uint64_t v7 = self->_sandboxExtensionAuditToken;
      if (v7) {
        [(BSAuditToken *)v7 realToken];
      }
      id v8 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      id v8 = (const char *)sandbox_extension_issue_file();
    }
    __int16 v9 = (char *)v8;
    if (v8)
    {
      xpc_object_t v10 = xpc_string_create(v8);
      free(v9);
      [v5 encodeXPCObject:v10 forKey:@"sandboxToken"];
    }
  }
  else
  {
    __int16 v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    objc_super v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v11 stringWithFormat:@"<%@:%p> can only be encoded by %@ rather than %@ : %@", v13, self, v15, v17, self];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      [(PFSandboxExtendedURL *)a2 encodeWithCoder:(uint64_t)v18];
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PFSandboxExtendedURL)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFSandboxExtendedURL;
  id v5 = [(PFSandboxExtendedURL *)&v11 init];
  int v6 = v5;
  if (v5)
  {
    v5->_sandboxExtensionHandle = -1;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sandboxExtensionURL"];
    sandboxExtensionURL = v6->_sandboxExtensionURL;
    v6->_sandboxExtensionURL = (NSURL *)v7;

    __int16 v9 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8798] forKey:@"sandboxToken"];
    xpc_string_get_string_ptr(v9);
    v6->_sandboxExtensionHandle = sandbox_extension_consume();
    v6->_options = 2;
  }
  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_sandboxExtensionURL forKey:@"_sandboxExtensionURL"];
  sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
  [(NSURL *)self->_sandboxExtensionURL fileSystemRepresentation];
  if (sandboxExtensionAuditToken)
  {
    int v6 = self->_sandboxExtensionAuditToken;
    if (v6) {
      [(BSAuditToken *)v6 realToken];
    }
    uint64_t v7 = (const char *)sandbox_extension_issue_file_to_process();
  }
  else
  {
    uint64_t v7 = (const char *)sandbox_extension_issue_file();
  }
  id v8 = (char *)v7;
  if (v7)
  {
    xpc_object_t v9 = xpc_string_create(v7);
    free(v8);
    [v4 encodeXPCObject:v9 forKey:@"sandboxToken"];
  }
}

- (NSURL)URL
{
  return self->_sandboxExtensionURL;
}

- (unsigned)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionURL, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionAuditToken, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  xpc_object_t v9 = v5;
  __int16 v10 = 2114;
  objc_super v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  int v15 = @"PFSandboxExtendedURL.m";
  __int16 v16 = 1024;
  int v17 = 121;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end