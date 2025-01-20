@interface PKPassesXPCContainer
+ (BOOL)supportsSecureCoding;
- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithBlock:(id)a3;
- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (BOOL)isInvalidated;
- (NSURL)temporaryOutputDirectory;
- (PKPassesXPCContainer)init;
- (PKPassesXPCContainer)initWithCoder:(id)a3;
- (PKPassesXPCContainer)initWithFileDescriptor:(int)a3;
- (PKPassesXPCContainer)initWithFileURL:(id)a3;
- (id)_init;
- (id)_initWithFileDescriptorContainer:(id)a3;
- (void)_unarchive;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setTemporaryOutputDirectory:(id)a3;
@end

@implementation PKPassesXPCContainer

- (PKPassesXPCContainer)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassesXPCContainer;
  id result = [(PKPassesXPCContainer *)&v3 init];
  if (result)
  {
    *((_DWORD *)result + 2) = 0;
    *((void *)result + 4) = 1;
  }
  return result;
}

- (id)_initWithFileDescriptorContainer:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(PKPassesXPCContainer *)self _init];
    v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 2, a3);
    }
    else {
      [v5 invalidate];
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassesXPCContainer)initWithFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [[PKFileDescriptorXPCContainer alloc] initWithFileURL:v4];

  v6 = [(PKPassesXPCContainer *)self _initWithFileDescriptorContainer:v5];
  return v6;
}

- (PKPassesXPCContainer)initWithFileDescriptor:(int)a3
{
  id v4 = [[PKFileDescriptorXPCContainer alloc] initWithFileDescriptor:*(void *)&a3];
  id v5 = [(PKPassesXPCContainer *)self _initWithFileDescriptorContainer:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassesXPCContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassesXPCContainer *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fd"];
    fd = v5->_fd;
    v5->_fd = (PKFileDescriptorXPCContainer *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"passFDs"];
    passFDs = v5->_passFDs;
    v5->_passFDs = (NSDictionary *)v12;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_fd forKey:@"fd"];
  [v5 encodeObject:self->_passFDs forKey:@"passFDs"];
  [v5 encodeInteger:self->_status forKey:@"status"];

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  [(PKPassesXPCContainer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPassesXPCContainer;
  [(PKPassesXPCContainer *)&v3 dealloc];
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKFileDescriptorXPCContainer *)self->_fd invalidate];
    fd = self->_fd;
    self->_fd = 0;

    [(NSDictionary *)self->_passFDs enumerateKeysAndObjectsUsingBlock:&__block_literal_global_89];
    passFDs = self->_passFDs;
    self->_passFDs = 0;

    self->_status = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __34__PKPassesXPCContainer_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithBlock:(id)a3
{
  int64_t v3 = [(PKPassesXPCContainer *)self unarchivePassesWithOptions:0 usingBlock:a3];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)unarchivePassesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v32 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PKPassesXPCContainer *)self _unarchive];
  int64_t status = self->_status;
  NSUInteger v28 = [(NSDictionary *)self->_passFDs count];
  v30 = (void (**)(void, void, void, void, void))v5;
  if (!v5 || status)
  {
    int64_t v27 = status;
    os_unfair_lock_unlock(lock);
  }
  else
  {
    v7 = (void *)[(NSDictionary *)self->_passFDs copy];
    os_unfair_lock_unlock(lock);
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v28];
      v31 = v7;
      uint64_t v9 = [v7 allKeys];
      [v8 addObjectsFromArray:v9];

      uint64_t v10 = [v8 sortUsingComparator:&__block_literal_global_28_2];
      BOOL invalidated = 0;
      if (!v28) {
        goto LABEL_27;
      }
      NSUInteger v12 = 0;
      int64_t v27 = 0;
      NSUInteger v13 = v28 - 1;
      *(void *)&long long v11 = 138412546;
      long long v26 = v11;
      do
      {
        v14 = (void *)MEMORY[0x192FDC630](v10);
        if ((v32 & 2) != 0) {
          NSUInteger v15 = v13;
        }
        else {
          NSUInteger v15 = v12;
        }
        v16 = objc_msgSend(v8, "objectAtIndexedSubscript:", v15, v26);
        v17 = [v31 objectForKeyedSubscript:v16];
        if (!invalidated)
        {
          uint64_t v44 = 0;
          v45 = &v44;
          uint64_t v46 = 0x3032000000;
          v47 = __Block_byref_object_copy__28;
          v48 = __Block_byref_object_dispose__28;
          id v49 = 0;
          uint64_t v38 = 0;
          v39 = &v38;
          uint64_t v40 = 0x3032000000;
          v41 = __Block_byref_object_copy__28;
          v42 = __Block_byref_object_dispose__28;
          id v43 = 0;
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke_29;
          v34[3] = &unk_1E56E5850;
          v34[4] = self;
          id v18 = v16;
          id v35 = v18;
          v36 = &v44;
          v37 = &v38;
          [v17 accessFileDescriptorWithBlock:v34];
          uint64_t v19 = v45[5];
          if (v19
            && (v20 = (id *)(v39 + 5),
                id obj = (id)v39[5],
                id v21 = +[PKObject createWithFileDataAccessor:v19 warnings:0 error:&obj], objc_storeStrong(v20, obj), v21))
          {
            v22 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v52 = v18;
              _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: unarchived %@.", buf, 0xCu);
            }
          }
          else
          {
            v22 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = v39[5];
              *(_DWORD *)buf = v26;
              id v52 = v18;
              __int16 v53 = 2112;
              uint64_t v54 = v23;
              _os_log_error_impl(&dword_190E10000, v22, OS_LOG_TYPE_ERROR, "PKPassesXPCContainer: failed to unarchive %@ - %@.", buf, 0x16u);
            }
            id v21 = 0;
          }

          ((void (**)(void, id, NSUInteger, id, BOOL *))v30)[2](v30, v21, v12, v18, &invalidated);
          if (!invalidated)
          {
            os_unfair_lock_lock(lock);
            BOOL invalidated = self->_invalidated;
            if (invalidated) {
              int64_t v27 = self->_status;
            }
            os_unfair_lock_unlock(lock);
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(&v44, 8);
        }
        ++v12;
        --v13;
      }
      while (v13 != -1);
      if (v27) {
        NSUInteger v28 = 0;
      }
      else {
LABEL_27:
      }
        int64_t v27 = 0;
    }
    else
    {
      int64_t v27 = 0;
    }
  }

  int64_t v24 = v27;
  unint64_t v25 = v28;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

