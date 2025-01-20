@interface PLSandboxedURL
+ (BOOL)supportsSecureCoding;
- (PLSandboxedURL)initWithCoder:(id)a3;
- (PLSandboxedURL)initWithURL:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5;
- (id)initFileURLWithPath:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5;
- (void)_commonPLSandboxedURLInitialize;
- (void)_initSandboxExtensionToken:(id)a3 consume:(BOOL)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLSandboxedURL

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLSandboxedURL;
  id v4 = a3;
  [(PLSandboxedURL *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxExtensionToken, @"sandboxExtensionToken", v5.receiver, v5.super_class);
}

- (PLSandboxedURL)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtensionToken"];
  [(PLSandboxedURL *)self _initSandboxExtensionToken:v5 consume:1];

  v8.receiver = self;
  v8.super_class = (Class)PLSandboxedURL;
  v6 = [(PLSandboxedURL *)&v8 initWithCoder:v4];

  return v6;
}

- (void)dealloc
{
  if ((self->_sandboxExtensionHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLSandboxedURL;
  [(PLSandboxedURL *)&v3 dealloc];
}

- (void)_commonPLSandboxedURLInitialize
{
  if ([(NSString *)self->_sandboxExtensionToken length])
  {
    [(NSString *)self->_sandboxExtensionToken UTF8String];
    self->_sandboxExtensionHandle = sandbox_extension_consume();
  }
}

- (id)initFileURLWithPath:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5
{
  if (a3)
  {
    BOOL v6 = a5;
    id v8 = a3;
    [(PLSandboxedURL *)self _initSandboxExtensionToken:a4 consume:v6];
    v12.receiver = self;
    v12.super_class = (Class)PLSandboxedURL;
    id v9 = [(PLSandboxedURL *)&v12 initFileURLWithPath:v8];

    self = (PLSandboxedURL *)v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PLSandboxedURL)initWithURL:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5
{
  if (a3)
  {
    BOOL v6 = a5;
    id v8 = a3;
    [(PLSandboxedURL *)self _initSandboxExtensionToken:a4 consume:v6];
    id v9 = [v8 absoluteString];

    v13.receiver = self;
    v13.super_class = (Class)PLSandboxedURL;
    v10 = [(PLSandboxedURL *)&v13 initWithString:v9];

    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_initSandboxExtensionToken:(id)a3 consume:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (NSString *)[a3 copy];
  sandboxExtensionToken = self->_sandboxExtensionToken;
  self->_sandboxExtensionToken = v6;

  if (v4)
  {
    [(PLSandboxedURL *)self _commonPLSandboxedURLInitialize];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end