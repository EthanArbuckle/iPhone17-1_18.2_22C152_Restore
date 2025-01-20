@interface MFMailDropMailDelivery
+ (id)_mailDropZone;
- (BOOL)_uploadAttachmentsViaCloudKit:(id)a3 zone:(id)a4 records:(id)a5 zippedPhotos:(id)a6 attachmentRecords:(id)a7 images:(id)a8;
- (BOOL)updateMessageWithAttachmentsSynchronously;
- (EMMailDropMetadata)imageArchiveMetadata;
- (NSArray)attachments;
- (id)_attachmentManager;
- (id)ckDatabase;
- (id)deliverSynchronouslyWithCompletion:(id)a3;
- (id)publishRecord:(id)a3 database:(id)a4 attachmentRecords:(id)a5 images:(id)a6 allowsCellularAccess:(BOOL)a7;
- (id)scaledImages:(id)a3;
- (int64_t)_processAttachments;
- (int64_t)mailDropState;
- (void)_processAttachments;
- (void)_recordZoneIDInDatabase:(id)a3 completionHandler:(id)a4;
- (void)setAttachments:(id)a3;
- (void)setImageArchiveMetadata:(id)a3;
- (void)setMailDropState:(int64_t)a3;
@end

@implementation MFMailDropMailDelivery

- (id)scaledImages:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)updateMessageWithAttachmentsSynchronously
{
  return 0;
}

- (id)_attachmentManager
{
  v2 = +[MFAttachmentManager defaultManager];
  if (!v2)
  {
    id v3 = [MFAttachmentLibraryManager alloc];
    v4 = +[MFMailMessageLibrary defaultInstance];
    v2 = [(MFAttachmentLibraryManager *)v3 initWithPrimaryLibrary:v4];
  }
  return v2;
}

- (NSArray)attachments
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_attachments)
  {
    if (self->super._message)
    {
      id v3 = [(MFOutgoingMessageDelivery *)self message];
      v4 = [v3 messageBody];
      v5 = [v4 attachmentURLs];

      v6 = [(MFMailDropMailDelivery *)self _attachmentManager];
      v7 = [v6 attachmentsForURLs:v5 error:0];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v8 = v7;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "placeholder", (void)v24);

            if (v13)
            {
              v14 = [v12 placeholder];
              v15 = [v14 contentID];
              [v12 setContentID:v15];
            }
          }
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v9);
      }

      attachments = self->_attachments;
      self->_attachments = v8;
    }
    else
    {
      mixedContent = self->super._mixedContent;
      if (mixedContent || (mixedContent = self->super._otherHTMLAndAttachments) != 0)
      {
        v18 = mixedContent;
        v19 = [(NSArray *)v18 indexesOfObjectsPassingTest:&__block_literal_global_40];
        v20 = [(NSArray *)v18 objectsAtIndexes:v19];
        v21 = self->_attachments;
        self->_attachments = v20;
      }
    }
  }
  v22 = self->_attachments;
  return v22;
}

uint64_t __37__MFMailDropMailDelivery_attachments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = EMLogMailDrop();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Delivering Mail Drop message", buf, 2u);
  }

  int64_t v6 = [(MFMailDropMailDelivery *)self _processAttachments];
  v7 = EMLogMailDrop();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v16 = v6;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Finished processing attachments with state: %lu", buf, 0xCu);
  }

  if (v6 == 8)
  {
    uint64_t v10 = EMLogMailDrop();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "MailDrop message is undeliverable", buf, 2u);
    }

    uint64_t v9 = [[MFDeliveryResult alloc] initWithStatus:7];
    goto LABEL_13;
  }
  if (v6 == 6)
  {
    v8 = EMLogMailDrop();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Continuing with Mail Drop message delivery", buf, 2u);
    }

    v14.receiver = self;
    v14.super_class = (Class)MFMailDropMailDelivery;
    uint64_t v9 = [(MFOutgoingMessageDelivery *)&v14 deliverSynchronouslyWithCompletion:v4];
LABEL_13:
    v11 = v9;
    goto LABEL_17;
  }
  v12 = EMLogMailDrop();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "MailDrop message is incomplete", buf, 2u);
  }

  v11 = [[MFDeliveryResult alloc] initWithStatus:8];
  [(MFDeliveryResult *)v11 setAttributes:v6];
LABEL_17:

  return v11;
}

