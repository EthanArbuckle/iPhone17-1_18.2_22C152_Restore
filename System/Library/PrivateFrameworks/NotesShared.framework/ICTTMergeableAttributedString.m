@interface ICTTMergeableAttributedString
+ (NSSet)allowedAttributesForModel;
+ (NSSet)allowedAttributesForStyle;
+ (NSSet)allowedTypingAttributes;
+ (id)attributesForRun:(const void *)a3;
+ (int)attributeForWritingDirection:(int64_t)a3;
+ (int64_t)writingDirectionForAttribute:(int)a3;
+ (void)saveAttributes:(id)a3 toArchive:(void *)a4;
+ (void)saveAttributesOfString:(id)a3 toArchive:(void *)a4;
- (BOOL)attributesEqual:(id)a3 to:(id)a4 modelEqual:(BOOL *)a5;
- (BOOL)attributesEqual:(id)a3 toRange:(_NSRange)a4 modelEqual:(BOOL *)a5;
- (ICTTMergeableAttributedString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7;
- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3;
- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3 string:(const void *)a4;
- (NSArray)edits;
- (NSAttributedString)editsAttributedString;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)editAtIndex:(unint64_t)a3;
- (id)editsInRange:(_NSRange)a3;
- (id)serialize;
- (void)encodeWithICCRCoder:(id)a3;
- (void)encodeWithICCRCoder:(id)a3 string:(void *)a4;
- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidateCache;
- (void)removeTimestampsForReplicaID:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4;
- (void)saveToArchive:(void *)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setAttributes:(id)a3 substring:(void *)a4;
- (void)setEditsAttributedString:(id)a3;
- (void)setTimestamp:(id)a3 range:(_NSRange)a4;
@end

@implementation ICTTMergeableAttributedString

void __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", ICTTAttributeNameTimestamp, v7, a3, a4);
  }
}

uint64_t __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 44)) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", ICTTAttributeNameReplicaID, *(void *)a2, *(unsigned int *)(a2 + 40), *(unsigned int *)(a2 + 16));
  }
  return result;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v8 = [(ICTTMergeableAttributedString *)self editsAttributedString];
  v16.NSUInteger location = objc_msgSend(v8, "ic_range");
  v16.NSUInteger length = v9;
  v15.NSUInteger location = location;
  v15.NSUInteger length = length;
  NSRange v10 = NSIntersectionRange(v15, v16);

  v11 = [(ICTTMergeableAttributedString *)self editsAttributedString];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__ICTTMergeableAttributedString_enumerateEditsInRange_usingBlock___block_invoke;
  v13[3] = &unk_1E64A5B58;
  id v12 = v7;
  id v14 = v12;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v13);
}

- (NSAttributedString)editsAttributedString
{
  editsAttributedString = self->_editsAttributedString;
  if (editsAttributedString)
  {
    v3 = editsAttributedString;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    v6 = [(ICTTMergeableString *)self attributedString];
    id v7 = [v6 string];
    v8 = (void *)[v5 initWithString:v7];

    NSUInteger v9 = [(ICTTMergeableString *)self attributedString];
    NSRange v10 = ICTTAttributeNameTimestamp;
    v11 = [(ICTTMergeableString *)self attributedString];
    uint64_t v12 = objc_msgSend(v11, "ic_range");
    uint64_t v14 = v13;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke;
    v25[3] = &unk_1E64A5B08;
    id v15 = v8;
    id v26 = v15;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, v12, v14, 0, v25);

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __54__ICTTMergeableAttributedString_editsAttributedString__block_invoke_2;
    v23 = &unk_1E64A5B30;
    id v16 = v15;
    id v24 = v16;
    [(ICTTMergeableString *)self traverseUnordered:&v20];
    v17 = (NSAttributedString *)objc_msgSend(v16, "copy", v20, v21, v22, v23);
    v18 = self->_editsAttributedString;
    self->_editsAttributedString = v17;

    v3 = self->_editsAttributedString;
  }
  return v3;
}

- (ICTTMergeableAttributedString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7
{
  v28.receiver = self;
  v28.super_class = (Class)ICTTMergeableAttributedString;
  v8 = [(ICTTMergeableString *)&v28 initWithArchive:a3 replicaID:a4 orderedSubstrings:a5 timestamp:a6 fragment:a7];
  NSUInteger v9 = v8;
  if (v8)
  {
    unsigned int v10 = *((_DWORD *)a3 + 22);
    v27 = v8;
    v11 = [(ICTTMergeableString *)v8 attributedString];
    NSUInteger v12 = [v11 length];

    NSUInteger v13 = 0;
    if (v10)
    {
      int v14 = 0;
      id v15 = (char *)a3 + 80;
      BOOL v16 = 1;
      while (1)
      {
        uint64_t v17 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)v15, v14);
        v18 = +[ICTTMergeableAttributedString attributesForRun:v17];
        if (!v18 || (*(unsigned char *)(v17 + 32) & 1) == 0) {
          break;
        }
        v29.NSUInteger length = *(unsigned int *)(v17 + 48);
        v29.NSUInteger location = v13;
        v30.NSUInteger location = 0;
        v30.NSUInteger length = v12;
        NSRange v19 = NSIntersectionRange(v29, v30);
        uint64_t v20 = [(ICTTMergeableString *)v27 attributedString];
        objc_msgSend(v20, "setAttributes:range:", v18, v19.location, v19.length);

        v13 += *(unsigned int *)(v17 + 48);
        BOOL v16 = ++v14 < v10;
        if (v10 == v14) {
          goto LABEL_7;
        }
      }
      v22 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:]();
      }
    }
    else
    {
LABEL_7:
      BOOL v16 = 0;
    }
    BOOL v23 = v13 == v12;
    NSUInteger v9 = v27;
    if (!v23)
    {
      [(ICTTMergeableString *)v27 dumpData];
      id v24 = os_log_create("com.apple.notes", "SimulatedCrash");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:]();
      }

      NSUInteger v9 = v27;
    }
    if (v16) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v9;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  v25 = v21;

  return v25;
}

