@interface MFMessageWriter
- (BOOL)allows8BitMimeParts;
- (BOOL)allowsBinaryMimeParts;
- (BOOL)allowsQuotedPrintable;
- (BOOL)shouldWriteAttachmentPlaceholders;
- (MFMessageWriter)init;
- (MFMessageWriter)initWithCompositionSpecification:(id)a3;
- (NSDictionary)compositionSpecification;
- (id)createMessageWithHtmlString:(id)a3 attachments:(id)a4 headers:(id)a5;
- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 charsets:(id)a6 headers:(id)a7;
- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6;
- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4;
- (id)createMessageWithString:(id)a3 headers:(id)a4;
- (id)delegate;
- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5;
- (void)dealloc;
- (void)setAllows8BitMimeParts:(BOOL)a3;
- (void)setAllowsBinaryMimeParts:(BOOL)a3;
- (void)setAllowsQuotedPrintable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageClassToInstantiate:(Class)a3;
- (void)setShouldWriteAttachmentPlaceholders:(BOOL)a3;
- (void)setWriteSizeDispositionParameter:(BOOL)a3;
@end

@implementation MFMessageWriter

- (MFMessageWriter)init
{
  return [(MFMessageWriter *)self initWithCompositionSpecification:0];
}

- (MFMessageWriter)initWithCompositionSpecification:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMessageWriter;
  v4 = [(MFMessageWriter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(MFMessageWriter *)v4 setAllowsQuotedPrintable:1];
    v5->_messageClassToInstantiate = (Class)objc_opt_class();
    v5->_compositionSpecification = (NSDictionary *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageWriter;
  [(MFMessageWriter *)&v3 dealloc];
}

- (void)appendDataForMimePart:(id)a3 toData:(id)a4 withPartData:(id)a5
{
  char v9 = objc_msgSend(@"multipart", "isEqualToString:", objc_msgSend(a3, "type"));
  id v10 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  id v13 = v10;
  if ((v9 & 1) != 0
    || (Value = CFDictionaryGetValue((CFDictionaryRef)a5, a3), id v10 = v13, Value)
    || (objc_msgSend(a3, "range", v13), id v10 = v13, !v12))
  {
    _appendPartDataToConsumer((uint64_t)self, a3, (uint64_t)v10, (const __CFDictionary *)a5, 1);
  }
  else
  {
    objc_msgSend(a4, "setLength:", objc_msgSend(a4, "length", v13) - 1);
    _appendPartHeadersToConsumer((uint64_t)self, a3, (const __CFDictionary *)a5);
  }
  [v13 done];
  objc_msgSend(a4, "appendData:", objc_msgSend(v13, "data"));
}

- (id)createMessageWithString:(id)a3 headers:(id)a4
{
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  id PartAndDataForString = _createPartAndDataForString(a3, 0, @"plain", Mutable);
  id OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, PartAndDataForString, a4, Mutable);

  CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithPlainTextDocumentsAndAttachments:(id)a3 headers:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  unint64_t v19 = [a3 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8) {
    goto LABEL_27;
  }
  id v18 = a4;
  id v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id PlainTextPart = _createPlainTextPart(v12, Mutable);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!objc_msgSend(v12, "isPlaceholder", v18)
            || (v14 = objc_msgSend((id)objc_msgSend(v12, "mimePart"), "fileWrapperForcingDownload:", 1),
                objc_msgSend(v14, "setContentID:", objc_msgSend((id)objc_msgSend(v12, "fileWrapperForcingDownload:", 0), "contentID")), !v14))
          {
            v14 = (void *)[v12 fileWrapperForcingDownload:1];
            if (!v14)
            {
LABEL_18:

              id v9 = 0;
              continue;
            }
          }
          id PlainTextPart = _createPartForFileWrapper((uint64_t)self, v14, Mutable);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          id PlainTextPart = _createPartForMFAttachment(self, v12, 0, Mutable);
        }
      }
      v15 = PlainTextPart;
      if (!PlainTextPart) {
        goto LABEL_18;
      }
      if (v9)
      {
        [v9 addSubpart:PlainTextPart];
      }
      else if (v19 < 2)
      {
        id v9 = PlainTextPart;
      }
      else
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F73530]);
        [v9 setType:@"multipart"];
        [v9 setSubtype:@"mixed"];
        [v9 addSubpart:v15];
      }
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v8);
  if (!v9)
  {
LABEL_27:
    id OutgoingMessageFromTopLevelMimePart = 0;
    goto LABEL_28;
  }
  id OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v9, v18, Mutable);

