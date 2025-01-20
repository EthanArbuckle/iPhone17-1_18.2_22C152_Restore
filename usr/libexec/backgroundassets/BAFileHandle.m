@interface BAFileHandle
+ (BOOL)supportsSecureCoding;
- (BAFileHandle)initWithFileDescriptor:(int)a3 originalPath:(id)a4 closeOnDealloc:(BOOL)a5;
- (NSFileHandle)handle;
- (NSString)filePath;
- (void)setFilePath:(id)a3;
- (void)setHandle:(id)a3;
@end

@implementation BAFileHandle

- (BAFileHandle)initWithFileDescriptor:(int)a3 originalPath:(id)a4 closeOnDealloc:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BAFileHandle;
  v10 = [(BAFileHandle *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_filePath, a4);
    v12 = (NSFileHandle *)[objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v7 closeOnDealloc:v5];
    handle = v11->_handle;
    v11->_handle = v12;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (NSFileHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end