@interface PAAccessReaderSandboxExtension
- (NSString)path;
- (PAAccessReaderSandboxExtension)initWithHandle:(int64_t)a3 forRootDirectory:(id)a4;
- (PAAccessReaderSandboxExtension)initWithToken:(id)a3 forPath:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation PAAccessReaderSandboxExtension

- (PAAccessReaderSandboxExtension)initWithToken:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  [a3 bytes];
  uint64_t v9 = sandbox_extension_consume();
  if (v9 == -1)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:7 userInfo:0];
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    self = [(PAAccessReaderSandboxExtension *)self initWithHandle:v9 forRootDirectory:v8];
    v10 = self;
  }

  return v10;
}

- (PAAccessReaderSandboxExtension)initWithHandle:(int64_t)a3 forRootDirectory:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessReaderSandboxExtension;
  id v8 = [(PAAccessReaderSandboxExtension *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_handle = a3;
    objc_storeStrong((id *)&v8->_path, a4);
  }

  return v9;
}

- (void)dealloc
{
  sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)PAAccessReaderSandboxExtension;
  [(PAAccessReaderSandboxExtension *)&v3 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end