@interface PLXPCShMemData
- (PLXPCShMemData)initWithXPCShmem:(id)a3;
- (PLXPCShMemData)initWithXPCShmem:(id)a3 length:(int64_t)a4;
- (const)bytes;
- (id)description;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation PLXPCShMemData

- (unint64_t)length
{
  return self->_dataLength;
}

- (const)bytes
{
  return self->_buffer;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> bufferLength=%lu dataLength=%lu", objc_opt_class(), self, self->_bufferLength, self->_dataLength];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  size_t bufferLength = self->_bufferLength;
  if (bufferLength && munmap(self->_buffer, bufferLength))
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      *(_DWORD *)buf = 136315138;
      v9 = v6;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "munmap(2) failed. (%s)", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PLXPCShMemData;
  [(PLXPCShMemData *)&v7 dealloc];
}

- (PLXPCShMemData)initWithXPCShmem:(id)a3 length:(int64_t)a4
{
  result = [(PLXPCShMemData *)self initWithXPCShmem:a3];
  if (result) {
    result->_dataLength = a4;
  }
  return result;
}

- (PLXPCShMemData)initWithXPCShmem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLXPCShMemData;
  v5 = [(PLXPCShMemData *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (!v4 || (v7 = xpc_shmem_map(v4, &v5->_buffer), (v6->_size_t bufferLength = v7) == 0))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6->_dataLength = v7;
  }
  v8 = v6;
LABEL_7:

  return v8;
}

@end