- (id)ckDatabase
{
  id v2 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.largeattachment"];
  [v2 setSourceApplicationBundleIdentifier:*MEMORY[0x1E4F77E48]];
  id v3 = [v2 privateCloudDatabase];

  return v3;
}

- (int64_t)_processAttachments
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = EMLogMailDrop();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Processing attachments", buf, 2u);
  }

  long long v25 = [(MFMailDropMailDelivery *)self ckDatabase];
  id v4 = [(MFMailDropMailDelivery *)self attachments];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  int64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F60E18] promise];
  if (v4 && EFProtectedDataAvailable())
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__MFMailDropMailDelivery__processAttachments__block_invoke;
    v27[3] = &unk_1E5D3F268;
    id v28 = v8;
    uint64_t v29 = self;
    id v30 = v5;
    id v31 = v6;
    id v32 = v7;
    id v33 = v25;
    [(MFMailDropMailDelivery *)self _recordZoneIDInDatabase:v33 completionHandler:v27];

    uint64_t v9 = v28;
  }
  else
  {
    uint64_t v10 = EMLogMailDrop();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(MFMailDropMailDelivery *)v10 _processAttachments];
    }

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MFMessageErrorDomain" code:1029 userInfo:0];
    [v8 finishWithError:v9];
  }

  v18 = [v8 future];
  id v26 = 0;
  v19 = [v18 result:&v26];
  id v20 = v26;
  int64_t v21 = [v19 integerValue];

  v22 = EMLogMailDrop();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v20, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    int64_t v35 = v21;
    __int16 v36 = 2114;
    v37 = v23;
    _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Mail Drop attachments finished processing with result: %lu, error:%{public}@", buf, 0x16u);
  }
  if (v20)
  {
    int64_t v21 = 0;
  }
  else if (v21 >= 4)
  {
    if ([(MFMailDropMailDelivery *)self updateMessageWithAttachmentsSynchronously])
    {
      int64_t v21 = 6;
    }
    else
    {
      int64_t v21 = 8;
    }
  }

  return v21;
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v52 = a3;
  v55 = v5;
  v56 = a1;
  if (v5)
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 2;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    int64_t v6 = [a1[5] attachments];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v73 objects:v90 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v74 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          if ([v10 isImageFile])
          {
            uint64_t v11 = EMLogMailDrop();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = [v10 fileName];
              *(_DWORD *)buf = 141558274;
              uint64_t v83 = 1752392040;
              __int16 v84 = 2112;
              v85 = v12;
              _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Adding attachment '%{mask.hash}@' as image.", buf, 0x16u);
            }
            [v56[8] addObject:v10];
          }
          else
          {
            uint64_t v13 = [v10 fetchDataToURL:0];
            if (v13)
            {
              uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"mailAttachment" zoneID:v55];
              uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:v13];
              [v14 setObject:v15 forKeyedSubscript:@"data"];
              uint64_t v16 = [v10 mimeType];
              [v14 setObject:v16 forKeyedSubscript:@"contentType"];

              uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "decodedFileSize"));
              [v14 setObject:v17 forKeyedSubscript:@"fileSize"];

              v18 = [MEMORY[0x1E4F1C9C8] date];
              [v14 setObject:v18 forKeyedSubscript:@"uploadDate"];

              [v56[6] addObject:v14];
              id v19 = v56[7];
              id v20 = [v14 recordID];
              [v19 setObject:v10 forKeyedSubscript:v20];

              int64_t v21 = EMLogMailDrop();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = [v14 recordID];
                v23 = [v10 fileName];
                *(_DWORD *)buf = 141558786;
                uint64_t v83 = 1752392040;
                __int16 v84 = 2112;
                v85 = v22;
                __int16 v86 = 2160;
                uint64_t v87 = 1752392040;
                __int16 v88 = 2112;
                v89 = v23;
                _os_log_error_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_ERROR, "Mail Drop added record '%{mask.hash}@' for attachment '%{mask.hash}@'.", buf, 0x2Au);
              }
            }
            else
            {
              uint64_t v14 = EMLogMailDrop();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                long long v24 = [v10 fileName];
                *(_DWORD *)buf = 141558274;
                uint64_t v83 = 1752392040;
                __int16 v84 = 2112;
                v85 = v24;
                _os_log_error_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_ERROR, "Mail Drop couldn't create file for attachment '%{mask.hash}@'. Ignoring attachment.", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v73 objects:v90 count:16];
      }
      while (v7);
    }

    long long v25 = v56;
    if ([v56[8] count])
    {
      v53 = +[MFAttachmentUtilities temporaryFileURLWithExtension:@"zip"];
      v54 = +[MFAttachmentDataProvider dataProviderWithURL:v53];
      id v26 = +[MFFileArchiveDirectory archiveDirectory];
      [v26 setUrl:v53];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v70 = 0u;
      long long v69 = 0u;
      id v27 = v56[8];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v69 objects:v81 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v70 != v29) {
              objc_enumerationMutation(v27);
            }
            id v31 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            id v32 = [v31 fetchDataSynchronously:0];
            id v33 = [MFFileArchiveEntry alloc];
            v34 = [v31 fileName];
            int64_t v35 = [(MFFileArchiveEntry *)v33 initWithContents:v32 path:v34];

            [v26 setArchiveEntry:v35];
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v69 objects:v81 count:16];
        }
        while (v28);
      }

      __int16 v36 = +[MFFileArchive archive];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __45__MFMailDropMailDelivery__processAttachments__block_invoke_49;
      v57[3] = &unk_1E5D3F240;
      v68 = &v77;
      id v37 = v54;
      id v58 = v37;
      id v38 = v26;
      id v39 = v56[5];
      id v59 = v38;
      id v60 = v39;
      id v61 = v56[9];
      id v62 = v55;
      id v63 = v56[6];
      id v40 = v53;
      id v64 = v40;
      id v65 = v56[7];
      id v66 = v56[8];
      id v67 = v56[4];
      [v36 compressContents:v38 completion:v57];
    }
    else
    {
      if ([v56[5] _uploadAttachmentsViaCloudKit:v56[9] zone:v55 records:v56[6] zippedPhotos:0 attachmentRecords:v56[7] images:0])
      {
        v78[3] = 4;
      }
      else
      {
        v43 = EMLogMailDrop();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(v43, v44, v45, v46, v47, v48, v49, v50);
        }

        long long v25 = v56;
      }
      id v51 = v25[4];
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      [v51 finishWithResult:v40];
    }

    _Block_object_dispose(&v77, 8);
    v42 = v52;
  }
  else
  {
    v41 = EMLogMailDrop();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v52, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_1();
    }

    v42 = v52;
    [a1[4] finishWithError:v52];
  }
}

