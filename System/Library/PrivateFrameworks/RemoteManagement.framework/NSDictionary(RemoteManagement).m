@interface NSDictionary(RemoteManagement)
- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:;
@end

@implementation NSDictionary(RemoteManagement)

- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:
{
  id v6 = a3;
  id v12 = 0;
  v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:a1 format:100 options:0 error:&v12];
  id v8 = v12;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(v7, "rm_atomicWriteToURL:error:", v6, a4);
  }
  else
  {
    v10 = +[RMLog nsdictionary_rm];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(RemoteManagement) rm_atomicWriteToURL:error:]((uint64_t)v8, v10);
    }

    uint64_t v9 = 0;
    if (a4 && v8)
    {
      uint64_t v9 = 0;
      *a4 = v8;
    }
  }

  return v9;
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224784000, a2, OS_LOG_TYPE_ERROR, "Failed to convert to plist: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end