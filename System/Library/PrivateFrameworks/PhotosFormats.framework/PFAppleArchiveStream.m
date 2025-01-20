@interface PFAppleArchiveStream
- (AAByteStream_impl)_byteStreamToBeReadByArchiveDecodingStream;
- (AAByteStream_impl)_byteStreamToBeTargetedByArchiveEncodingStream;
- (BOOL)_openForReadingEncryptionStreamWithError:(id *)a3;
- (BOOL)_openForWritingCompressionStreamShouldAppend:(BOOL)a3 error:(id *)a4;
- (BOOL)_openForWritingEncryptionStreamWithError:(id *)a3;
- (BOOL)_setupEncryptionContextForWritingWithError:(id *)a3;
- (BOOL)appendToExistingArchive;
- (BOOL)close:(id *)a3;
- (BOOL)openForReading:(id *)a3;
- (BOOL)openForWriting:(id *)a3;
- (NSData)encryptionKey;
- (NSDictionary)encryptedArchiveMetadata;
- (NSURL)archiveURL;
- (PFAppleArchiveStream)init;
- (PFAppleArchiveStream)initWithArchiveURL:(id)a3;
- (id)description;
- (int64_t)compression;
- (unint64_t)blockSize;
- (unsigned)aaCompressionAlgorithm;
- (void)dealloc;
- (void)setAppendToExistingArchive:(BOOL)a3;
- (void)setBlockSize:(unint64_t)a3;
- (void)setCompression:(int64_t)a3;
- (void)setEncryptedArchiveMetadata:(id)a3;
- (void)setEncryptionKey:(id)a3;
@end

@implementation PFAppleArchiveStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedArchiveMetadata, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setAppendToExistingArchive:(BOOL)a3
{
  self->_appendToExistingArchive = a3;
}

- (BOOL)appendToExistingArchive
{
  return self->_appendToExistingArchive;
}

- (void)setEncryptedArchiveMetadata:(id)a3
{
}

- (NSDictionary)encryptedArchiveMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCompression:(int64_t)a3
{
  self->_compression = a3;
}

- (int64_t)compression
{
  return self->_compression;
}

- (NSURL)archiveURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)aaCompressionAlgorithm
{
  unint64_t v2 = [(PFAppleArchiveStream *)self compression];
  if (v2 > 2) {
    return 0;
  }
  else {
    return dword_1A42D3A00[v2];
  }
}

- (void)dealloc
{
  encryptionStream = self->_encryptionStream;
  if (encryptionStream)
  {
    AAByteStreamCancel(encryptionStream);
    AAByteStreamClose(self->_encryptionStream);
  }
  compressionStream = self->_compressionStream;
  if (compressionStream)
  {
    AAByteStreamCancel(compressionStream);
    AAByteStreamClose(self->_compressionStream);
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    AAByteStreamCancel(outputStream);
    AAByteStreamClose(self->_outputStream);
  }
  inputStream = self->_inputStream;
  if (inputStream)
  {
    AAByteStreamCancel(inputStream);
    AAByteStreamClose(self->_inputStream);
  }
  encryptionContext = self->_encryptionContext;
  if (encryptionContext) {
    AEAContextDestroy(encryptionContext);
  }
  v8.receiver = self;
  v8.super_class = (Class)PFAppleArchiveStream;
  [(PFAppleArchiveStream *)&v8 dealloc];
}

- (BOOL)close:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  encryptionStream = self->_encryptionStream;
  if (!encryptionStream) {
    goto LABEL_6;
  }
  int v6 = AAByteStreamClose(encryptionStream);
  self->_encryptionStream = 0;
  if (a3 && v6)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = v6;
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v9 = [NSString stringWithFormat:@"%@", @"Failed to close encryption stream"];
    v28[0] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = (void **)v28;
    v12 = &v27;
