@interface MFMailMimePart
+ (BOOL)isRecognizedClassForContent:(id)a3;
+ (Class)attachmentClass;
- (BOOL)_shouldContinueDecodingProcess;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7;
- (id)decodeMessagePartial;
- (id)decodeMessageRfc822;
- (id)decodeMultipartAppledouble;
- (id)decodeTextEnriched;
- (id)decodeTextHtml;
- (id)decodeTextPlain;
- (id)decodeTextRichtext;
- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4;
- (id)fileWrapperForcingDownload:(BOOL)a3;
- (id)htmlContent;
- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5;
- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5;
- (void)configureFileWrapper:(id)a3;
@end

@implementation MFMailMimePart

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MFMailMimePart;
  id v8 = [(MFMailMimePart *)&v21 contentToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:a6 isComplete:a7];
  v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(MFWebMessageDocument **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [[MFWebMessageDocument alloc] initWithMimePart:self htmlData:[(MFWebMessageDocument *)v14 dataUsingEncoding:4] encoding:134217984];
            v15 = v14;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v14 = [[MFContentErrorDocument alloc] initWithMimePart:self];
            }
          }
          if (v14) {
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else if ([(MFMailMimePart *)self _shouldContinueDecodingProcess])
  {
    objc_msgSend(v9, "addObject:", -[MFContentErrorDocument initWithMimePart:]([MFContentErrorDocument alloc], "initWithMimePart:", self));
  }
  return v9;
}

- (id)decodeTextRichtext
{
  uint64_t v3 = _MFDecodeText();
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F73440]), "BOOLValue");
  return -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, objc_msgSend((id)objc_msgSend(NSString, "mf_stringFromMimeRichTextString:asHTML:", v3, v5), "dataUsingEncoding:", 4), 134217984);
}

- (id)decodeTextEnriched
{
  uint64_t v3 = _MFDecodeText();
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F73440]), "BOOLValue");
  return -[MFWebMessageDocument initWithMimePart:htmlData:encoding:]([MFWebMessageDocument alloc], "initWithMimePart:htmlData:encoding:", self, objc_msgSend((id)objc_msgSend(NSString, "mf_stringFromMimeEnrichedString:asHTML:", v3, v5), "dataUsingEncoding:", 4), 134217984);
}

- (id)decodeTextHtml
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v4 = _MFOffsetFromThreadDictionary();
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F73450]), "BOOLValue");
  uint64_t v12 = 0;
  unsigned __int8 v11 = 0;
  v6 = (void *)[(MFMailMimePart *)self copyBodyDataToOffset:v4 resultOffset:&v12 downloadIfNecessary:v5 isComplete:&v11];
  id v7 = (id)objc_msgSend(objc_allocWithZone((Class)MFWebMessageDocument), "initWithMimePart:htmlData:encoding:", self, v6, -[MFMailMimePart textEncoding](self, "textEncoding"));

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v12];
  [v3 setObject:v8 forKey:*MEMORY[0x1E4F73468]];
  uint64_t v9 = [NSNumber numberWithBool:v11];
  [v3 setObject:v9 forKey:*MEMORY[0x1E4F73458]];
  return v7;
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return [(MFMailMimePart *)self contentToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:1 isComplete:0];
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return [(MFMailMimePart *)self htmlContentToOffset:a3 resultOffset:a4 downloadIfNecessary:1];
}

- (id)htmlContent
{
  return [(MFMailMimePart *)self htmlContentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 downloadIfNecessary:1];
}

- (id)decodeTextPlain
{
  int v12 = 0;
  uint64_t v3 = (void *)_MFCopyDecodeText();
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  int v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F73440]), "BOOLValue");
  unsigned __int8 v11 = 0;
  int v6 = _formatFlowedOptions(self);
  if (v5) {
    int v7 = 12;
  }
  else {
    int v7 = 4;
  }
  uint64_t v8 = objc_msgSend(v3, "mf_convertFromFlowedText:visuallyEmpty:", v6 | v7, &v11);

  uint64_t v9 = objc_msgSend(objc_allocWithZone((Class)MFWebMessageDocument), "initWithMimePart:htmlData:encoding:", self, objc_msgSend(v8, "mf_dataUsingEncoding:", 4), 134217984);
  [v9 setVisuallyEmpty:v11];
  return v9;
}