+ (id)attributesForRun:(const void *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v4;
  int v6 = *((_DWORD *)a3 + 8);
  if ((v6 & 4) != 0)
  {
    id v7 = [ICTTFont alloc];
    v8 = v7;
    uint64_t v9 = *((void *)a3 + 7);
    if (!v9) {
      uint64_t v9 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v7) + 56);
    }
    unsigned int v10 = [(ICTTFont *)v8 initWithArchive:v9];
    [v5 setObject:v10 forKeyedSubscript:ICTTAttributeNameFont];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 8) != 0)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*((unsigned int *)a3 + 13)];
    [v5 setObject:v11 forKeyedSubscript:ICTTAttributeNameFontHints];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x10) != 0 && *((_DWORD *)a3 + 16))
  {
    NSUInteger v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
    [v5 setObject:v12 forKeyedSubscript:ICTTAttributeNameUnderline];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x20) != 0 && *((_DWORD *)a3 + 17))
  {
    NSUInteger v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
    [v5 setObject:v13 forKeyedSubscript:ICTTAttributeNameStrikethrough];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x1000) != 0 && *((_DWORD *)a3 + 30))
  {
    int v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
    [v5 setObject:v14 forKeyedSubscript:ICTTAttributeNameEmphasis];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x40) != 0)
  {
    id v15 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)a3 + 20)];
    [v5 setObject:v15 forKeyedSubscript:ICTTAttributeNameSuperscript];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x80) != 0)
  {
    id v16 = [NSString alloc];
    uint64_t v17 = (uint64_t *)*((void *)a3 + 9);
    if (*((char *)v17 + 23) < 0)
    {
      uint64_t v17 = (uint64_t *)*v17;
      uint64_t v18 = *(void *)(*((void *)a3 + 9) + 8);
    }
    else
    {
      uint64_t v18 = *((unsigned __int8 *)v17 + 23);
    }
    NSRange v19 = (void *)[v16 initWithBytes:v17 length:v18 encoding:4];
    uint64_t v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
    [v5 setObject:v20 forKeyedSubscript:@"NSLink"];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t v21 = [ICTTParagraphStyle alloc];
    v22 = v21;
    uint64_t v23 = *((void *)a3 + 5);
    if (!v23) {
      uint64_t v23 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v21) + 40);
    }
    id v24 = [(ICTTParagraphStyle *)v22 initWithArchive:v23];
    [v5 setObject:v24 forKeyedSubscript:ICTTAttributeNameParagraphStyle];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x100) != 0)
  {
    v25 = (float *)*((void *)a3 + 11);
    if (v25)
    {
      CGFloat components = v25[10];
    }
    else
    {
      v4 = (void *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
      v25 = (float *)*((void *)a3 + 11);
      CGFloat components = *(float *)(v4[11] + 40);
      if (!v25)
      {
        v4 = (void *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
        v25 = (float *)*((void *)a3 + 11);
        double v65 = *(float *)(v4[11] + 44);
        if (!v25)
        {
          v4 = (void *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
          v25 = (float *)*((void *)a3 + 11);
          double v26 = *(float *)(v4[11] + 48);
          double v66 = v26;
          if (!v25)
          {
            v4 = (void *)topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4);
            v25 = (float *)v4[11];
            double v26 = v66;
          }
          goto LABEL_33;
        }
LABEL_32:
        double v26 = v25[12];
        double v66 = v26;
LABEL_33:
        float v27 = v25[13];
        double v67 = v27;
        if (components != 0.0 || v65 != 0.0 || v26 != 0.0 || v27 != 1.0)
        {
          objc_super v28 = (CGColorSpace *)TSUDeviceRGBColorSpace();
          NSRange v29 = CGColorCreate(v28, &components);
          [v5 setObject:v29 forKeyedSubscript:ICTTAttributeNameForegroundColor];
          CGColorRelease(v29);
        }
        int v6 = *((_DWORD *)a3 + 8);
        goto LABEL_39;
      }
    }
    double v65 = v25[11];
    goto LABEL_32;
  }
LABEL_39:
  if ((v6 & 0x200) != 0)
  {
    NSRange v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", +[ICTTMergeableAttributedString writingDirectionForAttribute:](ICTTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 21)));
    v63 = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v5 setObject:v31 forKeyedSubscript:@"NSWritingDirection"];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x400) == 0) {
    goto LABEL_54;
  }
  uint64_t v32 = *((void *)a3 + 12);
  if (!v32) {
    uint64_t v32 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4) + 96);
  }
  if ((~*(_DWORD *)(v32 + 32) & 3) == 0)
  {
    v33 = objc_alloc_init(ICTTAttachment);
    v34 = *(uint64_t **)(v32 + 40);
    if (*((char *)v34 + 23) < 0) {
      v34 = (uint64_t *)*v34;
    }
    v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, objc_msgSend(NSString, "defaultCStringEncoding"));
    [(ICTTAttachment *)v33 setAttachmentIdentifier:v35];

    id v36 = [NSString alloc];
    v37 = *(uint64_t **)(v32 + 48);
    if (*((char *)v37 + 23) < 0)
    {
      v37 = (uint64_t *)*v37;
      uint64_t v38 = *(void *)(*(void *)(v32 + 48) + 8);
    }
    else
    {
      uint64_t v38 = *((unsigned __int8 *)v37 + 23);
    }
    v41 = (void *)[v36 initWithBytes:v37 length:v38 encoding:4];
    [(ICTTAttachment *)v33 setAttachmentUTI:v41];

    [v5 setObject:v33 forKeyedSubscript:@"NSAttachment"];
    int v6 = *((_DWORD *)a3 + 8);
