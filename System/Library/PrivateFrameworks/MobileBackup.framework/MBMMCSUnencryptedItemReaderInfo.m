@interface MBMMCSUnencryptedItemReaderInfo
- (BOOL)closeWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readWithOffset:(unint64_t)a3 buffer:(char *)a4 bufferLength:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)statWithSize:(unint64_t *)a3 error:(id *)a4;
- (MBMMCSUnencryptedItemReaderInfo)initWithItemID:(unint64_t)a3 path:(id)a4;
- (NSString)path;
- (int)fd;
- (unint64_t)itemID;
- (void)dealloc;
- (void)setFd:(int)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setPath:(id)a3;
@end

@implementation MBMMCSUnencryptedItemReaderInfo

- (MBMMCSUnencryptedItemReaderInfo)initWithItemID:(unint64_t)a3 path:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MBMMCSUnencryptedItemReaderInfo;
  v6 = [(MBMMCSUnencryptedItemReaderInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_itemID = a3;
    v6->_path = (NSString *)a4;
    v7->_fd = -1;
  }
  return v7;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }

  v4.receiver = self;
  v4.super_class = (Class)MBMMCSUnencryptedItemReaderInfo;
  [(MBMMCSUnencryptedItemReaderInfo *)&v4 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  if ((self->_fd & 0x80000000) == 0) {
    return 1;
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t itemID = self->_itemID;
    path = self->_path;
    *(_DWORD *)buf = 134218242;
    unint64_t v18 = itemID;
    __int16 v19 = 2112;
    v20 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Opening fd for MMCS item %llu at %@", buf, 0x16u);
    unint64_t v15 = self->_itemID;
    v16 = self->_path;
    _MBLog();
  }
  int v8 = open([(NSString *)self->_path fileSystemRepresentation], 256);
  if ((v8 & 0x80000000) == 0)
  {
    self->_int fd = v8;
    return 1;
  }
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = self->_itemID;
    v12 = self->_path;
    int v13 = *__error();
    *(_DWORD *)buf = 134218498;
    unint64_t v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 1024;
    int v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error opening fd for MMCS item %llu: %@: %{errno}d", buf, 0x1Cu);
    __error();
    _MBLog();
  }
  if (!a3) {
    return 0;
  }
  id v14 = +[MBError posixErrorWithPath:self->_path format:@"open error"];
  BOOL result = 0;
  *a3 = v14;
  return result;
}

- (BOOL)statWithSize:(unint64_t *)a3 error:(id *)a4
{
  memset(&v13, 0, sizeof(v13));
  int v7 = fstat(self->_fd, &v13);
  if (v7)
  {
    int v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t itemID = self->_itemID;
      path = self->_path;
      int v11 = *__error();
      *(_DWORD *)buf = 134218498;
      unint64_t v15 = itemID;
      __int16 v16 = 2112;
      v17 = path;
      __int16 v18 = 1024;
      int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error stat'ing fd for MMCS item %llu: %@: %{errno}d", buf, 0x1Cu);
      __error();
      _MBLog();
    }
    if (a4) {
      *a4 = +[MBError posixErrorWithPath:self->_path format:@"stat error"];
    }
  }
  else if (a3)
  {
    *a3 = v13.st_size;
  }
  return v7 == 0;
}

- (BOOL)readWithOffset:(unint64_t)a3 buffer:(char *)a4 bufferLength:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  ssize_t v10 = pread(self->_fd, a4, a5, a3);
  ssize_t v11 = v10;
  if (v10 < 0)
  {
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t itemID = self->_itemID;
      path = self->_path;
      int v15 = *__error();
      *(_DWORD *)buf = 134218498;
      unint64_t v18 = itemID;
      __int16 v19 = 2112;
      v20 = path;
      __int16 v21 = 1024;
      int v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error reading fd for MMCS item %llu: %@: %{errno}d", buf, 0x1Cu);
      __error();
      _MBLog();
    }
    if (a7) {
      *a7 = +[MBError posixErrorWithPath:self->_path format:@"read error"];
    }
  }
  else if (a6)
  {
    *a6 = v10;
  }
  return v11 >= 0;
}

- (BOOL)closeWithError:(id *)a3
{
  int v5 = close(self->_fd);
  if (v5)
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t itemID = self->_itemID;
      path = self->_path;
      int v9 = *__error();
      *(_DWORD *)buf = 134218498;
      unint64_t v12 = itemID;
      __int16 v13 = 2112;
      id v14 = path;
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error closing fd for MMCS item %llu: %@: %{errno}d", buf, 0x1Cu);
      __error();
      _MBLog();
    }
    if (a3) {
      *a3 = +[MBError posixErrorWithPath:self->_path format:@"close error"];
    }
  }
  else
  {
    self->_int fd = -1;
  }
  return v5 == 0;
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_unint64_t itemID = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_int fd = a3;
}

@end