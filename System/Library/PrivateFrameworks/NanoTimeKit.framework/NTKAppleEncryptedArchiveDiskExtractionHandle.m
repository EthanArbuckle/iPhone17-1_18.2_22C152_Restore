@interface NTKAppleEncryptedArchiveDiskExtractionHandle
- (AAArchiveStream_impl)archiveStream;
- (AAArchiveStream_impl)openReturningError:(id *)a3;
- (AAArchiveStream_impl)outputStream;
- (BOOL)closeReturningError:(id *)a3;
- (NTKAppleEncryptedArchiveDiskExtractionHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6;
- (void)dealloc;
@end

@implementation NTKAppleEncryptedArchiveDiskExtractionHandle

- (NTKAppleEncryptedArchiveDiskExtractionHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  v12 = [(NTKAppleEncryptedArchiveHandle *)&v18 initWithArchiveURL:a3 symmetricKey:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    outputDirectoryURL = v12->_outputDirectoryURL;
    v12->_outputDirectoryURL = (NSURL *)v13;

    uint64_t v15 = [v11 copy];
    fileProtection = v12->_fileProtection;
    v12->_fileProtection = (NSString *)v15;
  }
  return v12;
}

- (void)dealloc
{
  AAArchiveStreamClose(self->_outputStream);
  self->_outputStream = 0;
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  [(NTKAppleEncryptedArchiveHandle *)&v3 dealloc];
}

- (AAArchiveStream_impl)archiveStream
{
  return self->super._archiveStream;
}

- (AAArchiveStream_impl)outputStream
{
  return self->_outputStream;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  result = -[NTKAppleEncryptedArchiveHandle openReturningError:](&v13, sel_openReturningError_);
  if (result)
  {
    v6 = [(NSURL *)self->_outputDirectoryURL absoluteURL];
    id v7 = [v6 path];
    v8 = (const char *)[v7 fileSystemRepresentation];
    v9 = [(NTKAppleEncryptedArchiveHandle *)self archiveEntryEvent];
    self->_outputStream = AAExtractArchiveOutputStreamOpen(v8, v9, (AAEntryMessageProc)invokeBlockForArchiveEvent, 0xC010000000000001, 0);

    result = self->_outputStream;
    if (!result)
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
      [(NTKAppleEncryptedArchiveHandle *)&v12 closeReturningError:0];
      if (a3)
      {
        if (*a3)
        {
          id v10 = *a3;
          result = 0;
          *a3 = v10;
          return result;
        }
        -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 4);
        id v11 = objc_claimAutoreleasedReturnValue();
        *a3 = v11;
      }
      return 0;
    }
  }
  return result;
}

- (BOOL)closeReturningError:(id *)a3
{
  int v5 = AAArchiveStreamClose(self->_outputStream);
  BOOL v6 = v5 == 0;
  if (v5)
  {
    id v7 = -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 5);
  }
  else
  {
    id v7 = 0;
  }
  self->_outputStream = 0;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  id v15 = 0;
  unsigned __int8 v8 = [(NTKAppleEncryptedArchiveHandle *)&v14 closeReturningError:&v15];
  id v9 = v15;
  id v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v7) {
      id v11 = v7;
    }
    else {
      id v11 = v9;
    }
    id v12 = v11;

    BOOL v6 = 0;
    id v7 = v12;
  }
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
}

@end