@interface MMapStruct
+ (id)mMapStructWithFilepath:(id)a3;
- (MMapStruct)initWithBuffer:(void *)a3 size:(unint64_t)a4;
- (unint64_t)size;
- (void)buffer;
- (void)dealloc;
@end

@implementation MMapStruct

- (MMapStruct)initWithBuffer:(void *)a3 size:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MMapStruct;
  result = [(MMapStruct *)&v7 init];
  if (result)
  {
    result->_buffer = a3;
    result->_size = a4;
  }
  return result;
}

+ (id)mMapStructWithFilepath:(id)a3
{
  id v3 = a3;
  int v4 = open((const char *)[v3 UTF8String], 0);
  if (v4 < 0)
  {
    v10 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MMapStruct mMapStructWithFilepath:]();
    }
  }
  else
  {
    int v5 = v4;
    memset(&v13, 0, sizeof(v13));
    if (fstat(v4, &v13) < 0)
    {
      v11 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MMapStruct mMapStructWithFilepath:]();
      }
    }
    else
    {
      off_t st_size = v13.st_size;
      objc_super v7 = mmap(0, v13.st_size, 1, 1, v5, 0);
      if (v7 != (void *)-1)
      {
        v8 = v7;
        close(v5);
        v9 = [[MMapStruct alloc] initWithBuffer:v8 size:st_size];
        goto LABEL_14;
      }
      v11 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MMapStruct mMapStructWithFilepath:]();
      }
    }

    close(v5);
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (void)dealloc
{
  munmap(self->_buffer, self->_size);
  v3.receiver = self;
  v3.super_class = (Class)MMapStruct;
  [(MMapStruct *)&v3 dealloc];
}

- (void)buffer
{
  return self->_buffer;
}

- (unint64_t)size
{
  return self->_size;
}

+ (void)mMapStructWithFilepath:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25E363000, v1, v2, "open file failed. MMap process stopped. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
}

+ (void)mMapStructWithFilepath:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25E363000, v1, v2, "fstat failed. MMap process stopped. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
}

+ (void)mMapStructWithFilepath:.cold.3()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25E363000, v1, v2, "mmap failed. File path=%@ errno:%d(%s)", v3, v4, v5, v6, v7);
}

@end