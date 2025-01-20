@interface MBRestoreFileHandle
- (BOOL)closeWithError:(id *)a3;
- (MBRestoreFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5;
- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MBRestoreFileHandle

- (MBRestoreFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MBRestoreFileHandle;
  v7 = [(MBFileHandleProxy *)&v10 initWithFileHandle:a4];
  if (v7)
  {
    v7->_engine = (MBDriveRestoreEngine *)a3;
    v7->_file = (MBFile *)a5;
    if (objc_msgSend(objc_msgSend(a5, "domain"), "shouldDigest")
      && [a3 shouldVerifyDigests])
    {
      v7->_digest = (MBDigest *)objc_alloc_init((Class)MBDigestSHA1);
    }
    +[NSDate timeIntervalSinceReferenceDate];
    v7->_startTime = v8;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBRestoreFileHandle;
  [(MBFileHandleProxy *)&v3 dealloc];
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t v7 = [[(MBFileHandleProxy *)self fileHandle] writeWithBytes:a3 length:a4 error:a5];
  if (v7 >= 1) {
    [(MBDigest *)self->_digest updateWithBytes:a3 length:v7];
  }
  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  id v5 = [(MBDigest *)self->_digest final];
  if (v5)
  {
    v6 = v5;
    if ([(MBFile *)self->_file digest])
    {
      unsigned __int8 v7 = [v6 isEqualToData:-[MBFile digest](self->_file, "digest")];
      double v8 = MBGetDefaultLog();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_super v10 = [(MBFile *)self->_file absolutePath];
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Digest matches: %@", buf, 0xCu);
          v28 = [(MBFile *)self->_file absolutePath];
LABEL_8:
          _MBLog();
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v16 = [(MBFile *)self->_file digest];
        v17 = [(MBFile *)self->_file absolutePath];
        v18 = [(MBFile *)self->_file fileID];
        *(_DWORD *)buf = 138413058;
        v34 = (NSString *)v6;
        __int16 v35 = 2112;
        unint64_t v36 = (unint64_t)v16;
        __int16 v37 = 2112;
        unint64_t v38 = (unint64_t)v17;
        __int16 v39 = 2112;
        v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "File digest does not match manifest (%@ vs %@): %@ (%@)", buf, 0x2Au);
        v19 = [(MBFile *)self->_file digest];
        v31 = [(MBFile *)self->_file absolutePath];
        v32 = [(MBFile *)self->_file fileID];
        v28 = (NSString *)v6;
        v30 = (MBFileID *)v19;
        goto LABEL_13;
      }
    }
    else
    {
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [(MBFile *)self->_file absolutePath];
        v15 = [(MBFile *)self->_file fileID];
        *(_DWORD *)buf = 138412546;
        v34 = v14;
        __int16 v35 = 2112;
        unint64_t v36 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Digest missing from file: %@ (%@)", buf, 0x16u);
        v28 = [(MBFile *)self->_file absolutePath];
        v30 = [(MBFile *)self->_file fileID];
LABEL_13:
        _MBLog();
      }
    }
    -[MBDriveRestoreEngine digestDidNotMatchForFile:](self->_engine, "digestDidNotMatchForFile:", self->_file, v28, v30, v31, v32);
    goto LABEL_15;
  }
  v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = [(MBFile *)self->_file absolutePath];
    *(_DWORD *)buf = 138412290;
    v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Not digested: %@", buf, 0xCu);
    v28 = [(MBFile *)self->_file absolutePath];
    goto LABEL_8;
  }
LABEL_15:
  +[NSDate timeIntervalSinceReferenceDate];
  double v21 = v20;
  double startTime = self->_startTime;
  unint64_t v23 = [(MBFile *)self->_file size];
  if ([(MBFile *)self->_file absolutePath])
  {
    v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      double v25 = v21 - startTime;
      v26 = [(MBFile *)self->_file absolutePath];
      *(_DWORD *)buf = 138412802;
      v34 = v26;
      __int16 v35 = 2048;
      unint64_t v36 = v23;
      __int16 v37 = 2048;
      unint64_t v38 = (unint64_t)((double)v23 / v25);
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Downloaded: %@ (%{bytes}llu at %{bytes}llu/s)", buf, 0x20u);
      v30 = (MBFileID *)v23;
      v31 = (NSString *)((double)v23 / v25);
      v29 = [(MBFile *)self->_file absolutePath];
      _MBLog();
    }
  }
  return [[(MBFileHandleProxy *)self fileHandle] closeWithError:a3];
}

@end