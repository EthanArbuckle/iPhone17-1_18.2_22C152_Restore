@interface TUSandboxExtendedURL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSandboxExtendedURL:(id)a3;
- (NSString)sandboxExtensionClass;
- (NSString)sandboxExtensionToken;
- (NSURL)URL;
- (TUSandboxExtendedURL)init;
- (TUSandboxExtendedURL)initWithCoder:(id)a3;
- (TUSandboxExtendedURL)initWithURL:(id)a3;
- (TUSandboxExtendedURL)initWithURL:(id)a3 withExtensionType:(int64_t)a4;
- (id)description;
- (int)pid;
- (int64_t)sandboxExtensionHandle;
- (unint64_t)hash;
- (void)URL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPid:(int)a3;
- (void)setSandboxExtensionClass:(id)a3;
- (void)setSandboxExtensionHandle:(int64_t)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation TUSandboxExtendedURL

- (TUSandboxExtendedURL)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUSandboxExtendedURL;
  v6 = [(TUSandboxExtendedURL *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (TUSandboxExtendedURL)initWithURL:(id)a3 withExtensionType:(int64_t)a4
{
  id v5 = [(TUSandboxExtendedURL *)self initWithURL:a3];
  if (v5)
  {
    if (a4 == 1)
    {
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F14008];
      goto LABEL_6;
    }
    if (!a4)
    {
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F14000];
LABEL_6:
      uint64_t v8 = [v6 stringWithUTF8String:*v7];
      sandboxExtensionClass = v5->_sandboxExtensionClass;
      v5->_sandboxExtensionClass = (NSString *)v8;
    }
  }
  return v5;
}

- (TUSandboxExtendedURL)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUSandboxExtendedURL.m", 52, @"%s is not available. Use a designated initializer instead.", "-[TUSandboxExtendedURL init]");

  return 0;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "Releasing sandbox handle for URL: %@", (uint8_t *)&v3, 0xCu);
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  URL = self->_URL;
  v6 = [(TUSandboxExtendedURL *)self sandboxExtensionClass];
  v7 = [(TUSandboxExtendedURL *)self sandboxExtensionToken];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p URL=%@ sandboxExtensionClass=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>", v4, self, URL, v6, v7, -[TUSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle")];

  return v8;
}

- (NSURL)URL
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUSandboxExtendedURL *)self sandboxExtensionToken];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    int64_t v5 = [(TUSandboxExtendedURL *)self sandboxExtensionHandle];

    if (!v5)
    {
      id v6 = [(TUSandboxExtendedURL *)self sandboxExtensionToken];
      [v6 UTF8String];
      [(TUSandboxExtendedURL *)self setSandboxExtensionHandle:sandbox_extension_consume()];

      int64_t v7 = [(TUSandboxExtendedURL *)self sandboxExtensionHandle];
      uint64_t v8 = TUDefaultLog();
      objc_super v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[TUSandboxExtendedURL URL](self);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        URL = self->_URL;
        int v13 = 138412290;
        v14 = URL;
        _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Successfully consumed sandbox extension for URL %@", (uint8_t *)&v13, 0xCu);
      }

      [(TUSandboxExtendedURL *)self setSandboxExtensionToken:0];
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
    && [(TUSandboxExtendedURL *)self isEqualToSandboxExtendedURL:v4];

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSandboxExtendedURL *)self URL];
  id v6 = [v4 URL];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    int64_t v7 = [(TUSandboxExtendedURL *)self sandboxExtensionToken];
    uint64_t v8 = [v4 sandboxExtensionToken];
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      int64_t v9 = [(TUSandboxExtendedURL *)self sandboxExtensionHandle];
      BOOL v10 = v9 == [v4 sandboxExtensionHandle];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUSandboxExtendedURL *)self URL];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUSandboxExtendedURL *)self sandboxExtensionToken];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(TUSandboxExtendedURL *)self sandboxExtensionHandle];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSandboxExtendedURL)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector("URL");
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  uint64_t v8 = [(TUSandboxExtendedURL *)self initWithURL:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    BOOL v10 = NSStringFromSelector(sel_sandboxExtensionToken);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sandboxExtensionToken = v8->_sandboxExtensionToken;
    v8->_sandboxExtensionToken = (NSString *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUSandboxExtendedURL *)self URL];
  uint64_t v6 = NSStringFromSelector("URL");
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(TUSandboxExtendedURL *)self sandboxExtensionClass];

  if (v7)
  {
    int v8 = [(TUSandboxExtendedURL *)self pid];
    id v9 = [(TUSandboxExtendedURL *)self sandboxExtensionClass];
    [v9 UTF8String];
    BOOL v10 = [(TUSandboxExtendedURL *)self URL];
    id v11 = [v10 path];
    [v11 fileSystemRepresentation];
    if (v8)
    {
      [(TUSandboxExtendedURL *)self pid];
      uint64_t v12 = sandbox_extension_issue_file_to_process_by_pid();
    }
    else
    {
      uint64_t v12 = sandbox_extension_issue_file();
    }
    int v13 = (void *)v12;

    if (v13)
    {
      v14 = [NSString stringWithUTF8String:v13];
      uint64_t v15 = NSStringFromSelector(sel_sandboxExtensionToken);
      [v4 encodeObject:v14 forKey:v15];

      free(v13);
    }
    else
    {
      v16 = TUDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[TUSandboxExtendedURL encodeWithCoder:](self);
      }
    }
  }
}

- (void)setURL:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
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
  uint64_t v2 = [a1 sandboxExtensionToken];
  [a1 sandboxExtensionHandle];
  OUTLINED_FUNCTION_1_3(&dword_19C496000, v3, v4, "Unable to consume sandbox extension with token %@, received handle %lld", v5, v6, v7, v8, 2u);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 sandboxExtensionClass];
  id v9 = [a1 URL];
  OUTLINED_FUNCTION_1_3(&dword_19C496000, v3, v4, "Unable to issue sandbox extension of class %@ for URL %@", v5, v6, v7, v8, 2u);
}

@end