LABEL_28:
  CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 headers:(id)a6
{
  return [(MFMessageWriter *)self createMessageWithHtmlString:a3 plainTextAlternative:a4 otherHtmlStringsAndAttachments:a5 charsets:0 headers:a6];
}

- (id)createMessageWithHtmlString:(id)a3 plainTextAlternative:(id)a4 otherHtmlStringsAndAttachments:(id)a5 charsets:(id)a6 headers:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  id v61 = a3;
  if (a3)
  {
    if ([a6 count]) {
      uint64_t v11 = [a6 objectAtIndex:0];
    }
    else {
      uint64_t v11 = 0;
    }
    if (v11 == [MEMORY[0x1E4F1CA98] null]) {
      id v13 = 0;
    }
    else {
      id v13 = (void *)v11;
    }
    id PartAndDataForString = _createPartAndDataForString(v61, v13, @"html", Mutable);
  }
  else
  {
    id PartAndDataForString = 0;
  }
  unint64_t v59 = [a5 count];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v14 = [a5 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v14)
  {
    v40 = 0;
    char v16 = 0;
    BOOL v41 = 1;
LABEL_76:
    id v44 = PartAndDataForString;
    if (a4)
    {
LABEL_77:
      id v45 = _createPlainTextPart(a4, Mutable);
      if (v45) {
        char v46 = v16;
      }
      else {
        char v46 = 1;
      }
      if ((v46 & 1) == 0)
      {
        id v47 = v45;
        if (v44)
        {
          v48 = Mutable;
          id v49 = objc_alloc_init(MEMORY[0x1E4F73530]);
          [v49 setType:@"multipart"];
          [v49 setSubtype:@"alternative"];
          [v49 addSubpart:v47];
          [v49 addSubpart:v44];
          v50 = v49;
          Mutable = v48;
          id v44 = v50;
        }
        else
        {
          id v44 = v45;
        }
      }
    }
    goto LABEL_84;
  }
  uint64_t v15 = v14;
  id v57 = a4;
  cf = Mutable;
  v62 = 0;
  char v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = *(void *)v66;
  while (2)
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v66 != v18) {
        objc_enumerationMutation(a5);
      }
      if (v16)
      {
        v40 = v62;
        BOOL v41 = v62 == 0;
        char v16 = 1;
        goto LABEL_72;
      }
      long long v20 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v17 + v19 + 1 >= (unint64_t)[a6 count]) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = [a6 objectAtIndex:v17 + v19 + 1];
        }
        if (v21 == [MEMORY[0x1E4F1CA98] null]) {
          v28 = 0;
        }
        else {
          v28 = (void *)v21;
        }
        id PartForMFAttachment = _createPartAndDataForString(v20, v28, @"html", cf);
        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = MFLogGeneral();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v24 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
          *(_DWORD *)buf = 138412802;
          uint64_t v70 = (uint64_t)v20;
          __int16 v71 = 2112;
          uint64_t v72 = v23;
          __int16 v73 = 2112;
          uint64_t v74 = v24;
          uint64_t v25 = v22;
          v26 = "*** BAD!!! Used old attachments for %@\n\n%@\n\n%@";
          uint32_t v27 = 32;
LABEL_57:
          _os_log_impl(&dword_1CFCFE000, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
          goto LABEL_58;
        }
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = MFLogGeneral();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          uint64_t v70 = v38;
          __int16 v71 = 2048;
          uint64_t v72 = (uint64_t)v20;
          uint64_t v25 = v37;
          v26 = "*** Unexpected object <%@:%p>";
          uint32_t v27 = 22;
          goto LABEL_57;
        }
LABEL_58:
        char v16 = 0;
        goto LABEL_59;
      }
      if (v61) {
        BOOL v30 = PartAndDataForString == 0;
      }
      else {
        BOOL v30 = 1;
      }
      int v31 = !v30;
      if (v62) {
        int v32 = 1;
      }
      else {
        int v32 = v31;
      }
      id PartForMFAttachment = _createPartForMFAttachment(self, v20, v32, cf);
LABEL_38:
      v33 = PartForMFAttachment;
      if (v20) {
        BOOL v34 = PartForMFAttachment == 0;
      }
      else {
        BOOL v34 = 0;
      }
      char v16 = v34;
      if (PartForMFAttachment)
      {
        if (PartAndDataForString)
        {
          if (v61)
          {
            id v35 = v62;
            if (!v62)
            {
              id v35 = objc_alloc_init(MEMORY[0x1E4F73530]);
              [v35 setType:@"multipart"];
              [v35 setSubtype:@"related"];
              [v35 addSubpart:PartAndDataForString];
            }
            v62 = v35;
            v36 = v35;
LABEL_53:
            [v36 addSubpart:v33];
LABEL_54:

            goto LABEL_59;
          }
        }
        else
        {
          if (v59 < 2)
          {
            id PartAndDataForString = PartForMFAttachment;
            goto LABEL_54;
          }
          id PartAndDataForString = objc_alloc_init(MEMORY[0x1E4F73530]);
          [PartAndDataForString setType:@"multipart"];
          [PartAndDataForString setSubtype:@"mixed"];
        }
        v36 = PartAndDataForString;
        goto LABEL_53;
      }
