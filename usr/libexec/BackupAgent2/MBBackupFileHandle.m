@interface MBBackupFileHandle
- (BOOL)_isModifiedSince:(int64_t)a3 error:(id *)a4;
- (BOOL)isSQLiteFile;
- (BOOL)recordMetadataWithSHA256Data:(id)a3 error:(id *)a4;
- (MBBackupFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5;
- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MBBackupFileHandle

- (MBBackupFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MBBackupFileHandle;
  v7 = [(MBFileHandleProxy *)&v10 initWithFileHandle:a4];
  if (v7)
  {
    v7->_engine = (MBDriveBackupEngine *)a3;
    v7->_file = (MBFile *)a5;
    if (objc_msgSend(objc_msgSend(a5, "domain"), "shouldDigest")) {
      v7->_digest = (MBDigest *)objc_alloc_init((Class)MBDigestSHA1);
    }
    +[NSDate timeIntervalSinceReferenceDate];
    v7->_startTime = v8;
    v7->_shouldCheckForModifications = [a3 isFinalRetry] ^ 1;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBBackupFileHandle;
  [(MBFileHandleProxy *)&v3 dealloc];
}

- (BOOL)isSQLiteFile
{
  v2 = [(MBFileHandleProxy *)self fileHandle];

  return [(MBFileHandle *)v2 isSQLiteFile];
}

- (BOOL)_isModifiedSince:(int64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  BOOL v6 = [(MBDriveBackupEngine *)self->_engine isModifiedSince:a3 reason:&v8];
  if (v6)
  {
    if (a4) {
      *a4 = +[MBError errorWithCode:9 format:@"File modified while being uploaded"];
    }
    [(MBDriveBackupEngine *)self->_engine fileModifiedWhileUploadingFile:self->_file reason:v8];
  }
  return v6;
}

- (BOOL)recordMetadataWithSHA256Data:(id)a3 error:(id *)a4
{
  memset(v34, 0, sizeof(v34));
  LODWORD(v7) = [[(MBFileHandleProxy *)self fileHandle] statWithBuffer:v34 error:a4];
  if (v7)
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    LODWORD(v7) = sub_10008F52C((uint64_t)v34, (uint64_t)&v29, a4);
    if (v7)
    {
      [(MBFile *)self->_file setNode:&v29];
      if (self->_shouldCheckForModifications
        && [(MBBackupFileHandle *)self _isModifiedSince:*((void *)&v30 + 1) error:a4])
      {
        goto LABEL_20;
      }
      if ([(MBDomain *)[(MBFile *)self->_file domain] shouldDigest])
      {
        if (a3)
        {
          file = self->_file;
          id v9 = a3;
        }
        else
        {
          id v9 = [(MBDigest *)self->_digest final];
          file = self->_file;
        }
        [(MBFile *)file setDigest:v9];
      }
      [(MBFile *)self->_file setProtectionClass:+[MBProtectionClassUtils getWithFD:[[(MBFileHandleProxy *)self fileHandle] fd] error:a4]];
      if ([(MBFile *)self->_file protectionClass] == 255)
      {
LABEL_20:
        LOBYTE(v7) = 0;
      }
      else
      {
        [(MBFile *)self->_file setExtendedAttributes:+[MBExtendedAttributes attributesForFD:[[(MBFileHandleProxy *)self fileHandle] fd] error:a4]];
        v7 = [(MBFile *)self->_file extendedAttributes];
        if (v7)
        {
          unint64_t v10 = +[MBExtendedAttributes sizeOfAttributes:[(MBFile *)self->_file extendedAttributes]];
          if (v10 >= 0x801)
          {
            unint64_t v11 = v10;
            v12 = MBGetDefaultLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = [(MBFile *)self->_file absolutePath];
              *(_DWORD *)buf = 134218498;
              v36 = (MBDomain *)v11;
              __int16 v37 = 1024;
              *(_DWORD *)v38 = 2048;
              *(_WORD *)&v38[4] = 2112;
              *(void *)&v38[6] = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Extended attributes size greater than supported (%lu > %d): %@", buf, 0x1Cu);
              uint64_t v25 = 2048;
              v26 = [(MBFile *)self->_file absolutePath];
              v24 = (MBDomain *)v11;
              _MBLog();
            }
            -[MBFile setExtendedAttributes:](self->_file, "setExtendedAttributes:", &__NSDictionary0__struct, v24, v25, v26);
          }
          if (sub_100092304())
          {
            unsigned int v14 = sub_10008F3CC((uint64_t)&v29);
            v15 = MBGetDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = [(MBFile *)self->_file domain];
              v17 = [(MBFile *)self->_file relativePath];
              v18 = sub_10008F46C((unsigned int *)&v29);
              v19 = [(MBManifestDB *)[(MBDriveBackupEngine *)self->_engine snapshotManifestDB] path];
              *(_DWORD *)buf = 138413314;
              v36 = v16;
              __int16 v37 = 2112;
              *(void *)v38 = v17;
              *(_WORD *)&v38[8] = 2112;
              *(void *)&v38[10] = v18;
              __int16 v39 = 1024;
              unsigned int v40 = v14;
              __int16 v41 = 2112;
              v42 = v19;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Adding file %@:%@ with mbNode %@ (dataless:%d) to manifest at %@", buf, 0x30u);
              v20 = [(MBFile *)self->_file domain];
              v21 = [(MBFile *)self->_file relativePath];
              v22 = sub_10008F46C((unsigned int *)&v29);
              uint64_t v27 = v14;
              v28 = [(MBManifestDB *)[(MBDriveBackupEngine *)self->_engine snapshotManifestDB] path];
              uint64_t v25 = (uint64_t)v21;
              v26 = v22;
              v24 = v20;
              _MBLog();
            }
          }
          [(MBManifestDB *)[(MBDriveBackupEngine *)self->_engine snapshotManifestDB] addFile:self->_file flags:0];
          LOBYTE(v7) = 1;
        }
      }
    }
  }
  return (char)v7;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (!sub_10007B4A4([[(MBFileHandleProxy *)self fileHandle] fd]))
  {
    uint64_t v9 = [[(MBFileHandleProxy *)self fileHandle] readWithBytes:a3 length:a4 error:a5];
    if (v9)
    {
      int64_t v10 = v9;
      if (v9 >= 1)
      {
        [(MBDigest *)self->_digest updateWithBytes:a3 length:v9];
        unint64_t v11 = self->_bytesReadSinceLastModificationCheck + v10;
        self->_bytesReadSinceLastModificationCheck = v11;
        if (!self->_shouldCheckForModifications) {
          return v10;
        }
        if (v11 < 0x100000) {
          return v10;
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v27 = 0u;
        memset(buf, 0, sizeof(buf));
        if ([[(MBFileHandleProxy *)self fileHandle] statWithBuffer:buf error:a5])
        {
          if (![(MBBackupFileHandle *)self _isModifiedSince:(void)v28 error:a5]) {
            return v10;
          }
        }
      }
      return -1;
    }
  }
  if (![(MBBackupFileHandle *)self recordMetadataWithSHA256Data:0 error:a5]) {
    return -1;
  }
  v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v14 = v13;
    double startTime = self->_startTime;
    unint64_t v16 = [(MBFile *)self->_file size];
    v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(MBFile *)self->_file snapshotPath];
      file = self->_file;
      if (v18) {
        v20 = [(MBFile *)file snapshotPath];
      }
      else {
        v20 = [(MBFile *)file absolutePath];
      }
      v21 = v20;
      v22 = [(MBFileID *)[(MBFile *)self->_file fileID] string];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v16;
      LOWORD(v27) = 2048;
      *(void *)((char *)&v27 + 2) = (unint64_t)((double)v16 / (v14 - startTime));
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Uploaded: %@ for %@ (%{bytes}llu at %{bytes}llu/s)", buf, 0x2Au);
      v23 = [(MBFile *)self->_file snapshotPath];
      v24 = self->_file;
      if (v23) {
        [(MBFile *)v24 snapshotPath];
      }
      else {
        [(MBFile *)v24 absolutePath];
      }
      [(MBFileID *)[(MBFile *)self->_file fileID] string];
      _MBLog();
    }
  }
  return 0;
}

@end