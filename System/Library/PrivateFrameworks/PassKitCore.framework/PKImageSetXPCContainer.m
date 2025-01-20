@interface PKImageSetXPCContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)isInvalidated;
- (NSData)imageSetHash;
- (PKImageSetXPCContainer)init;
- (PKImageSetXPCContainer)initWithCoder:(id)a3;
- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 hash:(id)a4;
- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 length:(unint64_t)a4 isSharedMemory:(BOOL)a5 offset:(unint64_t)a6 hash:(id)a7;
- (id)consumeImageSet;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation PKImageSetXPCContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetHash, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t length = self->_length;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:length];
  [v8 encodeObject:v6 forKey:@"length"];

  [v8 encodeBool:self->_isShmem forKey:@"isShmem"];
  [v8 encodeXPCObject:self->_data forKey:@"data"];
  v7 = [NSNumber numberWithUnsignedInteger:self->_offset];
  [v8 encodeObject:v7 forKey:@"offset"];

  [v8 encodeObject:self->_imageSetHash forKey:@"imageSetHash"];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    data = self->_data;
    if (data)
    {
      self->_unint64_t length = 0;
      self->_offset = 0;
      self->_data = 0;
    }
    imageSetHash = self->_imageSetHash;
    if (imageSetHash)
    {
      self->_imageSetHash = 0;
    }
    self->_isShmem = 0;
  }
}

- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 length:(unint64_t)a4 isSharedMemory:(BOOL)a5 offset:(unint64_t)a6 hash:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKImageSetXPCContainer;
  v15 = [(PKImageSetXPCContainer *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_unint64_t length = a4;
    v15->_isShmem = a5;
    if (v13) {
      objc_storeStrong((id *)&v15->_data, a3);
    }
    v16->_offset = a6;
    uint64_t v17 = [v14 copy];
    imageSetHash = v16->_imageSetHash;
    v16->_imageSetHash = (NSData *)v17;
  }
  return v16;
}

- (PKImageSetXPCContainer)initWithWithXPCObject:(id)a3 hash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    size_t length = xpc_data_get_length(v6);
  }
  else {
    size_t length = 0;
  }
  v9 = [(PKImageSetXPCContainer *)self initWithWithXPCObject:v6 length:length isSharedMemory:0 offset:0 hash:v7];

  return v9;
}

- (NSData)imageSetHash
{
  return self->_imageSetHash;
}

- (PKImageSetXPCContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKImageSetXPCContainer;
  v5 = [(PKImageSetXPCContainer *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x192FDC630]();
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"length"];
    v5->_size_t length = [v7 unsignedIntegerValue];

    int v8 = [v4 decodeBoolForKey:@"isShmem"];
    v5->_isShmem = v8;
    if (v8) {
      uint64_t v9 = MEMORY[0x1E4F145E8];
    }
    else {
      uint64_t v9 = MEMORY[0x1E4F14580];
    }
    uint64_t v10 = [v4 decodeXPCObjectOfType:v9 forKey:@"data"];
    data = v5->_data;
    v5->_data = (OS_xpc_object *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offset"];
    v5->_offset = [v12 unsignedIntegerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageSetHash"];
    imageSetHash = v5->_imageSetHash;
    v5->_imageSetHash = (NSData *)v13;

    if (v5->_offset > v5->_length)
    {
      v15 = v5->_data;
      v5->_offset = 0;
      v5->_data = 0;
      v5->_size_t length = 0;
    }
  }

  return v5;
}

void __41__PKImageSetXPCContainer_consumeImageSet__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && munmap(*(void **)(a1 + 32), *(void *)(a1 + 40)))
  {
    v1 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_190E10000, v1, OS_LOG_TYPE_FAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
    }

    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_190E10000, v1, OS_LOG_TYPE_DEFAULT, "Failed to unmap file! Leaking mapping...", v2, 2u);
    }
  }
}

- (id)consumeImageSet
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = self->_data;
  if (!v3) {
    goto LABEL_25;
  }
  BOOL isShmem = self->_isShmem;
  unint64_t length = self->_length;
  self->_unint64_t length = 0;
  unint64_t offset = self->_offset;
  data = self->_data;
  self->_unint64_t offset = 0;
  self->_data = 0;

  int v8 = 0;
  if (length >= offset)
  {
    region = 0;
    if (isShmem)
    {
      unint64_t v9 = xpc_shmem_map(v3, &region);
      bytes_ptr = region;
      if (!region) {
        goto LABEL_25;
      }
    }
    else
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v3);
      region = bytes_ptr;
      unint64_t v9 = xpc_data_get_length(v3);
      if (!bytes_ptr)
      {
LABEL_25:
        int v8 = 0;
        goto LABEL_26;
      }
    }
    if (length - 1 >= v9 || length <= offset)
    {
      if (isShmem && munmap(bytes_ptr, v9))
      {
        objc_super v20 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_190E10000, v20, OS_LOG_TYPE_FAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
        }

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Failed to unmap file! Leaking mapping...", buf, 2u);
        }
      }
      goto LABEL_25;
    }
    v11 = (void *)MEMORY[0x192FDC630]();
    id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__PKImageSetXPCContainer_consumeImageSet__block_invoke;
    v24[3] = &__block_descriptor_49_e12_v24__0_v8Q16l;
    BOOL v25 = isShmem;
    v24[4] = region;
    v24[5] = v9;
    uint64_t v13 = (void *)[v12 initWithBytesNoCopy:(char *)region + offset length:length - offset deallocator:v24];
    id v23 = 0;
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v13 error:&v23];
    id v15 = v23;
    id v16 = v15;
    int v8 = 0;
    if (v14 && !v15)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = *MEMORY[0x1E4F284E8];
      id v22 = 0;
      int v8 = [v14 decodeTopLevelObjectOfClass:v17 forKey:v18 error:&v22];
      id v16 = v22;
    }
    [v14 finishDecoding];
    if (!v8 || v16)
    {
      v19 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v28 = self;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "PKImageSetXPCContainer (%p): failed to extract wrapped image set. %@.", buf, 0x16u);
      }
    }
  }
LABEL_26:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageSetXPCContainer)init
{
  return [(PKImageSetXPCContainer *)self initWithWithXPCObject:0 hash:0];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

@end