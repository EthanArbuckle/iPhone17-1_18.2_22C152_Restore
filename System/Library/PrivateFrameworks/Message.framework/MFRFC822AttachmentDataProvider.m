@interface MFRFC822AttachmentDataProvider
- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3;
- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3 managed:(BOOL)a4;
- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4;
- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4 managed:(BOOL)a5;
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
    uint64_t v11 = +[MFMessage messageWithRFC822Data:v10->_messageData withParentPart:v8 generateMessageIDHash:1];
    message = v10->_message;
    v10->_message = (MFMailMessage *)v11;
  }
  return v10;
}

- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4 managed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MFRFC822AttachmentDataProvider *)self initWithMessageData:v8 parentPart:v9];
  uint64_t v11 = v10;
  if (v10) {
    [(MFMailMessage *)v10->_message setSourceIsManaged:v5];
  }

  return v11;
}

- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3
{
  id v5 = a3;
  v6 = [(MFRFC822AttachmentDataProvider *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3 managed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MFRFC822AttachmentDataProvider *)self initWithMessage:v6];
  id v8 = v7;
  if (v7) {
    [(MFMailMessage *)v7->_message setSourceIsManaged:v4];
  }

  return v8;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void *, void))a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E5D3DD30;
  id v32 = v12;
  id v35 = v32;
  v33 = _Block_copy(aBlock);
  v14 = [(MFMailMessage *)self->_message messageStore];
  v15 = [v10 part];
  v16 = [v15 mimeBody];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    v18 = [v10 part];
    v19 = [v14 bodyForMessage:self->_message fetchIfNotAvailable:0 updateFlags:0];
    [v18 setMimeBody:v19];
  }
  v20 = [v10 decodeFilterWithDataConsumer:v11];
  id v21 = objc_alloc(MEMORY[0x1E4F73560]);
  v38[0] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v23 = objc_msgSend(v21, "initWithConsumers:expectedSize:", v22, objc_msgSend(v10, "encodedFileSize"));

  [v23 setProgressBlock:v33];
  v24 = [v10 part];
  v25 = [v10 part];
  [v25 range];
  uint64_t v27 = objc_msgSend(v14, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v24, 0, v26, v23, 1);

  if (v27)
  {
    v28 = 0;
  }
  else
  {
    v29 = +[MFActivityMonitor currentMonitor];
    v30 = [v29 error];

    if (v30)
    {
      uint64_t v36 = *MEMORY[0x1E4F28A50];
      v37 = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    }
    else
    {
      v31 = 0;
    }
    v28 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not retrieve RFC822 data for attachment." title:@"No Data Found" userInfo:v31];
  }
  [v23 done];
  [v11 done];
  v13[2](v13, v27, v28, 0);
}

uint64_t __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  id v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

- (id)messageForAttachment:(id)a3
{
  return self->_message;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end