@interface MFMailMimePart
+ (BOOL)isRecognizedClassForContent:(id)a3;
+ (Class)attachmentClass;
+ (id)log;
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
- (id)htmlContent;
- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5;
- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5;
- (void)configureFileWrapper:(id)a3;
- (void)decodeTextHtml;
@end

@implementation MFMailMimePart

- (id)decodeTextHtml
{
  v3 = +[MFActivityMonitor currentMonitor];
  [v3 recordTransportType:1];

  v4 = [MEMORY[0x1E4F29060] currentThread];
  v5 = [v4 threadDictionary];

  uint64_t v6 = _MFOffsetFromThreadDictionary();
  v7 = [v5 objectForKey:*MEMORY[0x1E4F73450]];
  uint64_t v8 = [v7 BOOLValue];

  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unsigned __int8 v16 = 0;
  v9 = (void *)[(MFMailMimePart *)self copyBodyDataToOffset:v6 resultOffset:&v17 downloadIfNecessary:v8 isComplete:&v16];
  if (v9)
  {
    v10 = [[MFWebMessageDocument alloc] initWithMimePart:self htmlData:v9 encoding:[(MFMailMimePart *)self textEncoding]];
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v17];
    [v5 setObject:v11 forKey:*MEMORY[0x1E4F73468]];

    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v16];
    [v5 setObject:v12 forKey:*MEMORY[0x1E4F73458]];
  }
  else
  {
    v13 = +[MFMailMimePart log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MFMailMimePart decodeTextHtml](v13);
    }

    v12 = +[MFActivityMonitor currentMonitor];
    v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1039 localizedDescription:0];
    [v12 setError:v14];

    v10 = 0;
  }

  return v10;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v13 = +[MFActivityMonitor currentMonitor];
  [v13 recordTransportType:1];

  v29.receiver = self;
  v29.super_class = (Class)MFMailMimePart;
  v24 = [(MFMailMimePart *)&v29 contentToOffset:a3 resultOffset:a4 downloadIfNecessary:v9 asHTML:v8 isComplete:a7];
  v14 = [MEMORY[0x1E4F1CA48] array];
  if (v24)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v15 = v24;
    uint64_t v16 = [(MFContentErrorDocument *)v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (!v16) {
      goto LABEL_20;
    }
    uint64_t v17 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = [v19 dataUsingEncoding:4];
          v21 = [[MFWebMessageDocument alloc] initWithMimePart:self htmlData:v20 encoding:134217984];

          if (v21) {
            goto LABEL_14;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v22 = [[MFContentErrorDocument alloc] initWithMimePart:self];
          }
          else {
            v22 = v19;
          }
          v21 = (MFWebMessageDocument *)v22;
          if (v22) {
LABEL_14:
          }
            [v14 addObject:v21];
        }
      }
      uint64_t v16 = [(MFContentErrorDocument *)v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (!v16)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
  }
  if ([(MFMailMimePart *)self _shouldContinueDecodingProcess])
  {
    v15 = [[MFContentErrorDocument alloc] initWithMimePart:self];
    [v14 addObject:v15];
    goto LABEL_20;
  }
LABEL_21:

  return v14;
}

- (void)configureFileWrapper:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMailMimePart;
  [(MFMailMimePart *)&v10 configureFileWrapper:v4];
  if (v4)
  {
    v5 = [(MFMailMimePart *)self bodyParameterForKey:*MEMORY[0x1E4F73430]];
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v6 = [(MFMailMimePart *)self mimeBody];
    v7 = [v6 message];
    v5 = [v7 URL];

    if (v5)
    {
      BOOL v8 = [(MFMailMimePart *)self partNumber];
      uint64_t v9 = [v5 stringByAppendingFormat:@"&aid=%@", v8];

      v5 = (void *)v9;
      if (v9) {
LABEL_3:
      }
        [v4 setURL:v5];
    }
  }
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MFMailMimePart;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_isRecognizedClassForContent_, v4);
  }

  return v5;
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MFMailMimePart_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v2 = (void *)log_log_8;
  return v2;
}

void __21__MFMailMimePart_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

- (id)decodeTextRichtext
{
  id v3 = _MFDecodeText();
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  unsigned __int8 v5 = [v4 threadDictionary];

  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F73440]];
  uint64_t v7 = [v6 BOOLValue];

  BOOL v8 = objc_msgSend(NSString, "mf_stringFromMimeRichTextString:asHTML:", v3, v7);
  uint64_t v9 = [MFWebMessageDocument alloc];
  objc_super v10 = [v8 dataUsingEncoding:4];
  v11 = [(MFWebMessageDocument *)v9 initWithMimePart:self htmlData:v10 encoding:134217984];

  return v11;
}

