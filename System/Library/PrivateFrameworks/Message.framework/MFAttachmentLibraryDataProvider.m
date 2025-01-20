@interface MFAttachmentLibraryDataProvider
- (EDAttachmentPersistenceManager)persistenceManager;
- (MFAttachmentLibraryDataProvider)initWithLibrary:(id)a3;
- (MFMailMessageLibrary)messageLibrary;
- (_MFAttachmentDataFetchResult)_fetchDataForAttachment:(SEL)a3 consumer:(id)a4 progress:(id)a5;
- (id)messageForAttachment:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)setMessageLibrary:(id)a3;
- (void)setPersistenceManager:(id)a3;
@end

@implementation MFAttachmentLibraryDataProvider

- (id)messageForAttachment:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 part];
  v6 = [v5 mimeBody];
  v7 = [v6 message];

  if (!v7)
  {
    v8 = [v4 url];
    uint64_t v9 = objc_msgSend(v8, "mf_rowID");

    if (v9 == *MEMORY[0x1E4F5FCC8])
    {
      v10 = EDAttachmentsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v4 url];
        [(MFAttachmentLibraryDataProvider *)v11 messageForAttachment:v10];
      }
      v7 = 0;
    }
    else
    {
      v12 = [(MFAttachmentLibraryDataProvider *)self messageLibrary];
      v7 = [v12 messageWithLibraryID:v9 options:4227087 inMailbox:0];

      v10 = [v7 mailbox];
      v13 = [v10 account];
      v14 = [v13 storeForMailboxUid:v10];
      if (v14)
      {
        [v7 setMessageStore:v14];
      }
      else
      {
        v15 = MFLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = objc_msgSend(v7, "ef_publicDescription");
          int v18 = 138543362;
          v19 = v16;
          _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "#Attachments failed to find a store for message %{public}@, things may behave unexpectedly", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }

  return v7;
}

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

- (EDAttachmentPersistenceManager)persistenceManager
{
  persistenceManager = self->_persistenceManager;
  if (!persistenceManager)
  {
    id v4 = [(MFAttachmentLibraryDataProvider *)self messageLibrary];
    v5 = [v4 persistence];
    v6 = [v5 attachmentPersistenceManager];
    v7 = self->_persistenceManager;
    self->_persistenceManager = v6;

    persistenceManager = self->_persistenceManager;
  }
  return persistenceManager;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  memset(v12, 170, sizeof(v12));
  [(MFAttachmentLibraryDataProvider *)self _fetchDataForAttachment:v10 consumer:a4 progress:a5];
  [v10 updatePathIfNeeded];
  (*((void (**)(id, void, id, void))v11 + 2))(v11, LOBYTE(v12[0]), v12[1], LOBYTE(v12[2]));
}