LABEL_20:
    v19 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    *a3 = [v7 errorWithDomain:@"com.apple.PhotosFormats" code:v8 userInfo:v19];

    return 0;
  }
  if (!v6)
  {
LABEL_6:
    compressionStream = self->_compressionStream;
    if (!compressionStream) {
      goto LABEL_11;
    }
    int v14 = AAByteStreamClose(compressionStream);
    self->_compressionStream = 0;
    if (a3 && v14)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = v14;
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v9 = [NSString stringWithFormat:@"%@", @"Failed to close compression stream"];
      v26 = v9;
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = &v26;
      v12 = &v25;
      goto LABEL_20;
    }
    if (!v14)
    {
LABEL_11:
      inputStream = self->_inputStream;
      if (!inputStream) {
        goto LABEL_16;
      }
      int v16 = AAByteStreamClose(inputStream);
      self->_inputStream = 0;
      if (a3 && v16)
      {
        v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = v16;
        uint64_t v23 = *MEMORY[0x1E4F28228];
        v9 = [NSString stringWithFormat:@"%@", @"Failed to close input stream"];
        v24 = v9;
        v10 = (void *)MEMORY[0x1E4F1C9E8];
        v11 = &v24;
        v12 = &v23;
        goto LABEL_20;
      }
      if (!v16)
      {
LABEL_16:
        outputStream = self->_outputStream;
        if (outputStream)
        {
          int v18 = AAByteStreamClose(outputStream);
          self->_outputStream = 0;
          if (a3 && v18)
          {
            v7 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v8 = v18;
            v9 = [NSString stringWithFormat:@"%@", @"Failed to close output stream", *MEMORY[0x1E4F28228]];
            v22 = v9;
            v10 = (void *)MEMORY[0x1E4F1C9E8];
            v11 = &v22;
            v12 = &v21;
            goto LABEL_20;
          }
          if (v18) {
            return 0;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

- (BOOL)_openForReadingEncryptionStreamWithError:(id *)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  v5 = AEAContextCreateWithEncryptedStream(self->_inputStream);
  self->_encryptionContext = v5;
  if (!v5)
  {
    if (!a3) {
      return (char)a3;
    }
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28228];
    v15 = [NSString stringWithFormat:@"Unable to get encryption context from input stream"];
    v59[0] = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
    uint64_t v17 = 500003;
    goto LABEL_7;
  }
  int v6 = v5;
  id v7 = [(PFAppleArchiveStream *)self encryptionKey];
  uint64_t v8 = (const uint8_t *)[v7 bytes];
  v9 = [(PFAppleArchiveStream *)self encryptionKey];
  uint64_t v10 = AEAContextSetFieldBlob(v6, 9u, 0, v8, [v9 length]);

  if (!v10)
  {
    int v18 = AEAAuthDataCreateWithContext(self->_encryptionContext);
    if (v18)
    {
      v19 = v18;
      uint64_t EntryCount = AEAAuthDataGetEntryCount(v18);
      if (EntryCount <= 1)
      {
        if (a3)
        {
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F28228];
          v22 = [NSString stringWithFormat:@"Unexpected entry count %u, expected at least %u", EntryCount, 2];
          v53 = v22;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          *a3 = [v21 errorWithDomain:@"com.apple.PhotosFormats" code:500008 userInfo:v23];
        }
        AEAAuthDataDestroy(v19);
        goto LABEL_13;
      }
      uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:EntryCount];
      uint64_t v26 = 0;
      do
      {
        size_t data_size = 0;
        uint64_t Entry = AEAAuthDataGetEntry(v19, v26, 0x64uLL, key, 0, 0x64uLL, data, &data_size);
        if (Entry)
        {
          if (a3)
          {
            v32 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v48 = *MEMORY[0x1E4F28228];
            v33 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to get auth data entry %d: %d", v26, Entry);
            v49 = v33;
            v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            *a3 = [v32 errorWithDomain:@"com.apple.PhotosFormats" code:500009 userInfo:v34];
          }
          AEAAuthDataDestroy(v19);
          goto LABEL_27;
        }
        v28 = [NSString stringWithUTF8String:key];
        id v29 = [NSString alloc];
        v30 = (void *)[v29 initWithBytes:data length:data_size encoding:4];
        v31 = [v25 objectForKeyedSubscript:v28];
        if (v31 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v43 = v28;
          __int16 v44 = 2112;
          v45 = v31;
          __int16 v46 = 2112;
          v47 = v30;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Overwriting existing auth data value for key %@: %@/%@", buf, 0x20u);
        }
        [v25 setObject:v30 forKeyedSubscript:v28];

        uint64_t v26 = (v26 + 1);
      }
      while (EntryCount != v26);
      AEAAuthDataDestroy(v19);
      objc_storeStrong((id *)&self->_encryptedArchiveMetadata, v25);
      v35 = AEADecryptionInputStreamOpen(self->_inputStream, self->_encryptionContext, 0, 0);
      self->_encryptionStream = v35;
      if (v35)
      {
        LOBYTE(a3) = 1;
        goto LABEL_30;
      }
      if (a3)
      {
        v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28228];
        v37 = [NSString stringWithFormat:@"Unable to open encryption output stream"];
        v41 = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        *a3 = [v36 errorWithDomain:@"com.apple.PhotosFormats" code:500002 userInfo:v38];

LABEL_27:
        LOBYTE(a3) = 0;
      }
LABEL_30:

      return (char)a3;
    }
    if (!a3) {
      return (char)a3;
    }
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28228];
    v15 = [NSString stringWithFormat:@"Unable to query auth data from encrypted archive context"];
    v55 = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    uint64_t v17 = 500007;
