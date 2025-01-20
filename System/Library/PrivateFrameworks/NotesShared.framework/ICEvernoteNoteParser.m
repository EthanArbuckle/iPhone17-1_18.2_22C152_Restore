@interface ICEvernoteNoteParser
- (BOOL)shouldCountOnly;
- (BOOL)shouldIgnoreCurrentNote;
- (ICEvernoteNote)currentNote;
- (ICEvernoteNoteParser)init;
- (ICEvernoteResource)currentResource;
- (NSError)parseError;
- (NSMutableArray)importItems;
- (NSMutableArray)notes;
- (NSMutableDictionary)currentImportItem;
- (NSMutableString)bufferString;
- (NSMutableString)contentString;
- (NSURL)currentImportDirectory;
- (NSURL)importDirectory;
- (OS_dispatch_queue)parseQueue;
- (OS_dispatch_semaphore)parseSemaphore;
- (id)archiveItemsFromBookmarkData:(id)a3 error:(id *)a4;
- (id)dateFromDateString:(id)a3;
- (id)importDirectoryURLWithImportIdentifier:(id)a3;
- (id)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4;
- (id)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4;
- (int64_t)contentLevel;
- (unint64_t)countEvernoteNotesFromBookmarkData:(id)a3;
- (unint64_t)noteCount;
- (void)archiveEvernoteNote:(id)a3;
- (void)archiveEvernoteResource:(id)a3;
- (void)cleanupArchiveId:(id)a3;
- (void)parseFileAtBookmarkData:(id)a3 shouldCountOnly:(BOOL)a4;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)setBufferString:(id)a3;
- (void)setContentLevel:(int64_t)a3;
- (void)setContentString:(id)a3;
- (void)setCurrentImportDirectory:(id)a3;
- (void)setCurrentImportItem:(id)a3;
- (void)setCurrentNote:(id)a3;
- (void)setCurrentResource:(id)a3;
- (void)setImportItems:(id)a3;
- (void)setNoteCount:(unint64_t)a3;
- (void)setNotes:(id)a3;
- (void)setParseError:(id)a3;
- (void)setParseQueue:(id)a3;
- (void)setParseSemaphore:(id)a3;
- (void)setShouldCountOnly:(BOOL)a3;
- (void)setShouldIgnoreCurrentNote:(BOOL)a3;
@end

@implementation ICEvernoteNoteParser

- (ICEvernoteNoteParser)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICEvernoteNoteParser;
  v2 = [(ICEvernoteNoteParser *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.EvernoteNoteParser", v3);
    parseQueue = v2->_parseQueue;
    v2->_parseQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (NSURL)importDirectory
{
  v2 = [MEMORY[0x1E4F837A0] importDocumentsURL];
  v3 = [v2 URLByAppendingPathComponent:@"tmp" isDirectory:1];

  dispatch_queue_t v4 = [v3 URLByAppendingPathComponent:@"Import" isDirectory:1];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:0];

  return (NSURL *)v4;
}

- (unint64_t)countEvernoteNotesFromBookmarkData:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C877DB80]();
  [(ICEvernoteNoteParser *)self parseFileAtBookmarkData:v4 shouldCountOnly:1];
  unint64_t v6 = [(ICEvernoteNoteParser *)self noteCount];

  return v6;
}

- (id)archiveItemsFromBookmarkData:(id)a3 error:(id *)a4
{
  unint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [(ICEvernoteNoteParser *)self setImportItems:v8];

  [(ICEvernoteNoteParser *)self parseFileAtBookmarkData:v7 shouldCountOnly:0];
  if (a4)
  {
    v9 = [(ICEvernoteNoteParser *)self parseError];

    if (v9)
    {
      *a4 = [(ICEvernoteNoteParser *)self parseError];
    }
  }
  return [(ICEvernoteNoteParser *)self importItems];
}

