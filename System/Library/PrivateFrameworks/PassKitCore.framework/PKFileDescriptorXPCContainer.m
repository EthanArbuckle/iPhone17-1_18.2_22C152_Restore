@interface PKFileDescriptorXPCContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)isInvalidated;
- (PKFileDescriptorXPCContainer)init;
- (PKFileDescriptorXPCContainer)initWithCoder:(id)a3;
- (PKFileDescriptorXPCContainer)initWithFileDescriptor:(int)a3;
- (PKFileDescriptorXPCContainer)initWithFileURL:(id)a3;
- (id)_init;
- (id)_initWithXPCFileDescriptor:(id)a3;
- (void)accessFileDescriptorWithBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation PKFileDescriptorXPCContainer

- (PKFileDescriptorXPCContainer)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKFileDescriptorXPCContainer;
  id result = [(PKFileDescriptorXPCContainer *)&v3 init];
  if (result)
  {
    *((_DWORD *)result + 3) = 0;
    *((_DWORD *)result + 4) = 0;
  }
  return result;
}

- (id)_initWithXPCFileDescriptor:(id)a3
{
  id v5 = a3;
  v6 = [(PKFileDescriptorXPCContainer *)self _init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 3, a3);
  }

  return v7;
}

- (PKFileDescriptorXPCContainer)initWithFileURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  if (([v4 isFileURL] & 1) == 0)
  {
    v11 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKFileDescriptorXPCContainer: cannot handle non-file URL %@.", (uint8_t *)&v17, 0xCu);
    }

    goto LABEL_12;
  }
  id v6 = v5;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 4);
  if (v7 < 0)
  {
    v12 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = __error();
      v14 = strerror(*v13);
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2082;
      v20 = v14;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKFileDescriptorXPCContainer: failed to open file %@ - %{public}s.", (uint8_t *)&v17, 0x16u);
    }

    goto LABEL_12;
  }
  int v8 = v7;
  xpc_object_t v9 = xpc_fd_create(v7);
  if (v9)
  {
    id v10 = [(PKFileDescriptorXPCContainer *)self _initWithXPCFileDescriptor:v9];
  }
  else
  {

    id v10 = 0;
  }
  close(v8);
  self = (PKFileDescriptorXPCContainer *)v10;

  v15 = self;
LABEL_13:

  return v15;
}

- (PKFileDescriptorXPCContainer)initWithFileDescriptor:(int)a3
{
  if (a3 < 0)
  {
    id v5 = 0;
  }
  else
  {
    xpc_object_t v4 = xpc_fd_create(a3);
    if (v4)
    {
      self = (PKFileDescriptorXPCContainer *)[(PKFileDescriptorXPCContainer *)self _initWithXPCFileDescriptor:v4];
      id v5 = self;
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFileDescriptorXPCContainer)initWithCoder:(id)a3
{
  xpc_object_t v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"fd"];
  id v5 = [(PKFileDescriptorXPCContainer *)self _initWithXPCFileDescriptor:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_readLock = &self->_readLock;
  id v6 = a3;
  os_unfair_lock_lock(p_readLock);
  id v5 = self->_fd;
  os_unfair_lock_unlock(p_readLock);
  [v6 encodeXPCObject:v5 forKey:@"fd"];
}

- (void)accessFileDescriptorWithBlock:(id)a3
{
  int v8 = (void (**)(id, uint64_t))a3;
  if (v8)
  {
    p_writeLock = &self->_writeLock;
    os_unfair_lock_lock(&self->_writeLock);
    p_readLock = &self->_readLock;
    os_unfair_lock_lock(&self->_readLock);
    fd = self->_fd;
    uint64_t v7 = fd ? xpc_fd_dup(fd) : 0xFFFFFFFFLL;
    os_unfair_lock_unlock(p_readLock);
    v8[2](v8, v7);
    os_unfair_lock_unlock(p_writeLock);
    if ((v7 & 0x80000000) == 0) {
      close(v7);
    }
  }
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_readLock = &self->_readLock;
  os_unfair_lock_lock(&self->_readLock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_readLock);
  return (char)v2;
}

- (void)invalidate
{
  p_readLock = &self->_readLock;
  os_unfair_lock_lock(&self->_readLock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    fd = self->_fd;
    self->_fd = 0;
  }
  os_unfair_lock_unlock(p_readLock);
}

- (void).cxx_destruct
{
}

@end