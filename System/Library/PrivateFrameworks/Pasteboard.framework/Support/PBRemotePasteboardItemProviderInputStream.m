@interface PBRemotePasteboardItemProviderInputStream
+ (id)inputStreamWithFileHandle:(id)a3;
- (BOOL)hasBytesAvailable;
- (PBRemotePasteboardItemProviderInputStream)initWithFileHandle:(id)a3;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (void)close;
@end

@implementation PBRemotePasteboardItemProviderInputStream

+ (id)inputStreamWithFileHandle:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithFileHandle:v4];

  return v5;
}

- (PBRemotePasteboardItemProviderInputStream)initWithFileHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBRemotePasteboardItemProviderInputStream;
  v6 = [(PBRemotePasteboardItemProviderInputStream *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileHandle, a3);
    v7->_fd = [v5 fileDescriptor];
  }

  return v7;
}

- (void)close
{
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  int64_t result = read(self->_fd, a3, a4);
  if (result < 0)
  {
    id v5 = _PBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      int v9 = 136315650;
      v10 = "-[PBRemotePasteboardItemProviderInputStream read:maxLength:]";
      __int16 v11 = 1024;
      int v12 = v6;
      __int16 v13 = 2080;
      v14 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s: Error trying to read from fileHandle obtained for item representation: errno %d - %s", (uint8_t *)&v9, 0x1Cu);
    }

    return 0;
  }
  return result;
}

- (BOOL)hasBytesAvailable
{
  return 1;
}

- (void).cxx_destruct
{
}

@end