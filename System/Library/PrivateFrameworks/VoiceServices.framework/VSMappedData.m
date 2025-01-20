@interface VSMappedData
- (BOOL)shouldCleanFile;
- (NSMutableData)fallbackInMemoryData;
- (NSString)filePath;
- (VSMappedData)init;
- (VSMappedData)initWithFilePath:(id)a3 initialSize:(unint64_t)a4;
- (_NSRange)appendData:(id)a3;
- (unint64_t)mappedLength;
- (unint64_t)totalLength;
- (void)_appendToFallbackMemory:(id)a3;
- (void)_appendToMappedMemory:(id)a3;
- (void)_convertToFallbackMemory;
- (void)bytesAtOffset:(unint64_t)a3;
- (void)dealloc;
- (void)mmappedData;
- (void)setFallbackInMemoryData:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setMappedLength:(unint64_t)a3;
- (void)setMmappedData:(void *)a3;
- (void)setShouldCleanFile:(BOOL)a3;
- (void)setTotalLength:(unint64_t)a3;
@end

@implementation VSMappedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInMemoryData, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)setShouldCleanFile:(BOOL)a3
{
  self->_shouldCleanFile = a3;
}

- (BOOL)shouldCleanFile
{
  return self->_shouldCleanFile;
}

- (void)setFallbackInMemoryData:(id)a3
{
}

- (NSMutableData)fallbackInMemoryData
{
  return self->_fallbackInMemoryData;
}

- (void)setMappedLength:(unint64_t)a3
{
  self->_mappedLength = a3;
}

- (unint64_t)mappedLength
{
  return self->_mappedLength;
}

- (void)setMmappedData:(void *)a3
{
  self->_mmappedData = a3;
}

- (void)mmappedData
{
  return self->_mmappedData;
}

- (void)setTotalLength:(unint64_t)a3
{
  self->_totalLength = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)bytesAtOffset:(unint64_t)a3
{
  fallbackInMemoryData = self->_fallbackInMemoryData;
  if (fallbackInMemoryData) {
    return [(NSMutableData *)fallbackInMemoryData mutableBytes] + a3;
  }
  mmappedData = (char *)self->_mmappedData;
  if (mmappedData) {
    return &mmappedData[a3];
  }
  else {
    return 0;
  }
}

- (_NSRange)appendData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_mmappedData) {
      [(VSMappedData *)self _appendToMappedMemory:v4];
    }
    else {
      [(VSMappedData *)self _appendToFallbackMemory:v4];
    }
    unint64_t v7 = self->_totalLength + [v4 length];
    self->_unint64_t totalLength = v7;
    unint64_t totalLength = v7 - [v4 length];
    uint64_t v5 = [v4 length];
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t totalLength = self->_totalLength;
  }

  NSUInteger v8 = totalLength;
  NSUInteger v9 = v5;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)_appendToMappedMemory:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  unint64_t totalLength = self->_totalLength;
  unint64_t mappedLength = self->_mappedLength;
  if (totalLength + v5 >= mappedLength)
  {
    unint64_t v12 = (unint64_t)((double)([v4 length] + mappedLength) * 1.5);
    NSUInteger v8 = [MEMORY[0x263F08840] fileHandleForUpdatingAtPath:self->_filePath];
    if (ftruncate([v8 fileDescriptor], v12))
    {
      v13 = VSGetLogDefault();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      int v20 = *__error();
      v21 = __error();
      v22 = strerror(*v21);
      int v23 = 67109378;
      int v24 = v20;
      __int16 v25 = 2080;
      v26 = v22;
      v19 = "Unable to resize mapped file, errno: %d, error: %s";
    }
    else
    {
      v14 = (char *)mmap(0, v12, 3, 1, [v8 fileDescriptor], 0);
      if (v14 != (char *)-1)
      {
        NSUInteger v9 = v14;
        mmappedData = self->_mmappedData;
        if (mmappedData) {
          munmap(mmappedData, self->_mappedLength);
        }
        self->_mmappedData = v9;
        self->_unint64_t mappedLength = v12;
        unint64_t totalLength = self->_totalLength;
        goto LABEL_3;
      }
      v13 = VSGetLogDefault();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        [(VSMappedData *)self _convertToFallbackMemory];
        [(VSMappedData *)self _appendToFallbackMemory:v4];
        goto LABEL_7;
      }
      int v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      int v23 = 67109378;
      int v24 = v16;
      __int16 v25 = 2080;
      v26 = v18;
      v19 = "Unable to mmap file, errno: %d, error: %s";
    }
    _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0x12u);
    goto LABEL_6;
  }
  NSUInteger v8 = 0;
  NSUInteger v9 = (char *)self->_mmappedData;
LABEL_3:
  v10 = &v9[totalLength];
  id v11 = v4;
  memcpy(v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
LABEL_7:
}

- (void)_convertToFallbackMemory
{
  p_mmappedData = &self->_mmappedData;
  id v4 = [MEMORY[0x263EFF990] dataWithBytes:self->_mmappedData length:self->_totalLength];
  fallbackInMemoryData = self->_fallbackInMemoryData;
  self->_fallbackInMemoryData = v4;

  if (*p_mmappedData) {
    munmap(*p_mmappedData, self->_mappedLength);
  }
  *p_mmappedData = 0;
  self->_unint64_t mappedLength = 0;
}

- (void)_appendToFallbackMemory:(id)a3
{
}

- (void)dealloc
{
  mmappedData = self->_mmappedData;
  if (mmappedData) {
    munmap(mmappedData, self->_mappedLength);
  }
  if (self->_shouldCleanFile)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 removeItemAtPath:self->_filePath error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)VSMappedData;
  [(VSMappedData *)&v5 dealloc];
}

- (VSMappedData)init
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  id v4 = NSTemporaryDirectory();
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"VSMappedData%p", self, v4);
  v10[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  unint64_t v7 = [v3 pathWithComponents:v6];

  NSUInteger v8 = [(VSMappedData *)self initWithFilePath:v7 initialSize:512000];
  return v8;
}

- (VSMappedData)initWithFilePath:(id)a3 initialSize:(unint64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VSMappedData;
  NSUInteger v8 = [(VSMappedData *)&v19 init];
  NSUInteger v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filePath, a3);
    v10 = [MEMORY[0x263F08850] defaultManager];
    char v11 = [v10 fileExistsAtPath:v9->_filePath];

    if ((v11 & 1) == 0)
    {
      unint64_t v12 = [MEMORY[0x263F08850] defaultManager];
      [v12 createFileAtPath:v9->_filePath contents:0 attributes:0];

      v9->_shouldCleanFile = 1;
    }
    v13 = [MEMORY[0x263F08840] fileHandleForUpdatingAtPath:v9->_filePath];
    v14 = v13;
    if (v13 && (v9->_unint64_t mappedLength = a4, !ftruncate([v13 fileDescriptor], v9->_mappedLength)))
    {
      v9->_mmappedData = mmap(0, v9->_mappedLength, 3, 1, [v14 fileDescriptor], 0);
      [v14 closeFile];
    }
    else
    {
      v9->_unint64_t mappedLength = 0;
      filePath = v9->_filePath;
      v9->_filePath = 0;
    }
    if ((unint64_t)v9->_mmappedData + 1 <= 1)
    {
      uint64_t v16 = [MEMORY[0x263EFF990] data];
      fallbackInMemoryData = v9->_fallbackInMemoryData;
      v9->_fallbackInMemoryData = (NSMutableData *)v16;

      v9->_mmappedData = 0;
    }
  }
  return v9;
}

@end