LABEL_7:
    *a3 = [v14 errorWithDomain:@"com.apple.PhotosFormats" code:v17 userInfo:v16];

    goto LABEL_13;
  }
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28228];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to set symmetric key for decryption: %d", v10);
    v57 = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    *a3 = [v11 errorWithDomain:@"com.apple.PhotosFormats" code:500005 userInfo:v13];

LABEL_13:
    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)openForReading:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self->_inputStream || self->_outputStream) {
    _PFAssertFailHandler();
  }
  id v5 = [(PFAppleArchiveStream *)self archiveURL];
  self->_inputStream = AAFileStreamOpenWithPath((const char *)[v5 fileSystemRepresentation], 0, 0x1A4u);

  if (!self->_inputStream)
  {
    if (a3)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v9 = [NSString stringWithFormat:@"%@", @"Failed to open input file stream"];
      v18[0] = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = (void **)v18;
      v12 = &v17;
LABEL_10:
      v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      *a3 = [v8 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v13];
    }
    return 0;
  }
  int v6 = [(PFAppleArchiveStream *)self encryptionKey];

  if (!v6)
  {
    if ([(PFAppleArchiveStream *)self compression] == -1) {
      return 1;
    }
    int v14 = AADecompressionInputStreamOpen(self->_inputStream, 0, 0);
    self->_compressionStream = v14;
    if (v14) {
      return 1;
    }
    if (a3)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      v9 = [NSString stringWithFormat:@"%@", @"Failed to open decompression stream", *MEMORY[0x1E4F28228]];
      int v16 = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = &v16;
      v12 = &v15;
      goto LABEL_10;
    }
    return 0;
  }

  return [(PFAppleArchiveStream *)self _openForReadingEncryptionStreamWithError:a3];
}

- (AAByteStream_impl)_byteStreamToBeReadByArchiveDecodingStream
{
  result = self->_encryptionStream;
  if (!result)
  {
    result = self->_compressionStream;
    if (!result) {
      return self->_inputStream;
    }
  }
  return result;
}

- (AAByteStream_impl)_byteStreamToBeTargetedByArchiveEncodingStream
{
  result = self->_encryptionStream;
  if (!result)
  {
    result = self->_compressionStream;
    if (!result) {
      return self->_outputStream;
    }
  }
  return result;
}

- (BOOL)_openForWritingCompressionStreamShouldAppend:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  AACompressionAlgorithm v7 = [(PFAppleArchiveStream *)self aaCompressionAlgorithm];
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v5
     ? AACompressionOutputStreamOpenExisting(self->_outputStream, 0, 0)
     : AACompressionOutputStreamOpen(self->_outputStream, v7, [(PFAppleArchiveStream *)self blockSize], 0, 0);
  self->_compressionStream = v8;
  if (v8) {
    return 1;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28798];
  uint64_t v12 = *__error();
  uint64_t v26 = *MEMORY[0x1E4F28228];
  uint64_t v13 = v26;
  int v14 = NSString;
  uint64_t v15 = __error();
  int v16 = [v14 stringWithUTF8String:strerror(*v15)];
  v27[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  int v18 = [v10 errorWithDomain:v11 code:v12 userInfo:v17];

  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28A50];
  v24[0] = v13;
  v24[1] = v20;
  v25[0] = @"Failed to open compression stream";
  v25[1] = v18;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v22 = [v19 errorWithDomain:@"com.apple.PhotosFormats" code:500300 userInfo:v21];
  uint64_t v23 = v22;
  if (a4) {
    *a4 = v22;
  }

  return 0;
}

