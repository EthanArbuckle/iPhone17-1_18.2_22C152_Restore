@interface NTKAppleEncryptedArchiveVerificationHandle
- (AAArchiveStream_impl)archiveStream;
- (AAArchiveStream_impl)openReturningError:(id *)a3;
- (AAArchiveStream_impl)verificationStream;
- (BOOL)closeReturningError:(id *)a3;
- (NTKAppleEncryptedArchiveVerificationHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 excludeFields:(id)a6;
- (void)dealloc;
@end

@implementation NTKAppleEncryptedArchiveVerificationHandle

- (NTKAppleEncryptedArchiveVerificationHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 excludeFields:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  v12 = [(NTKAppleEncryptedArchiveHandle *)&v19 initWithArchiveURL:a3 symmetricKey:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    outputDirectoryURL = v12->_outputDirectoryURL;
    v12->_outputDirectoryURL = (NSURL *)v13;

    v15 = [v11 allObjects];
    v16 = [v15 componentsJoinedByString:@","];

    id v17 = v16;
    v12->_excludeFields = AAFieldKeySetCreateWithString((const char *)[v17 fileSystemRepresentation]);
  }
  return v12;
}

- (void)dealloc
{
  AAArchiveStreamClose(self->_verificationStream);
  AAFieldKeySetDestroy(self->_excludeFields);
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  [(NTKAppleEncryptedArchiveHandle *)&v3 dealloc];
}

- (AAArchiveStream_impl)archiveStream
{
  return self->_archiveStream;
}

- (AAArchiveStream_impl)verificationStream
{
  return self->_verificationStream;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  result = -[NTKAppleEncryptedArchiveHandle openReturningError:](&v12, sel_openReturningError_);
  self->_archiveStream = result;
  if (result)
  {
    v6 = [(NSURL *)self->_outputDirectoryURL absoluteURL];
    id v7 = [v6 path];
    [v7 fileSystemRepresentation];
    v8 = [(NTKAppleEncryptedArchiveHandle *)self archiveEntryEvent];
    self->_verificationStream = (AAArchiveStream_impl *)AAVerifyDirectoryArchiveOutputStreamOpen();

    result = self->_verificationStream;
    if (!result)
    {
      v11.receiver = self;
      v11.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
      [(NTKAppleEncryptedArchiveHandle *)&v11 closeReturningError:0];
      if (a3)
      {
        if (*a3)
        {
          id v9 = *a3;
          result = 0;
          *a3 = v9;
          return result;
        }
        -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 4);
        id v10 = objc_claimAutoreleasedReturnValue();
        *a3 = v10;
      }
      return 0;
    }
  }
  return result;
}

- (BOOL)closeReturningError:(id *)a3
{
  int v5 = AAArchiveStreamClose(self->_verificationStream);
  BOOL v6 = v5 == 0;
  if (v5)
  {
    id v7 = -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 5);
  }
  else
  {
    id v7 = 0;
  }
  self->_verificationStream = 0;
  AAFieldKeySetDestroy(self->_excludeFields);
  self->_excludeFields = 0;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  id v15 = 0;
  unsigned __int8 v8 = [(NTKAppleEncryptedArchiveHandle *)&v14 closeReturningError:&v15];
  id v9 = v15;
  id v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v7) {
      objc_super v11 = v7;
    }
    else {
      objc_super v11 = v9;
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
}

@end