LABEL_59:
      ++v19;
    }
    while (v15 != v19);
    uint64_t v39 = [a5 countByEnumeratingWithState:&v65 objects:v75 count:16];
    uint64_t v15 = v39;
    v17 += v19;
    if (v39) {
      continue;
    }
    break;
  }
  v40 = v62;
  BOOL v41 = v62 == 0;
  if (v62) {
    char v42 = v16;
  }
  else {
    char v42 = 1;
  }
  if ((v42 & 1) == 0)
  {
    v43 = (void *)[v62 firstChildPart];
    Mutable = cf;
    if (v43) {
      [v62 setBodyParameter:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@", objc_msgSend(v43, "type"), objc_msgSend(v43, "subtype")), @"type" forKey];
    }
    char v16 = 0;
    BOOL v41 = 0;
    id v44 = v62;
    a4 = v57;
    if (v57) {
      goto LABEL_77;
    }
    goto LABEL_84;
  }
LABEL_72:
  id v44 = v40;
  Mutable = cf;
  a4 = v57;
  if (!v40) {
    goto LABEL_76;
  }
  if (v57) {
    goto LABEL_77;
  }
LABEL_84:
  if (v44) {
    char v51 = v16;
  }
  else {
    char v51 = 1;
  }
  if (v51)
  {
    id OutgoingMessageFromTopLevelMimePart = 0;
    if (!Mutable) {
      goto LABEL_101;
    }
LABEL_100:
    CFRelease(Mutable);
  }
  else
  {
    if (v41)
    {
      v53 = v40;
      id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v54 addObject:v44];
      while ([v54 count])
      {
        id v55 = (id)[v54 lastObject];
        [v54 removeLastObject];
        if (objc_msgSend((id)objc_msgSend(v55, "type"), "isEqualToString:", @"multipart"))
        {
          objc_msgSend(v54, "addObjectsFromArray:", objc_msgSend(v55, "subparts"));
        }
        else if ((objc_msgSend((id)objc_msgSend(v55, "disposition"), "isEqualToString:", @"attachment") & 1) != 0 {
               || objc_msgSend((id)objc_msgSend(v55, "disposition"), "isEqualToString:", @"inline"))
        }
        {
          [v55 setContentID:0];
        }
      }
      v40 = v53;
    }
    id OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v44, a7, Mutable);
    if (Mutable) {
      goto LABEL_100;
    }
  }
LABEL_101:

  return OutgoingMessageFromTopLevelMimePart;
}

- (id)createMessageWithHtmlString:(id)a3 attachments:(id)a4 headers:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  id PartAndDataForString = _createPartAndDataForString(a3, 0, @"html", Mutable);
  if ([a4 count])
  {
    uint64_t v11 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73530]) init];
    [v11 setType:@"multipart"];
    [v11 setSubtype:@"mixed"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(a4);
          }
          PartForFileWrapper = _createPartForFileWrapper((uint64_t)self, *(void **)(*((void *)&v18 + 1) + 8 * v14), Mutable);
          if (PartForFileWrapper)
          {
            [v11 addSubpart:PartForFileWrapper];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
    [v11 addSubpart:PartAndDataForString];

    if (v11)
    {
LABEL_12:
      id OutgoingMessageFromTopLevelMimePart = _createOutgoingMessageFromTopLevelMimePart((uint64_t)self, v11, a5, Mutable);

      if (!Mutable) {
        return OutgoingMessageFromTopLevelMimePart;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v11 = PartAndDataForString;
    if (PartAndDataForString) {
      goto LABEL_12;
    }
  }
  id OutgoingMessageFromTopLevelMimePart = 0;
  if (Mutable) {
LABEL_16:
  }
    CFRelease(Mutable);
  return OutgoingMessageFromTopLevelMimePart;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
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
  return self->_delegate;
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

- (void)setMessageClassToInstantiate:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_impl(&dword_1CFCFE000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Must be called with a subclass of MFOutgoingMessage.  You provided %@", (uint8_t *)&v3, 0xCu);
  }
  __assert_rtn("-[MFMessageWriter setMessageClassToInstantiate:]", "MessageWriter.m", 1511, "0");
}

@end