- (BOOL)_setupEncryptionContextForWritingWithError:(id *)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (self->_encryptionContext) {
    _PFAssertFailHandler();
  }
  BOOL v5 = AEAContextCreateWithProfile(1u);
  self->_encryptionContext = v5;
  if (v5)
  {
    uint64_t v6 = [(PFAppleArchiveStream *)self aaCompressionAlgorithm];
    if (v6
      && (v7 = v6, uint64_t v8 = AEAContextSetFieldUInt(self->_encryptionContext, 3u, v6), v8))
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F28228];
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to set compression algorithm %u: %d", v7, v8);
        v38 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        uint64_t v12 = 500004;
LABEL_10:
        int v18 = v9;
LABEL_13:
        *a3 = [v18 errorWithDomain:@"com.apple.PhotosFormats" code:v12 userInfo:v11];
      }
    }
    else
    {
      encryptionContext = self->_encryptionContext;
      id v14 = [(PFAppleArchiveStream *)self encryptionKey];
      uint64_t v15 = (const uint8_t *)[v14 bytes];
      int v16 = [(PFAppleArchiveStream *)self encryptionKey];
      uint64_t v17 = AEAContextSetFieldBlob(encryptionContext, 9u, 0, v15, [v16 length]);

      if (!v17)
      {
        uint64_t v21 = [(PFAppleArchiveStream *)self encryptedArchiveMetadata];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          AEAAuthData v23 = AEAAuthDataCreate();
          if (!v23)
          {
            if (!a3) {
              return 0;
            }
            v9 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v33 = *MEMORY[0x1E4F28228];
            uint64_t v10 = [NSString stringWithFormat:@"Unable to create auth data blob"];
            v34 = v10;
            uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            uint64_t v12 = 500007;
            goto LABEL_10;
          }
          v24 = v23;
          uint64_t v25 = [(PFAppleArchiveStream *)self encryptedArchiveMetadata];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __67__PFAppleArchiveStream__setupEncryptionContextForWritingWithError___block_invoke;
          v30[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
          v30[4] = v24;
          [v25 enumerateKeysAndObjectsUsingBlock:v30];

          uint64_t v26 = self->_encryptionContext;
          EncodedData = AEAAuthDataGetEncodedData(v24);
          size_t EncodedSize = AEAAuthDataGetEncodedSize(v24);
          uint64_t v29 = AEAContextSetFieldBlob(v26, 5u, 0, EncodedData, EncodedSize);
          AEAAuthDataDestroy(v24);
          if (v29)
          {
            if (!a3) {
              return 0;
            }
            v9 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v31 = *MEMORY[0x1E4F28228];
            uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to set auth data on encrypted archive context: %d", v29);
            v32 = v10;
            uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            uint64_t v12 = 500006;
            goto LABEL_10;
          }
        }
        return 1;
      }
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28228];
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to set symmetric key for encryption: %d", v17);
        v36 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        uint64_t v12 = 500005;
        goto LABEL_10;
      }
    }
  }
  else if (a3)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28228];
    uint64_t v10 = [NSString stringWithFormat:@"%@", @"Unable to create encryption context"];
    v40[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    int v18 = v19;
    uint64_t v12 = 500003;
    goto LABEL_13;
  }
  return 0;
}

uint64_t __67__PFAppleArchiveStream__setupEncryptionContextForWritingWithError___block_invoke(uint64_t a1, id a2, void *a3)
{
  v4 = *(AEAAuthData_impl **)(a1 + 32);
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  v9 = (const uint8_t *)[v8 UTF8String];
  size_t v10 = [v8 lengthOfBytesUsingEncoding:4];

  return AEAAuthDataAppendEntry(v4, v7, v9, v10);
}