LABEL_54:
    if ((v6 & 0x2000) != 0)
    {
      uint64_t v42 = *((void *)a3 + 14);
      if (!v42) {
        uint64_t v42 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v4) + 112);
      }
      if ((~*(_DWORD *)(v42 + 32) & 7) == 0)
      {
        id v43 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v44 = *(uint64_t **)(v42 + 64);
        if (*((char *)v44 + 23) < 0)
        {
          v44 = (uint64_t *)*v44;
          uint64_t v45 = *(void *)(*(void *)(v42 + 64) + 8);
        }
        else
        {
          uint64_t v45 = *((unsigned __int8 *)v44 + 23);
        }
        v46 = (void *)[v43 initWithBytes:v44 length:v45];
        id v47 = [NSString alloc];
        v48 = *(uint64_t **)(v42 + 48);
        if (*((char *)v48 + 23) < 0)
        {
          v48 = (uint64_t *)*v48;
          uint64_t v49 = *(void *)(*(void *)(v42 + 48) + 8);
        }
        else
        {
          uint64_t v49 = *((unsigned __int8 *)v48 + 23);
        }
        v50 = (void *)[v47 initWithBytes:v48 length:v49 encoding:4];
        id v51 = [NSString alloc];
        v52 = *(uint64_t **)(v42 + 56);
        if (*((char *)v52 + 23) < 0)
        {
          v52 = (uint64_t *)*v52;
          uint64_t v53 = *(void *)(*(void *)(v42 + 56) + 8);
        }
        else
        {
          uint64_t v53 = *((unsigned __int8 *)v52 + 23);
        }
        v54 = (void *)[v51 initWithBytes:v52 length:v53 encoding:4];
        v55 = *(uint64_t **)(v42 + 40);
        if (*((char *)v55 + 23) < 0) {
          v55 = (uint64_t *)*v55;
        }
        v56 = objc_msgSend(NSString, "stringWithCString:encoding:", v55, objc_msgSend(NSString, "defaultCStringEncoding"));
        v57 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v57);
        int v59 = [v54 isEqualToString:v58];

        if (v59)
        {
          v60 = (ICFallbackSystemTextAttachment *)[objc_alloc(MEMORY[0x1E4FB0820]) initWithImageContent:v46];
          [v5 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4FB06B0]];
        }
        else
        {
          v60 = [[ICFallbackSystemTextAttachment alloc] initWithData:v46 type:v50 contentIdentifier:v56 systemClassName:v54];
          [v5 setObject:v60 forKeyedSubscript:@"NSAttachment"];
        }
      }
    }
    if ((*((unsigned char *)a3 + 33) & 8) != 0)
    {
      v61 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)a3 + 13)];
      [v5 setObject:v61 forKeyedSubscript:ICTTAttributeNameTimestamp];
    }
    id v40 = v5;
    goto LABEL_79;
  }
  v39 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    +[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) attributesForRun:]();
  }

  id v40 = 0;
LABEL_79:

  return v40;
}

+ (int64_t)writingDirectionForAttribute:(int)a3
{
  if ((a3 - 1) >= 4) {
    return -1;
  }
  else {
    return (a3 - 1);
  }
}

+ (NSSet)allowedAttributesForStyle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICTTMergeableAttributedString_allowedAttributesForStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ICTTMergeableAttributedString allowedAttributesForStyle]::once != -1) {
    dispatch_once(&+[ICTTMergeableAttributedString allowedAttributesForStyle]::once, block);
  }
  v2 = (void *)+[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes;
  return (NSSet *)v2;
}

void __66__ICTTMergeableAttributedString_enumerateEditsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = -[ICTTTextEdit initWithAttributes:range:]([ICTTTextEdit alloc], "initWithAttributes:range:", v8, a3, a4);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __58__ICTTMergeableAttributedString_allowedAttributesForStyle__block_invoke(uint64_t a1)
{
  v6[11] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) allowedTypingAttributes];
  uint64_t v2 = *MEMORY[0x1E4F5F118];
  v6[0] = @"NSAttachment";
  v6[1] = v2;
  v6[2] = kDDFoundExistingLinkAttributeName;
  v6[3] = kUITextInputDictationResultMetadataAttributeName;
  v6[4] = TTPresentationAttributeNameApproxMaxItemNumber;
  v6[5] = @"NSTextAlternatives";
  v6[6] = *MEMORY[0x1E4FB06B0];
  v6[7] = TTPresentationAttributeNameMentionUnconfirmed;
  v6[8] = *MEMORY[0x1E4F287E0];
  v6[9] = TTPresentationAttributeNameHashtagUnconfirmed;
  v6[10] = TTPresentationAttributeNameAcceleratorLinkUnconfirmed;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:11];
  uint64_t v4 = [v1 setByAddingObjectsFromArray:v3];
  id v5 = (void *)+[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedAttributesForStyle]::allowedAttributes = v4;
}