uint64_t __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

void __62__PKPassesXPCContainer_unarchivePassesWithOptions_usingBlock___block_invoke_29(void *a1, uint64_t a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    unint64_t v4 = *(void **)(a1[4] + 40);
    if (v4)
    {
      id v5 = [v4 URLByAppendingPathComponent:a1[5] isDirectory:1];
    }
    else
    {
      id v5 = 0;
    }
    id v12 = 0;
    uint64_t v6 = [[PKSerializedDataAccessor alloc] initWithFileDescriptor:a2 error:&v12 outputURL:v5];
    id v7 = v12;
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;

    uint64_t v10 = *(void *)(a1[7] + 8);
    long long v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v7;
  }
}

- (void)_unarchive
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (self->_invalidated) {
    return;
  }
  fd = self->_fd;
  if (!fd) {
    return;
  }
  if (self->_passFDs) {
    goto LABEL_45;
  }
  context = (void *)MEMORY[0x192FDC630]();
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__28;
  v47 = __Block_byref_object_dispose__28;
  id v48 = 0;
  unint64_t v4 = self->_fd;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __34__PKPassesXPCContainer__unarchive__block_invoke;
  v42[3] = &unk_1E56E5878;
  v42[4] = self;
  v42[5] = &v43;
  [(PKFileDescriptorXPCContainer *)v4 accessFileDescriptorWithBlock:v42];
  if (!v44[5]) {
    goto LABEL_44;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v33 contentsOfDirectoryAtURL:v44[5] includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:4 error:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (!v6)
  {
LABEL_26:

    v22 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v53.st_dev = 134217984;
      *(void *)&v53.st_mode = v5;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: unarchived with %lu passes.", (uint8_t *)&v53, 0xCu);
    }

    goto LABEL_40;
  }
  uint64_t v37 = *(void *)v39;
  *(void *)&long long v7 = 138412290;
  long long v32 = v7;
