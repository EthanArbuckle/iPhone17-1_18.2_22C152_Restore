@interface MFMessageWriter
- (BOOL)allows8BitMimeParts;
- (BOOL)allowsBinaryMimeParts;
- (BOOL)allowsQuotedPrintable;
- (BOOL)shouldWriteAttachmentPlaceholders;
- (MFMessageWriter)init;
- (MFMessageWriter)initWithCompositionSpecification:(id)a3;
- (NSDictionary)compositionSpecification;
- (id)_mimePartWithType:(id)a3 subtype:(id)a4 bodyData:(id)a5 partMap:(__CFDictionary *)a6 subparts:(id)a7;
- (id)_newDataForMimePart:(id)a3 withPartData:(id)a4 andHeaders:(id)a5;
- (id)createMessageWithHTMLStringAndMIMECharset:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6;
- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4;
- (id)createMessageWithString:(id)a3 headers:(id)a4;
- (id)delegate;
- (id)newDataForMimePart:(id)a3 withPartData:(id)a4;
- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5;
- (void)appendHeadersForMimePart:(id)a3 toHeaders:(id)a4;
- (void)setAllows8BitMimeParts:(BOOL)a3;
- (void)setAllowsBinaryMimeParts:(BOOL)a3;
- (void)setAllowsQuotedPrintable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageClassToInstantiate:(Class)a3;
- (void)setShouldWriteAttachmentPlaceholders:(BOOL)a3;
- (void)setWriteSizeDispositionParameter:(BOOL)a3;
@end

@implementation MFMessageWriter

void ___ef_log_MFMessageWriter_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MFMessageWriter");
  v1 = (void *)_ef_log_MFMessageWriter_log;
  _ef_log_MFMessageWriter_log = (uint64_t)v0;
}

- (MFMessageWriter)init
{
  return [(MFMessageWriter *)self initWithCompositionSpecification:0];
}

- (MFMessageWriter)initWithCompositionSpecification:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMessageWriter;
  v5 = [(MFMessageWriter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(MFMessageWriter *)v5 setAllowsQuotedPrintable:1];
    v6->_messageClassToInstantiate = (Class)objc_opt_class();
    uint64_t v7 = [v4 copy];
    compositionSpecification = v6->_compositionSpecification;
    v6->_compositionSpecification = (NSDictionary *)v7;
  }
  return v6;
}

- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5
{
  id key = a3;
  id v8 = a4;
  CFDictionaryRef v9 = (const __CFDictionary *)a5;
  objc_super v10 = [key type];
  char v11 = [@"multipart" isEqualToString:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  if ((v11 & 1) != 0 || CFDictionaryGetValue(v9, key) || ([key range], !v14))
  {
    _appendPartDataToConsumer(self, key, v12, v9, 1);
  }
  else
  {
    objc_msgSend(v8, "setLength:", objc_msgSend(v8, "length") - 1);
    _appendPartHeadersToConsumer(self, key, v9, v12);
  }
  [v12 done];
  v13 = [v12 data];
  [v8 appendData:v13];
}

- (id)createMessageWithString:(id)a3 headers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  CFDictionaryRef v9 = _createPartAndDataForString(self, v6, 0, @"plain", Mutable);
  objc_super v10 = _createOutgoingMessageFromTopLevelMimePart(self, v9, v7, Mutable);

  CFRelease(Mutable);
  return v10;
}

- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  v24 = v6;
  cf = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  unint64_t v26 = [v6 count];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v7)
  {

    v22 = 0;
    id v8 = 0;
    goto LABEL_32;
  }
  id v8 = 0;
  uint64_t v9 = *(void *)v30;
  do
  {
    uint64_t v10 = 0;
    char v11 = v8;
    do
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = _createPlainTextPart(self, v12, cf);
LABEL_8:
        id v14 = (id)v13;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        uint64_t v13 = _createPartForMFAttachment(self, v12, 0, cf);
        goto LABEL_8;
      }
      v15 = self;
      id v16 = v12;
      if ([v16 isPlaceholder])
      {
        v17 = [v16 mimePart];
        v18 = [v17 fileWrapperForcingDownload:1];

        v19 = [v16 fileWrapperForcingDownload:0];
        v20 = [v19 contentID];
        [v18 setContentID:v20];

        if (v18) {
          goto LABEL_13;
        }
      }
      v18 = [v16 fileWrapperForcingDownload:1];
      if (v18)
      {
LABEL_13:
        _createPartForFileWrapper(v15, v18, cf);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }

LABEL_18:
      if (!v14)
      {
LABEL_21:

        id v14 = 0;
        id v8 = 0;
        goto LABEL_22;
      }
      if (v11)
      {
        [v11 addSubpart:v14];
        id v8 = v11;
      }
      else if (v26 < 2)
      {
        id v14 = v14;
        id v8 = v14;
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F73530]);
        [v8 setType:@"multipart"];
        [v8 setSubtype:@"mixed"];
        [v8 addSubpart:v14];
      }