- (id)decodeTextEnriched
{
  id v3 = _MFDecodeText();
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  unsigned __int8 v5 = [v4 threadDictionary];

  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F73440]];
  uint64_t v7 = [v6 BOOLValue];

  BOOL v8 = objc_msgSend(NSString, "mf_stringFromMimeEnrichedString:asHTML:", v3, v7);
  uint64_t v9 = [MFWebMessageDocument alloc];
  objc_super v10 = [v8 dataUsingEncoding:4];
  v11 = [(MFWebMessageDocument *)v9 initWithMimePart:self htmlData:v10 encoding:134217984];

  return v11;
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
  int v14 = -1431655766;
  id v3 = (void *)_MFCopyDecodeText();
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  unsigned __int8 v5 = [v4 threadDictionary];

  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73440]];
  int v7 = [v6 BOOLValue];

  unsigned __int8 v13 = 0;
  if (v7) {
    uint64_t v8 = [(MFMimePart *)self formatFlowedOptions] | 0xC;
  }
  else {
    uint64_t v8 = [(MFMimePart *)self formatFlowedOptions] | 4;
  }
  uint64_t v9 = objc_msgSend(v3, "mf_convertFromFlowedText:visuallyEmpty:", v8, &v13);
  objc_super v10 = objc_msgSend(v9, "mf_dataUsingEncoding:", 4);
  v11 = (void *)[objc_allocWithZone((Class)MFWebMessageDocument) initWithMimePart:self htmlData:v10 encoding:134217984];
  [v11 setVisuallyEmpty:v13];

  return v11;
}

- (id)decodeMultipartAppledouble
{
  v2 = [(MFMailMimePart *)self firstChildPart];
  id v3 = [v2 nextSiblingPart];
  id v4 = [v3 fileWrapperForcingDownload:0];

  return v4;
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 fileWrapper];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFMailMimePart;
    uint64_t v7 = [(MFMailMimePart *)&v10 fileWrapperForDecodedObject:v6 withFileData:a4];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 messageStore];
  objc_super v10 = [v9 storeData:v8 forMimePart:self isComplete:v5];

  return v10;
}

- (BOOL)_shouldContinueDecodingProcess
{
  v2 = +[MFActivityMonitor currentMonitor];
  id v3 = [v2 error];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)decodeMessageRfc822
{
  id v3 = [(MFMailMimePart *)self bodyData];
  if (v3)
  {
    BOOL v4 = +[MFMessage messageWithRFC822Data:v3 withParentPart:self];
    BOOL v5 = [(MFMailMimePart *)self mimeBody];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 message];
      id v8 = [v7 messageURL];

      [v4 setMessageURL:v8];
      uint64_t v9 = [MFRFC822AttachmentDataProvider alloc];
      objc_super v10 = [v6 topLevelPart];
      v11 = [(MFRFC822AttachmentDataProvider *)v9 initWithMessageData:v3 parentPart:v10];

      v12 = +[MFAttachmentManager allManagers];
      unsigned __int8 v13 = [v12 anyObject];
      [v13 addProvider:v11 forBaseURL:v8];
    }
    unsigned __int8 v22 = 0;
    int v14 = [v4 messageBody];
    if ([(MFMailMimePart *)self isGenerated])
    {
      id v15 = [v14 contentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 asHTML:1 isComplete:&v22];
    }
    else
    {
      id v15 = v3;
      unsigned __int8 v22 = 1;
    }
    uint64_t v16 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v17 = [v16 threadDictionary];

    v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v22];
    [v17 setObject:v18 forKey:*MEMORY[0x1E4F73458]];

    if (v14)
    {
      v19 = [v17 objectForKey:*MEMORY[0x1E4F73448]];
      int v20 = [v19 BOOLValue];

      if (v20) {
        [v17 setObject:v14 forKey:*MEMORY[0x1E4F73460]];
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)decodeMessagePartial
{
  id v3 = NSString;
  BOOL v4 = [(MFMailMimePart *)self bodyParameterForKey:@"number"];
  BOOL v5 = [(MFMailMimePart *)self bodyParameterForKey:@"total"];
  id v6 = [v3 stringWithFormat:@"Partial message, part %@ of %@\nTo read this message, select all of the parts of the message and select the Message --> MIME --> Combine Messages menu item.\n", v4, v5];

  return v6;
}

- (void)decodeTextHtml
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to decode text html due to missing data", v1, 2u);
}

@end