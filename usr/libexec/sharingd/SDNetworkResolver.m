@interface SDNetworkResolver
- (NSNumber)flags;
- (NSString)protocol;
- (SDNetworkResolver)initWithNode:(__SFNode *)a3;
- (SDNetworkResolverDelegate)delegate;
- (int)start;
- (void)bonjourResolverDidChange:(id)a3;
- (void)dealloc;
- (void)notifyClientAboutResolve:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFlags:(id)a3;
- (void)setProtocol:(id)a3;
- (void)stop;
@end

@implementation SDNetworkResolver

- (SDNetworkResolver)initWithNode:(__SFNode *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SDNetworkResolver;
  v4 = [(SDNetworkResolver *)&v10 init];
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0;

    v5->_node = (__SFNode *)CFRetain(a3);
    protocol = v5->_protocol;
    v5->_protocol = 0;

    resolver = v5->_resolver;
    v5->_resolver = 0;

    v5->_session = 0;
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_node);
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkResolver;
  [(SDNetworkResolver *)&v3 dealloc];
}

- (void)notifyClientAboutResolve:(int)a3
{
  id v8 = (id)objc_opt_new();
  [v8 setObject:self->_node forKeyedSubscript:kSFOperationNodeKey];
  [v8 setObject:self->_flags forKeyedSubscript:kSFOperationFlagsKey];
  [v8 setObject:self->_protocol forKeyedSubscript:kSFOperationProtocolKey];
  if (a3)
  {
    v5 = +[NSError errorWithDomain:@"SFNodeError" code:a3 userInfo:0];
    [v8 setObject:v5 forKeyedSubscript:kSFOperationErrorKey];

    uint64_t v6 = 10;
  }
  else
  {
    uint64_t v6 = 9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networkResolver:self event:v6 withResults:v8];

  [(SDNetworkResolver *)self stop];
}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 error];
  if (v5)
  {
    int v6 = v5;
    v7 = browser_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F3450(v6, v7);
    }

    id v8 = self;
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  CFURLRef v10 = (const __CFURL *)SFNodeCopyURL();
  if (v10)
  {
    CFURLRef v11 = v10;
    CFStringRef v12 = CFURLCopyScheme(v10);
    if (v12)
    {
      CFStringRef v13 = v12;
      CFStringRef v14 = CFURLCopyPath(v11);
      if (v14)
      {
        CFStringRef v15 = v14;
        v16 = [v4 hostName];
        v17 = [v4 portNumber];
        CFURLRef v18 = sub_1000D8564(v13, 0, 0, v16, (int)[v17 intValue], v15, 0, 0);

        SFNodeSetURL();
        if (v18) {
          CFRelease(v18);
        }
        CFRelease(v15);
      }
      CFRelease(v13);
    }
    CFRelease(v11);
  }
  else
  {
    v19 = [v4 portNumber];
    [v19 intValue];
    SFNodeSetPortNumber();

    v20 = [v4 hostName];
    SFNodeSetHostName();

    v21 = [v4 path];
    SFNodeSetPath();

    v22 = [v4 url];
    SFNodeSetURL();
  }
  if ([(NSString *)self->_protocol isEqualToString:kSFNodeProtocolVNC])
  {
    id v8 = self;
    uint64_t v9 = 0;
LABEL_16:
    [(SDNetworkResolver *)v8 notifyClientAboutResolve:v9];
    goto LABEL_17;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained) {
    [(SDNetworkResolver *)self mount];
  }
LABEL_17:
}

- (int)start
{
  protocol = self->_protocol;
  if (!protocol)
  {
    sub_1001B2794();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    unsigned int v5 = self->_protocol;
    self->_protocol = v4;

    protocol = self->_protocol;
    if (!protocol) {
      return -2;
    }
  }
  if ([(NSString *)protocol isEqualToString:kSFNodeProtocolODisk])
  {
    int v6 = (void *)SFNodeCopyURL();
    v7 = (void *)SFNodeCopyDomain();
    uint64_t v8 = SFNodeCopyServiceName();
    uint64_t v9 = (void *)v8;
    if (v6)
    {
      uint64_t v10 = _CFNetServiceCreateFromURL();
      if (v10)
      {
        CFURLRef v11 = (__CFNetService *)v10;
        CFStringRef v12 = [SDBonjourResolver alloc];
        CFStringRef Name = CFNetServiceGetName(v11);
        CFStringRef Type = CFNetServiceGetType(v11);
        CFStringRef v15 = [(SDBonjourResolver *)v12 initWithName:Name type:Type domain:CFNetServiceGetDomain(v11) path:0 timeout:0];
        resolver = self->_resolver;
        self->_resolver = v15;

        [(SDBonjourResolver *)self->_resolver setDelegate:self];
        [(SDBonjourResolver *)self->_resolver resolve];
        CFRelease(v11);
LABEL_18:

        goto LABEL_19;
      }
      if (!v9 || !v7) {
        goto LABEL_18;
      }
    }
    else if (!v8 || !v7)
    {
      v17 = browser_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000F350C(v17);
      }
LABEL_24:

      return -2;
    }
    CFURLRef v18 = sub_1000D97FC(self->_protocol);
    if (v18)
    {
      v19 = v18;
      v20 = (void *)SFNodeCopyRealName();
      v21 = [SDBonjourResolver alloc];
      if (SFNodeIsSharePoint()) {
        v22 = v20;
      }
      else {
        v22 = 0;
      }
      v23 = [(SDBonjourResolver *)v21 initWithName:v9 type:v19 domain:v7 path:v22 timeout:0];
      v24 = self->_resolver;
      self->_resolver = v23;

      [(SDBonjourResolver *)self->_resolver setDelegate:self];
      [(SDBonjourResolver *)self->_resolver resolve];

      goto LABEL_18;
    }
    v17 = browser_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000F34C8(v17);
    }
    goto LABEL_24;
  }
LABEL_19:
  if (!self->_resolver)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F3334;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return 0;
}

- (void)stop
{
  resolver = self->_resolver;
  if (resolver)
  {
    [(SDBonjourResolver *)resolver setDelegate:0];
    [(SDBonjourResolver *)self->_resolver cancel];
    id v4 = self->_resolver;
    self->_resolver = 0;
  }
}

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProtocol:(id)a3
{
}

- (SDNetworkResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDNetworkResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_flags, 0);

  objc_storeStrong((id *)&self->_resolver, 0);
}

@end