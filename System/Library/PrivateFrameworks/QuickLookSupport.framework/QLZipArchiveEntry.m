@interface QLZipArchiveEntry
- (NSData)data;
- (NSURL)url;
- (QLZipArchive)archive;
- (archive_entry)entry;
- (id)readDataWithError:(id *)a3;
- (void)setArchive:(id)a3;
- (void)setData:(id)a3;
- (void)setEntry:(archive_entry *)a3;
@end

@implementation QLZipArchiveEntry

- (NSURL)url
{
  v2 = (const __int32 *)archive_entry_pathname_w();
  v3 = (void *)[[NSString alloc] initWithBytes:v2 length:4 * wcslen(v2) encoding:2617245952];
  v4 = [NSURL fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (id)readDataWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  data = self->_data;
  if (data)
  {
    v4 = data;
  }
  else
  {
    p_error = &self->_error;
    error = self->_error;
    if (a3 && error)
    {
      v4 = 0;
      *a3 = error;
    }
    else
    {
      self->_error = 0;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_archive);
      entry = self->_entry;
      id v17 = 0;
      v11 = [WeakRetained readCurrentDataWithEntry:entry error:&v17];
      id v12 = v17;
      v13 = self->_data;
      self->_data = v11;

      if (!a3 || self->_data)
      {
        if (v12)
        {
          v15 = _qlsLogHandle;
          if (!_qlsLogHandle)
          {
            QLSInitLogging();
            v15 = _qlsLogHandle;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v19 = v12;
            _os_log_impl(&dword_217F31000, v15, OS_LOG_TYPE_ERROR, "Error while attempting to read data: %@ #ZIPHandling", buf, 0xCu);
          }
        }
      }
      else
      {
        id v14 = v12;
        *a3 = v14;
        objc_storeStrong((id *)p_error, v14);
      }
      v4 = self->_data;
    }
  }
  return v4;
}

- (archive_entry)entry
{
  return self->_entry;
}

- (void)setEntry:(archive_entry *)a3
{
  self->_entry = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
}

- (QLZipArchive)archive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_archive);
  return (QLZipArchive *)WeakRetained;
}

- (void)setArchive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_archive);
}

@end