+ (NSSet)allowedTypingAttributes
{
  if (+[ICTTMergeableAttributedString allowedTypingAttributes]::once != -1) {
    dispatch_once(&+[ICTTMergeableAttributedString allowedTypingAttributes]::once, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)+[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes;
  return (NSSet *)v2;
}

void __56__ICTTMergeableAttributedString_allowedTypingAttributes__block_invoke()
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = ICTTAttributeNameFont;
  v4[1] = ICTTAttributeNameFontHints;
  v4[2] = ICTTAttributeNameUnderline;
  v4[3] = ICTTAttributeNameStrikethrough;
  v4[4] = ICTTAttributeNameEmphasis;
  v4[5] = ICTTAttributeNameForegroundColor;
  v4[6] = ICTTAttributeNameParagraphStyle;
  v4[7] = @"NSLink";
  v4[8] = *MEMORY[0x1E4F287E0];
  v4[9] = ICTTAttributeNameSuperscript;
  v4[10] = @"NSWritingDirection";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)+[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedTypingAttributes]::allowedAttributes = v2;
}

+ (int)attributeForWritingDirection:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (void)saveAttributes:(id)a3 toArchive:(void *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v87 = [v5 objectForKeyedSubscript:ICTTAttributeNameFont];
  if (v87)
  {
    *((_DWORD *)a4 + 8) |= 4u;
    uint64_t v6 = *((void *)a4 + 7);
    if (!v6) {
      operator new();
    }
    [v87 saveToArchive:v6];
  }
  id v7 = [v5 objectForKeyedSubscript:ICTTAttributeNameFontHints];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:ICTTAttributeNameFontHints];
    int v9 = [v8 intValue];
    *((_DWORD *)a4 + 8) |= 8u;
    *((_DWORD *)a4 + 13) = v9;
  }
  unsigned int v10 = [v5 objectForKeyedSubscript:ICTTAttributeNameUnderline];

  if (v10)
  {
    v11 = [v5 objectForKeyedSubscript:ICTTAttributeNameUnderline];
    int v12 = [v11 intValue];
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v12;
  }
  NSUInteger v13 = [v5 objectForKeyedSubscript:ICTTAttributeNameStrikethrough];

  if (v13)
  {
    int v14 = [v5 objectForKeyedSubscript:ICTTAttributeNameStrikethrough];
    int v15 = [v14 intValue];
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((_DWORD *)a4 + 17) = v15;
  }
  id v16 = [v5 objectForKeyedSubscript:ICTTAttributeNameEmphasis];

  if (v16)
  {
    uint64_t v17 = [v5 objectForKeyedSubscript:ICTTAttributeNameEmphasis];
    int v18 = [v17 intValue];
    *((_DWORD *)a4 + 8) |= 0x1000u;
    *((_DWORD *)a4 + 30) = v18;
  }
  v89 = [v5 objectForKeyedSubscript:@"NSLink"];
  if (v89)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = [v89 absoluteString];
      if (!v19) {
        goto LABEL_23;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_23:
        id v20 = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v19 = v89;
    }
    id v20 = v19;
    [v20 UTF8String];
    *((_DWORD *)a4 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a4 + 9) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v21 = [v5 objectForKeyedSubscript:ICTTAttributeNameSuperscript];
  if (v21)
  {
    v22 = [v5 objectForKeyedSubscript:ICTTAttributeNameSuperscript];
    uint64_t v23 = [v22 integerValue];

    if (v23)
    {
      id v24 = [v5 objectForKeyedSubscript:ICTTAttributeNameSuperscript];
      int v25 = [v24 intValue];
      *((_DWORD *)a4 + 8) |= 0x40u;
      *((_DWORD *)a4 + 20) = v25;
    }
  }
  v86 = [v5 objectForKeyedSubscript:ICTTAttributeNameParagraphStyle];
  if (v86)
  {
    *((_DWORD *)a4 + 8) |= 2u;
    uint64_t v26 = *((void *)a4 + 5);
    if (!v26) {
      operator new();
    }
    [v86 saveToArchive:v26];
  }
  float v27 = [v5 objectForKeyedSubscript:ICTTAttributeNameForegroundColor];

  if (v27)
  {
    Components = CGColorGetComponents((CGColorRef)v27);
    size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v27);
    int v30 = NumberOfComponents;
    if (NumberOfComponents == 4)
    {
      float64x2_t v31 = *(float64x2_t *)Components;
      float64x2_t v32 = *(float64x2_t *)(Components + 2);
      *((_DWORD *)a4 + 8) |= 0x100u;
      uint64_t v33 = *((void *)a4 + 11);
      if (!v33) {
        operator new();
      }
      *(_DWORD *)(v33 + 32) |= 1u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v33 + 32) |= 2u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v33 + 32) |= 4u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v33 + 32) |= 8u;
      *(float32x4_t *)(v33 + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v32);
    }
    else
    {
      v34 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        buf.__r_.__value_.__r.__words[0] = 0x404000200;
        LOWORD(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 2) = v30;
        _os_log_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_DEFAULT, "Incorrect number of color components for foreground color. Expected %d and got %d", (uint8_t *)&buf, 0xEu);
      }
    }
  }
  v88 = [v5 objectForKeyedSubscript:@"NSWritingDirection"];
  if (v88 && [v88 count])
  {
    v35 = [v88 firstObject];
    uint64_t v36 = [v35 integerValue];

    v37 = (topotext *)+[ICTTMergeableAttributedString attributeForWritingDirection:v36];
    int v38 = (int)v37;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v37)) {
      __assert_rtn("set_writingdirection", "topotext.pb.h", 4482, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
    }
    *((_DWORD *)a4 + 8) |= 0x200u;
    *((_DWORD *)a4 + 21) = v38;
  }
  v39 = [v5 objectForKeyedSubscript:@"NSAttachment"];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    v41 = [v5 objectForKeyedSubscript:@"NSAttachment"];
    objc_opt_class();
    uint64_t v42 = ICDynamicCast();
    int v43 = objc_msgSend(v42, "ic_isSystemTextAttachment");

    if (v43)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v44 = v41;
        uint64_t v45 = [v44 contentIdentifier];
        v85 = [v44 systemClassName];
      }
      else
      {
        uint64_t v45 = 0;
        v85 = 0;
      }
      id v52 = v41;
      uint64_t v53 = [v52 fileType];
      if (v53)
      {
        v54 = [v52 contents];
        BOOL v55 = ![v54 length] || v45 == 0;
        BOOL v56 = v55 || v85 == 0;
        BOOL v57 = !v56;

        if (v57)
        {
          *((_DWORD *)a4 + 8) |= 0x2000u;
          uint64_t v58 = *((void *)a4 + 14);
          if (!v58) {
            operator new();
          }
          objc_msgSend(v52, "fileType", v85);
          id v59 = objc_claimAutoreleasedReturnValue();
          [v59 UTF8String];
          *(_DWORD *)(v58 + 32) |= 2u;
          if (!google::protobuf::internal::empty_string_) {
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          }
          if (*(void *)(v58 + 48) == google::protobuf::internal::empty_string_) {
            operator new();
          }
          MEMORY[0x1C877D5B0]();

          id v60 = [v52 contents];
          v61 = (void *)[v60 bytes];
          v62 = [v52 contents];
          std::string::basic_string[abi:ne180100](&buf, v61, [v62 length]);
          *(_DWORD *)(v58 + 32) |= 8u;
          if (!google::protobuf::internal::empty_string_) {
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          }
          v63 = *(std::string **)(v58 + 64);
          if (v63 == (std::string *)google::protobuf::internal::empty_string_) {
            operator new();
          }
          std::string::operator=(v63, &buf);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }

          [v45 UTF8String];
          *(_DWORD *)(v58 + 32) |= 1u;
          if (!google::protobuf::internal::empty_string_) {
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          }
          if (*(void *)(v58 + 40) == google::protobuf::internal::empty_string_) {
            operator new();
          }
          MEMORY[0x1C877D5B0]();
          id v64 = v85;
          std::string::basic_string[abi:ne180100](&buf, (void *)[v64 UTF8String], objc_msgSend(v64, "length"));
          *(_DWORD *)(v58 + 32) |= 4u;
          if (!google::protobuf::internal::empty_string_) {
            __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
          }
          double v65 = *(std::string **)(v58 + 56);
          if (v65 == (std::string *)google::protobuf::internal::empty_string_) {
            operator new();
          }
          std::string::operator=(v65, &buf);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
        }
      }
    }
    else
    {
      if (![v41 conformsToProtocol:&unk_1F1F80810])
      {
LABEL_92:

        goto LABEL_93;
      }
      v46 = [v41 attachmentIdentifier];
      BOOL v47 = v46 == 0;

      if (v47)
      {
        uint64_t v45 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          +[ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:]();
        }
      }
      else
      {
        *((_DWORD *)a4 + 8) |= 0x400u;
        uint64_t v48 = *((void *)a4 + 12);
        if (!v48) {
          operator new();
        }
        id v49 = [v41 attachmentIdentifier];
        [v49 UTF8String];
        *(_DWORD *)(v48 + 32) |= 1u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*(void *)(v48 + 40) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1C877D5B0]();

        v50 = [v41 attachmentUTI];
        BOOL v51 = v50 == 0;

        if (v51) {
          goto LABEL_92;
        }
        uint64_t v45 = [v41 attachmentUTI];
        [v45 UTF8String];
        *(_DWORD *)(v48 + 32) |= 2u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*(void *)(v48 + 48) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1C877D5B0]();
      }
    }

    goto LABEL_92;
  }
