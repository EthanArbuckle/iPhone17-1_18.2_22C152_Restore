@interface NTKAppleEncryptedArchiveDiskExtractor
- (BOOL)verifyExtractedContentsWithError:(id *)a3;
- (NSData)symmetricKey;
- (NSString)fileProtection;
- (NSURL)archiveURL;
- (NSURL)outputDirectoryURL;
- (NTKAppleEncryptedArchiveDiskExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6 completion:(id)a7;
- (id)errorWithCode:(void *)a1;
- (id)errorWithCode:(void *)a3 userInfo:;
- (id)requiredDiskSpaceWithError:(id *)a3;
- (uint64_t)setOutputStream:(uint64_t)result;
- (uint64_t)setState:(uint64_t)result;
- (void)cancel;
- (void)resume;
- (void)setCompletion:(void *)a1;
- (void)setExtractionQueue:(uint64_t)a1;
@end

@implementation NTKAppleEncryptedArchiveDiskExtractor

- (NTKAppleEncryptedArchiveDiskExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractor;
  v17 = [(NTKAppleEncryptedArchiveDiskExtractor *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    archiveURL = v17->_archiveURL;
    v17->_archiveURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    symmetricKey = v17->_symmetricKey;
    v17->_symmetricKey = (NSData *)v20;

    uint64_t v22 = [v14 copy];
    outputDirectoryURL = v17->_outputDirectoryURL;
    v17->_outputDirectoryURL = (NSURL *)v22;

    objc_storeStrong((id *)&v17->_fileProtection, a6);
    uint64_t v24 = [v16 copy];
    id completion = v17->_completion;
    v17->_id completion = (id)v24;

    v17->_outputStream = 0;
    objc_storeStrong((id *)&v17->_completionQueue, MEMORY[0x1E4F14428]);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.nanotimekit.facesupport.aeadiskextractor.extractionQueue", 0);
    extractionQueue = v17->_extractionQueue;
    v17->_extractionQueue = (OS_dispatch_queue *)v26;

    v17->_state = 0;
  }

  return v17;
}

- (id)errorWithCode:(void *)a1
{
  if (a1)
  {
    a1 = -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:userInfo:](a1, a2, MEMORY[0x1E4F1CC08]);
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
    v7 = [v5 objectForKey:*MEMORY[0x1E4F289D0]];

    if (!v7)
    {
      v8 = [a1 archiveURL];
      [v5 setObject:v8 forKey:v6];
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = (void *)[v5 copy];
    v11 = [v9 errorWithDomain:@"NTKAppleEncryptedArchiveDiskExtractor" code:a2 userInfo:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)requiredDiskSpaceWithError:(id *)a3
{
  v5 = [NTKAppleEncryptedArchiveHandle alloc];
  uint64_t v6 = [(NTKAppleEncryptedArchiveDiskExtractor *)self archiveURL];
  v7 = [(NTKAppleEncryptedArchiveDiskExtractor *)self symmetricKey];
  v8 = [(NTKAppleEncryptedArchiveHandle *)v5 initWithArchiveURL:v6 symmetricKey:v7];

  uint64_t v9 = [(NTKAppleEncryptedArchiveHandle *)v8 openReturningError:a3];
  if (v9)
  {
    v10 = (AAArchiveStream_impl *)v9;
    for (uint64_t i = 0; ; i += PayloadSize)
    {
      AAHeader header = 0;
      int v12 = AAArchiveStreamReadHeader(v10, &header);
      if (v12 != 1) {
        break;
      }
      uint64_t v19 = 0;
      id v13 = header;
      v14.ikey = 5917011;
      uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v14);
      if ((KeyIndex & 0x80000000) != 0 || AAHeaderGetFieldUInt(v13, KeyIndex, &v19) > 1) {
        uint64_t PayloadSize = AAHeaderGetPayloadSize(header);
      }
      else {
        uint64_t PayloadSize = v19;
      }
    }
    if (!v12 || i)
    {
      [(NTKAppleEncryptedArchiveHandle *)v8 closeReturningError:0];
      v17 = [NSNumber numberWithUnsignedLongLong:i];
      goto LABEL_16;
    }
    if (a3)
    {
      -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:](self, 8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(NTKAppleEncryptedArchiveHandle *)v8 closeReturningError:0];
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (BOOL)verifyExtractedContentsWithError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CTM", @"MTM", @"BTM", @"UID", @"GID", @"MOD", 0);
  uint64_t v6 = [NTKAppleEncryptedArchiveVerificationHandle alloc];
  v7 = [(NTKAppleEncryptedArchiveDiskExtractor *)self archiveURL];
  v8 = [(NTKAppleEncryptedArchiveDiskExtractor *)self symmetricKey];
  uint64_t v9 = [(NTKAppleEncryptedArchiveDiskExtractor *)self outputDirectoryURL];
  v10 = [(NTKAppleEncryptedArchiveVerificationHandle *)v6 initWithArchiveURL:v7 symmetricKey:v8 outputDirectoryURL:v9 excludeFields:v5];

  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74__NTKAppleEncryptedArchiveDiskExtractor_verifyExtractedContentsWithError___block_invoke;
  v28[3] = &unk_1E62C5D88;
  id v12 = v11;
  id v29 = v12;
  [(NTKAppleEncryptedArchiveHandle *)v10 setArchiveEntryEvent:v28];
  id v13 = [(NTKAppleEncryptedArchiveVerificationHandle *)v10 openReturningError:a3];
  if (v13)
  {
    AAFieldKey v14 = [(NTKAppleEncryptedArchiveVerificationHandle *)v10 archiveStream];
    id v15 = [(NTKAppleEncryptedArchiveHandle *)v10 archiveEntryEvent];
    ssize_t v16 = AAArchiveStreamProcess(v14, v13, v15, (AAEntryMessageProc)invokeBlockForArchiveEvent_0, 0xC010000000000001, 0);

    LOBYTE(v13) = v16 >= 0;
    if (v16 < 0)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v19 = (void *)[v12 copy];
      uint64_t v20 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, @"FailingPaths", 0);
      v17 = -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:userInfo:](self, 7, v20);
    }
    else
    {
      v17 = 0;
    }
    id v27 = 0;
    BOOL v21 = [(NTKAppleEncryptedArchiveVerificationHandle *)v10 closeReturningError:&v27];
    id v22 = v27;
    v23 = v22;
    if (!v21)
    {
      if (v17) {
        uint64_t v24 = v17;
      }
      else {
        uint64_t v24 = v22;
      }
      id v25 = v24;

      LOBYTE(v13) = 0;
      v17 = v25;
    }
    if (a3) {
      *a3 = v17;
    }
  }
  return (char)v13;
}

uint64_t __74__NTKAppleEncryptedArchiveDiskExtractor_verifyExtractedContentsWithError___block_invoke(uint64_t a1, int a2, void *a3, AAFieldKeySet_impl *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  uint64_t v9 = 0;
  if (a2 <= 71)
  {
    if (a2 != 12)
    {
      if (a2 == 71)
      {
        v10 = *(void **)(a1 + 32);
        v11 = @"-";
LABEL_10:
        [v10 setObject:v11 forKey:v8];
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_12;
  }
  if (a2 == 72)
  {
    if (![v7 length])
    {
      uint64_t v9 = 1;
      goto LABEL_12;
    }
    v10 = *(void **)(a1 + 32);
    v11 = @"+";
    goto LABEL_10;
  }
  if (a2 == 74)
  {
    memset(v15, 0, sizeof(v15));
    AAFieldKeySetSerialize(a4, 0x7FuLL, (char *)v15);
    id v12 = *(void **)(a1 + 32);
    id v13 = [NSString stringWithUTF8String:v15];
    [v12 setObject:v13 forKey:v8];

    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

- (void)resume
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    v2->_state = 1;
  }
  objc_sync_exit(v2);

  v3 = [NTKAppleEncryptedArchiveDiskExtractionHandle alloc];
  v4 = [(NTKAppleEncryptedArchiveDiskExtractor *)v2 archiveURL];
  v5 = [(NTKAppleEncryptedArchiveDiskExtractor *)v2 symmetricKey];
  uint64_t v6 = [(NTKAppleEncryptedArchiveDiskExtractor *)v2 outputDirectoryURL];
  id v7 = [(NTKAppleEncryptedArchiveDiskExtractor *)v2 fileProtection];
  v8 = [(NTKAppleEncryptedArchiveDiskExtractionHandle *)v3 initWithArchiveURL:v4 symmetricKey:v5 outputDirectoryURL:v6 fileProtection:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke;
  v14[3] = &unk_1E62C5D88;
  v14[4] = v2;
  [(NTKAppleEncryptedArchiveHandle *)v8 setArchiveEntryEvent:v14];
  if (v2) {
    extractionQueue = v2->_extractionQueue;
  }
  else {
    extractionQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke_2;
  block[3] = &unk_1E62C09C0;
  id v12 = v8;
  id v13 = v2;
  v10 = v8;
  dispatch_async(extractionQueue, block);
}

- (uint64_t)setState:(uint64_t)result
{
  if (result) {
    *(void *)(result + 72) = a2;
  }
  return result;
}

uint64_t __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a2 == 22)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  else if (a2 == 26)
  {
    *(unsigned char *)a4 |= 8u;
    v8 = [*(id *)(a1 + 32) fileProtection];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F28340]];

    if (v9)
    {
      uint64_t v10 = 0;
      int v11 = 1;
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) fileProtection];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F28348]];

      if (v13)
      {
        uint64_t v10 = 0;
        int v11 = 2;
      }
      else
      {
        AAFieldKey v14 = [*(id *)(a1 + 32) fileProtection];
        int v15 = [v14 isEqualToString:*MEMORY[0x1E4F28358]];

        if (v15)
        {
          uint64_t v10 = 0;
          int v11 = 3;
        }
        else
        {
          uint64_t v16 = [*(id *)(a1 + 32) fileProtection];
          int v17 = [v16 isEqualToString:*MEMORY[0x1E4F28378]];

          uint64_t v10 = 0;
          if (v17) {
            int v11 = 4;
          }
          else {
            int v11 = -1;
          }
        }
      }
    }
    *(_DWORD *)(a4 + 4) = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v26 = 0;
  v3 = (AAArchiveStream_impl *)[v2 openReturningError:&v26];
  id v4 = v26;
  v5 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v6 = v5;
    objc_sync_enter(v6);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      *(void *)(v7 + 48) = v3;
    }
    objc_sync_exit(v6);

    v8 = (AAArchiveStream_impl *)[*(id *)(a1 + 32) archiveStream];
    int v9 = [*(id *)(a1 + 32) archiveEntryEvent];
    ssize_t v10 = AAArchiveStreamProcess(v8, v3, v9, (AAEntryMessageProc)invokeBlockForArchiveEvent_0, 0xC010000000000001, 0);

    id v11 = *(id *)(a1 + 40);
    objc_sync_enter(v11);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      *(void *)(v12 + 72) = 2;
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        *(void *)(v13 + 48) = 0;
      }
    }
    objc_sync_exit(v11);

    BOOL v14 = v10 >= 0;
    if (v10 < 0)
    {
      int v15 = -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:](*(void **)(a1 + 40), 4);
    }
    else
    {
      int v15 = 0;
    }
    int v17 = *(void **)(a1 + 32);
    id v25 = 0;
    char v18 = [v17 closeReturningError:&v25];
    id v19 = v25;
    uint64_t v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (v15) {
        BOOL v21 = v15;
      }
      else {
        BOOL v21 = v19;
      }
      id v22 = v21;

      BOOL v14 = 0;
      int v15 = v22;
    }
    uint64_t v23 = *(void *)(a1 + 40);
    if (v23) {
      uint64_t v24 = *(void *)(v23 + 40);
    }
    else {
      uint64_t v24 = 0;
    }
    (*(void (**)(uint64_t, BOOL, void *))(v24 + 16))(v24, v14, v15);
  }
  else
  {
    if (v5) {
      uint64_t v16 = v5[5];
    }
    else {
      uint64_t v16 = 0;
    }
    (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v4);
  }
}

- (uint64_t)setOutputStream:(uint64_t)result
{
  if (result) {
    *(void *)(result + 48) = a2;
  }
  return result;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_state == 2)
    {
      objc_sync_exit(obj);

      return;
    }
    obj->_state = 2;
    objc_sync_exit(obj);

    outputStream = obj->_outputStream;
  }
  else
  {
    objc_sync_exit(0);
    outputStream = 0;
  }
  AAArchiveStreamCancel(outputStream);
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (NSString)fileProtection
{
  return self->_fileProtection;
}

- (void)setCompletion:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
  }
}

- (void)setExtractionQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end