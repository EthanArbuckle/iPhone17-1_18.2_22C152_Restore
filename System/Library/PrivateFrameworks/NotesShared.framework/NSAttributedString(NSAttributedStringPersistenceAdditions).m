@interface NSAttributedString(NSAttributedStringPersistenceAdditions)
+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:;
+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateNewAttachments:error:;
+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:error:;
+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:forParentAttachment:error:;
+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:;
+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateAttachments:error:;
+ (void)enumerateAttachmentsInData:()NSAttributedStringPersistenceAdditions withBlock:;
- (BOOL)ic_isCopyableSize;
- (id)ic_serializeWithFlags:()NSAttributedStringPersistenceAdditions dataPersister:managedObjectContext:error:;
- (uint64_t)ic_approximateAttachmentsSizeIncludingPreviews:()NSAttributedStringPersistenceAdditions;
- (uint64_t)ic_saveToArchive:()NSAttributedStringPersistenceAdditions flags:dataPersister:managedObjectContext:error:;
@end

@implementation NSAttributedString(NSAttributedStringPersistenceAdditions)

+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateNewAttachments:error:
{
  v7 = objc_msgSend(a1, "ic_attributedStringWithArchive:dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:", a3, a4, a5, 0, a6, a7);
  return v7;
}

+ (id)ic_attributedStringWithArchive:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v76 = a4;
  id v13 = a5;
  id v73 = a6;
  v75 = v13;
  id v14 = [NSString alloc];
  v15 = *(uint64_t **)(a3 + 40);
  if (*((char *)v15 + 23) < 0)
  {
    v15 = (uint64_t *)*v15;
    uint64_t v16 = *(void *)(*(void *)(a3 + 40) + 8);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)v15 + 23);
  }
  v74 = (void *)[v14 initWithBytes:v15 length:v16 encoding:4];
  v78 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v74];
  uint64_t v72 = a3;
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v13 || !a7) {
    goto LABEL_48;
  }
  uint64_t v17 = a3;
  uint64_t v18 = *(unsigned int *)(a3 + 112);
  if (v18)
  {
    unsigned int v19 = 0;
    int v20 = 0;
    do
    {
      uint64_t v21 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v17 + 104, v20);
      if ((*(unsigned char *)(v21 + 32) & 0x40) != 0)
      {
        id v22 = [NSString alloc];
        v23 = *(uint64_t **)(v21 + 80);
        if (*((char *)v23 + 23) < 0)
        {
          v23 = (uint64_t *)*v23;
          uint64_t v24 = *(void *)(*(void *)(v21 + 80) + 8);
        }
        else
        {
          uint64_t v24 = *((unsigned __int8 *)v23 + 23);
        }
        v25 = objc_msgSend(v22, "initWithBytes:length:encoding:", v23, v24, 4, v72);
        v19 += +[ICTTAttachment typeUTIIsInlineAttachment:v25];
      }
      ++v20;
    }
    while (v18 != v20);
  }
  else
  {
    unsigned int v19 = 0;
  }
  if (v18 >= v19) {
    uint64_t v26 = v18 - v19;
  }
  else {
    uint64_t v26 = 0;
  }
  id v13 = v75;
  if (objc_msgSend(v75, "canAddAttachments:", v26, v72))
  {
    if (!v78)
    {
LABEL_57:
      id v64 = 0;
      goto LABEL_62;
    }
    int v27 = [v75 isPasswordProtected] ^ 1;
    if (!v18) {
      LOBYTE(v27) = 1;
    }
    if ((v27 & 1) == 0)
    {
      for (int i = 0; v18 != i; ++i)
      {
        uint64_t v29 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v17 + 104, i);
        if ((*(unsigned char *)(v29 + 32) & 0x40) != 0)
        {
          id v30 = [NSString alloc];
          v31 = *(uint64_t **)(v29 + 80);
          if (*((char *)v31 + 23) < 0)
          {
            v31 = (uint64_t *)*v31;
            uint64_t v32 = *(void *)(*(void *)(v29 + 80) + 8);
          }
          else
          {
            uint64_t v32 = *((unsigned __int8 *)v31 + 23);
          }
          v33 = (void *)[v30 initWithBytes:v31 length:v32 encoding:4];
          if (!+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:v33])
          {
            if (a8)
            {
              v68 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v69 = *MEMORY[0x1E4F83660];
              v81[0] = *MEMORY[0x1E4F83680];
              v81[1] = v69;
              v82[0] = @"Unsupported attachment for password protected notes";
              v70 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v18];
              v82[1] = v70;
              v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
              *a8 = [v68 errorWithDomain:*MEMORY[0x1E4F83668] code:205 userInfo:v71];
            }
            id v64 = 0;
            goto LABEL_61;
          }
        }
      }
    }
    if (v18)
    {
      int v34 = 0;
      uint64_t v35 = v72 + 104;
      do
      {
        v36 = (void *)MEMORY[0x1C877DB80]();
        uint64_t v37 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34);
        if ((*(unsigned char *)(v37 + 32) & 0x40) != 0)
        {
          v39 = *(uint64_t **)(v37 + 80);
          if (*((char *)v39 + 23) < 0) {
            v39 = (uint64_t *)*v39;
          }
          v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, objc_msgSend(NSString, "defaultCStringEncoding"));
          if (v38)
          {
            id v13 = v75;
            if (+[ICTTAttachment typeUTIIsInlineAttachment:v38])
            {
              v40 = [MEMORY[0x1E4F29128] UUID];
              v41 = [v40 UUIDString];
              if (v73) {
                [v73 addInlineAttachmentWithIdentifier:v41];
              }
              else {
              v44 = [v75 addInlineAttachmentWithIdentifier:v41];
              }

              objc_msgSend(v44, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34), v76, v77);
              [v44 updateChangeCountWithReason:@"Loaded inline attachment from archive"];
              goto LABEL_44;
            }
          }
          else
          {
            id v13 = v75;
          }
        }
        else
        {
          v38 = 0;
        }
        v42 = [MEMORY[0x1E4F29128] UUID];
        v43 = [v42 UUIDString];
        v44 = [v13 addAttachmentWithIdentifier:v43];

        objc_msgSend(v44, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>(v35, v34), v76, v77);
        [v44 updateChangeCountWithReason:@"Loaded attachment from archive"];
        v45 = [v44 media];
        [v45 updateChangeCountWithReason:@"Loaded attachment from archive"];

