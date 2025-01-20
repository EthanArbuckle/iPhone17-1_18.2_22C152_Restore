@interface SandboxManager
+ (id)getManager;
- (NSMutableDictionary)sandboxHandles;
- (OS_os_log)log_handle;
- (SandboxManager)init;
- (void)setLog_handle:(id)a3;
- (void)setSandboxHandles:(id)a3;
@end

@implementation SandboxManager

- (SandboxManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SandboxManager;
  v2 = [(SandboxManager *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.libcryptex", "SandboxManager");
    [(SandboxManager *)v2 setLog_handle:v3];

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(SandboxManager *)v2 setSandboxHandles:v4];

    v5 = [(SandboxManager *)v2 sandboxHandles];

    if (!v5) {
      sub_100043104(&v7, v9);
    }
  }
  return v2;
}

+ (id)getManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021940;
  block[3] = &unk_10005A2B0;
  block[4] = a1;
  if (qword_10005E858 != -1) {
    dispatch_once(&qword_10005E858, block);
  }
  v2 = (void *)qword_10005E860;

  return v2;
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
}

- (NSMutableDictionary)sandboxHandles
{
  return self->_sandboxHandles;
}

- (void)setSandboxHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);

  objc_storeStrong((id *)&self->_log_handle, 0);
}

@end