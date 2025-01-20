@interface MFAttachmentLibraryDataProvider
- (MFAttachmentLibraryDataProvider)initWithLibrary:(id)a3;
- (MFMessageLibrary)messageLibrary;
- (id)fetchLocalDataForAttachment:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)setMessageLibrary:(id)a3;
@end

@implementation MFAttachmentLibraryDataProvider

- (MFAttachmentLibraryDataProvider)initWithLibrary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentLibraryDataProvider;
  v5 = [(MFAttachmentLibraryDataProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MFAttachmentLibraryDataProvider *)v5 setMessageLibrary:v4];
  }

  return v6;
}

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 readFromDisk];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 url];
    objc_super v8 = [(MFAttachmentLibraryDataProvider *)self messageForAttachment:v4];
    v9 = [v8 messageStore];
    v10 = objc_msgSend(v7, "mf_lastPartNumber");
    v11 = [v8 messageBody];
    v12 = [v11 partWithNumber:v10];

    uint64_t v13 = [v12 range];
    v15 = objc_msgSend(v9, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v12, v13, v14, 0, 0, 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__MFAttachmentLibraryDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E6866FE8;
  id v31 = v12;
  id v36 = v31;
  uint64_t v13 = (void (**)(id, uint64_t, void *, uint64_t))a6;
  v34 = _Block_copy(aBlock);
  uint64_t v14 = [v10 url];
  v15 = [(MFAttachmentLibraryDataProvider *)self messageForAttachment:v10];
  v33 = [v15 messageStore];
  v16 = objc_msgSend(v14, "mf_lastPartNumber");
  v32 = v11;
  if (v16)
  {
    v17 = [v10 readFromDisk];
    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F73560]);
      v38[0] = v11;
      uint64_t v19 = 1;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      v21 = objc_msgSend(v18, "initWithConsumers:expectedSize:", v20, objc_msgSend(v10, "encodedFileSize"));

      [v21 setProgressBlock:v34];
      [v21 appendData:v17];
      uint64_t v22 = 0;
      v23 = 0;
    }
    else
    {
      v30 = [v10 decodeFilterWithDataConsumer:v11];
      id v24 = objc_alloc(MEMORY[0x1E4F73560]);
      v37 = v30;
      uint64_t v22 = 1;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      v21 = objc_msgSend(v24, "initWithConsumers:expectedSize:", v25, objc_msgSend(v10, "encodedFileSize"));

      [v21 setProgressBlock:v34];
      uint64_t v26 = [v15 messageBody];
      v27 = [(id)v26 partWithNumber:v16];

      uint64_t v28 = [v27 range];
      LOBYTE(v26) = objc_msgSend(v33, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v27, v28, v29, v21, 1);

      if (v26)
      {
        v23 = 0;
        uint64_t v19 = 1;
      }
      else
      {
        v23 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not retrieve library data for attachment." title:@"No Data Found" userInfo:0];
        uint64_t v19 = 0;
        uint64_t v22 = 0;
      }
    }
  }
  else
  {
    v23 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Invalid attachment URL." title:@"Invalid Attachment URL" userInfo:0];
    v21 = 0;
    uint64_t v22 = 0;
    uint64_t v19 = 0;
  }
  [v21 done];
  [v32 done];
  v13[2](v13, v19, v23, v22);
}

uint64_t __87__MFAttachmentLibraryDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

- (id)messageForAttachment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 part];
  v6 = [v5 mimeBody];
  v7 = [v6 message];

  if (!v7)
  {
    objc_super v8 = [v4 url];
    uint64_t v9 = objc_msgSend(v8, "mf_rowID");

    if (v9 == -1)
    {
      v7 = 0;
    }
    else
    {
      id v10 = [(MFAttachmentLibraryDataProvider *)self messageLibrary];
      v7 = [v10 messageWithLibraryID:v9 options:4111 inMailbox:0];

      id v11 = [v7 mailbox];
      id v12 = [v11 account];
      uint64_t v13 = [v12 storeForMailboxUid:v11];
      if (v13)
      {
        [v7 setMessageStore:v13];
      }
      else
      {
        uint64_t v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = objc_msgSend(v7, "ef_publicDescription");
          int v17 = 138543362;
          id v18 = v15;
          _os_log_impl(&dword_1CFCFE000, v14, OS_LOG_TYPE_INFO, "#Attachments failed to find a store for message %{public}@, things may behave unexpectedly", (uint8_t *)&v17, 0xCu);
        }
      }
    }
  }

  return v7;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  v6 = [a4 attachmentStorageLocation];
  if (v6)
  {
    v7 = [v5 part];
    objc_super v8 = [v7 partNumber];
    uint64_t v9 = [v6 stringByAppendingPathComponent:v8];

    id v10 = [v5 fileName];
    v6 = [v9 stringByAppendingPathComponent:v10];
  }
  return v6;
}

- (MFMessageLibrary)messageLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLibrary);
  return (MFMessageLibrary *)WeakRetained;
}

- (void)setMessageLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end