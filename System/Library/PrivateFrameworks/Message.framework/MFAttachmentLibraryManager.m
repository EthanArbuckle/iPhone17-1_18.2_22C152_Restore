@interface MFAttachmentLibraryManager
- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3;
- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4;
- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4;
- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4 updatingFlags:(BOOL)a5;
- (void)removeProviderForBaseURL:(id)a3;
@end

@implementation MFAttachmentLibraryManager

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MFAttachmentLibraryManager;
  id v25 = 0;
  id v7 = [(MFAttachmentManager *)&v24 _dataProviderForAttachmentURL:v6 error:&v25];
  id v8 = v25;
  if (!v7)
  {
    providers = self->super.super._providers;
    v10 = [v6 scheme];
    v11 = [(NSMutableDictionary *)providers objectForKeyedSubscript:v10];

    if (v11)
    {
      id v7 = v11;
    }
    else
    {
      uint64_t v12 = [(NSMutableDictionary *)self->super.super._providers objectForKeyedSubscript:@"x-attach"];
      id v7 = (id)v12;
      if (a4 && !v12)
      {
        if (v8)
        {
          v13 = objc_msgSend(v8, "userInfo", 0);
          v14 = (void *)[v13 mutableCopy];

          v22 = v14;
          uint64_t v15 = [v14 objectForKey:@"MFLocalizedDescriptionKey"];
          uint64_t v16 = [v14 objectForKey:@"MFErrorTitleKey"];
          uint64_t v17 = [v8 domain];
          [v22 removeObjectForKey:@"MFLocalizedDescriptionKey"];
          v18 = (__CFString *)v15;
          v19 = (__CFString *)v16;
          v20 = (__CFString *)v17;
          [v22 removeObjectForKey:@"MFErrorTitleKey"];
        }
        else
        {
          v20 = @"MFMessageErrorDomain";
          v22 = 0;
          v19 = @"No Provider Found";
          v18 = @"Could not find a provider for the given URL.";
        }
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v20, 1030, v18, v19, v22, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        id v7 = 0;
      }
    }
  }
  return v7;
}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4 updatingFlags:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  [v8 messageBodyIfAvailableUpdatingFlags:v5];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  v21 = long long v25 = 0u;
  id obj = [v21 attachments];
  uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) mimePart];
        v14 = [v13 partURL];

        if (([v8 messageFlags] & 8) != 0)
        {
          id v16 = 0;
        }
        else
        {
          uint64_t v15 = [(MFAttachmentLibraryManager *)self _dataProviderForAttachmentURL:v14 error:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v16 = 0;
          }
          else {
            id v16 = v21;
          }
        }
        if (!v9
          || ([v14 scheme],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v9 containsObject:v17],
              v17,
              (v18 & 1) != 0))
        {
          v19 = [(MFAttachmentManager *)self attachmentForURL:v14 withMimeBody:v16 error:0];
          if (v19) {
            [v22 addObject:v19];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v22;
}

- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFAttachmentComposeManager *)self init];
  if (v5)
  {
    id v6 = [v4 dataProvider];
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-attach"];
    id v8 = [[MFMailDropAttachmentDataProvider alloc] initWithLibrary:v4];
    id v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-attach-maildrop"];
    uint64_t v10 = [(MFAttachmentLibraryDataProvider *)[MFMailDropAttachmentPreviewDataProvider alloc] initWithLibrary:v4];
    uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-attach-maildrop-image"];
    [(MFAttachmentManager *)v5 addProvider:v6 forBaseURL:v7];
    [(MFAttachmentManager *)v5 addProvider:v8 forBaseURL:v9];
    [(MFAttachmentManager *)v5 addProvider:v10 forBaseURL:v11];
  }
  return v5;
}

- (void)removeProviderForBaseURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 absoluteString];
  char v6 = [v5 isEqualToString:@"x-attach://"];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFAttachmentLibraryManager;
    [(MFAttachmentManager *)&v7 removeProviderForBaseURL:v4];
  }
}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4
{
  id v4 = [(MFAttachmentLibraryManager *)self attachmentsForMessage:a3 withSchemes:a4 updatingFlags:1];
  return v4;
}

@end