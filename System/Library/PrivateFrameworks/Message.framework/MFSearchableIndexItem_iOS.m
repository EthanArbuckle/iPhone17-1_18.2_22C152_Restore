@interface MFSearchableIndexItem_iOS
+ (OS_os_log)log;
+ (id)_bodyDataForMessage:(id)a3;
+ (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4;
+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4;
+ (id)suggestionsSearchableItemWithMessage:(id)a3;
- (BOOL)_shouldAutoDownloadAttachment:(id)a3;
- (BOOL)shouldExcludeFromIndex;
- (id)fetchIndexableAttachments;
- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType;
- (void)setNeedsAllAttributesIndexingType;
@end

@implementation MFSearchableIndexItem_iOS

+ (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__MFSearchableIndexItem_iOS_searchableIndexItemsFromMessages_type___block_invoke;
  v6[3] = &__block_descriptor_48_e53___EDSearchableIndexItem_16__0___EDPersistedMessage__8l;
  v6[4] = a1;
  v6[5] = a4;
  v4 = objc_msgSend(a3, "ef_map:", v6);
  return v4;
}

- (BOOL)shouldExcludeFromIndex
{
  v10.receiver = self;
  v10.super_class = (Class)MFSearchableIndexItem_iOS;
  if ([(EDSearchableIndexItem *)&v10 shouldExcludeFromIndex]) {
    return 1;
  }
  v4 = [(EDSearchableIndexItem *)self baseMessage];
  v5 = [v4 mailbox];
  if (v5)
  {
    v6 = [v4 mailbox];
    v7 = [v6 representedAccount];
    v8 = +[LocalAccount localAccount];
    char v3 = [v7 isEqual:v8];
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (id)fetchIndexableAttachments
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFSearchableIndexItem_iOS *)self shouldExcludeFromIndex];
  if ([(EDSearchableIndexItem *)self indexingType]) {
    BOOL v3 = 1;
  }
  v26 = [(EDSearchableIndexItem *)self baseMessage];
  if (v3) {
    goto LABEL_5;
  }
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  v5 = [v26 dateSent];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  [v4 timeIntervalSince1970];
  double v9 = v8;

  if (v7 < v9)
  {
LABEL_5:
    objc_super v10 = [MEMORY[0x1E4F60D70] nullFuture];
  }
  else
  {
    v25 = +[MFAttachmentManager defaultManager];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v27 = objc_opt_new();
    v11 = [v25 attachmentsForMessage:v26 withSchemes:0 updatingFlags:0];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (([v15 isDataAvailableLocally] & 1) == 0
            && [(MFSearchableIndexItem_iOS *)self _shouldAutoDownloadAttachment:v15])
          {
            v16 = +[MFSearchableIndexItem_iOS log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v22 = [v15 url];
              v23 = [v22 absoluteString];
              *(_DWORD *)buf = 138412290;
              v35 = v23;
              _os_log_debug_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEBUG, "fetching attachment %@", buf, 0xCu);
            }
            v17 = [MEMORY[0x1E4F60E18] promise];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke;
            v28[3] = &unk_1E5D407E0;
            id v18 = v17;
            id v29 = v18;
            [v15 setFetchCompletionBlock:v28];
            [v15 setWantsCompletionBlockOffMainThread:1];
            id v19 = (id)[v15 fetchData];
            v20 = [v18 future];
            v21 = [v20 recover:&__block_literal_global_58];

            [v27 addObject:v21];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v12);
    }

    objc_super v10 = [MEMORY[0x1E4F60D70] join:v27];
  }
  return v10;
}

+ (id)_bodyDataForMessage:(id)a3
{
  char v5 = 0;
  BOOL v3 = [a3 bestAlternativePartAsData:&v5 usingEncoding:4];
  return v3;
}

+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v28 = +[MFAttachmentManager defaultManager];
  id v29 = [v28 attachmentsForMessage:v27 withSchemes:0 updatingFlags:0];
  v4 = objc_opt_new();
  char v5 = objc_opt_new();
  double v6 = objc_opt_new();
  double v7 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v29;
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = [v11 mimeType];
        uint64_t v13 = (void *)v12;
        if (v12) {
          v14 = (__CFString *)v12;
        }
        else {
          v14 = &stru_1EFF11268;
        }
        [v4 addObject:v14];

        uint64_t v15 = [v11 fileUTType];
        v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = &stru_1EFF11268;
        }
        [v5 addObject:v17];

        uint64_t v18 = [v11 fileName];
        id v19 = (void *)v18;
        if (v18) {
          v20 = (__CFString *)v18;
        }
        else {
          v20 = &stru_1EFF11268;
        }
        [v6 addObject:v20];

        if (![v11 isDataAvailableLocally]
          || ([v11 path],
              v21 = objc_claimAutoreleasedReturnValue(),
              BOOL v22 = v21 == 0,
              v21,
              v22))
        {
          [v7 addObject:&stru_1EFF11268];
        }
        else
        {
          v23 = [v11 path];
          [v7 addObject:v23];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  id v24 = objc_alloc(MEMORY[0x1E4F60C50]);
  v25 = (void *)[v24 initWithNames:v6 paths:v7 UTIs:v5 specificUTIs:MEMORY[0x1E4F1CBF0] mimeTypes:v4 kinds:MEMORY[0x1E4F1CBF0]];

  return v25;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MFSearchableIndexItem_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1) {
    dispatch_once(&log_onceToken_31, block);
  }
  v2 = (void *)log_log_31;
  return (OS_os_log *)v2;
}

+ (id)suggestionsSearchableItemWithMessage:(id)a3
{
  id v4 = a3;
  char v5 = [a1 _bodyDataForMessage:v4];
  double v6 = [a1 suggestionsSearchableItemWithMessage:v4 bodyData:v5 fetchBody:1 isEncrypted:0 includeEncryptedBody:0];

  return v6;
}

- (void)setNeedsAllAttributesIndexingType
{
  v2.receiver = self;
  v2.super_class = (Class)MFSearchableIndexItem_iOS;
  [(EDSearchableIndexItem *)&v2 setNeedsAllAttributesIndexingType];
}

- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType
{
  v2.receiver = self;
  v2.super_class = (Class)MFSearchableIndexItem_iOS;
  [(EDSearchableIndexItem *)&v2 setNeedsAllAttributesIncludingDataDetectionResultsIndexingType];
}

- (BOOL)_shouldAutoDownloadAttachment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mimeType];
  if ([v4 isEqualToString:@"text/calendar"]
    && (unint64_t)[v3 encodedFileSize] >> 5 <= 0xC34)
  {
    char v5 = [v3 contentID];
    int v6 = [v5 isEqualToString:@"191AF69B-0088-47D2-AD66-6C9D08949C46"] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end