- (id)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (a3 && v6)
  {
    id v9 = a3;
    v10 = [(ICEvernoteNoteParser *)self importDirectory];
    v11 = [v10 URLByAppendingPathComponent:v9 isDirectory:1];

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v11 path];
    int v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      v15 = [v11 URLByAppendingPathComponent:v7 isDirectory:0];
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      v17 = [v15 path];
      int v18 = [v16 fileExistsAtPath:v17];

      if (v18)
      {
        id v31 = 0;
        v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15 options:1 error:&v31];
        id v20 = v31;
        if (v19)
        {
          id v30 = 0;
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v19 error:&v30];
          v22 = v30;
          if (v22)
          {
            v23 = os_log_create("com.apple.notes", "Import");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:]();
            }
          }
          id v8 = [[ICEvernoteNote alloc] initWithCoder:v21];
        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:]();
          }
          id v8 = 0;
        }

        v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v29 = v20;
        char v25 = [v24 removeItemAtURL:v15 error:&v29];
        id v26 = v29;

        if ((v25 & 1) == 0)
        {
          v27 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:](v26);
          }
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (a3 && v6)
  {
    id v9 = a3;
    v10 = [(ICEvernoteNoteParser *)self importDirectory];
    v11 = [v10 URLByAppendingPathComponent:v9 isDirectory:1];

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v11 path];
    int v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      v15 = [v11 URLByAppendingPathComponent:v7 isDirectory:0];
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      v17 = [v15 path];
      int v18 = [v16 fileExistsAtPath:v17];

      if (v18)
      {
        id v31 = 0;
        v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15 options:1 error:&v31];
        id v20 = v31;
        if (v19)
        {
          id v30 = 0;
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v19 error:&v30];
          v22 = v30;
          if (v22)
          {
            v23 = os_log_create("com.apple.notes", "Import");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:]();
            }
          }
          id v8 = [[ICEvernoteResource alloc] initWithCoder:v21];
        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[ICEvernoteNoteParser unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:]();
          }
          id v8 = 0;
        }

        v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v29 = v20;
        char v25 = [v24 removeItemAtURL:v15 error:&v29];
        id v26 = v29;

        if ((v25 & 1) == 0)
        {
          v27 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[ICEvernoteNoteParser unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:](v26);
          }
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)cleanupArchiveId:(id)a3
{
  id v4 = a3;
  v5 = [(ICEvernoteNoteParser *)self importDirectory];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    [v10 removeItemAtURL:v6 error:&v13];
    id v11 = v13;

    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ICEvernoteNoteParser cleanupArchiveId:](v11);
      }
    }
  }
}

