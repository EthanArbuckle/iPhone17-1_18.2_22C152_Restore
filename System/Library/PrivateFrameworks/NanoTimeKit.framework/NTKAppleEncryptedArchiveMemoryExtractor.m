@interface NTKAppleEncryptedArchiveMemoryExtractor
- (NSData)symmetricKey;
- (NSString)targetArchivedPath;
- (NSURL)archiveURL;
- (NTKAppleEncryptedArchiveMemoryExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 extractingFileAtArchivedPath:(id)a5 completion:(id)a6;
- (uint64_t)completion;
- (uint64_t)completionQueue;
- (uint64_t)extractionQueue;
- (uint64_t)outputData;
- (uint64_t)outputError;
- (uint64_t)outputStream;
- (uint64_t)setOutputStream:(uint64_t)result;
- (uint64_t)setState:(uint64_t)result;
- (uint64_t)state;
- (void)cancel;
- (void)resume;
- (void)setCompletion:(void *)a1;
- (void)setCompletionQueue:(uint64_t)a1;
- (void)setExtractionQueue:(uint64_t)a1;
- (void)setOutputData:(uint64_t)a1;
- (void)setOutputError:(uint64_t)a1;
@end

@implementation NTKAppleEncryptedArchiveMemoryExtractor

- (NTKAppleEncryptedArchiveMemoryExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 extractingFileAtArchivedPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NTKAppleEncryptedArchiveMemoryExtractor;
  v14 = [(NTKAppleEncryptedArchiveMemoryExtractor *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    archiveURL = v14->_archiveURL;
    v14->_archiveURL = (NSURL *)v15;

    uint64_t v17 = [v11 copy];
    symmetricKey = v14->_symmetricKey;
    v14->_symmetricKey = (NSData *)v17;

    uint64_t v19 = [v12 copy];
    targetArchivedPath = v14->_targetArchivedPath;
    v14->_targetArchivedPath = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    id completion = v14->_completion;
    v14->_id completion = (id)v21;

    v14->_outputStream = 0;
    objc_storeStrong((id *)&v14->_completionQueue, MEMORY[0x1E4F14428]);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.nanotimekit.facesupport.aeamemoryextractor.extractionQueue", 0);
    extractionQueue = v14->_extractionQueue;
    v14->_extractionQueue = (OS_dispatch_queue *)v23;

    v14->_state = 0;
  }

  return v14;
}

- (void)resume
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    v2->_state = 1;
    objc_sync_exit(v2);

    extractionQueue = v2->_extractionQueue;
  }
  else
  {
    objc_sync_exit(0);
    extractionQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = v2;
  dispatch_async(extractionQueue, block);
}

- (uint64_t)setState:(uint64_t)result
{
  if (result) {
    *(void *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)extractionQueue
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke(uint64_t a1)
{
  v92[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_2;
  aBlock[3] = &unk_1E62C0518;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v77 = v3;
  uint64_t v78 = v4;
  v5 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  v6 = [*(id *)(a1 + 32) archiveURL];
  v7 = [v6 absoluteURL];
  v8 = [v7 path];

  id v9 = v8;
  AAByteStream v10 = AAFileStreamOpenWithPath((const char *)[v9 fileSystemRepresentation], 16777472, 0);
  id v11 = v10;
  if (v10)
  {
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_4;
    v75[3] = &__block_descriptor_40_e5_v8__0l;
    v75[4] = v10;
    id v12 = _Block_copy(v75);
    [v3 addObject:v12];

    AEAContext v13 = AEAContextCreateWithEncryptedStream(v11);
    v14 = v13;
    if (v13)
    {
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_5;
      v74[3] = &__block_descriptor_40_e5_v8__0l;
      v74[4] = v13;
      uint64_t v15 = _Block_copy(v74);
      [v3 addObject:v15];

      id v16 = [*(id *)(a1 + 32) symmetricKey];
      uint64_t v17 = (const uint8_t *)[v16 bytes];
      v18 = [*(id *)(a1 + 32) symmetricKey];
      AEAContextSetFieldBlob(v14, 9u, 0, v17, [v18 length]);

      AAByteStream v19 = AEADecryptionInputStreamOpen(v11, v14, 0xC000000000000001, 0);
      v20 = v19;
      if (v19)
      {
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_6;
        v73[3] = &__block_descriptor_40_e5_v8__0l;
        v73[4] = v19;
        uint64_t v21 = _Block_copy(v73);
        [v3 addObject:v21];

        AAArchiveStream v22 = AADecodeArchiveInputStreamOpen(v20, 0, (AAEntryMessageProc)archiveEvent, 0xC000000000000001, 0);
        dispatch_queue_t v23 = v22;
        if (v22)
        {
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_7;
          v72[3] = &__block_descriptor_40_e5_v8__0l;
          v72[4] = v22;
          v24 = _Block_copy(v72);
          [v3 addObject:v24];

          AAArchiveStream v25 = AACustomArchiveStreamOpen();
          objc_super v26 = v25;
          if (v25)
          {
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_8;
            v71[3] = &__block_descriptor_40_e5_v8__0l;
            v71[4] = v25;
            v27 = _Block_copy(v71);
            [v3 addObject:v27];

            AACustomArchiveStreamSetData(v26, *(id *)(a1 + 32));
            AACustomArchiveStreamSetWriteHeaderProc(v26, (AAArchiveStreamWriteHeaderProc)_NTKAppleEncryptedArchiveMemoryExtractorWriteHeader);
            AACustomArchiveStreamSetWriteBlobProc(v26, (AAArchiveStreamWriteBlobProc)_NTKAppleEncryptedArchiveMemoryExtractorWriteBlob);
            AACustomArchiveStreamSetCancelProc(v26, (AAArchiveStreamCancelProc)_NTKAppleEncryptedArchiveMemoryExtractorCancel);
            AACustomArchiveStreamSetCloseProc(v26, (AAArchiveStreamCloseProc)_NTKAppleEncryptedArchiveMemoryExtractorClose);
            id v28 = *(id *)(a1 + 32);
            objc_sync_enter(v28);
            uint64_t v29 = *(void *)(a1 + 32);
            if (v29) {
              *(void *)(v29 + 40) = v26;
            }
            objc_sync_exit(v28);

            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_9;
            v70[3] = &unk_1E62BFF20;
            v70[4] = *(void *)(a1 + 32);
            v30 = _Block_copy(v70);
            [v3 addObject:v30];

            ssize_t v31 = AAArchiveStreamProcess(v23, v26, 0, (AAEntryMessageProc)archiveEvent, 0, 0);
            id v32 = *(id *)(a1 + 32);
            objc_sync_enter(v32);
            if (*(void *)(a1 + 32)
              && (*(void *)(*(void *)(a1 + 32) + 64) = 4, (uint64_t v33 = *(void *)(a1 + 32)) != 0)
              && (id v34 = *(id *)(v33 + 72)) != 0)
            {
              v35 = v34;
              v36 = (void *)MEMORY[0x1E4F1C9B8];
              v37 = *(void **)(a1 + 32);
              if (v37) {
                v37 = (void *)v37[9];
              }
              v38 = v37;
              v39 = [v36 dataWithData:v38];
            }
            else
            {
              v39 = 0;
            }
            v60 = *(void **)(a1 + 32);
            if (v60) {
              v60 = (void *)v60[10];
            }
            v61 = v60;
            objc_sync_exit(v32);

            if (v31 < 0)
            {
              v62 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v81 = *MEMORY[0x1E4F289D0];
              v63 = [*(id *)(a1 + 32) archiveURL];
              v82 = v63;
              v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
              v65 = [v62 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:4 userInfo:v64];
              v5[2](v5, 0, v65);
            }
            else if (v39)
            {
              ((void (**)(void *, void *, void *))v5)[2](v5, v39, 0);
            }
            else if (v61)
            {
              v5[2](v5, 0, v61);
            }
            else
            {
              v66 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v79 = *MEMORY[0x1E4F289D0];
              v67 = [*(id *)(a1 + 32) archiveURL];
              v80 = v67;
              v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
              v69 = [v66 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:5 userInfo:v68];
              v5[2](v5, 0, v69);
            }
          }
          else
          {
            v56 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v83 = *MEMORY[0x1E4F289D0];
            v57 = [*(id *)(a1 + 32) archiveURL];
            v84 = v57;
            v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
            v59 = [v56 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:4 userInfo:v58];
            v5[2](v5, 0, v59);
          }
        }
        else
        {
          v52 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v85 = *MEMORY[0x1E4F289D0];
          v53 = [*(id *)(a1 + 32) archiveURL];
          v86 = v53;
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v55 = [v52 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:2 userInfo:v54];
          v5[2](v5, 0, v55);
        }
      }
      else
      {
        v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v87 = *MEMORY[0x1E4F289D0];
        v49 = [*(id *)(a1 + 32) archiveURL];
        v88 = v49;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        v51 = [v48 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:2 userInfo:v50];
        v5[2](v5, 0, v51);
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v89 = *MEMORY[0x1E4F289D0];
      v45 = [*(id *)(a1 + 32) archiveURL];
      v90 = v45;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      v47 = [v44 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:2 userInfo:v46];
      v5[2](v5, 0, v47);
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v91 = *MEMORY[0x1E4F289D0];
    v41 = [*(id *)(a1 + 32) archiveURL];
    v92[0] = v41;
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
    v43 = [v40 errorWithDomain:@"NTKAppleEncryptedArchiveMemoryExtractor" code:1 userInfo:v42];
    v5[2](v5, 0, v43);
  }
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = [*(id *)(a1 + 32) reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    AEAContext v13 = *(NSObject **)(v12 + 48);
  }
  else {
    AEAContext v13 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_3;
  block[3] = &unk_1E62C04F0;
  block[4] = *(void *)(a1 + 40);
  id v17 = v5;
  id v18 = v6;
  id v14 = v6;
  id v15 = v5;
  dispatch_async(v13, block);
}

- (uint64_t)completionQueue
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_3(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, void, void))(v1 + 16))(v1, a1[5], a1[6]);
}

- (uint64_t)completion
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_4(uint64_t a1)
{
  return AAByteStreamClose(*(AAByteStream *)(a1 + 32));
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_5(uint64_t a1)
{
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_6(uint64_t a1)
{
  return AAByteStreamClose(*(AAByteStream *)(a1 + 32));
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_7(uint64_t a1)
{
  return AAArchiveStreamClose(*(AAArchiveStream *)(a1 + 32));
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_8(uint64_t a1)
{
  return AAArchiveStreamClose(*(AAArchiveStream *)(a1 + 32));
}

- (uint64_t)setOutputStream:(uint64_t)result
{
  if (result) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_9(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(void *)(v2 + 40) = 0;
  }
  objc_sync_exit(obj);
}

- (uint64_t)outputData
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)outputError
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (void)cancel
{
  id obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_state == 4)
    {
      objc_sync_exit(obj);

      return;
    }
    obj->_state = 4;
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

- (uint64_t)state
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)outputStream
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSString)targetArchivedPath
{
  return self->_targetArchivedPath;
}

- (void)setCompletion:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
  }
}

- (void)setCompletionQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setExtractionQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setOutputData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setOutputError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputError, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_extractionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_targetArchivedPath, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end