@interface MFRFC822AttachmentDataProvider
- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4;
- (id)fetchLocalDataForAttachment:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MFRFC822AttachmentDataProvider

- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MFRFC822AttachmentDataProvider *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageData, a3);
    objc_storeStrong((id *)&v10->_parentPart, a4);
    uint64_t v11 = +[MFMessage messageWithRFC822Data:v10->_messageData withParentPart:v10->_parentPart generateMessageIDHash:1];
    message = v10->_message;
    v10->_message = (MFMailMessage *)v11;
  }
  return v10;
}

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v4 = a3;
  v5 = [(MFMailMessage *)self->_message messageStore];
  v6 = [v4 part];
  id v7 = [v6 mimeBody];

  if (!v7)
  {
    id v8 = [v4 part];
    v9 = [v5 bodyForMessage:self->_message fetchIfNotAvailable:0 updateFlags:0];
    [v8 setMimeBody:v9];
  }
  v10 = [v4 readFromDisk];
  if (!v10)
  {
    uint64_t v11 = [v4 part];
    v12 = [v4 part];
    [v12 range];
    v10 = objc_msgSend(v5, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v11, 0, v13, 0, 0, 0);
  }
  return v10;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E6866FE8;
  id v13 = v12;
  id v39 = v13;
  v14 = (void (**)(id, uint64_t, void *, void))a6;
  v15 = _Block_copy(aBlock);
  v37 = [(MFMailMessage *)self->_message messageStore];
  v16 = [v10 part];
  v17 = [v16 mimeBody];

  if (!v17)
  {
    v18 = [v10 part];
    v19 = [v37 bodyForMessage:self->_message fetchIfNotAvailable:0 updateFlags:0];
    [v18 setMimeBody:v19];
  }
  v20 = [v10 readFromDisk];
  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F73560]);
    v43[0] = v11;
    uint64_t v22 = 1;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    v24 = objc_msgSend(v21, "initWithConsumers:expectedSize:", v23, objc_msgSend(v10, "encodedFileSize"));

    [v24 setProgressBlock:v15];
    [v24 appendData:v20];
    v25 = 0;
  }
  else
  {
    id v36 = v13;
    v26 = [v10 decodeFilterWithDataConsumer:v11];
    id v27 = objc_alloc(MEMORY[0x1E4F73560]);
    v42 = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    v24 = objc_msgSend(v27, "initWithConsumers:expectedSize:", v28, objc_msgSend(v10, "encodedFileSize"));

    [v24 setProgressBlock:v15];
    v29 = [v10 part];
    v30 = [v10 part];
    [v30 range];
    char v32 = objc_msgSend(v37, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v29, 0, v31, v24, 1);

    if (v32)
    {
      v25 = 0;
      uint64_t v22 = 1;
      id v13 = v36;
    }
    else
    {
      v33 = +[MFActivityMonitor currentMonitor];
      v34 = [v33 error];

      if (v34)
      {
        uint64_t v40 = *MEMORY[0x1E4F28A50];
        v41 = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      }
      else
      {
        v35 = 0;
      }
      id v13 = v36;
      v25 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not retrieve RFC822 data for attachment." title:@"No Data Found" userInfo:v35];

      uint64_t v22 = 0;
    }
  }
  [v24 done];
  [v11 done];
  v14[2](v14, v22, v25, 0);
}

uint64_t __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  id v5 = a3;
  v6 = [a4 attachmentStorageLocation];
  if (v6)
  {
    id v7 = [v5 part];
    id v8 = [v7 partNumber];
    v9 = [v6 stringByAppendingPathComponent:v8];

    id v10 = [v5 fileName];
    v6 = [v9 stringByAppendingPathComponent:v10];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_parentPart, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end