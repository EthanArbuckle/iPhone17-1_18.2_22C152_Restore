@interface MFComposeAttachmentDataProvider
- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4;
- (id)_dataForAttachment:(id)a3;
- (id)dataForContentID:(id)a3;
- (id)messageForAttachment:(id)a3;
- (id)rawDataForContentID:(id)a3;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (void)addData:(id)a3 forContentID:(id)a4;
- (void)dealloc;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)recordPasteboardDataForAttachments:(id)a3;
- (void)recordUndoDataForAttachments:(id)a3;
- (void)removeDataForAttachment:(id)a3;
@end

@implementation MFComposeAttachmentDataProvider

- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFComposeAttachmentDataProvider;
  v6 = [(MFComposeAttachmentDataProvider *)&v8 init];
  if (v6)
  {
    v6->_attachmentsData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(MFComposeAttachmentDataProvider *)v6 addData:a3 forContentID:a4];
    v6->_attachmentsPlaceholderData = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v6->_attachmentsPasteboardData = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v6->_attachmentsUndoData = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeAttachmentDataProvider;
  [(MFComposeAttachmentDataProvider *)&v3 dealloc];
}

- (void)addData:(id)a3 forContentID:(id)a4
{
  if (a4
    && (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", a4), "isEqualToData:", a3) & 1) == 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F734C0]) initWithData:a3];
    [(NSMutableDictionary *)self->_attachmentsData setValue:v7 forKey:a4];
  }
}

- (void)removeDataForAttachment:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 lastPathComponent];
    [(NSMutableDictionary *)self->_attachmentsData removeObjectForKey:v4];
    attachmentsPasteboardData = self->_attachmentsPasteboardData;
    [(NSMutableDictionary *)attachmentsPasteboardData removeObjectForKey:v4];
  }
}

- (void)recordPasteboardDataForAttachments:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(NSMutableDictionary *)self->_attachmentsPasteboardData removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) lastPathComponent];
          if ([v9 length])
          {
            uint64_t v10 = [(NSMutableDictionary *)self->_attachmentsData objectForKey:v9];
            if (v10) {
              [(NSMutableDictionary *)self->_attachmentsPasteboardData setObject:v10 forKey:v9];
            }
            [(NSMutableDictionary *)self->_attachmentsData removeObjectForKey:v9];
            [(NSMutableDictionary *)self->_attachmentsPasteboardData removeObjectForKey:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)recordUndoDataForAttachments:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(NSMutableDictionary *)self->_attachmentsUndoData removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) lastPathComponent];
          if ([v9 length])
          {
            uint64_t v10 = [(NSMutableDictionary *)self->_attachmentsData objectForKey:v9];
            if (v10) {
              [(NSMutableDictionary *)self->_attachmentsUndoData setObject:v10 forKey:v9];
            }
            [(NSMutableDictionary *)self->_attachmentsData removeObjectForKey:v9];
            [(NSMutableDictionary *)self->_attachmentsPasteboardData removeObjectForKey:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (id)_dataForAttachment:(id)a3
{
  uint64_t v5 = (void *)[a3 contentID];
  if (![v5 length]) {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "url"), "lastPathComponent");
  }
  return [(MFComposeAttachmentDataProvider *)self dataForContentID:v5];
}

- (id)dataForContentID:(id)a3
{
  id v5 = -[MFComposeAttachmentDataProvider rawDataForContentID:](self, "rawDataForContentID:");
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:v5])
  {
    id v6 = [(NSCache *)self->_attachmentsPlaceholderData objectForKey:a3];
    if (!v6)
    {
      id v8 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v5];
      if (v8)
      {
        id v6 = +[MFAttachmentPlaceholder dataForPlaceholder:v8];
        if ([v6 length]) {
          [(NSCache *)self->_attachmentsPlaceholderData setObject:v6 forKey:a3];
        }
      }
      else
      {
        id v6 = 0;
      }
    }
    if (v6) {
      return v6;
    }
  }
  return v5;
}

- (id)rawDataForContentID:(id)a3
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:");
  if (!v5)
  {
    id v5 = (void *)[(NSMutableDictionary *)self->_attachmentsPasteboardData objectForKey:a3];
    if (!v5) {
      id v5 = (void *)[(NSMutableDictionary *)self->_attachmentsUndoData objectForKey:a3];
    }
  }
  if (![v5 length])
  {
    id v6 = MFLogGeneral();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        -[MFComposeAttachmentDataProvider rawDataForContentID:]((uint64_t)a3, v6);
      }
    }
    else if (v7)
    {
      -[MFComposeAttachmentDataProvider rawDataForContentID:]((uint64_t)a3, v6);
    }
  }
  return v5;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = -[MFComposeAttachmentDataProvider _dataForAttachment:](self, "_dataForAttachment:");
  if (v10)
  {
    [a4 appendData:v10];
    uint64_t v11 = [a3 encodedFileSize];
    [a5 setCompletedUnitCount:v11];
    [a5 setTotalUnitCount:v11];
    [a4 done];
    long long v12 = 0;
  }
  else
  {
    long long v12 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Could not find data for compose attachment." title:@"No Data Found" userInfo:0];
  }
  long long v13 = (void (*)(id, BOOL, MFError *, void))*((void *)a6 + 2);
  v13(a6, v10 != 0, v12, 0);
}

- (id)messageForAttachment:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id result = (id)[a4 attachmentStorageLocation];
  if (result)
  {
    id v6 = objc_msgSend(result, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "part"), "partNumber"));
    uint64_t v7 = [a3 fileName];
    return (id)[v6 stringByAppendingPathComponent:v7];
  }
  return result;
}

- (void)rawDataForContentID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_DEBUG, "No attachment for [%@]", (uint8_t *)&v2, 0xCu);
}

- (void)rawDataForContentID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_DEBUG, "Zero length attachment for [%@]", (uint8_t *)&v2, 0xCu);
}

@end