- (BOOL)_openForWritingEncryptionStreamWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[PFAppleArchiveStream _setupEncryptionContextForWritingWithError:](self, "_setupEncryptionContextForWritingWithError:");
  if (v5)
  {
    id v6 = AEAEncryptionOutputStreamOpen(self->_outputStream, self->_encryptionContext, 0, 0);
    self->_encryptionStream = v6;
    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v11 = *MEMORY[0x1E4F28228];
        id v8 = [NSString stringWithFormat:@"Unable to open encryption output stream"];
        v12[0] = v8;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        *a3 = [v7 errorWithDomain:@"com.apple.PhotosFormats" code:500001 userInfo:v9];
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)openForWriting:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_inputStream || self->_outputStream) {
    _PFAssertFailHandler();
  }
  BOOL v5 = [(PFAppleArchiveStream *)self appendToExistingArchive];
  if (v5) {
    int v6 = 2561;
  }
  else {
    int v6 = 1537;
  }
  id v7 = [(PFAppleArchiveStream *)self archiveURL];
  unsigned int v8 = open((const char *)[v7 fileSystemRepresentation], v6, 420);

  int v9 = v8;
  if ((v8 & 0x80000000) != 0)
  {
    if (!v5
      || *__error() != 17
      || ([(PFAppleArchiveStream *)self archiveURL],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v9 = open((const char *)[v13 fileSystemRepresentation], 2, 420),
          v13,
          v9 < 0))
    {
      if (a3)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28228];
        uint64_t v15 = [NSString stringWithFormat:@"%@", @"Failed to open output file stream"];
        v23[0] = v15;
        int v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = (void **)v23;
        int v18 = &v22;
LABEL_19:
        v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
        *a3 = [v14 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v19];

        return 0;
      }
      return 0;
    }
  }
  size_t v10 = AAFileStreamOpenWithFD(v9, 1);
  self->_outputStream = v10;
  if (!v10)
  {
    if (a3)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = [NSString stringWithFormat:@"%@", @"Failed to open output file stream", *MEMORY[0x1E4F28228]];
      uint64_t v21 = v15;
      int v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = &v21;
      int v18 = &v20;
      goto LABEL_19;
    }
    return 0;
  }
  uint64_t v11 = [(PFAppleArchiveStream *)self encryptionKey];

  if (v11)
  {
    return [(PFAppleArchiveStream *)self _openForWritingEncryptionStreamWithError:a3];
  }
  else
  {
    return [(PFAppleArchiveStream *)self _openForWritingCompressionStreamShouldAppend:v8 >> 31 error:a3];
  }
}

- (id)description
{
  int64_t v3 = [(PFAppleArchiveStream *)self compression];
  if ((unint64_t)(v3 + 1) > 3) {
    v4 = @"???";
  }
  else {
    v4 = off_1E5B2E330[v3 + 1];
  }
  if (self->_inputStream)
  {
    BOOL v5 = @"R";
  }
  else if (self->_outputStream)
  {
    BOOL v5 = @"W";
  }
  else
  {
    BOOL v5 = @"-";
  }
  int v6 = NSString;
  id v7 = v5;
  uint64_t v8 = objc_opt_class();
  int v9 = [(PFAppleArchiveStream *)self archiveURL];
  size_t v10 = [v6 stringWithFormat:@"<%@:%p %@ append=%d block_size=%ld compression=%@ open:%@>", v8, self, v9, -[PFAppleArchiveStream appendToExistingArchive](self, "appendToExistingArchive"), -[PFAppleArchiveStream blockSize](self, "blockSize"), v4, v7];

  return v10;
}

- (PFAppleArchiveStream)initWithArchiveURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    int v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PFAppleArchiveStream;
    id v7 = [(PFAppleArchiveStream *)&v12 init];
    uint64_t v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_archiveURL, a3);
      v8->_blockSize = 0x100000;
    }

    return v8;
  }
  else
  {
    size_t v10 = (PFAppleArchiveStream *)_PFAssertFailHandler();
    return [(PFAppleArchiveStream *)v10 init];
  }
}

- (PFAppleArchiveStream)init
{
  unint64_t v2 = (PFAppleArchive *)_PFAssertFailHandler();
  [(PFAppleArchive *)v2 dealloc];
  return result;
}

@end