LABEL_22:

      ++v10;
      char v11 = v8;
    }
    while (v7 != v10);
    uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v7 = v21;
  }
  while (v21);

  if (v8)
  {
    v22 = _createOutgoingMessageFromTopLevelMimePart(self, v8, v25, cf);
  }
  else
  {
    v22 = 0;
  }
LABEL_32:
  CFRelease(cf);

  return v22;
}

- (id)createMessageWithHTMLStringAndMIMECharset:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v66 = a4;
  id v10 = a5;
  id v65 = a6;
  v68 = v9;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  if (v9)
  {
    id v12 = [v9 string];
    uint64_t v13 = [v9 charset];
    id v14 = _createPartAndDataForString(self, v12, v13, @"html", Mutable);
  }
  else
  {
    id v14 = 0;
  }
  unint64_t v67 = [v10 count];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
  cf = Mutable;
  BOOL v64 = v15 != 0;
  if (v15)
  {
    BOOL v16 = 0;
    v17 = 0;
    uint64_t v18 = *(void *)v73;
LABEL_6:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v73 != v18) {
        objc_enumerationMutation(obj);
      }
      if (v16) {
        goto LABEL_61;
      }
      v20 = *(void **)(*((void *)&v72 + 1) + 8 * v19);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        _ef_log_MFMessageWriter();
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
          v27 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
          *(_DWORD *)buf = 138412802;
          v77 = v20;
          __int16 v78 = 2112;
          id v79 = v26;
          __int16 v80 = 2112;
          v81 = v27;
          _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "*** BAD!!! Used old attachments for %@\n\n%@\n\n%@", buf, 0x20u);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = v20;
          if (v68) {
            BOOL v29 = v14 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          int v30 = !v29;
          if (v17) {
            int v31 = 1;
          }
          else {
            int v31 = v30;
          }
          uint64_t v32 = _createPartForMFAttachment(self, v28, v31, cf);
LABEL_29:
          id v24 = (id)v32;
LABEL_30:
          if (v24) {
            BOOL v16 = 0;
          }
          else {
            BOOL v16 = v20 != 0;
          }

          if (v24)
          {
            if (v14)
            {
              if (v68)
              {
                if (!v17)
                {
                  id v33 = objc_alloc_init(MEMORY[0x1E4F73530]);
                  [v33 setType:@"multipart"];
                  [v33 setSubtype:@"related"];
                  v17 = v33;
                  [v33 addSubpart:v14];
                }
                [v17 addSubpart:v24];
              }
              else
              {
                [v14 addSubpart:v24];
              }
            }
            else if (v67 < 2)
            {
              id v24 = v24;
              id v14 = v24;
            }
            else
            {
              id v34 = objc_alloc_init(MEMORY[0x1E4F73530]);
              [v34 setType:@"multipart"];
              [v34 setSubtype:@"mixed"];
              id v14 = v34;
              [v34 addSubpart:v24];
            }
          }
          else
          {
            id v24 = 0;
          }
          goto LABEL_44;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v32 = _createPartForFileWrapper(self, v20, cf);
          goto LABEL_29;
        }
        _ef_log_MFMessageWriter();
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v77 = v35;
          __int16 v78 = 2048;
          id v79 = v20;
          id v36 = v35;
          _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "*** Unexpected object <%@:%p>", buf, 0x16u);
        }
      }

      id v24 = 0;
      BOOL v16 = 0;
LABEL_44:

      if (v15 == ++v19)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
        uint64_t v15 = v37;
        if (v37) {
          goto LABEL_6;
        }

        BOOL v38 = v17 == 0;
        if (v17) {
          char v39 = v16;
        }
        else {
          char v39 = 1;
        }
        if (v17) {
          v40 = v17;
        }
        else {
          v40 = v14;
        }
        if ((v39 & 1) == 0)
        {
          v41 = [v17 firstChildPart];
          v42 = v41;
          if (v41)
          {
            v43 = NSString;
            v44 = [v41 type];
            v45 = [v42 subtype];
            v46 = [v43 stringWithFormat:@"%@/%@", v44, v45];
            [v17 setBodyParameter:v46 forKey:@"type"];
          }
          BOOL v38 = 0;
          BOOL v16 = 0;
          v40 = v17;
        }
        goto LABEL_65;
      }
    }
    id v21 = v20;
    v22 = [v21 string];
    v23 = [v21 charset];
    _createPartAndDataForString(self, v22, v23, @"html", cf);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  v17 = 0;
LABEL_61:

  BOOL v38 = v17 == 0;
  if (v17) {
    v40 = v17;
  }
  else {
    v40 = v14;
  }
  BOOL v16 = v64;