LABEL_93:
  uint64_t v66 = *MEMORY[0x1E4FB06B0];
  double v67 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4FB06B0], v85);
  BOOL v68 = v67 == 0;

  if (!v68)
  {
    objc_opt_class();
    v69 = [v5 objectForKeyedSubscript:v66];
    v70 = ICDynamicCast();

    v71 = [v70 contentIdentifier];
    v72 = [MEMORY[0x1E4FB0820] contentType];
    v73 = [v72 identifier];

    v74 = [v70 imageContent];
    v75 = [v70 className];
    if (v71 && v73 && v74)
    {
      *((_DWORD *)a4 + 8) |= 0x2000u;
      uint64_t v76 = *((void *)a4 + 14);
      if (!v76) {
        operator new();
      }
      [v73 UTF8String];
      *(_DWORD *)(v76 + 32) |= 2u;
      if (!google::protobuf::internal::empty_string_) {
        goto LABEL_121;
      }
      if (*(void *)(v76 + 48) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5B0]();
      id v77 = v74;
      std::string::basic_string[abi:ne180100](&buf, (void *)[v77 bytes], objc_msgSend(v77, "length"));
      *(_DWORD *)(v76 + 32) |= 8u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      v78 = *(std::string **)(v76 + 64);
      if (v78 == (std::string *)google::protobuf::internal::empty_string_) {
        operator new();
      }
      std::string::operator=(v78, &buf);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      [v71 UTF8String];
      *(_DWORD *)(v76 + 32) |= 1u;
      if (!google::protobuf::internal::empty_string_) {
LABEL_121:
      }
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*(void *)(v76 + 40) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5B0]();
      id v79 = v75;
      std::string::basic_string[abi:ne180100](&buf, (void *)[v79 UTF8String], objc_msgSend(v79, "length"));
      *(_DWORD *)(v76 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      v80 = *(std::string **)(v76 + 56);
      if (v80 == (std::string *)google::protobuf::internal::empty_string_) {
        operator new();
      }
      std::string::operator=(v80, &buf);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
    }
  }
  v81 = [v5 objectForKeyedSubscript:ICTTAttributeNameTimestamp];
  BOOL v82 = v81 == 0;

  if (!v82)
  {
    v83 = [v5 objectForKeyedSubscript:ICTTAttributeNameTimestamp];
    uint64_t v84 = [v83 unsignedLongValue];
    *((_DWORD *)a4 + 8) |= 0x800u;
    *((void *)a4 + 13) = v84;
  }
}

