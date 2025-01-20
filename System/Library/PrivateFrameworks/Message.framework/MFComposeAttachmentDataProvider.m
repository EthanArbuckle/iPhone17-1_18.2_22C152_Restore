@interface MFComposeAttachmentDataProvider
- (MFComposeAttachmentDataProvider)initWithAttachmentDataItemProvider:(id)a3 forContentID:(id)a4;
- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4;
- (id)_dataForAttachment:(id)a3;
- (id)dataForContentID:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)rawDataForContentID:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)_commonInitWithDataProvider:(id)a3 forContentID:(id)a4;
- (void)addData:(id)a3 forContentID:(id)a4;
- (void)addDataItemProvider:(id)a3 forContentID:(id)a4;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)removeDataForAttachment:(id)a3;
@end

@implementation MFComposeAttachmentDataProvider

- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFComposeAttachmentDataProvider;
  v8 = [(MFComposeAttachmentDataProvider *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentsData = v8->_attachmentsData;
    v8->_attachmentsData = v9;

    [(MFComposeAttachmentDataProvider *)v8 addData:v6 forContentID:v7];
    [(MFComposeAttachmentDataProvider *)v8 _commonInitWithDataProvider:v6 forContentID:v7];
  }

  return v8;
}

- (MFComposeAttachmentDataProvider)initWithAttachmentDataItemProvider:(id)a3 forContentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFComposeAttachmentDataProvider;
  v8 = [(MFComposeAttachmentDataProvider *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentsData = v8->_attachmentsData;
    v8->_attachmentsData = v9;

    [(MFComposeAttachmentDataProvider *)v8 addDataItemProvider:v6 forContentID:v7];
    [(MFComposeAttachmentDataProvider *)v8 _commonInitWithDataProvider:v6 forContentID:v7];
  }

  return v8;
}

- (void)_commonInitWithDataProvider:(id)a3 forContentID:(id)a4
{
  v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
  attachmentsPlaceholderData = self->_attachmentsPlaceholderData;
  self->_attachmentsPlaceholderData = v5;
}

- (void)addData:(id)a3 forContentID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_attachmentsData objectForKey:v6];
    char v8 = [v7 isEqualToData:v10];

    if ((v8 & 1) == 0)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F734C0]) initWithData:v10];
      [(NSMutableDictionary *)self->_attachmentsData setValue:v9 forKey:v6];
    }
  }
}

- (void)addDataItemProvider:(id)a3 forContentID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_attachmentsData objectForKeyedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v7 != v8)) == 1) {
      [(NSMutableDictionary *)self->_attachmentsData setValue:v8 forKey:v6];
    }
  }
}

- (void)removeDataForAttachment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = [v4 lastPathComponent];
    [(NSMutableDictionary *)self->_attachmentsData removeObjectForKey:v5];

    id v4 = v6;
  }
}

- (id)_dataForAttachment:(id)a3
{
  id v4 = a3;
  v5 = [v4 contentID];
  if (![v5 length])
  {
    id v6 = [v4 url];
    uint64_t v7 = [v6 lastPathComponent];

    v5 = (void *)v7;
  }
  id v8 = [(MFComposeAttachmentDataProvider *)self dataForContentID:v5];

  return v8;
}

- (id)dataForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(MFComposeAttachmentDataProvider *)self rawDataForContentID:v4];
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:v5])
  {
    id v6 = [(NSCache *)self->_attachmentsPlaceholderData objectForKey:v4];
    if (v6) {
      goto LABEL_3;
    }
    v9 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v5];
    if (v9)
    {
      id v6 = +[MFAttachmentPlaceholder dataForPlaceholder:v9];
      if ([v6 length]) {
        [(NSCache *)self->_attachmentsPlaceholderData setObject:v6 forKey:v4];
      }

      if (v6)
      {
LABEL_3:
        id v7 = v6;

        v5 = v7;
      }
    }
  }

  return v5;
}

- (id)rawDataForContentID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_attachmentsData objectForKey:v4];
  uint64_t v19 = 0;
  v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 registeredTypeIdentifiers];
    id v8 = [v7 firstObject];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke;
    v16 = &unk_1E5D3E2F0;
    v18 = &v19;
    id v9 = v4;
    id v17 = v9;
    id v10 = (id)[v6 loadDataRepresentationForTypeIdentifier:v8 completionHandler:&v13];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsData, "setObject:forKeyedSubscript:", v20[5], v9, v13, v14, v15, v16);
LABEL_3:

    goto LABEL_5;
  }
  objc_storeStrong(v20 + 5, v5);
  if (![v20[5] length])
  {
    if (v20[5])
    {
      id v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[MFComposeAttachmentDataProvider rawDataForContentID:]((uint64_t)v4, v6);
      }
    }
    else
    {
      id v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[MFComposeAttachmentDataProvider rawDataForContentID:]((uint64_t)v4, v6);
      }
    }
    goto LABEL_3;
  }
LABEL_5:
  id v11 = v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F734C0]) initWithData:v5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else if (v6)
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke_cold_1(a1, (uint64_t)v7, v11);
    }
  }
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = (void (**)(id, BOOL, void *, void))a6;
  uint64_t v13 = [(MFComposeAttachmentDataProvider *)self _dataForAttachment:v16];
  if (v13)
  {
    [v10 appendData:v13];
    uint64_t v14 = [v16 encodedFileSize];
    [v11 setCompletedUnitCount:v14];
    [v11 setTotalUnitCount:v14];
    v15 = 0;
    [v10 done];
  }
  else
  {
    v15 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not find data for compose attachment." title:@"No Data Found" userInfo:0];
  }
  v12[2](v12, v13 != 0, v15, 0);
}

- (id)messageForAttachment:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsPlaceholderData, 0);
  objc_storeStrong((id *)&self->_attachmentsData, 0);
}

- (void)rawDataForContentID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "No attachment for [%@]", (uint8_t *)&v2, 0xCu);
}

- (void)rawDataForContentID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "Zero length attachment for [%@]", (uint8_t *)&v2, 0xCu);
}

void __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "failed to get attachment data for [%@], error:%@", (uint8_t *)&v4, 0x16u);
}

@end