- (id)decodeMultipartAppledouble
{
  v2 = objc_msgSend((id)-[MFMailMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart");
  return (id)[v2 fileWrapperForcingDownload:0];
}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  int v6 = (void *)[v5 performSelector:sel__attachmentStorageLocation];
  if (!v6
    || (v7 = objc_msgSend(v6, "stringByAppendingPathComponent:", -[MFMailMimePart partNumber](self, "partNumber")), (uint64_t v8 = -[MFMailMimePart attachmentFilename](self, "attachmentFilename")) == 0)|| (v9 = v8, v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F73500]), "initWithPath:", objc_msgSend(v7, "stringByAppendingPathComponent:", v8)), objc_msgSend(v10, "setPreferredFilename:", v9), objc_msgSend(v10, "setFilename:", objc_msgSend(v10, "preferredFilename")), -[MFMailMimePart configureFileWrapper:](self, "configureFileWrapper:", v10), !v10))
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)MFMailMimePart;
    return [(MFMailMimePart *)&v12 fileWrapperForcingDownload:v3];
  }
  return v10;
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (id)[a3 fileWrapper];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFMailMimePart;
    return [(MFMailMimePart *)&v8 fileWrapperForDecodedObject:a3 withFileData:a4];
  }
}

- (void)configureFileWrapper:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MFMailMimePart;
  -[MFMailMimePart configureFileWrapper:](&v13, sel_configureFileWrapper_);
  if (a3)
  {
    uint64_t v5 = [(MFMailMimePart *)self bodyParameterForKey:*MEMORY[0x1E4F73430]];
    if (v5
      || (objc_super v12 = objc_msgSend((id)objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message"), "URL")) != 0&& (v5 = objc_msgSend(v12, "stringByAppendingFormat:", @"&aid=%@", -[MFMailMimePart partNumber](self, "partNumber"))) != 0)
    {
      [a3 setURL:v5];
    }
  }
  if (([a3 isPlaceholder] & 1) == 0)
  {
    int v6 = objc_msgSend((id)-[MFMailMimePart mimeBody](self, "mimeBody"), "message");
    if (objc_opt_respondsToSelector())
    {
      int v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      objc_super v8 = (void *)[v6 performSelector:sel__attachmentStorageLocation];
      if (v8)
      {
        uint64_t v9 = objc_msgSend(v8, "stringByAppendingPathComponent:", -[MFMailMimePart partNumber](self, "partNumber"));
        if (([v7 fileExistsAtPath:v9] & 1) == 0) {
          [v7 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
        }
        uint64_t v10 = [a3 preferredFilename];
        if (v10)
        {
          uint64_t v11 = [v9 stringByAppendingPathComponent:v10];
          if (([v7 fileExistsAtPath:v11] & 1) == 0)
          {
            objc_msgSend(v7, "createFileAtPath:contents:attributes:", v11, objc_msgSend(a3, "regularFileContents"), objc_msgSend(a3, "fileAttributes"));
            [a3 setPath:v11];
          }
        }
      }
    }
  }
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v8 = (void *)[a4 messageStore];
  return (id)[v8 storeData:a3 forMimePart:self isComplete:v5];
}

- (BOOL)_shouldContinueDecodingProcess
{
  return objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error") == 0;
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MFMailMimePart;
  return objc_msgSendSuper2(&v6, sel_isRecognizedClassForContent_, a3);
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

- (id)decodeMessageRfc822
{
  BOOL v3 = (void *)[(MFMailMimePart *)self bodyData];
  if (v3)
  {
    uint64_t v4 = +[MFMessage messageWithRFC822Data:v3 withParentPart:self];
    BOOL v5 = (void *)[(MFMailMimePart *)self mimeBody];
    if (v5)
    {
      objc_super v6 = v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "message"), "messageURL");
      [(MFMailMessage *)v4 setMessageURL:v7];
      objc_super v8 = -[MFRFC822AttachmentDataProvider initWithMessageData:parentPart:]([MFRFC822AttachmentDataProvider alloc], "initWithMessageData:parentPart:", v3, [v6 topLevelPart]);
      objc_msgSend((id)objc_msgSend(+[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers"), "anyObject"), "addProvider:forBaseURL:", v8, v7);
    }
    unsigned __int8 v13 = 0;
    uint64_t v9 = (void *)[(MFMailMessage *)v4 messageBody];
    if ([(MFMailMimePart *)self isGenerated]) {
      BOOL v3 = (void *)[v9 contentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 asHTML:1 isComplete:&v13];
    }
    else {
      unsigned __int8 v13 = 1;
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
    uint64_t v11 = [NSNumber numberWithBool:v13];
    [v10 setObject:v11 forKey:*MEMORY[0x1E4F73458]];
    if (v9 && objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E4F73448]), "BOOLValue")) {
      [v10 setObject:v9 forKey:*MEMORY[0x1E4F73460]];
    }
  }
  return v3;
}

- (id)decodeMessagePartial
{
  return (id)[NSString stringWithFormat:@"Partial message, part %@ of %@\nTo read this message, select all of the parts of the message and select the Message --> MIME --> Combine Messages menu item.\n", -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", @"number", -[MFMailMimePart bodyParameterForKey:](self, "bodyParameterForKey:", @"total"];
}

@end