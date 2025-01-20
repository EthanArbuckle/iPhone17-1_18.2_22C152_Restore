@interface SSApplicationVersionCondition
- (BOOL)evaluateWithContext:(id)a3;
- (SSApplicationVersionCondition)initWithDictionary:(id)a3;
- (void)dealloc;
@end

@implementation SSApplicationVersionCondition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSApplicationVersionCondition;
  [(SSProtocolCondition *)&v3 dealloc];
}

- (SSApplicationVersionCondition)initWithDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSApplicationVersionCondition;
  v4 = -[SSProtocolCondition initWithDictionary:](&v9, sel_initWithDictionary_);
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"bundle-id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_bundleIdentifier = (NSString *)v5;
    }
    v6 = (void *)[a3 objectForKey:@"bundle-version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_bundleVersion = (NSString *)v6;
    }
    v7 = (void *)[a3 objectForKey:@"external-version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_externalVersion = (NSNumber *)v7;
    }
  }
  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  if (self->_bundleIdentifier)
  {
    v4 = objc_alloc_init(SSSoftwareLibrary);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__21;
    v19 = __Block_byref_object_dispose__21;
    uint64_t v20 = 0;
    v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:self->_bundleIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__SSApplicationVersionCondition_evaluateWithContext___block_invoke;
    v14[3] = &unk_1E5BAA1F8;
    v14[4] = v5;
    v14[5] = &v15;
    [(SSSoftwareLibrary *)v4 getLibraryItemForBundleIdentifiers:v6 completionBlock:v14];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    v7 = (void *)v16[5];
    if (v7)
    {
      v8 = (void *)[v7 valueForProperty:@"bundleShortVersionString"];
      objc_super v9 = (void *)[(id)v16[5] valueForProperty:@"softwareVersionExternalIdentifier"];
      bundleVersion = self->_bundleVersion;
      if (bundleVersion && v8)
      {
        unint64_t v11 = SSCompareProductVersions(v8, bundleVersion);
      }
      else
      {
        char v12 = 0;
        if (!self->_externalVersion || !v9) {
          goto LABEL_12;
        }
        unint64_t v11 = objc_msgSend(v9, "compare:");
      }
      char v12 = ConditionResultForComparisonResult(v11, self->super._operator);
    }
    else
    {
      char v12 = 0;
    }
LABEL_12:

    _Block_object_dispose(&v15, 8);
    return v12;
  }
  return 0;
}

intptr_t __53__SSApplicationVersionCondition_evaluateWithContext___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 count] == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[a2 lastObject];
  }
  v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

@end