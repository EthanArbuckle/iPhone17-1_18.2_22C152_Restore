@interface _PASBundleIdResolver
- (_PASBundleIdResolver)initWithProcessIdentifier:(int)a3;
- (id)bundleIdentifierOrProcessName:(BOOL *)a3;
- (void)_populateResultWithLockWitness:(id)a3;
@end

@implementation _PASBundleIdResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_exePath, 0);
}

- (id)bundleIdentifierOrProcessName:(BOOL *)a3
{
  if (self->_exePath)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__824;
    v11 = __Block_byref_object_dispose__825;
    id v12 = 0;
    lock = self->_lock;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54___PASBundleIdResolver_bundleIdentifierOrProcessName___block_invoke;
    v6[3] = &unk_1E5AEAD28;
    v6[5] = &v7;
    v6[6] = a3;
    v6[4] = self;
    [(_PASLock *)lock runWithLockAcquired:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_populateResultWithLockWitness:(id)a3
{
  v18 = a3;
  CFURLRef v5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_exePath, kCFURLPOSIXPathStyle, 0);
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_PASBundleIdResolver.m", 55, @"Failed to compute URL for filesystem path: \"%@\"", self->_exePath object file lineNumber description];
  }
  uint64_t v6 = _CFBundleCopyBundleURLForExecutableURL();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (Unique)
    {
      uint64_t v9 = Unique;
      CFStringRef Identifier = CFBundleGetIdentifier(Unique);
      if (Identifier)
      {
        CFStringRef Copy = CFStringCreateCopy(0, Identifier);
        if (!Copy)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"_PASBundleIdResolver.m" lineNumber:65 description:@"Failed to copy bundleIdentifier."];

          CFStringRef Copy = 0;
        }
        id v12 = (void *)v18[1];
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

- (_PASBundleIdResolver)initWithProcessIdentifier:(int)a3
{
  v3 = (void *)MEMORY[0x1F4188790](self);
  int v5 = v4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = v3;
  v15.super_class = (Class)_PASBundleIdResolver;
  uint64_t v6 = [(_PASBundleIdResolver *)&v15 init];
  if (v6)
  {
    int v7 = proc_pidpath(v5, buffer, 0x1000u);
    if (v7 < 1) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [[NSString alloc] initWithBytes:buffer length:v7 encoding:4];
    }
    exePath = v6->_exePath;
    v6->_exePath = (NSString *)v8;

    v10 = [_PASLock alloc];
    v11 = objc_opt_new();
    uint64_t v12 = [(_PASLock *)v10 initWithGuardedData:v11];
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v12;
  }
  return v6;
}

@end