- (void)saveToArchive:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString saveToArchive:](&v6, sel_saveToArchive_);
  id v5 = [(ICTTMergeableString *)self attributedString];
  +[ICTTMergeableAttributedString saveAttributesOfString:v5 toArchive:a3];
}

+ (void)saveAttributesOfString:(id)a3 toArchive:(void *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = objc_msgSend(v5, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v14, 0, v6);
      int v9 = *((_DWORD *)a4 + 23);
      uint64_t v10 = *((int *)a4 + 22);
      if ((int)v10 >= v9)
      {
        if (v9 == *((_DWORD *)a4 + 24)) {
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a4 + 80, v9 + 1);
        }
        google::protobuf::internal::GenericTypeHandler<topotext::AttributeRun>::New();
      }
      uint64_t v11 = *((void *)a4 + 10);
      *((_DWORD *)a4 + 22) = v10 + 1;
      uint64_t v12 = *(void *)(v11 + 8 * v10);
      int v13 = ICTTBoundedCheckedCastNSUIntegerToUInt32(v15);
      *(_DWORD *)(v12 + 32) |= 1u;
      *(_DWORD *)(v12 + 48) = v13;
      +[ICTTMergeableAttributedString saveAttributes:v8 toArchive:v12];
      v7 += v15;
    }
    while (v7 < v6);
  }
}

- (id)serialize
{
  topotext::String::String((topotext::String *)v5);
  [(ICTTMergeableAttributedString *)self saveToArchive:v5];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::String::ByteSize((topotext::String *)v5)];
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v5, (void *)[v3 mutableBytes], objc_msgSend(v3, "length"));
  topotext::String::~String((topotext::String *)v5);
  return v3;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICTTMergeableAttributedString;
  id v5 = -[ICTTMergeableString i_saveDeltasSinceTimestamp:toArchive:](&v6, sel_i_saveDeltasSinceTimestamp_toArchive_, a3);
  +[ICTTMergeableAttributedString saveAttributesOfString:v5 toArchive:a4];
}

- (void)invalidateCache
{
  v4.receiver = self;
  v4.super_class = (Class)ICTTMergeableAttributedString;
  [(ICTTMergeableString *)&v4 invalidateCache];
  editsAttributedString = self->_editsAttributedString;
  self->_editsAttributedString = 0;
}

+ (NSSet)allowedAttributesForModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICTTMergeableAttributedString_allowedAttributesForModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ICTTMergeableAttributedString allowedAttributesForModel]::once != -1) {
    dispatch_once(&+[ICTTMergeableAttributedString allowedAttributesForModel]::once, block);
  }
  uint64_t v2 = (void *)+[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes;
  return (NSSet *)v2;
}

void __58__ICTTMergeableAttributedString_allowedAttributesForModel__block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) allowedTypingAttributes];
  v5[0] = @"NSAttachment";
  v5[1] = ICTTAttributeNameTimestamp;
  v5[2] = *MEMORY[0x1E4FB06B0];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v1 setByAddingObjectsFromArray:v2];
  objc_super v4 = (void *)+[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes;
  +[ICTTMergeableAttributedString allowedAttributesForModel]::allowedAttributes = v3;
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if ([(ICTTMergeableString *)self length])
  {
    id v8 = [(ICTTMergeableString *)self attributedString];
    int v9 = v8;
    NSUInteger v10 = location - 1;
    if (!location) {
      NSUInteger v10 = 0;
    }
    if (length) {
      NSUInteger v11 = location;
    }
    else {
      NSUInteger v11 = v10;
    }
    uint64_t v12 = [v8 attributesAtIndex:v11 effectiveRange:0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  int v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  v14.receiver = self;
  v14.super_class = (Class)ICTTMergeableAttributedString;
  -[ICTTMergeableString replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v13);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  objc_super v6 = [(ICTTMergeableString *)self attributedString];
  id v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = v7;
  if (length)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__ICTTMergeableAttributedString_setAttributes_range___block_invoke;
    v26[3] = &unk_1E64A5AB8;
    v26[4] = self;
    id v10 = v9;
    id v27 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v26];
    NSUInteger v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F5F118]];
    if (v11)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:kDDFoundExistingLinkAttributeName];
      if (v12)
      {
      }
      else
      {
        objc_super v14 = [v10 objectForKeyedSubscript:@"NSLink"];

        if (v14) {
          [v10 removeObjectForKey:@"NSLink"];
        }
      }
    }
    id v13 = v10;

    char v25 = 0;
    BOOL v15 = -[ICTTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v13, location, length, &v25);
    if (v25)
    {
      if (!v15)
      {
        id v16 = [(ICTTMergeableString *)self attributedString];
        objc_msgSend(v16, "setAttributes:range:", v13, location, length);

        uint64_t v17 = [(ICTTMergeableString *)self delegate];
        objc_msgSend(v17, "edited:range:changeInLength:", 1, location, length, 0);
      }
    }
    else
    {
      int v18 = [(ICTTMergeableString *)self delegate];
      [v18 beginEditing];

      [(ICTTMergeableString *)self beginEditing];
      __p = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, location, length);
      id v19 = __p;
      id v20 = v23;
      while (v19 != v20)
        [(ICTTMergeableAttributedString *)self setAttributes:v13 substring:*v19++];
      [(ICTTMergeableString *)self endEditing];
      uint64_t v21 = [(ICTTMergeableString *)self delegate];
      [v21 endEditing];

      if (__p)
      {
        uint64_t v23 = __p;
        operator delete(__p);
      }
    }
  }
  else
  {
    id v13 = v7;
  }
}

