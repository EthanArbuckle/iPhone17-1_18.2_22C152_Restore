@interface MBDeviceLinkDriveContext
- (MBDeviceLinkDriveContext)initWithFileHandleFactory:(id)a3;
- (id)_fileForFD:(int)a3;
- (int)_addFile:(id)a3;
- (int)closeWithFD:(int)a3;
- (int)openWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5;
- (int)statWithFD:(int)a3 buf:(stat *)a4;
- (int64_t)readWithFD:(int)a3 bytes:(void *)a4 length:(unint64_t)a5;
- (int64_t)writeWithFD:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5;
- (void)_removeFileWithFD:(int)a3;
- (void)dealloc;
@end

@implementation MBDeviceLinkDriveContext

- (MBDeviceLinkDriveContext)initWithFileHandleFactory:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBDeviceLinkDriveContext;
  v4 = [(MBDeviceLinkDriveContext *)&v6 init];
  if (v4)
  {
    v4->_fileHandleFactory = (MBFileHandleFactory *)a3;
    v4->_fileHandlesByFD = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDeviceLinkDriveContext;
  [(MBDeviceLinkDriveContext *)&v3 dealloc];
}

- (id)_fileForFD:(int)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_fileHandlesByFD count] <= a3) {
    return 0;
  }
  id v5 = [(NSMutableArray *)self->_fileHandlesByFD objectAtIndexedSubscript:a3];
  if (v5 == (id)objc_opt_class()) {
    return 0;
  }
  else {
    return v5;
  }
}

- (int)_addFile:(id)a3
{
  unint64_t v5 = (int)[a3 fd];
  while ((unint64_t)[(NSMutableArray *)self->_fileHandlesByFD count] <= v5)
    [(NSMutableArray *)self->_fileHandlesByFD addObject:+[NSNull null]];
  [(NSMutableArray *)self->_fileHandlesByFD setObject:a3 atIndexedSubscript:v5];
  return v5;
}

- (void)_removeFileWithFD:(int)a3
{
  unint64_t v5 = +[NSNull null];
  fileHandlesByFD = self->_fileHandlesByFD;

  [(NSMutableArray *)fileHandlesByFD setObject:v5 atIndexedSubscript:a3];
}

- (int)openWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5
{
  uint64_t v15 = 0;
  id v7 = [(MBFileHandleFactory *)self->_fileHandleFactory fileHandleWithPath:a3 flags:*(void *)&a4 mode:a5 error:&v15];
  if (v7) {
    return [(MBDeviceLinkDriveContext *)self _addFile:v7];
  }
  unsigned int v9 = +[MBError isError:withCodes:](MBError, "isError:withCodes:", v15, 4, 7, 9, 0);
  v10 = MBGetDefaultLog();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Failed to open %@: %@", buf, 0x16u);
      id v13 = a3;
      uint64_t v14 = v15;
LABEL_8:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = a3;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to open %@: %@", buf, 0x16u);
    id v13 = a3;
    uint64_t v14 = v15;
    goto LABEL_8;
  }
  int v12 = +[MBError errnoForError:](MBError, "errnoForError:", v15, v13, v14);
  *__error() = v12;
  return -1;
}

- (int)statWithFD:(int)a3 buf:(stat *)a4
{
  uint64_t v13 = 0;
  id v5 = [(MBDeviceLinkDriveContext *)self _fileForFD:*(void *)&a3];
  if (v5)
  {
    objc_super v6 = v5;
    if ([v5 statWithBuffer:a4 error:&v13]) {
      return 0;
    }
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v6 path];
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
      id v11 = [v6 path];
      uint64_t v12 = v13;
      _MBLog();
    }
    int v10 = +[MBError errnoForError:](MBError, "errnoForError:", v13, v11, v12);
    *__error() = v10;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

- (int64_t)readWithFD:(int)a3 bytes:(void *)a4 length:(unint64_t)a5
{
  uint64_t v18 = 0;
  id v7 = [(MBDeviceLinkDriveContext *)self _fileForFD:*(void *)&a3];
  if (v7)
  {
    v8 = v7;
    int64_t result = (int64_t)[v7 readWithBytes:a4 length:a5 error:&v18];
    if ((result & 0x8000000000000000) == 0) {
      return result;
    }
    unsigned int v10 = +[MBError isError:v18 withCode:9];
    id v11 = MBGetDefaultLog();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = [v8 path];
        *(_DWORD *)buf = 138412546;
        id v20 = v13;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "read failed at %@: %@", buf, 0x16u);
        id v16 = [v8 path];
        uint64_t v17 = v18;
LABEL_9:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v8 path];
      *(_DWORD *)buf = 138412546;
      id v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "read failed at %@: %@", buf, 0x16u);
      id v16 = [v8 path];
      uint64_t v17 = v18;
      goto LABEL_9;
    }
    int v15 = +[MBError errnoForError:](MBError, "errnoForError:", v18, v16, v17);
    *__error() = v15;
    return -1;
  }
  *__error() = 9;
  return -1;
}

- (int64_t)writeWithFD:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5
{
  uint64_t v15 = 0;
  id v7 = [(MBDeviceLinkDriveContext *)self _fileForFD:*(void *)&a3];
  if (v7)
  {
    v8 = v7;
    int64_t result = (int64_t)[v7 writeWithBytes:a4 length:a5 error:&v15];
    if ((result & 0x8000000000000000) == 0) {
      return result;
    }
    unsigned int v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v8 path];
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "write failed at %@: %@", buf, 0x16u);
      id v13 = [v8 path];
      uint64_t v14 = v15;
      _MBLog();
    }
    int v12 = +[MBError errnoForError:](MBError, "errnoForError:", v15, v13, v14);
    *__error() = v12;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

- (int)closeWithFD:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = 0;
  id v5 = -[MBDeviceLinkDriveContext _fileForFD:](self, "_fileForFD:");
  if (v5)
  {
    objc_super v6 = v5;
    if ([v5 closeWithError:&v13])
    {
      [(MBDeviceLinkDriveContext *)self _removeFileWithFD:v3];
      return 0;
    }
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v6 path];
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "close failed at %@: %@", buf, 0x16u);
      id v11 = [v6 path];
      uint64_t v12 = v13;
      _MBLog();
    }
    int v10 = +[MBError errnoForError:](MBError, "errnoForError:", v13, v11, v12);
    *__error() = v10;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

@end