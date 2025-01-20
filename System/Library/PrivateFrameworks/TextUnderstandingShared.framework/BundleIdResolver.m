@interface BundleIdResolver
- (BundleIdResolver)initWithProcessIdentifier:(int)a3;
- (id)bundleIdentifierOrProcessName:(BOOL *)a3;
- (void)_populateResultWithLockWitness:(id)a3;
- (void)dealloc;
@end

@implementation BundleIdResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardedData, 0);
  objc_storeStrong((id *)&self->_exePath, 0);
}

- (id)bundleIdentifierOrProcessName:(BOOL *)a3
{
  if (self->_exePath)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    guardedData = self->_guardedData;
    if (guardedData->bundleIdOrProcName)
    {
      if (!a3)
      {
LABEL_5:
        v7 = guardedData->bundleIdOrProcName;
        pthread_mutex_unlock(p_lock);
        goto LABEL_7;
      }
    }
    else
    {
      -[BundleIdResolver _populateResultWithLockWitness:](self, "_populateResultWithLockWitness:");
      guardedData = self->_guardedData;
      if (!a3) {
        goto LABEL_5;
      }
    }
    *a3 = guardedData->isProcessName;
    guardedData = self->_guardedData;
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  return v7;
}

- (void)_populateResultWithLockWitness:(id)a3
{
  v18 = a3;
  CFURLRef v5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_exePath, kCFURLPOSIXPathStyle, 0);
  if (!v5)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BundleIdResolver.m", 62, @"Failed to compute URL for filesystem path: \"%@\"", self->_exePath object file lineNumber description];
  }
  uint64_t v6 = _CFBundleCopyBundleURLForExecutableURL();
  if (v6)
  {
    v7 = (const void *)v6;
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (Unique)
    {
      v9 = Unique;
      CFStringRef Identifier = CFBundleGetIdentifier(Unique);
      if (Identifier)
      {
        CFStringRef Copy = CFStringCreateCopy(0, Identifier);
        if (!Copy)
        {
          v17 = [MEMORY[0x263F08690] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"BundleIdResolver.m" lineNumber:72 description:@"Failed to copy bundleIdentifier."];

          CFStringRef Copy = 0;
        }
        v12 = (void *)v18[1];
        v18[1] = Copy;

        *((unsigned char *)v18 + 16) = 0;
      }
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  CFRelease(v5);
  v13 = v18;
  if (!v18[1])
  {
    uint64_t v14 = [(NSString *)self->_exePath lastPathComponent];
    v15 = (void *)v18[1];
    v18[1] = v14;

    v13 = v18;
    *((unsigned char *)v18 + 16) = 1;
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BundleIdResolver;
  [(BundleIdResolver *)&v3 dealloc];
}

- (BundleIdResolver)initWithProcessIdentifier:(int)a3
{
  objc_super v3 = (void *)MEMORY[0x270FA5388](self);
  int v5 = v4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = v3;
  v13.super_class = (Class)BundleIdResolver;
  uint64_t v6 = [(BundleIdResolver *)&v13 init];
  if (v6)
  {
    bzero(buffer, 0x1000uLL);
    int v7 = proc_pidpath(v5, buffer, 0x1000u);
    if (v7 < 1) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [[NSString alloc] initWithBytes:buffer length:v7 encoding:4];
    }
    exePath = v6->_exePath;
    v6->_exePath = (NSString *)v8;

    uint64_t v10 = objc_opt_new();
    guardedData = v6->_guardedData;
    v6->_guardedData = (BundleIdResolverGuardedData *)v10;

    pthread_mutex_init(&v6->_lock, 0);
  }
  return v6;
}

@end