LABEL_7:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v39 != v37) {
      objc_enumerationMutation(obj);
    }
    uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
    uint64_t v10 = objc_msgSend(v9, "lastPathComponent", v32);
    long long v11 = [v10 pathExtension];
    if (([v11 isEqualToString:@"pkpass"] & 1) == 0) {
      goto LABEL_24;
    }
    if (++v5 >= 0xB)
    {
      uint64_t v23 = PKLogFacilityTypeGetObject(0);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LOWORD(v53.st_dev) = 0;
      int64_t v24 = "PKPassesXPCContainer: too many .pkpass files found in archive.";
      unint64_t v25 = v23;
      uint32_t v26 = 2;
      goto LABEL_33;
    }
    id v12 = v9;
    uint64_t v13 = open((const char *)[v12 fileSystemRepresentation], 2097156);
    uint64_t v14 = v13;
    if ((v13 & 0x80000000) != 0) {
      break;
    }
    memset(&v53, 0, sizeof(v53));
    if (fstat(v13, &v53))
    {
      PKLogFacilityTypeGetObject(0);
      NSUInteger v15 = (PKFileDescriptorXPCContainer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
      {
        v16 = __error();
        v17 = strerror(*v16);
        *(_DWORD *)buf = 138412546;
        id v50 = v12;
        __int16 v51 = 2082;
        id v52 = v17;
        p_super = &v15->super;
        uint64_t v19 = "PKPassesXPCContainer: could not fstat pass %@ - %{public}s.";
        uint32_t v20 = 22;
LABEL_21:
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
      }
    }
    else if ((v53.st_mode & 0xF000) == 0x8000)
    {
      NSUInteger v15 = [[PKFileDescriptorXPCContainer alloc] initWithFileDescriptor:v14];
      if (v15)
      {
        [v35 setObject:v15 forKeyedSubscript:v10];
        char v21 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      NSUInteger v15 = (PKFileDescriptorXPCContainer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        id v50 = v12;
        p_super = &v15->super;
        uint64_t v19 = "PKPassesXPCContainer: %@ is not a pkpass file.";
        uint32_t v20 = 12;
        goto LABEL_21;
      }
    }
    char v21 = 1;
LABEL_23:

    close(v14);
    if (v21) {
      goto LABEL_35;
    }
LABEL_24:

    if (v6 == ++v8)
    {
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v54 count:16];
      if (v6) {
        goto LABEL_7;
      }
      goto LABEL_26;
    }
  }
  uint64_t v23 = PKLogFacilityTypeGetObject(0);
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_34;
  }
  int64_t v27 = __error();
  NSUInteger v28 = strerror(*v27);
  v53.st_dev = 138412546;
  *(void *)&v53.st_mode = v12;
  WORD2(v53.st_ino) = 2082;
  *(__darwin_ino64_t *)((char *)&v53.st_ino + 6) = (__darwin_ino64_t)v28;
  int64_t v24 = "PKPassesXPCContainer: failed to open pass at %@ - %{public}s.";
  unint64_t v25 = v23;
  uint32_t v26 = 22;
LABEL_33:
  _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v53, v26);
LABEL_34:

LABEL_35:
  [v35 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_37];

  if (self->_status)
  {
    id v35 = 0;
    goto LABEL_40;
  }
  if (v5 >= 0xB)
  {
    id v35 = 0;
    self->_int64_t status = 3;
    v29 = (NSDictionary *)[0 copy];
    goto LABEL_42;
  }
  id v35 = 0;
  self->_int64_t status = 1;
LABEL_40:
  if (v5)
  {
    v29 = (NSDictionary *)[v35 copy];
LABEL_42:
    passFDs = self->_passFDs;
    self->_passFDs = v29;
  }
  [v33 removeItemAtURL:v44[5] error:0];

LABEL_44:
  _Block_object_dispose(&v43, 8);

  fd = self->_fd;
LABEL_45:
  [(PKFileDescriptorXPCContainer *)fd invalidate];
  v31 = self->_fd;
  self->_fd = 0;
}

void __34__PKPassesXPCContainer__unarchive__block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  if (a2 < 0)
  {
    uint64_t v9 = 1;
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    if (fstat(a2, &v13))
    {
      PKLogFacilityTypeGetObject(0);
      uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        long long v7 = __error();
        uint64_t v8 = strerror(*v7);
        *(_DWORD *)buf = 136446210;
        uint64_t v15 = (uint64_t)v8;
        _os_log_impl(&dword_190E10000, &v6->super, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: could not fstat - %{public}s.", buf, 0xCu);
      }
      uint64_t v9 = 1;
    }
    else if (v13.st_size < 0x9600001uLL)
    {
      if (v5)
      {
        uint64_t v10 = PKTemporaryItemNameWithExtension(@"pkpasses");
        uint64_t v6 = [v5 URLByAppendingPathComponent:v10 isDirectory:1];
      }
      else
      {
        PKTemporaryItemURLWithExtension(@"pkpasses", 1);
        uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
        PKTemporaryItemPrepareDirectory();
      }
      if (PKUnarchiverZip(a2, v6, 0xF00000uLL))
      {
        long long v11 = v6;
        uint64_t v9 = 0;
        id v12 = *(void **)(v4 + 40);
        *(void *)(v4 + 40) = v11;
      }
      else
      {
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v12 removeItemAtURL:v6 error:0];
        uint64_t v9 = 1;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = 157286400;
        _os_log_impl(&dword_190E10000, &v6->super, OS_LOG_TYPE_DEFAULT, "PKPassesXPCContainer: archive exceeds the size limit of %zu.", buf, 0xCu);
      }
      uint64_t v9 = 2;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v9;
}

uint64_t __34__PKPassesXPCContainer__unarchive__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (NSURL)temporaryOutputDirectory
{
  return self->_temporaryOutputDirectory;
}

- (void)setTemporaryOutputDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryOutputDirectory, 0);
  objc_storeStrong((id *)&self->_passFDs, 0);
  objc_storeStrong((id *)&self->_fd, 0);
}

@end