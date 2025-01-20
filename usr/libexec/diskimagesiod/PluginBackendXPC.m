@interface PluginBackendXPC
+ (BOOL)supportsSecureCoding;
- (DIURL)URL;
- (PluginBackendXPC)initWithCoder:(id)a3;
- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4;
- (const)pluginHeader;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PluginBackendXPC

- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4
{
  id v7 = a3;
  unsigned int v22 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PluginBackendXPC;
  v8 = [(PluginBackendXPC *)&v21 init];
  if (v8)
  {
    id v9 = [v7 pluginName];
    v10 = (char *)[v9 UTF8String];

    v20 = v10;
    if (!v10)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_1001B6CA0;
      v14 = std::generic_category();
      exception[1] = 22;
      exception[2] = v14;
      *((unsigned char *)exception + 24) = 0;
      *((unsigned char *)exception + 48) = 0;
      exception[7] = "Invalid plugin URL, plugin name is missing";
    }
    v11 = [v7 pluginParams];
    v17 = v11;
    sub_1000D2260(&v20, (uint64_t *)&v17, &v22, &v18);

    sub_1000D24A0(&v18, &v15);
    long long v16 = v15;
    long long v15 = 0uLL;
    -[BackendXPC setBackend:](v8, "setBackend:", &v16, 0);
    if (*((void *)&v16 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v15 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v15 + 1));
    }
    objc_storeStrong((id *)&v8->_URL, a3);
    if (v19) {
      sub_100010A48(v19);
    }
  }

  return v8;
}

- (PluginBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PluginBackendXPC;
  v5 = [(BackendXPC *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"encodedDict"];

    long long v22 = *(_OWORD *)off_1001A9650;
    v23 = j__free_0;
    id v13 = [(DIURL *)v5->_URL pluginName];
    uint64_t v18 = 0;
    v19 = (char *)[v13 UTF8String];
    v17 = v12;
    sub_1000D27A8(&v19, (uint64_t)&v18, (uint64_t)&unk_1001690BF, (uint64_t)&v22, &v17, &v20);

    sub_1000D24A0(&v20, &v15);
    long long v16 = v15;
    long long v15 = 0uLL;
    [(BackendXPC *)v5 setBackend:&v16];
    if (*((void *)&v16 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v15 + 1)) {
      sub_100010A48(*((std::__shared_weak_count **)&v15 + 1));
    }
    if (v21) {
      sub_100010A48(v21);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PluginBackendXPC;
  [(BackendXPC *)&v7 encodeWithCoder:v4];
  v5 = [(PluginBackendXPC *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  uint64_t v6 = +[NSMutableDictionary dictionary];
  (*(void (**)(void))(*(void *)[(PluginBackendXPC *)self pluginHeader] + 64))();
  if ([v6 count]) {
    [v4 encodeObject:v6 forKey:@"encodedDict"];
  }
}

- (const)pluginHeader
{
  [(BackendXPC *)self backend];
  v2 = *(const void **)(v4 + 24);
  if (v5) {
    sub_100010A48(v5);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end