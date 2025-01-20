@interface ICEvernoteFileParser
- (BOOL)canHandleFileURL:(id)a3;
- (BOOL)isParsing;
- (BOOL)shouldCancelParsingProcess;
- (ICEvernoteFileParser)init;
- (ICNotesImporterClient)notesImporterClient;
- (NSArray)allowedContentTypes;
- (OS_dispatch_queue)contentParseQueue;
- (id)bookmarkDataFromFileURL:(id)a3;
- (id)getTypeIdentifierForFileURL:(id)a3;
- (void)addAttachmentsInContent:(id)a3 forEvernoteResource:(id)a4 forNote:(id)a5;
- (void)addTitleInContent:(id)a3 forEvernoteNote:(id)a4;
- (void)addTodoListsIfNeededInContent:(id)a3 forEvernoteNote:(id)a4;
- (void)cancelParsing;
- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7;
- (void)setContentParseQueue:(id)a3;
- (void)setIsParsing:(BOOL)a3;
- (void)setNotesImporterClient:(id)a3;
- (void)setShouldCancelParsingProcess:(BOOL)a3;
- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4;
@end

@implementation ICEvernoteFileParser

- (ICEvernoteFileParser)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICEvernoteFileParser;
  v2 = [(ICEvernoteFileParser *)&v9 init];
  if (v2)
  {
    v3 = (ICNotesImporterClient *)objc_alloc_init((Class)ICNotesImporterClient);
    notesImporterClient = v2->_notesImporterClient;
    v2->_notesImporterClient = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.notes.EvernoteFileParser", v5);
    contentParseQueue = v2->_contentParseQueue;
    v2->_contentParseQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(ICEvernoteFileParser *)self isParsing])
  {
    v8 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5E34();
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    [(ICEvernoteFileParser *)self setIsParsing:1];
    objc_super v9 = [(ICEvernoteFileParser *)self bookmarkDataFromFileURL:v6];
    v10 = [(ICEvernoteFileParser *)self notesImporterClient];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001AF68;
    v11[3] = &unk_1000EE6C0;
    v11[4] = self;
    v12 = v7;
    [v10 countEvernoteNotesFromBookmarkData:v9 completionBlock:v11];
  }
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(void))a7;
  if ([(ICEvernoteFileParser *)self isParsing])
  {
    v17 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5E34();
    }

    if (v16) {
      v16[2](v16);
    }
  }
  else
  {
    [(ICEvernoteFileParser *)self setIsParsing:1];
    v18 = [(ICEvernoteFileParser *)self bookmarkDataFromFileURL:v12];
    objc_initWeak(&location, self);
    v19 = [(ICEvernoteFileParser *)self notesImporterClient];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001B1DC;
    v20[3] = &unk_1000EE7B0;
    objc_copyWeak(&v25, &location);
    v20[4] = self;
    id v21 = v15;
    id v22 = v13;
    id v23 = v14;
    v24 = v16;
    [v19 archiveEvernoteNotesFromBookmarkData:v18 completionBlock:v20];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (NSArray)allowedContentTypes
{
  v2 = +[UTType importedTypeWithIdentifier:@"com.evernote.enex"];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (BOOL)canHandleFileURL:(id)a3
{
  v3 = [(ICEvernoteFileParser *)self getTypeIdentifierForFileURL:a3];
  v4 = +[UTType importedTypeWithIdentifier:v3];
  v5 = +[UTType importedTypeWithIdentifier:@"com.evernote.enex"];
  unsigned __int8 v6 = [v4 conformsToType:v5];

  return v6;
}

- (void)cancelParsing
{
  if ([(ICEvernoteFileParser *)self isParsing])
  {
    [(ICEvernoteFileParser *)self setShouldCancelParsingProcess:1];
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5EA8();
    }
  }
}

- (id)bookmarkDataFromFileURL:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  v4 = [v3 bookmarkDataWithOptions:512 includingResourceValuesForKeys:0 relativeToURL:0 error:&v8];
  id v5 = v8;
  if (v5)
  {
    unsigned __int8 v6 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B5EDC((uint64_t)v3, v6);
    }

    v4 = 0;
  }

  return v4;
}