void __53__ICTTMergeableAttributedString_setAttributes_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_super v6 = [(id)objc_opt_class() allowedAttributesForModel];
  int v7 = [v6 containsObject:v8];

  if (v7) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v8];
  }
}

- (BOOL)attributesEqual:(id)a3 toRange:(_NSRange)a4 modelEqual:(BOOL *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = [(ICTTMergeableString *)self attributedString];
  NSUInteger v11 = [v10 attributesAtIndex:location effectiveRange:v16];

  BOOL v15 = 0;
  if (v16[1] + v16[0] >= location + length)
  {
    BOOL v13 = [(ICTTMergeableAttributedString *)self attributesEqual:v9 to:v11 modelEqual:&v15];
    BOOL v12 = v15;
  }
  else
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
  *a5 = v12;

  return v13;
}

- (BOOL)attributesEqual:(id)a3 to:(id)a4 modelEqual:(BOOL *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  *a5 = 1;
  objc_super v28 = v7;
  uint64_t v9 = [v7 count];
  if (v9 == [v8 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = [v7 keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      int v13 = 1;
      id obj = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v15, obj);
          uint64_t v17 = [v8 objectForKeyedSubscript:v15];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            *a5 = 0;
LABEL_25:

            LOBYTE(v13) = 0;
            id v10 = obj;
            goto LABEL_26;
          }
          id v19 = [v28 objectForKeyedSubscript:v15];
          int v20 = [v19 isEqual:v16];
          CFTypeID v21 = CFGetTypeID(v19);
          if (v21 == CGColorGetTypeID() && (CFTypeID v22 = CFGetTypeID(v16), v22 == CGColorGetTypeID()))
          {
            int v23 = ICCGColorEquivalentToColor();
          }
          else
          {
            if ([v19 conformsToProtocol:&unk_1F1F80680])
            {
              int v24 = [v16 conformsToProtocol:&unk_1F1F80680];
              int v25 = v20;
              if (v24) {
                int v25 = [v19 isEqualToModelComparable:v16];
              }
            }
            else
            {
              int v25 = v20;
            }
            if (*a5) {
              int v23 = v25;
            }
            else {
              int v23 = 0;
            }
          }
          *a5 = v23;

          v13 &= v20;
          if (!(v13 | v23)) {
            goto LABEL_25;
          }
        }
        id v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v13) = 1;
    }
LABEL_26:
  }
  else
  {
    LOBYTE(v13) = 0;
    *a5 = 0;
  }

  return v13;
}

- (void)setAttributes:(id)a3 substring:(void *)a4
{
  id v6 = a3;
  if (a4 && !*((unsigned char *)a4 + 44))
  {
    char v30 = 0;
    BOOL v7 = -[ICTTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v6, *((unsigned int *)a4 + 10), *((unsigned int *)a4 + 4), &v30);
    if (!v30)
    {
      uint64_t v11 = [(ICTTMergeableString *)self delegate];
      if (v11)
      {
        uint64_t v12 = [(ICTTMergeableString *)self delegate];
        int v13 = [v12 wantsUndoCommands];

        if (v13)
        {
          objc_super v14 = objc_alloc_init(ICTTMergeableStringUndoAttributeCommand);
          if (*((unsigned char *)a4 + 44)) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = *((unsigned int *)a4 + 4);
          }
          uint64_t v22 = *((unsigned int *)a4 + 10);
          int v23 = [(ICTTMergeableString *)self attributedString];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __57__ICTTMergeableAttributedString_setAttributes_substring___block_invoke;
          v25[3] = &unk_1E64A5AE0;
          id v27 = a4;
          uint64_t v28 = v22;
          uint64_t v29 = v15;
          int v24 = v14;
          uint64_t v26 = v24;
          objc_msgSend(v23, "enumerateAttributesInRange:options:usingBlock:", v22, v15, 0, v25);

          [(ICTTMergeableUndoString *)self addUndoCommand:v24];
        }
      }
    }
    if (!v7)
    {
      id v8 = [(ICTTMergeableString *)self attributedString];
      uint64_t v9 = v8;
      if (*((unsigned char *)a4 + 44)) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = *((unsigned int *)a4 + 4);
      }
      objc_msgSend(v8, "setAttributes:range:", v6, *((unsigned int *)a4 + 10), v10);
    }
    if (!v30)
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
      uint64_t v17 = (void *)*((void *)a4 + 3);
      *((void *)a4 + 3) = v16;

      BOOL v18 = [(ICTTMergeableString *)self delegate];

      if (v18)
      {
        id v19 = [(ICTTMergeableString *)self delegate];
        int v20 = v19;
        if (*((unsigned char *)a4 + 44)) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = *((unsigned int *)a4 + 4);
        }
        objc_msgSend(v19, "edited:range:changeInLength:", 1, *((unsigned int *)a4 + 10), v21, 0);
      }
      [(ICTTMergeableString *)self setHasLocalChanges:1];
    }
  }
}

void __57__ICTTMergeableAttributedString_setAttributes_substring___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  LODWORD(a3) = ICTTBoundedCheckedCastNSUIntegerToUInt32(a3 - *(void *)(a1 + 48));
  int v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32(a4);
  id v10 = *(id *)v8;
  int v11 = *(_DWORD *)(v8 + 8);
  uint64_t v12 = (uint64_t *)[*(id *)(a1 + 32) attributeRanges];
  id v13 = v10;
  id v15 = v13;
  int v16 = v11 + a3;
  int v17 = v9;
  id v14 = v7;
  id v18 = v14;
  std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::push_back[abi:ne180100](v12, (uint64_t *)&v15);
}

