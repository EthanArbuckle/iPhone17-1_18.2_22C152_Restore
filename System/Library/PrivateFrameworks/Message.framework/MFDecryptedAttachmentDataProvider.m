@interface MFDecryptedAttachmentDataProvider
- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MFDecryptedAttachmentDataProvider

- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3
{
  id v5 = a3;
  v6 = [(MFDecryptedAttachmentDataProvider *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void *, uint64_t))a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E5D3DD30;
  id v14 = v12;
  id v33 = v14;
  v31 = _Block_copy(aBlock);
  v30 = [(MFMailMessage *)self->_message messageStore];
  v15 = [v10 part];
  v16 = [(MFMailMessage *)self->_message messageBody];
  [v15 setMimeBody:v16];

  v17 = [v10 readFromDisk];
  if (v17)
  {
    [v11 appendData:v17];
    uint64_t v18 = [v17 length];
    [v14 setCompletedUnitCount:v18];
    v19 = 0;
    [v14 setTotalUnitCount:v18];
    uint64_t v20 = 0;
    uint64_t v21 = 1;
    v22 = 0;
  }
  else
  {
    v23 = [v10 decodeFilterWithDataConsumer:v11];
    id v24 = objc_alloc(MEMORY[0x1E4F73560]);
    v36[0] = v23;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    v19 = objc_msgSend(v24, "initWithConsumers:expectedSize:", v25, objc_msgSend(v10, "encodedFileSize"));

    [v19 setProgressBlock:v31];
    [v15 range];
    LOBYTE(v25) = objc_msgSend(v30, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v15, 0, v26, v19, 1);

    if (v25)
    {
      v22 = 0;
      uint64_t v21 = 1;
      uint64_t v20 = 1;
    }
    else
    {
      v27 = +[MFActivityMonitor currentMonitor];
      v28 = [v27 error];

      if (v28)
      {
        uint64_t v34 = *MEMORY[0x1E4F28A50];
        v35 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      }
      else
      {
        v29 = 0;
      }
      v22 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not retrieve decrypted data for attachment." title:@"No Data Found" userInfo:v29];

      uint64_t v21 = 0;
      uint64_t v20 = 0;
    }
  }
  [v19 done];
  [v11 done];
  v13[2](v13, v21, v22, v20);
}

uint64_t __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

- (id)messageForAttachment:(id)a3
{
  return self->_message;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  v4 = [a4 storageLocationForAttachment:a3];
  return v4;
}

- (void).cxx_destruct
{
}

@end