- (void)addAttachmentsInContent:(id)a3 forEvernoteResource:(id)a4 forNote:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v8)
    {
      v10 = [v8 md5Hash];

      if (v10)
      {
        v11 = [v8 md5Hash];
        v38 = +[NSString stringWithFormat:@"{{NotesAttachment:%@}}", v11];

        id v12 = [v7 string];
        id v13 = [v12 length];

        if (v13)
        {
          id v14 = 0;
          do
          {
            id v15 = [v7 string];
            v16 = (char *)((unsigned char *)[v15 length] - v14);

            v17 = [v7 string];
            v18 = [v17 rangeOfString:v38 options:2 range:v14];
            uint64_t v20 = v19;

            if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            id v21 = [v8 mime];
            id v22 = +[UTType typeWithMIMEType:v21];
            id v23 = [v22 identifier];

            v24 = [v8 fileName];
            id v25 = v24;
            if (v24)
            {
              id v26 = v24;
            }
            else
            {
              id v26 = +[ICAttachment filenameFromUTI:v23];
            }
            v27 = v26;

            uint64_t v47 = 0;
            v48 = &v47;
            uint64_t v49 = 0x3032000000;
            v50 = sub_10001BB20;
            v51 = sub_10001BB30;
            id v52 = 0;
            v28 = [v9 managedObjectContext];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_10001C6AC;
            v41[3] = &unk_1000EE7D8;
            id v42 = v9;
            id v29 = v23;
            id v43 = v29;
            id v44 = v8;
            id v30 = v27;
            id v45 = v30;
            v46 = &v47;
            [v28 performBlockAndWait:v41];

            if (v48[5])
            {
              v31 = +[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:");
              id v32 = [v31 mutableCopy];

              [v32 addAttribute:NSAttachmentAttributeName value:v48[5] range:0, [v32 length]];
              id v33 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
              [v32 appendAttributedString:v33];

              [v7 replaceCharactersInRange:v18 withAttributedString:v20];
              id v34 = [v32 length];
            }
            else
            {
              v35 = os_log_create("com.apple.notes", "Import");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                sub_1000B5F54(&buf, v40, v35);
              }

              [v7 replaceCharactersInRange:v18 withString:@"\n\n"];
              id v34 = [@"\n\n" length];
            }
            id v14 = &v18[(void)v34];

            _Block_object_dispose(&v47, 8);
            v36 = [v7 string];
            v37 = (char *)[v36 length];
          }
          while (v14 < v37);
        }
      }
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content", "-[ICEvernoteFileParser addAttachmentsInContent:forEvernoteResource:forNote:]", 1, 0, @"Can't add attachment to nil content.");
  }
}

- (void)addTodoListsIfNeededInContent:(id)a3 forEvernoteNote:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v29 = v6;
    id v30 = 0;
    id v8 = +[NSRegularExpression regularExpressionWithPattern:@"\\{\\{NotesCheckbox\\:(.+?)\\}\\}" options:1 error:&v30];
    id v28 = v30;
    id v9 = &_s10Foundation3URLVSHAAMc_ptr;
    while (1)
    {
      v10 = [v5 string];
      v11 = [v5 string];
      id v12 = [v8 rangeOfFirstMatchInString:v10 options:1 range:[v11 length]];
      uint64_t v14 = v13;

      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL && !v14) {
        break;
      }
      id v15 = [v5 string];
      v16 = [v15 substringWithRange:v12 + 16, v14 - 18];

      id v17 = [objc_alloc((Class)v9[232]) initWithString:&stru_1000F2510];
      [v5 replaceCharactersInRange:v12 withAttributedString:v14];

      v18 = +[ICTTParagraphStyle paragraphStyleNamed:103];
      if ([v16 BOOLValue])
      {
        id v19 = [v18 mutableCopy];
        [v19 todo];
        id v21 = v20 = v9;
        id v22 = [v21 todoWithDone:1];
        [v19 setTodo:v22];

        id v9 = v20;
        id v23 = [v19 copy];

        v18 = v23;
      }
      v24 = [v5 string];
      id v25 = [v24 paragraphRangeForRange:v12];
      uint64_t v27 = v26;

      [v5 addAttribute:ICTTAttributeNameParagraphStyle value:v18 range:v25, v27];
    }

    id v7 = v29;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content", "-[ICEvernoteFileParser addTodoListsIfNeededInContent:forEvernoteNote:]", 1, 0, @"Can't add todo lists to nil content.");
  }
}

- (void)addTitleInContent:(id)a3 forEvernoteNote:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
  [v6 insertAttributedString:v7 atIndex:0];

  id v8 = +[ICTTParagraphStyle paragraphStyleNamed:0];
  id v9 = objc_alloc((Class)NSAttributedString);
  v10 = [v5 title];

  CFStringRef v11 = &stru_1000F2510;
  if (v10) {
    CFStringRef v11 = v10;
  }
  id v12 = +[NSString localizedStringWithFormat:@"%@\n", v11];
  uint64_t v15 = ICTTAttributeNameParagraphStyle;
  v16 = v8;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v14 = [v9 initWithString:v12 attributes:v13];

  [v6 insertAttributedString:v14 atIndex:0];
}

- (id)getTypeIdentifierForFileURL:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v9 = 0;
  unsigned __int8 v4 = [v3 getResourceValue:&v10 forKey:NSURLTypeIdentifierKey error:&v9];
  id v5 = v10;
  id v6 = v9;
  if ((v4 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B5A58(v6, (uint64_t)v3, v7);
    }
  }

  return v5;
}

- (ICNotesImporterClient)notesImporterClient
{
  return self->_notesImporterClient;
}

- (void)setNotesImporterClient:(id)a3
{
}

- (OS_dispatch_queue)contentParseQueue
{
  return self->_contentParseQueue;
}

- (void)setContentParseQueue:(id)a3
{
}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (BOOL)shouldCancelParsingProcess
{
  return self->_shouldCancelParsingProcess;
}

- (void)setShouldCancelParsingProcess:(BOOL)a3
{
  self->_shouldCancelParsingProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentParseQueue, 0);

  objc_storeStrong((id *)&self->_notesImporterClient, 0);
}

@end