- (void)parserDidEndDocument:(id)a3
{
  id v4 = [(ICEvernoteNoteParser *)self parseQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICEvernoteNoteParser_parserDidEndDocument___block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(v4, block);
}

void __45__ICEvernoteNoteParser_parserDidEndDocument___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) parseSemaphore];
  dispatch_semaphore_signal(v1);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5 = a4;
  id v6 = [(ICEvernoteNoteParser *)self parseQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke;
  v8[3] = &unk_1E64A4218;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 40) setParseError:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) parseSemaphore];
  dispatch_semaphore_signal(v3);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v8 = a4;
  id v9 = [(ICEvernoteNoteParser *)self parseQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__ICEvernoteNoteParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
  v11[3] = &unk_1E64A4218;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __85__ICEvernoteNoteParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C877DB80]();
  if (([*(id *)(a1 + 32) shouldCountOnly] & 1) == 0
    && ([*(id *)(a1 + 32) shouldIgnoreCurrentNote] & 1) == 0)
  {
    if (![*(id *)(a1 + 32) contentLevel])
    {
      v3 = [*(id *)(a1 + 32) contentString];
      id v4 = [*(id *)(a1 + 32) bufferString];
      [v3 appendString:v4];
    }
    id v5 = [*(id *)(a1 + 40) lowercaseString];
    if ([v5 isEqualToString:@"note"])
    {
      [*(id *)(a1 + 32) setShouldIgnoreCurrentNote:0];
      id v6 = objc_alloc_init(ICEvernoteNote);
      [*(id *)(a1 + 32) setCurrentNote:v6];

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 32) setCurrentImportItem:v7];

      id v8 = [MEMORY[0x1E4F29128] UUID];
      id v9 = [v8 UUIDString];

      id v10 = [*(id *)(a1 + 32) currentImportItem];
      [v10 setObject:v9 forKeyedSubscript:@"archiveId"];

      id v11 = [*(id *)(a1 + 32) importDirectoryURLWithImportIdentifier:v9];
      [*(id *)(a1 + 32) setCurrentImportDirectory:v11];
    }
    else
    {
      if ([v5 isEqualToString:@"content"])
      {
        [*(id *)(a1 + 32) setContentLevel:0];
        id v12 = (ICEvernoteResource *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        [*(id *)(a1 + 32) setContentString:v12];
      }
      else
      {
        if (![v5 isEqualToString:@"resource"])
        {
          if (([*(id *)(a1 + 32) contentLevel] & 0x8000000000000000) == 0) {
            objc_msgSend(*(id *)(a1 + 32), "setContentLevel:", objc_msgSend(*(id *)(a1 + 32), "contentLevel") + 1);
          }
          goto LABEL_12;
        }
        id v12 = objc_alloc_init(ICEvernoteResource);
        [*(id *)(a1 + 32) setCurrentResource:v12];
      }
    }
LABEL_12:
    id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [*(id *)(a1 + 32) setBufferString:v13];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(ICEvernoteNoteParser *)self parseQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ICEvernoteNoteParser_parser_foundCharacters___block_invoke;
  v8[3] = &unk_1E64A4218;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __47__ICEvernoteNoteParser_parser_foundCharacters___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C877DB80]();
  if (([*(id *)(a1 + 32) shouldCountOnly] & 1) == 0
    && ([*(id *)(a1 + 32) shouldIgnoreCurrentNote] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 32) bufferString];
    [v3 appendString:*(void *)(a1 + 40)];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v7 = a4;
  id v8 = [(ICEvernoteNoteParser *)self parseQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke;
  v10[3] = &unk_1E64A4218;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C877DB80]();
  v3 = [*(id *)(a1 + 32) lowercaseString];
  int v4 = [*(id *)(a1 + 40) shouldCountOnly];
  int v5 = [v3 isEqualToString:@"note"];
  if (v4)
  {
    if (v5) {
      objc_msgSend(*(id *)(a1 + 40), "setNoteCount:", objc_msgSend(*(id *)(a1 + 40), "noteCount") + 1);
    }
    goto LABEL_22;
  }
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) currentNote];

    if (v6)
    {
      char v7 = [*(id *)(a1 + 40) shouldIgnoreCurrentNote];
      id v8 = *(void **)(a1 + 40);
      if (v7)
      {
        id v9 = [*(id *)(a1 + 40) currentImportItem];
        id v10 = [v9 objectForKeyedSubscript:@"archiveId"];

        [*(id *)(a1 + 40) cleanupArchiveId:v10];
        [*(id *)(a1 + 40) setShouldIgnoreCurrentNote:0];
      }
      else
      {
        v21 = [*(id *)(a1 + 40) currentNote];
        [v8 archiveEvernoteNote:v21];

        id v10 = [*(id *)(a1 + 40) notes];
        v22 = [*(id *)(a1 + 40) currentNote];
        [v10 addObject:v22];
      }
    }
    [*(id *)(a1 + 40) setCurrentNote:0];
    [*(id *)(a1 + 40) setCurrentImportItem:0];
    [*(id *)(a1 + 40) setCurrentImportDirectory:0];
    goto LABEL_19;
  }
  int v11 = [v3 isEqualToString:@"title"];
  id v12 = *(void **)(a1 + 40);
  if (v11)
  {
    id v13 = [v12 bufferString];
    int v14 = [v13 copy];
    v15 = [*(id *)(a1 + 40) currentNote];
    [v15 setTitle:v14];
    goto LABEL_10;
  }
  if ([v12 shouldIgnoreCurrentNote]) {
    goto LABEL_22;
  }
  if ([v3 isEqualToString:@"created"])
  {
    v16 = *(void **)(a1 + 40);
    v17 = [v16 bufferString];
    int v18 = (void *)[v17 copy];
    v19 = [v16 dateFromDateString:v18];
    id v20 = [*(id *)(a1 + 40) currentNote];
    [v20 setCreated:v19];
LABEL_25:

    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"updated"])
  {
    v23 = *(void **)(a1 + 40);
    v17 = [v23 bufferString];
    int v18 = (void *)[v17 copy];
    v19 = [v23 dateFromDateString:v18];
    id v20 = [*(id *)(a1 + 40) currentNote];
    [v20 setUpdated:v19];
    goto LABEL_25;
  }
  if ([v3 isEqualToString:@"tag"])
  {
    id v13 = [*(id *)(a1 + 40) currentNote];
    int v14 = [v13 tags];
    v15 = [*(id *)(a1 + 40) bufferString];
    v24 = [v14 arrayByAddingObject:v15];
    char v25 = [*(id *)(a1 + 40) currentNote];
    [v25 setTags:v24];
  }
  else if ([v3 isEqualToString:@"content"])
  {
    id v26 = [*(id *)(a1 + 40) contentString];
    v27 = [*(id *)(a1 + 40) bufferString];
    [v26 appendString:v27];

    id v13 = [*(id *)(a1 + 40) contentString];
    int v14 = [v13 copy];
    v15 = [*(id *)(a1 + 40) currentNote];
    [v15 setContent:v14];
  }
  else
  {
    int v28 = [v3 isEqualToString:@"resource"];
    id v29 = *(void **)(a1 + 40);
    id v30 = [v29 currentResource];
    id v31 = v30;
    if (v28)
    {
      [v29 archiveEvernoteResource:v30];

      [*(id *)(a1 + 40) setCurrentResource:0];
      goto LABEL_19;
    }

    if (!v31) {
      goto LABEL_19;
    }
    if ([v3 isEqualToString:@"mime"])
    {
      id v13 = [*(id *)(a1 + 40) bufferString];
      int v14 = [*(id *)(a1 + 40) currentResource];
      [v14 setMime:v13];
      goto LABEL_11;
    }
    if ([v3 isEqualToString:@"width"])
    {
      id v13 = [*(id *)(a1 + 40) bufferString];
      double v32 = (double)[v13 integerValue];
      int v14 = [*(id *)(a1 + 40) currentResource];
      [v14 setImageWidth:v32];
      goto LABEL_11;
    }
    if ([v3 isEqualToString:@"height"])
    {
      id v13 = [*(id *)(a1 + 40) bufferString];
      double v33 = (double)[v13 integerValue];
      int v14 = [*(id *)(a1 + 40) currentResource];
      [v14 setImageHeight:v33];
      goto LABEL_11;
    }
    if ([v3 isEqualToString:@"duration"])
    {
      id v13 = [*(id *)(a1 + 40) bufferString];
      [v13 doubleValue];
      double v35 = v34;
      int v14 = [*(id *)(a1 + 40) currentResource];
      [v14 setDuration:v35];
      goto LABEL_11;
    }
    if ([v3 isEqualToString:@"file-name"])
    {
      id v13 = [*(id *)(a1 + 40) bufferString];
      int v14 = [*(id *)(a1 + 40) currentResource];
      [v14 setFileName:v13];
      goto LABEL_11;
    }
    if (![v3 isEqualToString:@"data"]) {
      goto LABEL_19;
    }
    id v36 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v37 = [*(id *)(a1 + 40) bufferString];
    id v13 = (void *)[v36 initWithBase64EncodedString:v37 options:1];

    if (!v13)
    {
      int v14 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_1(v14);
      }
      goto LABEL_11;
    }
    v38 = +[ICCloudConfiguration sharedConfiguration];
    v39 = [v38 maximumAttachmentSizeMB];
    uint64_t v40 = [v39 unsignedLongLongValue];

    if ([v13 length] > (unint64_t)(v40 << 20))
    {
      v41 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_2(v13, v40 << 20, v41);
      }

      [*(id *)(a1 + 40) setShouldIgnoreCurrentNote:1];
      goto LABEL_12;
    }
    v42 = [*(id *)(a1 + 40) currentResource];
    [v42 setData:v13];

    int v14 = objc_msgSend(v13, "ic_md5");
    v15 = [*(id *)(a1 + 40) currentResource];
    [v15 setMd5Hash:v14];
  }
