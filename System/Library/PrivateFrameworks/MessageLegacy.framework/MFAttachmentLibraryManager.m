@interface MFAttachmentLibraryManager
- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3;
- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4;
- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4;
- (void)_messageAttachmentStorageLocationsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)removeProviderForBaseURL:(id)a3;
@end

@implementation MFAttachmentLibraryManager

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentLibraryManager;
  [(MFAttachmentComposeManager *)&v3 dealloc];
}

- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3
{
  v4 = [(MFAttachmentManager *)self init];
  if (v4)
  {
    uint64_t v5 = [a3 dataProvider];
    -[MFAttachmentManager addProvider:forBaseURL:](v4, "addProvider:forBaseURL:", v5, [MEMORY[0x1E4F1CB10] URLWithString:@"x-attach"]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__messageAttachmentStorageLocationsDidChangeNotification_, @"MailMessageStoreMessagesAttachmentStorageLocationChanged", 0);
  }
  return v4;
}

- (void)_messageAttachmentStorageLocationsDidChangeNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"messages");
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        int v7 = [*(id *)(*((void *)&v20 + 1) + 8 * i) libraryID];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v8 = (void *)[(NSMutableDictionary *)self->super.super._metadata allKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if (objc_msgSend(v13, "mf_rowID") == v7) {
                [(NSMutableDictionary *)self->super.super._metadata removeObjectForKey:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentLibraryManager;
  id v14 = 0;
  id result = [(MFAttachmentManager *)&v13 _dataProviderForAttachmentURL:a3 error:&v14];
  if (!result)
  {
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super.super._providers, "objectForKeyedSubscript:", [a3 scheme]);
    if (!v8) {
      v8 = (void *)[(NSMutableDictionary *)self->super.super._providers objectForKeyedSubscript:@"x-attach"];
    }
    id result = v8;
    if (a4 && !result)
    {
      if (v14)
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(v14, "userInfo"), "mutableCopy");
        uint64_t v10 = (__CFString *)[v9 objectForKey:@"MFLocalizedDescriptionKey"];
        uint64_t v11 = (__CFString *)[v9 objectForKey:@"MFErrorTitleKey"];
        v12 = (__CFString *)[v14 domain];
        [v9 removeObjectForKey:@"MFLocalizedDescriptionKey"];
        [v9 removeObjectForKey:@"MFErrorTitleKey"];
      }
      else
      {
        uint64_t v9 = 0;
        v12 = @"MFMessageErrorDomain";
        uint64_t v11 = @"No Provider Found";
        uint64_t v10 = @"Could not find a provider for the given URL.";
      }
      *a4 = +[MFError errorWithDomain:v12 code:1030 localizedDescription:v10 title:v11 userInfo:v9];

      return 0;
    }
  }
  return result;
}

- (void)removeProviderForBaseURL:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "isEqualToString:", @"x-attach://") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MFAttachmentLibraryManager;
    [(MFAttachmentManager *)&v5 removeProviderForBaseURL:a3];
  }
}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v7 = (void *)[a3 messageBodyIfAvailable];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = (void *)[v7 attachments];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "mimePart"), "partURL");
        if (([a3 messageFlags] & 8) != 0)
        {
          id v14 = 0;
          if (a4) {
            goto LABEL_13;
          }
        }
        else
        {
          [(MFAttachmentLibraryManager *)self _dataProviderForAttachmentURL:v13 error:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = 0;
          }
          else {
            id v14 = v7;
          }
          if (a4)
          {
LABEL_13:
            if (!objc_msgSend(a4, "containsObject:", objc_msgSend(v13, "scheme"))) {
              goto LABEL_16;
            }
          }
        }
        id v15 = [(MFAttachmentManager *)self attachmentForURL:v13 withMimeBody:v14 error:0];
        if (v15) {
          [v17 addObject:v15];
        }
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  return v17;
}

@end