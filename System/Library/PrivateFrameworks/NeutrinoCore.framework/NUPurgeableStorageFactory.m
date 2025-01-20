@interface NUPurgeableStorageFactory
- (NSString)debugDescription;
- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3;
- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3 storagePool:(id)a4;
- (NUPurgeableStorageFactory)initWithStoragePool:(id)a3;
- (id)newStorageWithSize:(id)a3 format:(id)a4;
- (void)returnStorage:(id)a3;
@end

@implementation NUPurgeableStorageFactory

- (void).cxx_destruct
{
}

- (NSString)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NUPurgeableStoragePool *)self->_storagePool debugDescription];
  v7 = [v3 stringWithFormat:@"<%@: 0x%p> %@", v5, self, v6];

  return (NSString *)v7;
}

- (id)newStorageWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelFormat");
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPurgeableStorageFactory newStorageWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 254, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"pixelFormat");
  }
  storagePool = self->_storagePool;
  if (storagePool) {
    uint64_t v9 = -[NUPurgeableStoragePool newStorageWithSize:format:](storagePool, "newStorageWithSize:format:", var0, var1, v7);
  }
  else {
    uint64_t v9 = objc_msgSend(objc_alloc(self->_storageClass), "initWithSize:format:", var0, var1, v7);
  }
  v10 = (void *)v9;

  return v10;
}

- (void)returnStorage:(id)a3
{
  [(NUPurgeableStoragePool *)self->_storagePool returnStorage:a3];
}

- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3 storagePool:(id)a4
{
  v6 = (NUPurgeableStoragePool *)a4;
  v10.receiver = self;
  v10.super_class = (Class)NUPurgeableStorageFactory;
  id v7 = [(NUPurgeableStorageFactory *)&v10 init];
  storagePool = v7->_storagePool;
  v7->_storageClass = a3;
  v7->_storagePool = v6;

  return v7;
}

- (NUPurgeableStorageFactory)initWithStoragePool:(id)a3
{
  id v4 = a3;
  v5 = -[NUPurgeableStorageFactory initWithStorageClass:storagePool:](self, "initWithStorageClass:storagePool:", [v4 storageClass], v4);

  return v5;
}

- (NUPurgeableStorageFactory)initWithStorageClass:(Class)a3
{
  return [(NUPurgeableStorageFactory *)self initWithStorageClass:a3 storagePool:0];
}

@end