LABEL_10:

LABEL_11:
LABEL_12:

LABEL_19:
  if (([*(id *)(a1 + 40) contentLevel] & 0x8000000000000000) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "setContentLevel:", objc_msgSend(*(id *)(a1 + 40), "contentLevel") - 1);
  }
  [*(id *)(a1 + 40) setBufferString:0];
LABEL_22:
}

- (void)parseFileAtBookmarkData:(id)a3 shouldCountOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICEvernoteNoteParser *)self setShouldCountOnly:v4];
  [(ICEvernoteNoteParser *)self setShouldIgnoreCurrentNote:0];
  [(ICEvernoteNoteParser *)self setContentLevel:-1];
  [(ICEvernoteNoteParser *)self setNoteCount:0];
  [(ICEvernoteNoteParser *)self setParseError:0];
  id v16 = 0;
  char v7 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v6 options:256 relativeToURL:0 bookmarkDataIsStale:0 error:&v16];

  id v8 = v16;
  if (v8)
  {
    id v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICEvernoteNoteParser parseFileAtBookmarkData:shouldCountOnly:](v8);
    }
  }
  else
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    [(ICEvernoteNoteParser *)self setParseSemaphore:v10];

    int v11 = [(ICEvernoteNoteParser *)self parseQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICEvernoteNoteParser_parseFileAtBookmarkData_shouldCountOnly___block_invoke;
    block[3] = &unk_1E64A4218;
    int v14 = v7;
    v15 = self;
    dispatch_async(v11, block);

    id v12 = [(ICEvernoteNoteParser *)self parseSemaphore];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    id v9 = v14;
  }
}