BOOL __45__MFMailDropMailDelivery__processAttachments__block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  uint64_t v32 = a1;
  if (v31)
  {
    __int16 v36 = EMLogMailDrop();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v31, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __45__MFMailDropMailDelivery__processAttachments__block_invoke_49_cold_2();
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 3;
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) contents];
    [v3 save:v4];

    if ([*(id *)(v32 + 48) _uploadAttachmentsViaCloudKit:*(void *)(v32 + 56) zone:*(void *)(v32 + 64) records:*(void *)(v32 + 72) zippedPhotos:*(void *)(v32 + 80) attachmentRecords:*(void *)(v32 + 88) images:*(void *)(v32 + 96)])
    {
      *(void *)(*(void *)(*(void *)(v32 + 112) + 8) + 24) = 4;
      __int16 v36 = [*(id *)(v32 + 48) scaledImages:*(void *)(v32 + 96)];
      [MEMORY[0x1E4F1CA48] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      int64_t v35 = v43 = 0u;
      id v5 = [*(id *)(v32 + 48) attachments];
      obuint64_t j = v5;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v6)
      {
        uint64_t v34 = *(void *)v43;
        do
        {
          uint64_t v37 = v6;
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v43 != v34) {
              objc_enumerationMutation(obj);
            }
            id v8 = *(id *)(*((void *)&v42 + 1) + 8 * i);
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v9 = v36;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v39;
              while (2)
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v39 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                  uint64_t v14 = [v13 contentID];
                  uint64_t v15 = [v8 contentID];
                  int v16 = [v14 isEqualToString:v15];

                  if (v16)
                  {
                    id v17 = v13;

                    id v8 = v17;
                    goto LABEL_20;
                  }
                }
                uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
                if (v10) {
                  continue;
                }
                break;
              }
            }
LABEL_20:

            v18 = [v8 mailDropMetadata];
            objc_msgSend(v18, "setFlags:", objc_msgSend(v18, "flags") | 8);

            [v35 addObject:v8];
          }
          id v5 = obj;
          uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v6);
      }

      [*(id *)(v32 + 48) setAttachments:v35];
      *(void *)(*(void *)(*(void *)(v32 + 112) + 8) + 24) = 5;
    }
    else
    {
      id v19 = EMLogMailDrop();
      __int16 v36 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }

  id v27 = *(void **)(v32 + 104);
  uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(*(void *)(*(void *)(v32 + 112) + 8) + 24)];
  [v27 finishWithResult:v28];

  BOOL v29 = *(void *)(*(void *)(*(void *)(v32 + 112) + 8) + 24) > 3;
  return v29;
}