LABEL_65:
  id v47 = v40;
  if (v66)
  {
    v48 = _createPlainTextPart(self, v66, cf);
    id v49 = v48;
    if (v48) {
      char v50 = v16;
    }
    else {
      char v50 = 1;
    }
    if ((v50 & 1) == 0)
    {
      if (v47)
      {
        id v51 = objc_alloc_init(MEMORY[0x1E4F73530]);
        [v51 setType:@"multipart"];
        [v51 setSubtype:@"alternative"];
        [v51 addSubpart:v49];
        [v51 addSubpart:v47];

        id v47 = v51;
      }
      else
      {
        id v49 = v48;
        id v47 = v49;
      }
    }
  }
  else
  {
    id v49 = 0;
  }
  if (v47) {
    char v52 = v16;
  }
  else {
    char v52 = 1;
  }
  if (v52)
  {
    v53 = 0;
    goto LABEL_91;
  }
  if (!v38) {
    goto LABEL_90;
  }
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v54 addObject:v47];
  while ([v54 count])
  {
    v55 = [v54 lastObject];
    [v54 removeLastObject];
    v56 = [v55 type];
    int v57 = [v56 isEqualToString:@"multipart"];

    if (v57)
    {
      v58 = [v55 subparts];
      [v54 addObjectsFromArray:v58];

      goto LABEL_88;
    }
    v59 = [v55 disposition];
    if ([v59 isEqualToString:@"attachment"])
    {
    }
    else
    {
      v60 = [v55 disposition];
      int v61 = [v60 isEqualToString:@"inline"];

      if (!v61) {
        goto LABEL_88;
      }
    }
    [v55 setContentID:0];
LABEL_88:
  }
LABEL_90:
  v53 = _createOutgoingMessageFromTopLevelMimePart(self, v47, v65, cf);
LABEL_91:
  if (cf) {
    CFRelease(cf);
  }
  id v62 = v53;

  return v62;
}

- (void)appendHeadersForMimePart:(id)a3 toHeaders:(id)a4
{
}

- (id)newDataForMimePart:(id)a3 withPartData:(id)a4
{
  return [(MFMessageWriter *)self _newDataForMimePart:a3 withPartData:a4 andHeaders:0];
}

- (id)_mimePartWithType:(id)a3 subtype:(id)a4 bodyData:(id)a5 partMap:(__CFDictionary *)a6 subparts:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = objc_opt_new();
  [v15 setType:v11];
  [v15 setSubtype:v12];
  [v15 setSubparts:v14];
  if (v13) {
    CFDictionarySetValue(a6, v15, v13);
  }

  return v15;
}

- (id)_newDataForMimePart:(id)a3 withPartData:(id)a4 andHeaders:(id)a5
{
  id v8 = a3;
  CFDictionaryRef v9 = (const __CFDictionary *)a4;
  id v10 = a5;
  id v11 = _makeOutgoingMessageBody(self);
  id v12 = [v11 message];
  id v13 = +[MFActivityMonitor currentMonitor];
  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  [v12 setMutableHeaders:v10];
  if (_makeMimeHeadersConsistent(self, v8, v9) && ([v13 shouldCancel] & 1) == 0)
  {
    appendHeadersToMessageHeaders(self, v8, v10);
    _appendPartDataToConsumer(self, v8, v11, v9, 0);
    [v11 done];
    id v14 = [v12 messageData];
  }
  else
  {
    id v14 = 0;
  }
  [v12 setMessageBody:0];

  return v14;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id obj = a3;
  objc_storeWeak(p_delegate, 0);
  objc_storeWeak(p_delegate, obj);
}

- (BOOL)allows8BitMimeParts
{
  return *((unsigned char *)self + 16) & 1;
}

- (void)setAllows8BitMimeParts:(BOOL)a3
{
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
}

- (BOOL)allowsBinaryMimeParts
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setAllowsBinaryMimeParts:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v3;
}

- (BOOL)allowsQuotedPrintable
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setAllowsQuotedPrintable:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v3;
}

- (void)setWriteSizeDispositionParameter:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v3;
}

- (void)setMessageClassToInstantiate:(Class)a3
{
  if (self->_messageClassToInstantiate != a3)
  {
    if (![(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
      -[MFMessageWriter setMessageClassToInstantiate:]((uint64_t)a3);
    }
    self->_messageClassToInstantiate = a3;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (BOOL)shouldWriteAttachmentPlaceholders
{
  return self->_shouldWriteAttachmentPlaceholders;
}

- (void)setShouldWriteAttachmentPlaceholders:(BOOL)a3
{
  self->_shouldWriteAttachmentPlaceholders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)setMessageClassToInstantiate:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = _ef_log_MFMessageWriter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Must be called with a subclass of MFOutgoingMessage.  You provided %@", (uint8_t *)&v3, 0xCu);
  }

  __assert_rtn("-[MFMessageWriter setMessageClassToInstantiate:]", "MessageWriter.m", 1416, "0");
}

@end