LABEL_44:
        ++v34;
      }
      while (v18 != v34);
    }
LABEL_48:
    if (v78)
    {
      int v46 = *(_DWORD *)(v72 + 88);
      if (v46)
      {
        int v47 = 0;
        NSUInteger v48 = 0;
        uint64_t v49 = v72 + 80;
        do
        {
          uint64_t v50 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>(v49, v47);
          v51 = +[ICTTMergeableAttributedString attributesForRun:v50];
          objc_opt_class();
          v52 = [v51 objectForKeyedSubscript:@"NSAttachment"];
          v53 = ICDynamicCast();

          v54 = [v53 attachmentIdentifier];

          if (v54)
          {
            v55 = [v53 attachmentIdentifier];
            v56 = [v77 objectForKeyedSubscript:v55];

            if (v56) {
              [v53 setAttachmentIdentifier:v56];
            }
          }
          NSUInteger v57 = *(unsigned int *)(v50 + 48);
          v87.location = objc_msgSend(v78, "ic_range", v72);
          v87.length = v58;
          v86.location = v48;
          v86.length = v57;
          NSRange v59 = NSIntersectionRange(v86, v87);
          objc_msgSend(v78, "setAttributes:range:", v51, v59.location, v59.length);
          v48 += *(unsigned int *)(v50 + 48);

          ++v47;
        }
        while (v46 != v47);
      }
      v60 = ICTTAttributeNameParagraphStyle;
      uint64_t v61 = objc_msgSend(v78, "ic_range", v72);
      uint64_t v63 = v62;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __162__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_attributedStringWithArchive_dataPersister_note_parentAttachment_shouldCreateNewAttachments_error___block_invoke;
      v79[3] = &unk_1E64A5030;
      id v64 = v78;
      id v80 = v64;
      id v13 = v75;
      objc_msgSend(v64, "enumerateAttribute:inRange:options:usingBlock:", v60, v61, v63, 0, v79);
      v33 = v80;
      goto LABEL_61;
    }
    goto LABEL_57;
  }
  if (a8)
  {
    v65 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F83680];
    v84[0] = @"Maximum attachments exceeded";
    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    *a8 = [v65 errorWithDomain:*MEMORY[0x1E4F83668] code:202 userInfo:v66];
  }
  id v64 = 0;
  v33 = v78;
LABEL_61:

LABEL_62:
  return v64;
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:error:
{
  v6 = objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:forParentAttachment:error:", a3, a4, a5, 0, a6);
  return v6;
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:createNewAttachmentsInNote:forParentAttachment:error:
{
  v7 = objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", a3, a4, a5, a6, 1, a7);
  return v7;
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:shouldCreateAttachments:error:
{
  v7 = objc_msgSend(a1, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", a3, a4, a5, 0, a6, a7);
  return v7;
}

+ (id)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    topotext::String::String((topotext::String *)v24);
    id v17 = v13;
    uint64_t v18 = (char *)[v17 bytes];
    int v19 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v17 length]);
    if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v24, v18, v19))
    {
      int v20 = objc_msgSend(MEMORY[0x1E4F28B18], "ic_attributedStringWithArchive:dataPersister:note:parentAttachment:shouldCreateNewAttachments:error:", v24, v14, v15, v16, a7, a8);
    }
    else
    {
      id v22 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:]();
      }

      int v20 = 0;
    }
    topotext::String::~String((topotext::String *)v24);
  }
  else
  {
    uint64_t v21 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:]();
    }

    int v20 = 0;
  }

  return v20;
}

+ (void)enumerateAttachmentsInData:()NSAttributedStringPersistenceAdditions withBlock:
{
  id v5 = a3;
  v6 = a4;
  topotext::String::String((topotext::String *)v17);
  id v7 = v5;
  v8 = (char *)[v7 bytes];
  int v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v7 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v17, v8, v9))
  {
    id v15 = v5;
    char v16 = 0;
    int v10 = v19;
    if (v19)
    {
      int v11 = 0;
      while (1)
      {
        v12 = +[ICTTMergeableAttributedString attributesForRun:](ICTTMergeableAttributedString, "attributesForRun:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)&v18, v11), v15);
        id v13 = [v12 objectForKeyedSubscript:@"NSAttachment"];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v6) {
              v6[2](v6, v13, &v16);
            }
            if (v16) {
              break;
            }
          }
        }

        if (v10 == ++v11) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NSAttributedString(NSAttributedStringPersistenceAdditions) ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:]();
    }
  }
LABEL_14:
  topotext::String::~String((topotext::String *)v17);
}

- (uint64_t)ic_saveToArchive:()NSAttributedStringPersistenceAdditions flags:dataPersister:managedObjectContext:error:
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  id v14 = [a1 string];
  [v14 UTF8String];
  id v15 = [a1 string];
  [v15 lengthOfBytesUsingEncoding:4];
  *(_DWORD *)(a3 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(a3 + 40) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();

  +[ICTTMergeableAttributedString saveAttributesOfString:a1 toArchive:a3];
  if (a4)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    id v30 = __Block_byref_object_copy__7;
    v31 = __Block_byref_object_dispose__7;
    id v32 = 0;
    uint64_t v16 = [a1 length];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __126__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_saveToArchive_flags_dataPersister_managedObjectContext_error___block_invoke;
    v20[3] = &unk_1E64A5058;
    uint64_t v25 = a3;
    id v21 = v13;
    v23 = &v33;
    id v22 = v12;
    uint64_t v24 = &v27;
    uint64_t v26 = a4;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v16, 0, v20);
    if (a7)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a7 = v17;
      }
    }

    _Block_object_dispose(&v27, 8);
  }
  uint64_t v18 = *((unsigned __int8 *)v34 + 24);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (id)ic_serializeWithFlags:()NSAttributedStringPersistenceAdditions dataPersister:managedObjectContext:error:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_msgSend(a1, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v11);
  topotext::String::String((topotext::String *)v19);
  id v18 = 0;
  int v13 = objc_msgSend(v12, "ic_saveToArchive:flags:dataPersister:managedObjectContext:error:", v19, a3, v10, v11, &v18);
  id v14 = v18;
  id v15 = v14;
  if (v13)
  {
    id v16 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::String::ByteSize((topotext::String *)v19)];
    google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v19, (void *)[v16 mutableBytes], objc_msgSend(v16, "length"));
  }
  else
  {
    id v16 = 0;
    if (a6) {
      *a6 = v14;
    }
  }

  topotext::String::~String((topotext::String *)v19);
  return v16;
}

- (uint64_t)ic_approximateAttachmentsSizeIncludingPreviews:()NSAttributedStringPersistenceAdditions
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v5 = [a1 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_approximateAttachmentsSizeIncludingPreviews___block_invoke;
  v8[3] = &unk_1E64A5080;
  v8[4] = &v10;
  char v9 = a3;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v5, 0, v8);
  uint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)ic_isCopyableSize
{
  return (unint64_t)objc_msgSend(a1, "ic_approximateAttachmentsSizeIncludingPreviews:", 1) >> 24 == 0;
}

+ (void)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "ic_attributedStringWithData receiving nil data input", v1, 2u);
}

+ (void)ic_attributedStringWithData:()NSAttributedStringPersistenceAdditions dataPersister:note:parentAttachment:shouldCreateAttachments:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "NSAttributedString TT protobuf corrupt.", v2, v3, v4, v5, v6);
}

@end