- (id)editAtIndex:(unint64_t)a3
{
  objc_super v4 = [(ICTTMergeableAttributedString *)self editsAttributedString];
  id v5 = [v4 attributesAtIndex:a3 effectiveRange:v9];

  id v6 = [ICTTTextEdit alloc];
  id v7 = -[ICTTTextEdit initWithAttributes:range:](v6, "initWithAttributes:range:", v5, v9[0], v9[1]);

  return v7;
}

- (id)editsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__ICTTMergeableAttributedString_editsInRange___block_invoke;
  v10[3] = &unk_1E64A5B80;
  id v7 = v6;
  id v11 = v7;
  -[ICTTMergeableAttributedString enumerateEditsInRange:usingBlock:](self, "enumerateEditsInRange:usingBlock:", location, length, v10);
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

uint64_t __46__ICTTMergeableAttributedString_editsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSArray)edits
{
  uint64_t v3 = [(ICTTMergeableAttributedString *)self editsAttributedString];
  uint64_t v4 = objc_msgSend(v3, "ic_range");
  id v6 = -[ICTTMergeableAttributedString editsInRange:](self, "editsInRange:", v4, v5);

  return (NSArray *)v6;
}

- (void)setTimestamp:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(ICTTMergeableString *)self attributedString];
  v17.NSUInteger location = objc_msgSend(v8, "ic_range");
  v17.NSUInteger length = v9;
  v16.NSUInteger location = location;
  v16.NSUInteger length = length;
  NSRange v10 = NSIntersectionRange(v16, v17);

  id v11 = [(ICTTMergeableString *)self attributedString];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ICTTMergeableAttributedString_setTimestamp_range___block_invoke;
  v13[3] = &unk_1E64A5BA8;
  id v12 = v7;
  id v14 = v12;
  id v15 = self;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v13);
}

void __52__ICTTMergeableAttributedString_setTimestamp_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = (id)[a2 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
    [*(id *)(a1 + 32) timeIntervalSince1970];
    NSUInteger v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    NSUInteger v9 = 0;
  }
  [v12 setObject:v9 forKeyedSubscript:ICTTAttributeNameTimestamp];
  if (v7) {

  }
  NSRange v10 = *(void **)(a1 + 40);
  id v11 = (void *)[v12 copy];
  objc_msgSend(v10, "setAttributes:range:", v11, a3, a4);
}

- (void)removeTimestampsForReplicaID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTTMergeableAttributedString *)self editsAttributedString];
  uint64_t v6 = objc_msgSend(v5, "ic_range");
  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ICTTMergeableAttributedString_removeTimestampsForReplicaID___block_invoke;
  v10[3] = &unk_1E64A5BD0;
  id v9 = v4;
  id v11 = v9;
  id v12 = self;
  -[ICTTMergeableAttributedString enumerateEditsInRange:usingBlock:](self, "enumerateEditsInRange:usingBlock:", v6, v8, v10);
}

void __62__ICTTMergeableAttributedString_removeTimestampsForReplicaID___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 replicaID];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v8 range];
    objc_msgSend(v5, "setTimestamp:range:", 0, v6, v7);
  }
}

- (void)setEditsAttributedString:(id)a3
{
}

- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 10)
  {
    objc_opt_class();
    uint64_t v6 = [v4 document];
    uint64_t v7 = ICCheckedDynamicCast();

    if (*(_DWORD *)(v5 + 48) == 10) {
      uint64_t v9 = *(void *)(v5 + 40);
    }
    else {
      uint64_t v9 = topotext::String::default_instance(v8);
    }
    id v11 = [v7 replica];
    id v12 = [v7 sharedTopotextTimestamp];
    NSRange v10 = [(ICTTMergeableString *)self initWithArchive:v9 replicaID:v11 timestamp:v12];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    NSRange v10 = [(ICTTMergeableString *)self initWithReplicaID:v7];
  }

  id v13 = [v4 document];
  [(ICTTMergeableString *)v10 setDocument:v13];

  return v10;
}

- (ICTTMergeableAttributedString)initWithICCRCoder:(id)a3 string:(const void *)a4
{
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = [v6 document];
  id v8 = ICCheckedDynamicCast();

  if (v8)
  {
    uint64_t v9 = [v8 replica];
    NSRange v10 = [v8 sharedTopotextTimestamp];
    id v11 = [(ICTTMergeableString *)self initWithArchive:a4 replicaID:v9 timestamp:v10];
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICTTMergeableAttributedString(ICCRDataType) initWithICCRCoder:string:](v12);
    }

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [(ICTTMergeableString *)self initWithReplicaID:v9];
  }

  return v11;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(ICTTMergeableString *)self document];
  uint64_t v5 = [v4 sharedTopotextTimestamp];
  id v6 = [(ICTTMergeableString *)self timestamp];

  if (v5 != v6) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.document.sharedTopotextTimestamp == self.timestamp" functionName:"-[ICTTMergeableAttributedString(ICCRDataType) encodeWithICCRCoder:]" simulateCrash:1 showAlert:0 format:@"Timestamp should be the same the as one in document."];
  }
  uint64_t v7 = [v9 currentDocumentObjectForEncoding];
  uint64_t v8 = v7;
  if (*(_DWORD *)(v7 + 48) != 10)
  {
    CRDT::Document_DocObject::clear_contents(v7);
    *(_DWORD *)(v8 + 48) = 10;
    operator new();
  }
  [(ICTTMergeableAttributedString *)self encodeWithICCRCoder:v9 string:*(void *)(v7 + 40)];
}

- (void)encodeWithICCRCoder:(id)a3 string:(void *)a4
{
}

@end