void __64__ICEvernoteNoteParser_parseFileAtBookmarkData_shouldCountOnly___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:*(void *)(a1 + 32)];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithStream:v3];
  [v2 setShouldResolveExternalEntities:0];
  [v2 setShouldProcessNamespaces:1];
  [v2 setDelegate:*(void *)(a1 + 40)];
  [v2 parse];
}

- (void)archiveEvernoteNote:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = a3;
    id v6 = [v4 UUID];
    char v7 = [v6 UUIDString];

    id v8 = [(ICEvernoteNoteParser *)self currentImportDirectory];
    id v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];

    dispatch_semaphore_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v5 encodeWithCoder:v10];

    int v11 = [v10 encodedData];
    id v18 = 0;
    char v12 = [v11 writeToURL:v9 options:2 error:&v18];
    id v13 = v18;
    if (v12)
    {
      int v14 = [(ICEvernoteNoteParser *)self currentImportItem];
      [v14 setObject:v7 forKeyedSubscript:@"noteId"];

      v15 = [(ICEvernoteNoteParser *)self importItems];
      id v16 = [(ICEvernoteNoteParser *)self currentImportItem];
      v17 = (void *)[v16 copy];
      [v15 addObject:v17];
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICEvernoteNoteParser archiveEvernoteNote:]();
      }
    }
  }
}

- (void)archiveEvernoteResource:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = a3;
    id v6 = [v4 UUID];
    char v7 = [v6 UUIDString];

    id v8 = [(ICEvernoteNoteParser *)self currentImportDirectory];
    id v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];

    dispatch_semaphore_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v5 encodeWithCoder:v10];

    int v11 = [v10 encodedData];
    id v17 = 0;
    char v12 = [v11 writeToURL:v9 options:2 error:&v17];
    id v13 = v17;
    if (v12)
    {
      int v14 = [(ICEvernoteNoteParser *)self currentImportItem];
      v15 = [v14 objectForKeyedSubscript:@"resourceIds"];

      if (!v15) {
        v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [v15 addObject:v7];
      id v16 = [(ICEvernoteNoteParser *)self currentImportItem];
      [v16 setObject:v15 forKeyedSubscript:@"resourceIds"];
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICEvernoteNoteParser archiveEvernoteResource:]();
      }
    }
  }
}

- (id)importDirectoryURLWithImportIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICEvernoteNoteParser *)self importDirectory];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v8 = v11;

  if (v8)
  {
    id v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICEvernoteNoteParser importDirectoryURLWithImportIdentifier:](v8);
    }
  }
  return v6;
}

- (id)dateFromDateString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)dateFromDateString__dateFormatter;
  if (!dateFromDateString__dateFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v6 = (void *)dateFromDateString__dateFormatter;
    dateFromDateString__dateFormatter = (uint64_t)v5;

    char v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(id)dateFromDateString__dateFormatter setLocale:v7];
    id v8 = (void *)dateFromDateString__dateFormatter;
    id v9 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v8 setTimeZone:v9];

    [(id)dateFromDateString__dateFormatter setDateFormat:@"yyyyMMdd'T'HHmmss'Z'"];
    id v4 = (void *)dateFromDateString__dateFormatter;
  }
  dispatch_semaphore_t v10 = [v4 dateFromString:v3];

  return v10;
}