- (_MFAttachmentDataFetchResult)_fetchDataForAttachment:(SEL)a3 consumer:(id)a4 progress:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v54 = a6;
  v12 = EDAttachmentsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v10, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    uint64_t v62 = (uint64_t)v13;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "In _fetchDataForAttachment for attachment %{public}@", buf, 0xCu);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__MFAttachmentLibraryDataProvider__fetchDataForAttachment_consumer_progress___block_invoke;
  aBlock[3] = &unk_1E5D3DD30;
  id v14 = v54;
  id v57 = v14;
  v55 = _Block_copy(aBlock);
  v15 = [v10 url];
  v16 = objc_msgSend(v15, "mf_lastPartNumber");
  if (v16)
  {
    v17 = [v10 readFromDisk];
    if (v17)
    {
      [v11 appendData:v17];
      [v11 done];
      int v18 = EDAttachmentsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v17 length];
        uint64_t v20 = objc_msgSend(v10, "ef_publicDescription");
        *(_DWORD *)buf = 134218242;
        uint64_t v62 = v19;
        __int16 v63 = 2114;
        v64 = v20;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Got data (%{iec-bytes}llu) for attachment %{public}@.", buf, 0x16u);
      }
      *(void *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(void *)&retstr->var2 = 0;
      retstr->var0 = 1;
    }
    else
    {
      v52 = [(MFAttachmentLibraryDataProvider *)self messageForAttachment:v10];
      v53 = [v52 messageStore];
      [v53 downloadMimePartNumber:v16 message:v52 withProgressBlock:v55];
      [v10 updatePathIfNeeded];
      v17 = [v10 readFromDisk];
      if (v17)
      {
        v24 = EDAttachmentsLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v17 length];
          v26 = objc_msgSend(v10, "ef_publicDescription");
          *(_DWORD *)buf = 134218242;
          uint64_t v62 = v25;
          __int16 v63 = 2114;
          v64 = v26;
          _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Got data (%{iec-bytes}llu) for attachment %{public}@.", buf, 0x16u);
        }
        [v11 appendData:v17];
        [v11 done];
        if (objc_opt_respondsToSelector())
        {
          v27 = [v11 data];
          BOOL v28 = v27 == 0;

          if (v28)
          {
            v29 = EDAttachmentsLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = objc_msgSend(v10, "ef_publicDescription");
              -[MFAttachmentLibraryDataProvider _fetchDataForAttachment:consumer:progress:](v30, (uint64_t)buf, v29);
            }
          }
        }
        *(void *)&retstr->var0 = 0;
        retstr->var1 = 0;
        *(void *)&retstr->var2 = 0;
        retstr->var0 = 1;
      }
      else
      {
        v31 = EDAttachmentsLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = objc_msgSend(v10, "ef_publicDescription");
          -[MFAttachmentLibraryDataProvider _fetchDataForAttachment:consumer:progress:](v32, (uint64_t)buf, v31);
        }

        v33 = [v10 decodeFilterWithDataConsumer:v11];
        id v34 = objc_alloc(MEMORY[0x1E4F73560]);
        v60 = v33;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        v51 = objc_msgSend(v34, "initWithConsumers:expectedSize:", v35, objc_msgSend(v10, "encodedFileSize"));

        [v51 setProgressBlock:v55];
        v36 = [v52 messageBody];
        v50 = [v36 partWithNumber:v16];

        uint64_t v37 = [v50 range];
        int v39 = objc_msgSend(v53, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v50, v37, v38, v51, 1);
        [v10 updatePathIfNeeded];
        if (v39)
        {
          v40 = EDAttachmentsLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v33;
            uint64_t v41 = objc_msgSend(v10, "ef_publicDescription");
            *(_DWORD *)v58 = 138543362;
            uint64_t v59 = v41;
            v42 = (void *)v41;
            _os_log_impl(&dword_1A7EFF000, v40, OS_LOG_TYPE_DEFAULT, "Got data for attachment %{public}@.", v58, 0xCu);

            v33 = v48;
          }

          v43 = 0;
        }
        else
        {
          v44 = EDAttachmentsLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v49 = v33;
            uint64_t v45 = objc_msgSend(v10, "ef_publicDescription");
            *(_DWORD *)v58 = 138543362;
            uint64_t v59 = v45;
            v46 = (void *)v45;
            _os_log_impl(&dword_1A7EFF000, v44, OS_LOG_TYPE_DEFAULT, "Failed to get data for attachment %{public}@.", v58, 0xCu);

            v33 = v49;
          }

          v43 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not retrieve library data for attachment." title:@"No Data Found" userInfo:0];
        }
        [v51 done];
        [v11 done];
        retstr->var0 = v39;
        retstr->var1 = v43;
        retstr->var2 = v39;
      }
    }
  }
  else
  {
    v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Invalid attachment URL." title:@"Invalid Attachment URL" userInfo:0];
    v22 = EDAttachmentsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v10, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      uint64_t v62 = (uint64_t)v23;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "No part number for attachment %{public}@", buf, 0xCu);
    }
    retstr->var0 = 0;
    retstr->var1 = v21;
    retstr->var2 = 0;
  }

  return result;
}

uint64_t __77__MFAttachmentLibraryDataProvider__fetchDataForAttachment_consumer_progress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v4 = [a4 storageLocationForAttachment:a3];
  return v4;
}

- (MFMailMessageLibrary)messageLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLibrary);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setMessageLibrary:(id)a3
{
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_destroyWeak((id *)&self->_messageLibrary);
}

- (void)_fetchDataForAttachment:(void *)a1 consumer:(uint64_t)a2 progress:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "Failed to download attachment data for attachment %{public}@", (uint8_t *)a2);
}

- (void)_fetchDataForAttachment:(void *)a1 consumer:(uint64_t)a2 progress:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "Failed to find data for attachment %{public}@", (uint8_t *)a2);
}

- (void)messageForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "rowID is undefined for attachment url: %@.", (uint8_t *)a2);
}

@end