- (id)publishRecord:(id)a3 database:(id)a4 attachmentRecords:(id)a5 images:(id)a6 allowsCellularAccess:(BOOL)a7
{
  BOOL v7 = a7;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v33 = [MEMORY[0x1E4F60E18] promise];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v16 setAllowsCellularAccess:v7];
  id v17 = objc_alloc(MEMORY[0x1E4F1A290]);
  v18 = [v12 recordID];
  v42[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v20 = (void *)[v17 initWithRecordIDs:v19];

  [v20 setConfiguration:v16];
  uint64_t v21 = MFLogGeneral();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = objc_msgSend(v12, "recordID", v33);
    uint64_t v23 = [v14 objectForKeyedSubscript:v22];
    -[MFMailDropMailDelivery publishRecord:database:attachmentRecords:images:allowsCellularAccess:](v23, (uint64_t)v41, (uint64_t)v21, v22);
  }

  [v20 setRequestedTTL:2592000];
  uint64_t v24 = [v12 recordID];
  uint64_t v25 = [v14 objectForKeyedSubscript:v24];
  uint64_t v26 = [v25 fileName];

  if (![v26 length] && objc_msgSend(v15, "count"))
  {
    id v27 = (id)*MEMORY[0x1E4F5FD50];

    uint64_t v26 = v27;
  }
  long long v39 = @"data";
  long long v40 = v26;
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v33);
  [v20 setFileNamesByAssetFieldNames:v28];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke;
  v35[3] = &unk_1E5D3F290;
  id v29 = v34;
  id v36 = v29;
  id v30 = v14;
  id v37 = v30;
  long long v38 = self;
  [v20 setAssetPublishedBlock:v35];
  [v13 addOperation:v20];
  id v31 = [v29 future];

  return v31;
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_2();
    }

    [a1[4] finishWithError:v12];
    goto LABEL_21;
  }
  id v14 = [v11 downloadURL];
  id v15 = [MEMORY[0x1E4F602F0] mailDropMetadata];
  [MEMORY[0x1E4F602F8] parseURL:v14 intoMetadata:v15];
  id v16 = [v11 downloadURLExpiration];
  [v15 setExpiration:v16];

  id v17 = [a1[5] objectForKeyedSubscript:v9];
  if (v17)
  {
    v18 = [v15 fileName];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F5FD50]];

    if (v19)
    {
      uint64_t v20 = [v15 flags] | 2;
    }
    else if ([v17 isImageFile])
    {
      uint64_t v20 = [v15 flags] | 8;
    }
    else
    {
      uint64_t v20 = [v15 flags] | 4;
    }
    [v15 setFlags:v20];
    uint64_t v24 = [v17 mailDropMetadata];
    uint64_t v23 = v24;
    if (v24) {
      [v24 merge:v15];
    }
    else {
      [v17 setMailDropMetadata:v15];
    }
    goto LABEL_17;
  }
  uint64_t v21 = [v15 fileName];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F5FD50]];

  if (v22)
  {
    uint64_t v23 = [a1[6] imageArchiveMetadata];
    [v23 merge:v15];
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") | 8);
LABEL_18:
  uint64_t v25 = MFLogGeneral();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    [v11 downloadURL];
    objc_claimAutoreleasedReturnValue();
    __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_1();
  }

  [a1[4] finishWithResult:v11];
LABEL_21:
}

