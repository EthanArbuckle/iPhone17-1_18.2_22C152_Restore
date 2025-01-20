@interface MobileGestaltHelperProxy
+ (id)proxy;
- (BOOL)proxyRebuildCache;
- (BOOL)proxySetCacheSentinel;
- (MobileGestaltHelper)helper;
- (MobileGestaltHelperProxy)init;
- (NSXPCConnection)connection;
- (int)error;
- (void)dealloc;
- (void)invalidate;
- (void)setError:(int)a3;
@end

@implementation MobileGestaltHelperProxy

- (void)dealloc
{
  [self->_connection invalidate:a2, v2, v3, v4];

  v6.receiver = self;
  v6.super_class = (Class)MobileGestaltHelperProxy;
  [(MobileGestaltHelperProxy *)&v6 dealloc];
}

- (MobileGestaltHelperProxy)init
{
  v30.receiver = self;
  v30.super_class = (Class)MobileGestaltHelperProxy;
  uint64_t v2 = [(MobileGestaltHelperProxy *)&v30 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v2->_connection = (NSXPCConnection *)[v3 initWithMachServiceName:v4 options:0];
    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v6 unk_1EFC3A3A0:v7 v8];
    [v2->_connection setRemoteObjectInterface:v10, v9, v11, v12];
    if (xpc_user_sessions_enabled())
    {
      int v29 = 0;
      xpc_user_sessions_get_foreground_uid();
      [v2->_connection v17:v18 v19:v20];
      xpc_connection_set_target_user_session_uid();
    }
    [v2->_connection resume:v13, v14, v15, v16];
    connection = v2->_connection;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1A6ED859C;
    v28[3] = &unk_1E5CB2458;
    v28[4] = v2;
    v25 = (MobileGestaltHelper *)[connection objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler:v22, v23, v24];
    v2->_helper = v25;
    v26 = v25;
  }
  return v2;
}

- (void)invalidate
{
  self->_helper = 0;
}

- (MobileGestaltHelper)helper
{
  return self->_helper;
}

- (int)error
{
  return self->_error;
}

+ (id)proxy
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)proxyRebuildCache
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  helper = self->_helper;
  if (helper)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A6ED875C;
    v7[3] = &unk_1E5CB2480;
    v7[4] = &v8;
    [helper rebuildCache:a2 withKey:v7 andValue:v2 andValue:v3];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)proxySetCacheSentinel
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  helper = self->_helper;
  if (helper)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A6ED8840;
    v7[3] = &unk_1E5CB2480;
    v7[4] = &v8;
    [helper setCacheSentinel:a2 cacheSentinel:v7 cacheSentinel:v2 cacheSentinel:v3];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

@end