- (BOOL)shouldCountOnly
{
  return self->_shouldCountOnly;
}

- (void)setShouldCountOnly:(BOOL)a3
{
  self->_shouldCountOnly = a3;
}

- (BOOL)shouldIgnoreCurrentNote
{
  return self->_shouldIgnoreCurrentNote;
}

- (void)setShouldIgnoreCurrentNote:(BOOL)a3
{
  self->_shouldIgnoreCurrentNote = a3;
}

- (unint64_t)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(unint64_t)a3
{
  self->_noteCount = a3;
}

- (OS_dispatch_queue)parseQueue
{
  return self->_parseQueue;
}

- (void)setParseQueue:(id)a3
{
}

- (OS_dispatch_semaphore)parseSemaphore
{
  return self->_parseSemaphore;
}

- (void)setParseSemaphore:(id)a3
{
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void)setParseError:(id)a3
{
}

- (NSMutableString)bufferString
{
  return self->_bufferString;
}

- (void)setBufferString:(id)a3
{
}

- (int64_t)contentLevel
{
  return self->_contentLevel;
}

- (void)setContentLevel:(int64_t)a3
{
  self->_contentLevel = a3;
}

- (NSMutableString)contentString
{
  return self->_contentString;
}

- (void)setContentString:(id)a3
{
}

- (NSMutableArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (ICEvernoteNote)currentNote
{
  return self->_currentNote;
}

- (void)setCurrentNote:(id)a3
{
}

- (ICEvernoteResource)currentResource
{
  return self->_currentResource;
}

- (void)setCurrentResource:(id)a3
{
}

- (NSURL)currentImportDirectory
{
  return self->_currentImportDirectory;
}

- (void)setCurrentImportDirectory:(id)a3
{
}

- (NSMutableDictionary)currentImportItem
{
  return self->_currentImportItem;
}

- (void)setCurrentImportItem:(id)a3
{
}

- (NSMutableArray)importItems
{
  return self->_importItems;
}

- (void)setImportItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importItems, 0);
  objc_storeStrong((id *)&self->_currentImportItem, 0);
  objc_storeStrong((id *)&self->_currentImportDirectory, 0);
  objc_storeStrong((id *)&self->_currentResource, 0);
  objc_storeStrong((id *)&self->_currentNote, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_bufferString, 0);
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_parseSemaphore, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
}

- (void)unarchiveEvernoteNoteFromArchiveId:(void *)a1 noteArchiveId:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error removing note: %@", v4, v5, v6, v7, v8);
}

- (void)unarchiveEvernoteNoteFromArchiveId:noteArchiveId:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error loading Evernote note: %@", v2);
}

- (void)unarchiveEvernoteNoteFromArchiveId:noteArchiveId:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error creating unarchiver: %@", v2);
}

- (void)unarchiveEvernoteResourceFromArchiveId:(void *)a1 resourceArchiveId:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error removing resource: %@", v4, v5, v6, v7, v8);
}

- (void)unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error loading Evernote resource: %@", v2);
}

- (void)cleanupArchiveId:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error cleaning up archive: %@", v4, v5, v6, v7, v8);
}

void __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error occurred during parsing: %@", v4, v5, v6, v7, v8);
}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Couldn't decode data.", v1, 2u);
}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(a1, "length"), 0);
  uint64_t v6 = [MEMORY[0x1E4F28B68] stringFromByteCount:a2 countStyle:0];
  int v7 = 138412546;
  uint8_t v8 = v5;
  __int16 v9 = 2112;
  dispatch_semaphore_t v10 = v6;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Attachment size (%@) is greater then our max (%@)", (uint8_t *)&v7, 0x16u);
}

- (void)parseFileAtBookmarkData:(void *)a1 shouldCountOnly:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error retrieving URL from bookmark data: %@", v4, v5, v6, v7, v8);
}

- (void)archiveEvernoteNote:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Couldn't archive evernote note for import: %@", v2);
}

- (void)archiveEvernoteResource:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Couldn't archive evernote resource for import: %@", v2);
}

- (void)importDirectoryURLWithImportIdentifier:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error creating import directory: %@", v4, v5, v6, v7, v8);
}

@end