- (BOOL)_uploadAttachmentsViaCloudKit:(id)a3 zone:(id)a4 records:(id)a5 zippedPhotos:(id)a6 attachmentRecords:(id)a7 images:(id)a8
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v47 = a4;
  id v14 = a5;
  id v15 = a6;
  id v45 = a7;
  id v46 = a8;
  id v63 = 0;
  uint64_t v50 = v15;
  objc_msgSend(v15, "getResourceValue:forKey:error:", &v63, *MEMORY[0x1E4F1C5F8], 0, v14);
  id v48 = v63;
  unint64_t v16 = [v48 integerValue];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v60;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = [*(id *)(*((void *)&v59 + 1) + 8 * v20) objectForKeyedSubscript:@"filesize"];
        uint64_t v22 = [v21 integerValue];

        v16 += v22;
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v18);
  }

  if (v50)
  {
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"mailAttachment" zoneID:v47];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:v50];
    [v23 setObject:v24 forKeyedSubscript:@"data"];
    [v23 setObject:@"application/zip" forKeyedSubscript:@"contentType"];
    [v23 setObject:v48 forKeyedSubscript:@"fileSize"];
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
    [v23 setObject:v25 forKeyedSubscript:@"uploadDate"];

    [v17 addObject:v23];
    uint64_t v26 = [(MFMailDropMailDelivery *)self imageArchiveMetadata];
    LODWORD(v25) = v26 == 0;

    if (v25)
    {
      id v27 = [MEMORY[0x1E4F602F0] mailDropMetadata];
      [(MFMailDropMailDelivery *)self setImageArchiveMetadata:v27];

      uint64_t v28 = [(MFMailDropMailDelivery *)self imageArchiveMetadata];
      [v28 setFlags:2];
    }
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v29 setAllowsCellularAccess:v16 < 0x6400001];
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v17 recordIDsToDelete:0];
  [v30 setConfiguration:v29];
  [v30 setDatabase:v49];
  [v30 setQueuePriority:8];
  [v30 setQualityOfService:25];
  [v30 setPerRecordProgressBlock:&__block_literal_global_69];
  [v30 setPerRecordCompletionBlock:&__block_literal_global_73];
  id v31 = [MEMORY[0x1E4F60E18] promise];
  BOOL v32 = v16 < 0x6400001;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_74;
  v52[3] = &unk_1E5D3F370;
  id v33 = v31;
  id v53 = v33;
  v54 = self;
  id v34 = v49;
  id v55 = v34;
  id v35 = v45;
  id v56 = v35;
  id v36 = v46;
  id v57 = v36;
  BOOL v58 = v32;
  [v30 setModifyRecordsCompletionBlock:v52];
  id v37 = MFLogGeneral();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[MFMailDropMailDelivery _uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:]((uint64_t)v34, v37, v38);
  }

  [v34 addOperation:v30];
  long long v39 = [v33 future];
  id v51 = 0;
  long long v40 = [v39 result:&v51];
  id v41 = v51;

  if (!v40)
  {
    long long v42 = MFLogGeneral();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v41, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailDropMailDelivery _uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:]();
    }
  }
  char v43 = [v40 BOOLValue];

  return v43;
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke(double a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 values];
  uint64_t v6 = [v5 valueForKey:@"data"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v7 fileURL];
    id v10 = [v9 path];
    id v11 = [v10 lastPathComponent];
    int v12 = 134218242;
    double v13 = floor(a1 * 100.0);
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_debug_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEBUG, "Mail Drop progress %f for record:%@", (uint8_t *)&v12, 0x16u);
  }
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_70_cold_1();
    }
  }
  else
  {
    id v7 = [v4 values];
    id v8 = [v7 valueForKey:@"data"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v8;
      id v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v6 fileURL];
        id v11 = [v10 path];
        int v12 = [v11 lastPathComponent];
        int v13 = 138412290;
        __int16 v14 = v12;
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "#Attachments Mail Drop complete for record:%@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_74_cold_1();
    }

    [*(id *)(a1 + 32) finishWithError:v9];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F60D70];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_76;
    v19[3] = &unk_1E5D3F2F8;
    int v12 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v12;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    char v23 = *(unsigned char *)(a1 + 72);
    int v13 = objc_msgSend(v7, "ef_map:", v19);
    __int16 v14 = [v11 join:v13];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_2;
    v17[3] = &unk_1E5D3F320;
    id v18 = *(id *)(a1 + 32);
    [v14 addSuccessBlock:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_3;
    v15[3] = &unk_1E5D3F348;
    id v16 = *(id *)(a1 + 32);
    [v14 addFailureBlock:v15];
  }
}

id __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_76(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) publishRecord:a2 database:*(void *)(a1 + 40) attachmentRecords:*(void *)(a1 + 48) images:*(void *)(a1 + 56) allowsCellularAccess:*(unsigned __int8 *)(a1 + 64)];
  return v2;
}

uint64_t __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

