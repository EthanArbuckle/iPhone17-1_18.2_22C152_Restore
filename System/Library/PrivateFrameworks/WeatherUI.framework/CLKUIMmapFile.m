@interface CLKUIMmapFile
+ (CLKUIMmapFile)mmapFileWithPath:(id)a3;
- (CLKUIMmapFile)initWithPath:(id)a3 descriptor:(int)a4 length:(unint64_t)a5 bytes:(const void *)a6;
- (NSString)path;
- (const)bytes;
- (int)descriptor;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation CLKUIMmapFile

+ (CLKUIMmapFile)mmapFileWithPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = open((const char *)[v3 UTF8String], 0, 0);
  if ((v4 & 0x80000000) != 0)
  {
    v9 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CLKUIMmapFile mmapFileWithPath:]((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v5 = v4;
    memset(&v29, 0, sizeof(v29));
    fstat(v4, &v29);
    off_t st_size = v29.st_size;
    if (v29.st_size)
    {
      v7 = mmap(0, v29.st_size, 1, 1, v5, 0);
      if (v7 != (void *)-1)
      {
        v8 = [[CLKUIMmapFile alloc] initWithPath:v3 descriptor:v5 length:st_size bytes:v7];
        goto LABEL_12;
      }
      v9 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CLKUIMmapFile mmapFileWithPath:]((uint64_t)v3, v9, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      v9 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CLKUIMmapFile mmapFileWithPath:]((uint64_t)v3, v9, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  v8 = 0;
LABEL_12:

  return v8;
}

- (CLKUIMmapFile)initWithPath:(id)a3 descriptor:(int)a4 length:(unint64_t)a5 bytes:(const void *)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKUIMmapFile;
  uint64_t v12 = [(CLKUIMmapFile *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    v13->_descriptor = a4;
    v13->_length = a5;
    v13->_bytes = a6;
  }

  return v13;
}

- (void)dealloc
{
  munmap((void *)self->_bytes, self->_length);
  close(self->_descriptor);
  v3.receiver = self;
  v3.super_class = (Class)CLKUIMmapFile;
  [(CLKUIMmapFile *)&v3 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (void).cxx_destruct
{
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)mmapFileWithPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end