@interface TYATypologyURLHandle
- (BOOL)valid;
- (NSString)filename;
- (NSURL)url;
- (TYATypologyURLHandle)initWithURL:(id)a3 sandboxExtensionToken:(id)a4;
- (void)dealloc;
@end

@implementation TYATypologyURLHandle

- (TYATypologyURLHandle)initWithURL:(id)a3 sandboxExtensionToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TYATypologyURLHandle;
  v9 = [(TYATypologyURLHandle *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    id v11 = v8;
    v12 = v11;
    if (v11 && [v11 length])
    {
      id v13 = v12;
      [v13 UTF8String];
      uint64_t v14 = sandbox_extension_consume();
      v15 = TYALog();
      v16 = v15;
      if (v14 == -1)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[TYATypologyURLHandle initWithURL:sandboxExtensionToken:](v13, v16);
        }

        uint64_t v14 = -1;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v13 UTF8String];
          *(_DWORD *)buf = 136380675;
          uint64_t v21 = v17;
          _os_log_impl(&dword_23546D000, v16, OS_LOG_TYPE_INFO, "Sandbox extension (%{private}s) consumed.", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    v10->_handle = v14;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_23546D000, a1, OS_LOG_TYPE_ERROR, "Error releasing sandbox extension: %d", (uint8_t *)v3, 8u);
}

- (NSString)filename
{
  int v2 = [(TYATypologyURLHandle *)self url];
  v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (BOOL)valid
{
  return self->_handle != -1;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

- (void)initWithURL:(void *)a1 sandboxExtensionToken:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 UTF8String];
  int v4 = *__error();
  int v5 = 136380931;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_23546D000, a2, OS_LOG_TYPE_ERROR, "Error consuming (%{private}s) sandbox extension: %d", (uint8_t *)&v5, 0x12u);
}

@end