uint64_t __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)_recordZoneIDInDatabase:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MFMailDropMailDelivery _mailDropZone];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A320]);
    id v9 = (void *)[v8 initWithZoneName:v7 ownerName:*MEMORY[0x1E4F19C08]];
    id v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MFMailDropMailDelivery _recordZoneIDInDatabase:completionHandler:]((uint64_t)v9, v10, v11);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke;
    v14[3] = &unk_1E5D3F3C0;
    id v17 = v6;
    id v12 = v9;
    id v15 = v12;
    id v16 = v5;
    [v16 fetchRecordZoneWithID:v12 completionHandler:v14];
  }
  else
  {
    int v13 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not get zoneID to create zone."];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v13);
  }
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_84;
    v10[3] = &unk_1E5D3F398;
    id v9 = *(void **)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 32);
    [v9 saveRecordZone:v8 completionHandler:v10];
  }
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_84_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_mailDropZone
{
  if (_mailDropZone_onceToken != -1) {
    dispatch_once(&_mailDropZone_onceToken, &__block_literal_global_92);
  }
  id v2 = (void *)_mailDropZone__zone;
  return v2;
}

void __39__MFMailDropMailDelivery__mailDropZone__block_invoke()
{
  void v14[4] = *(id *)MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = [v0 UUIDString];

  uint64_t v2 = *MEMORY[0x1E4F3B578];
  v14[0] = 0;
  BOOL v3 = +[MFMessageKeychainManager addPassword:v1 forServiceName:@"kMFMailDropServiceKey" accountName:@"MainAccount" keychainAccessibility:v2 synchronizable:0 error:v14];
  id v4 = v14[0];
  id v5 = v4;
  if (v3)
  {
    if (v1) {
      goto LABEL_12;
    }
  }
  else if ([v4 code] == -25299 {
         && ([v5 domain],
  }
             id v6 = objc_claimAutoreleasedReturnValue(),
             int v7 = [(id)*MEMORY[0x1E4F28760] isEqualToString:v6],
             v6,
             v7))
  {
    id v13 = v5;
    uint64_t v8 = +[MFMessageKeychainManager passwordForServiceName:@"kMFMailDropServiceKey" accountName:@"MainAccount" synchronizable:0 error:&v13];
    id v9 = v13;

    v1 = (void *)v8;
    id v5 = v9;
    if (v8) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __39__MFMailDropMailDelivery__mailDropZone__block_invoke_cold_1();
  }

  v1 = 0;
LABEL_12:
  uint64_t v11 = [v1 copy];
  id v12 = (void *)_mailDropZone__zone;
  _mailDropZone__zone = v11;
}

- (void)setAttachments:(id)a3
{
}

- (EMMailDropMetadata)imageArchiveMetadata
{
  return self->_imageArchiveMetadata;
}

- (void)setImageArchiveMetadata:(id)a3
{
}

- (int64_t)mailDropState
{
  return self->_mailDropState;
}

- (void)setMailDropState:(int64_t)a3
{
  self->_mailDropState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageArchiveMetadata, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

- (void)_processAttachments
{
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "Mail Drop couldn't create zone. Error: %{public}@", v5);
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_49_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "Mail Drop couldn't create archive. Error: %{public}@", v5);
}

- (void)publishRecord:(uint64_t)a3 database:(void *)a4 attachmentRecords:images:allowsCellularAccess:.cold.1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_2((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_4_2(&dword_1A7EFF000, v6, (uint64_t)v6, "Mail Drop attachment: %@", v7);
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_4_2(&dword_1A7EFF000, v3, (uint64_t)v3, "Mail Drop asset URL: %@", v4);
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Mail Drop error publishing asset. %{public}@", v5);
}

- (void)_uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Failure encountered during Mail Drop processing [%{public}@]", v5);
}

- (void)_uploadAttachmentsViaCloudKit:(uint64_t)a3 zone:records:zippedPhotos:attachmentRecords:images:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_2(&dword_1A7EFF000, a2, a3, "Start uploading records to CloudKit database [%@] ...", (uint8_t *)&v3);
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Mail Drop error for record: %{public}@", v5);
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Mail Drop error with upload. %{public}@", v5);
}

- (void)_recordZoneIDInDatabase:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_2(&dword_1A7EFF000, a2, a3, "Start fetching CloudKit record zone for ID [%@] ...", (uint8_t *)&v3);
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Error encountered while fetching CloudKit record zone [%{public}@]", v5);
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_84_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments Error encountered while saving CloudKit record zone [%{public}@]", v5);
}

void __39__MFMailDropMailDelivery__mailDropZone__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, v3, v4, "#Attachments failed to get zone identifier from keychain: %{public}@", v5);
}

@end