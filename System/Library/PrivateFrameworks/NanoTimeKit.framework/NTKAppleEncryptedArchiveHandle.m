@interface NTKAppleEncryptedArchiveHandle
- (AAArchiveStream_impl)openReturningError:(id *)a3;
- (BOOL)closeReturningError:(id *)a3;
- (NSData)symmetricKey;
- (NSURL)archiveURL;
- (NTKAppleEncryptedArchiveHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4;
- (id)archiveEntryEvent;
- (id)errorWithCode:(void *)a1;
- (id)errorWithCode:(void *)a3 userInfo:;
- (void)dealloc;
- (void)setArchiveEntryEvent:(id)a3;
@end

@implementation NTKAppleEncryptedArchiveHandle

- (NTKAppleEncryptedArchiveHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveHandle;
  v8 = [(NTKAppleEncryptedArchiveHandle *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    archiveURL = v8->_archiveURL;
    v8->_archiveURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    symmetricKey = v8->_symmetricKey;
    v8->_symmetricKey = (NSData *)v11;
  }
  return v8;
}

- (void)dealloc
{
  AAArchiveStreamClose(self->_archiveStream);
  AAByteStreamClose(self->_decryptedStream);
  AEAContextDestroy(self->_context);
  AAByteStreamClose(self->_encryptedStream);
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveHandle;
  [(NTKAppleEncryptedArchiveHandle *)&v3 dealloc];
}

- (id)errorWithCode:(void *)a1
{
  if (a1)
  {
    a1 = -[NTKAppleEncryptedArchiveHandle errorWithCode:userInfo:](a1, a2, MEMORY[0x1E4F1CC08]);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)errorWithCode:(void *)a3 userInfo:
{
  if (a1)
  {
    v5 = (void *)[a3 mutableCopy];
    uint64_t v6 = *MEMORY[0x1E4F289D0];
    id v7 = [v5 objectForKey:*MEMORY[0x1E4F289D0]];

    if (!v7)
    {
      v8 = [a1 archiveURL];
      [v5 setObject:v8 forKey:v6];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = (void *)[v5 copy];
    uint64_t v11 = [v9 errorWithDomain:@"NTKAppleEncryptedArchiveHandleErrorDomain" code:a2 userInfo:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  if (!self->_encryptedStream)
  {
    uint64_t v6 = [(NTKAppleEncryptedArchiveHandle *)self archiveURL];
    id v7 = [v6 absoluteURL];
    id v8 = [v7 path];
    self->_encryptedStream = AAFileStreamOpenWithPath((const char *)[v8 fileSystemRepresentation], 16777472, 0);

    encryptedStream = self->_encryptedStream;
    if (encryptedStream)
    {
      v10 = AEAContextCreateWithEncryptedStream(encryptedStream);
      self->_context = v10;
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = v10;
      id v12 = [(NTKAppleEncryptedArchiveHandle *)self symmetricKey];
      v13 = (const uint8_t *)[v12 bytes];
      objc_super v14 = [(NTKAppleEncryptedArchiveHandle *)self symmetricKey];
      LODWORD(v11) = AEAContextSetFieldBlob(v11, 9u, 0, v13, [v14 length]);

      if (v11) {
        goto LABEL_8;
      }
      v20 = AEADecryptionInputStreamOpen(self->_encryptedStream, self->_context, 0xC010000000000001, 0);
      self->_decryptedStream = v20;
      if (v20)
      {
        v21 = [(NTKAppleEncryptedArchiveHandle *)self archiveEntryEvent];

        decryptedStream = self->_decryptedStream;
        if (v21)
        {
          v23 = [(NTKAppleEncryptedArchiveHandle *)self archiveEntryEvent];
          self->_archiveStream = AADecodeArchiveInputStreamOpen(decryptedStream, v23, (AAEntryMessageProc)invokeBlockForArchiveEvent, 0xC010000000000001, 0);

          archiveStream = self->_archiveStream;
        }
        else
        {
          archiveStream = AADecodeArchiveInputStreamOpen(self->_decryptedStream, 0, 0, 0xC010000000000001, 0);
          self->_archiveStream = archiveStream;
        }
        if (archiveStream)
        {
          v17 = 0;
LABEL_18:

          return archiveStream;
        }
        uint64_t v15 = 3;
      }
      else
      {
LABEL_8:
        uint64_t v15 = 2;
      }
    }
    else
    {
      uint64_t v15 = 1;
    }
    v17 = -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, v15);
    AAArchiveStreamClose(self->_archiveStream);
    self->_archiveStream = 0;
    AAByteStreamClose(self->_decryptedStream);
    self->_decryptedStream = 0;
    AEAContextDestroy(self->_context);
    self->_context = 0;
    AAByteStreamClose(self->_encryptedStream);
    self->_encryptedStream = 0;
    if (a3)
    {
      if (*a3) {
        id v18 = *a3;
      }
      else {
        id v18 = v17;
      }
      archiveStream = 0;
      *a3 = v18;
    }
    else
    {
      archiveStream = 0;
    }
    goto LABEL_18;
  }
  if (!a3) {
    return 0;
  }
  if (!*a3)
  {
    -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 6);
    id v16 = objc_claimAutoreleasedReturnValue();
    *a3 = v16;

    return 0;
  }
  archiveStream = 0;
  *a3 = *a3;
  return archiveStream;
}

- (BOOL)closeReturningError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!self->_encryptedStream)
  {
    if (a3)
    {
      if (*a3)
      {
        BOOL v11 = 0;
        *a3 = *a3;
        return v11;
      }
      -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 6);
      id v14 = objc_claimAutoreleasedReturnValue();
      *a3 = v14;
    }
    return 0;
  }
  int v5 = AAArchiveStreamClose(self->_archiveStream);
  int v6 = v5;
  if (v5) {
    id v7 = @"archiveStream";
  }
  else {
    id v7 = @"decryptedStream";
  }
  if (v5) {
    id v8 = @"archiveStream";
  }
  else {
    id v8 = 0;
  }
  self->_archiveStream = 0;
  int v9 = AAByteStreamClose(self->_decryptedStream);
  if (v9) {
    id v8 = v7;
  }
  self->_decryptedStream = 0;
  AEAContextDestroy(self->_context);
  self->_context = 0;
  if (AAByteStreamClose(self->_encryptedStream))
  {
    v10 = @"encryptedStream";
    if (v6) {
      v10 = @"archiveStream";
    }
    if (v9) {
      v10 = v7;
    }
    id v8 = v10;
  }
  self->_encryptedStream = 0;
  BOOL v11 = v8 == 0;
  if (a3 && v8)
  {
    if (*a3)
    {
      *a3 = *a3;
    }
    else
    {
      id v16 = @"failureStep";
      v17[0] = v8;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      -[NTKAppleEncryptedArchiveHandle errorWithCode:userInfo:](self, 5, v12);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a3 = v13;
    }
  }

  return v11;
}

- (NSURL)archiveURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)symmetricKey
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (id)archiveEntryEvent
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setArchiveEntryEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archiveEntryEvent, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end