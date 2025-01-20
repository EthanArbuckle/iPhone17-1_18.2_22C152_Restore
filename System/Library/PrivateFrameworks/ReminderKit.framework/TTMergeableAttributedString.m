@interface TTMergeableAttributedString
+ (id)allowlistedAttributesForModel;
+ (id)allowlistedAttributesForStyle;
+ (id)allowlistedTypingAttributes;
+ (id)attributesForRun:(const void *)a3;
+ (int)attributeForWritingDirection:(int64_t)a3;
+ (int64_t)writingDirectionForAttribute:(int)a3;
+ (void)saveAttributes:(id)a3 toArchive:(void *)a4;
+ (void)saveAttributesOfString:(id)a3 toArchive:(void *)a4;
- (BOOL)attributesEqual:(id)a3 to:(id)a4 modelEqual:(BOOL *)a5;
- (BOOL)attributesEqual:(id)a3 toRange:(_NSRange)a4 modelEqual:(BOOL *)a5;
- (TTMergeableAttributedString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 withOrderedSubstrings:(void *)a5 timestamp:(id)a6;
- (TTMergeableAttributedString)initWithCRCoder:(id)a3;
- (TTMergeableAttributedString)initWithCRCoder:(id)a3 string:(const void *)a4;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)serialize;
- (void)encodeWithCRCoder:(id)a3;
- (void)encodeWithCRCoder:(id)a3 string:(void *)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4;
- (void)saveToArchive:(void *)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setAttributes:(id)a3 substring:(void *)a4;
@end

@implementation TTMergeableAttributedString

- (TTMergeableAttributedString)initWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 10)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 document];
    v8 = REMCheckedDynamicCast(v6, (uint64_t)v7);

    if (*(_DWORD *)(v5 + 48) == 10) {
      uint64_t v10 = *(void *)(v5 + 40);
    }
    else {
      uint64_t v10 = topotext::String::default_instance(v9);
    }
    v12 = [v8 replica];
    v13 = [v8 sharedTopotextTimestamp];
    v11 = [(TTMergeableString *)self initWithArchive:v10 andReplicaID:v12 andSharedTimestamp:v13];
  }
  else
  {
    v11 = [(TTMergeableString *)self init];
  }
  v14 = [v4 document];
  [(TTMergeableString *)v11 setDocument:v14];

  return v11;
}

- (TTMergeableAttributedString)initWithCRCoder:(id)a3 string:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = [v6 document];
  v9 = REMCheckedDynamicCast(v7, (uint64_t)v8);

  if (v9)
  {
    uint64_t v10 = [v9 replica];
    v11 = [v9 sharedTopotextTimestamp];
    v12 = [(TTMergeableString *)self initWithArchive:a4 andReplicaID:v10 andSharedTimestamp:v11];
  }
  else
  {
    v13 = +[REMLog crdt];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[TTMergeableAttributedString(CRDataType) initWithCRCoder:string:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v12 = [(TTMergeableString *)self init];
  }

  return v12;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TTMergeableString *)self document];
  id v6 = [v5 sharedTopotextTimestamp];
  uint64_t v7 = [(TTMergeableString *)self timestamp];

  if (v6 != v7)
  {
    uint64_t v10 = +[REMLog crdt];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[TTMergeableAttributedString(CRDataType) encodeWithCRCoder:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v8 = [v4 currentDocumentObjectForEncoding];
  uint64_t v9 = v8;
  if (*(_DWORD *)(v8 + 48) != 10)
  {
    CRDT::Document_DocObject::clear_contents(v8);
    *(_DWORD *)(v9 + 48) = 10;
    operator new();
  }
  [(TTMergeableAttributedString *)self encodeWithCRCoder:v4 string:*(void *)(v8 + 40)];
}

- (void)encodeWithCRCoder:(id)a3 string:(void *)a4
{
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

+ (int)attributeForWritingDirection:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (TTMergeableAttributedString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 withOrderedSubstrings:(void *)a5 timestamp:(id)a6
{
  v26.receiver = self;
  v26.super_class = (Class)TTMergeableAttributedString;
  uint64_t v7 = [(TTMergeableString *)&v26 initWithArchive:a3 andReplicaID:a4 withOrderedSubstrings:a5 timestamp:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = *((_DWORD *)a3 + 22);
    uint64_t v10 = [(TTMergeableString *)v7 attributedString];
    NSUInteger range2 = [v10 length];

    NSUInteger v11 = 0;
    if (v9)
    {
      int v12 = 0;
      uint64_t v13 = (char *)a3 + 80;
      while (1)
      {
        uint64_t v14 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)v13, v12);
        uint64_t v15 = +[TTMergeableAttributedString attributesForRun:v14];
        if (!v15 || (*(unsigned char *)(v14 + 32) & 1) == 0) {
          break;
        }
        v27.length = *(unsigned int *)(v14 + 48);
        v27.location = v11;
        v28.location = 0;
        v28.length = range2;
        NSRange v16 = NSIntersectionRange(v27, v28);
        uint64_t v17 = v8;
        uint64_t v18 = [(TTMergeableString *)v8 attributedString];
        objc_msgSend(v18, "setAttributes:range:", v15, v16.location, v16.length);

        v11 += *(unsigned int *)(v14 + 48);
        ++v12;
        uint64_t v8 = v17;
        if (v9 == v12) {
          goto LABEL_7;
        }
      }
      uint64_t v20 = +[REMLog crdt];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:]();
      }

      int v19 = 1;
    }
    else
    {
LABEL_7:
      int v19 = 0;
    }
    if (v11 == range2)
    {
      v21 = v8;
      if (!v19) {
        goto LABEL_18;
      }
    }
    else
    {
      v22 = +[REMLog crdt];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:]();
      }
    }
  }
  v21 = 0;
LABEL_18:
  v23 = v21;

  return v23;
}

+ (id)attributesForRun:(const void *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (topotext::AttributeRun *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = v4;
  int v6 = *((_DWORD *)a3 + 8);
  if ((v6 & 4) != 0)
  {
    uint64_t v7 = [TTFont alloc];
    uint64_t v8 = v7;
    uint64_t v9 = *((void *)a3 + 7);
    if (!v9) {
      uint64_t v9 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v7) + 56);
    }
    uint64_t v10 = [(TTFont *)v8 initWithArchive:v9];
    [(topotext::AttributeRun *)v5 setObject:v10 forKeyedSubscript:TTAttributeNameFont];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 8) != 0)
  {
    NSUInteger v11 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a3 + 13)];
    [(topotext::AttributeRun *)v5 setObject:v11 forKeyedSubscript:TTAttributeNameFontHints];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x10) != 0 && *((_DWORD *)a3 + 16))
  {
    int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [(topotext::AttributeRun *)v5 setObject:v12 forKeyedSubscript:TTAttributeNameUnderline];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x20) != 0 && *((_DWORD *)a3 + 17))
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [(topotext::AttributeRun *)v5 setObject:v13 forKeyedSubscript:TTAttributeNameStrikethrough];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x40) != 0)
  {
    uint64_t v14 = [NSNumber numberWithInt:*((unsigned int *)a3 + 20)];
    [(topotext::AttributeRun *)v5 setObject:v14 forKeyedSubscript:TTAttributeNameSuperscript];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x80) != 0)
  {
    id v15 = [NSString alloc];
    NSRange v16 = (uint64_t *)*((void *)a3 + 9);
    if (*((char *)v16 + 23) < 0)
    {
      NSRange v16 = (uint64_t *)*v16;
      uint64_t v17 = *(void *)(*((void *)a3 + 9) + 8);
    }
    else
    {
      uint64_t v17 = *((unsigned __int8 *)v16 + 23);
    }
    uint64_t v18 = (void *)[v15 initWithBytes:v16 length:v17 encoding:4];
    int v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
    [(topotext::AttributeRun *)v5 setObject:v19 forKeyedSubscript:@"NSLink"];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t v20 = [TTParagraphStyle alloc];
    v21 = v20;
    uint64_t v22 = *((void *)a3 + 5);
    if (!v22) {
      uint64_t v22 = *(void *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v20) + 40);
    }
    v23 = [(TTParagraphStyle *)v21 initWithArchive:v22];
    [(topotext::AttributeRun *)v5 setObject:v23 forKeyedSubscript:TTAttributeNameParagraphStyle];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x100) != 0)
  {
    v24 = (float *)*((void *)a3 + 11);
    if (v24)
    {
      CGFloat components = v24[10];
    }
    else
    {
      v25 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v4);
      v24 = (float *)*((void *)a3 + 11);
      CGFloat components = *(float *)(*((void *)v25 + 11) + 40);
      if (!v24)
      {
        v37 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v25);
        v24 = (float *)*((void *)a3 + 11);
        double v41 = *(float *)(*((void *)v37 + 11) + 44);
        if (!v24)
        {
          v38 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v37);
          v24 = (float *)*((void *)a3 + 11);
          double v42 = *(float *)(*((void *)v38 + 11) + 48);
          if (!v24) {
            v24 = *(float **)(topotext::AttributeRun::default_instance(v38) + 88);
          }
          goto LABEL_30;
        }
LABEL_29:
        double v42 = v24[12];
LABEL_30:
        double v43 = v24[13];
        if (TSUDeviceRGBColorSpace(void)::sDeviceRGBDispatchOnce != -1) {
          dispatch_once(&TSUDeviceRGBColorSpace(void)::sDeviceRGBDispatchOnce, &__block_literal_global_44);
        }
        objc_super v26 = CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace(void)::sDeviceRGBColorSpace, &components);
        [(topotext::AttributeRun *)v5 setObject:v26 forKeyedSubscript:TTAttributeNameForegroundColor];
        CGColorRelease(v26);
        int v6 = *((_DWORD *)a3 + 8);
        goto LABEL_33;
      }
    }
    double v41 = v24[11];
    goto LABEL_29;
  }
LABEL_33:
  if ((v6 & 0x200) != 0)
  {
    NSRange v27 = objc_msgSend(NSNumber, "numberWithInteger:", +[TTMergeableAttributedString writingDirectionForAttribute:](TTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 21)));
    v39 = v27;
    NSRange v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [(topotext::AttributeRun *)v5 setObject:v28 forKeyedSubscript:@"NSWritingDirection"];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x800) != 0)
  {
    v29 = [NSNumber numberWithUnsignedLongLong:*((void *)a3 + 13)];
    [(topotext::AttributeRun *)v5 setObject:v29 forKeyedSubscript:TTAttributeNameTimestamp];

    int v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x1000) == 0) {
    goto LABEL_47;
  }
  uint64_t v30 = *((void *)a3 + 14);
  if (!v30) {
    uint64_t v30 = *(void *)(topotext::AttributeRun::default_instance(v4) + 112);
  }
  if (*(unsigned char *)(v30 + 32))
  {
    v33 = objc_alloc_init(TTREMHashtag);
    v34 = *(uint64_t **)(v30 + 40);
    if (*((char *)v34 + 23) < 0) {
      v34 = (uint64_t *)*v34;
    }
    v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, objc_msgSend(NSString, "defaultCStringEncoding"));
    [(TTREMHashtag *)v33 setObjectIdentifier:v35];

    [(topotext::AttributeRun *)v5 setObject:v33 forKeyedSubscript:@"_TTREMHashtag"];
LABEL_47:
    v32 = v5;
    goto LABEL_48;
  }
  v31 = +[REMLog crdt];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
    +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) attributesForRun:]();
  }

  v32 = 0;
LABEL_48:

  return v32;
}

+ (void)saveAttributes:(id)a3 toArchive:(void *)a4
{
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:TTAttributeNameFont];
  if (v6)
  {
    *((_DWORD *)a4 + 8) |= 4u;
    uint64_t v7 = *((void *)a4 + 7);
    if (!v7) {
      operator new();
    }
    [v6 saveToArchive:v7];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:TTAttributeNameFontHints];

  if (v8)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:TTAttributeNameFontHints];
    int v10 = [v9 intValue];
    *((_DWORD *)a4 + 8) |= 8u;
    *((_DWORD *)a4 + 13) = v10;
  }
  NSUInteger v11 = [v5 objectForKeyedSubscript:TTAttributeNameUnderline];

  if (v11)
  {
    int v12 = [v5 objectForKeyedSubscript:TTAttributeNameUnderline];
    int v13 = [v12 intValue];
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v13;
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:TTAttributeNameStrikethrough];

  if (v14)
  {
    id v15 = [v5 objectForKeyedSubscript:TTAttributeNameStrikethrough];
    int v16 = [v15 intValue];
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((_DWORD *)a4 + 17) = v16;
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:@"NSLink"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v17 absoluteString];
      if (!v18) {
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        id v19 = 0;
LABEL_22:

        goto LABEL_23;
      }
      id v18 = v17;
    }
    id v19 = v18;
    [v19 UTF8String];
    *((_DWORD *)a4 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a4 + 9) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1BA9DB480]();
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v20 = [v5 objectForKeyedSubscript:TTAttributeNameSuperscript];
  if (v20)
  {
    v21 = [v5 objectForKeyedSubscript:TTAttributeNameSuperscript];
    uint64_t v22 = [v21 integerValue];

    if (v22)
    {
      v23 = [v5 objectForKeyedSubscript:TTAttributeNameSuperscript];
      int v24 = [v23 intValue];
      *((_DWORD *)a4 + 8) |= 0x40u;
      *((_DWORD *)a4 + 20) = v24;
    }
  }
  v25 = [v5 objectForKeyedSubscript:TTAttributeNameParagraphStyle];
  if (v25)
  {
    *((_DWORD *)a4 + 8) |= 2u;
    uint64_t v26 = *((void *)a4 + 5);
    if (!v26) {
      operator new();
    }
    [v25 saveToArchive:v26];
  }
  NSRange v27 = [v5 objectForKeyedSubscript:TTAttributeNameForegroundColor];

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
      v34 = +[REMLog crdt];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:](v30, v34);
      }
    }
  }
  v35 = [v5 objectForKeyedSubscript:@"NSWritingDirection"];
  v36 = v35;
  if (v35 && [v35 count])
  {
    v37 = [v36 firstObject];
    uint64_t v38 = [v37 integerValue];

    v39 = (topotext *)+[TTMergeableAttributedString attributeForWritingDirection:v38];
    int v40 = (int)v39;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v39)) {
      __assert_rtn("set_writingdirection", "topotext.pb.h", 4117, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
    }
    *((_DWORD *)a4 + 8) |= 0x200u;
    *((_DWORD *)a4 + 21) = v40;
  }
  double v41 = [v5 objectForKeyedSubscript:TTAttributeNameTimestamp];

  if (v41)
  {
    double v42 = [v5 objectForKeyedSubscript:TTAttributeNameTimestamp];
    uint64_t v43 = [v42 unsignedLongValue];
    *((_DWORD *)a4 + 8) |= 0x800u;
    *((void *)a4 + 13) = v43;
  }
  uint64_t v44 = [v5 objectForKeyedSubscript:@"_TTREMHashtag"];

  if (v44)
  {
    v45 = [v5 objectForKeyedSubscript:@"_TTREMHashtag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = [v45 objectIdentifier];

      if (v46)
      {
        *((_DWORD *)a4 + 8) |= 0x1000u;
        uint64_t v47 = *((void *)a4 + 14);
        if (!v47) {
          operator new();
        }
        v48 = [v45 objectIdentifier];
        [v48 UTF8String];
        *(_DWORD *)(v47 + 32) |= 1u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*(void *)(v47 + 40) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1BA9DB480]();
      }
      else
      {
        v48 = +[REMLog crdt];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
          +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:]();
        }
      }
    }
  }
}

- (void)saveToArchive:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TTMergeableAttributedString;
  -[TTMergeableString saveToArchive:](&v6, sel_saveToArchive_);
  id v5 = [(TTMergeableString *)self attributedString];
  +[TTMergeableAttributedString saveAttributesOfString:v5 toArchive:a3];
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
      uint64_t v8 = objc_msgSend(v5, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v14, 0, v6);
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
      int v13 = TTBoundedCheckedCastNSUIntegerToUInt32(v15);
      *(_DWORD *)(v12 + 32) |= 1u;
      *(_DWORD *)(v12 + 48) = v13;
      +[TTMergeableAttributedString saveAttributes:v8 toArchive:v12];
      v7 += v15;
    }
    while (v7 < v6);
  }
}

- (id)serialize
{
  topotext::String::String((topotext::String *)v5);
  [(TTMergeableAttributedString *)self saveToArchive:v5];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::String::ByteSize((topotext::String *)v5)];
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v5, (void *)[v3 mutableBytes], objc_msgSend(v3, "length"));
  topotext::String::~String((topotext::String *)v5);

  return v3;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TTMergeableAttributedString;
  id v5 = -[TTMergeableString i_saveDeltasSinceTimestamp:toArchive:](&v6, sel_i_saveDeltasSinceTimestamp_toArchive_, a3);
  +[TTMergeableAttributedString saveAttributesOfString:v5 toArchive:a4];
}

+ (id)allowlistedAttributesForModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TTMergeableAttributedString_allowlistedAttributesForModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l_0;
  block[4] = a1;
  if (+[TTMergeableAttributedString allowlistedAttributesForModel]::once != -1) {
    dispatch_once(&+[TTMergeableAttributedString allowlistedAttributesForModel]::once, block);
  }
  v2 = (void *)+[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList;

  return v2;
}

void __60__TTMergeableAttributedString_allowlistedAttributesForModel__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) allowlistedTypingAttributes];
  v5[0] = @"NSAttachment";
  v5[1] = @"_TTREMHashtag";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v1 setByAddingObjectsFromArray:v2];
  id v4 = (void *)+[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList;
  +[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList = v3;
}

+ (id)allowlistedAttributesForStyle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TTMergeableAttributedString_allowlistedAttributesForStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l_0;
  block[4] = a1;
  if (+[TTMergeableAttributedString allowlistedAttributesForStyle]::once != -1) {
    dispatch_once(&+[TTMergeableAttributedString allowlistedAttributesForStyle]::once, block);
  }
  v2 = (void *)+[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList;

  return v2;
}

void __60__TTMergeableAttributedString_allowlistedAttributesForStyle__block_invoke(uint64_t a1)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) allowlistedTypingAttributes];
  uint64_t v2 = *MEMORY[0x1E4F5F118];
  v6[0] = @"NSAttachment";
  v6[1] = v2;
  v6[2] = kDDFoundExistingLinkAttributeName;
  v6[3] = kUITextInputDictationResultMetadataAttributeName;
  v6[4] = TTPresentationAttributeNameApproxMaxItemNumber;
  v6[5] = @"NSTextAlternatives";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  uint64_t v4 = [v1 setByAddingObjectsFromArray:v3];
  id v5 = (void *)+[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList;
  +[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList = v4;
}

+ (id)allowlistedTypingAttributes
{
  if (+[TTMergeableAttributedString allowlistedTypingAttributes]::once != -1) {
    dispatch_once(&+[TTMergeableAttributedString allowlistedTypingAttributes]::once, &__block_literal_global_47);
  }
  uint64_t v2 = (void *)+[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList;

  return v2;
}

void __58__TTMergeableAttributedString_allowlistedTypingAttributes__block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = TTAttributeNameFont;
  v4[1] = TTAttributeNameFontHints;
  v4[2] = TTAttributeNameUnderline;
  v4[3] = TTAttributeNameStrikethrough;
  v4[4] = TTAttributeNameForegroundColor;
  v4[5] = TTAttributeNameParagraphStyle;
  v4[6] = @"NSLink";
  v4[7] = TTAttributeNameSuperscript;
  v4[8] = @"NSWritingDirection";
  v4[9] = TTAttributeNameTimestamp;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)+[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList;
  +[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList = v2;
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if ([(TTMergeableString *)self length])
  {
    uint64_t v8 = [(TTMergeableString *)self attributedString];
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
  v14.super_class = (Class)TTMergeableAttributedString;
  -[TTMergeableString replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v13);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  objc_super v6 = [(TTMergeableString *)self attributedString];
  id v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = v7;
  if (length)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __51__TTMergeableAttributedString_setAttributes_range___block_invoke;
    v33[3] = &unk_1E61DE460;
    v33[4] = self;
    id v10 = v9;
    id v34 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v33];
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
    uint64_t v15 = [v8 objectForKeyedSubscript:TTAttributeNameParagraphStyle];
    if (v15)
    {
      NSRange v28 = v10;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v8 objectForKeyedSubscript:TTAttributeNameParagraphStyle];
      id v18 = REMDynamicCast(v16, (uint64_t)v17);
      id v19 = +[TTParagraphStyle defaultParagraphStyle];
      int v20 = [v18 isEqualToModelComparable:v19];

      id v10 = v28;
      if (v20) {
        [v28 removeObjectForKey:TTAttributeNameParagraphStyle];
      }
    }
    id v13 = v10;

    char v32 = 0;
    BOOL v21 = -[TTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v13, location, length, &v32);
    if (v32)
    {
      if (!v21)
      {
        uint64_t v22 = [(TTMergeableString *)self attributedString];
        objc_msgSend(v22, "setAttributes:range:", v13, location, length);

        v23 = [(TTMergeableString *)self delegate];
        objc_msgSend(v23, "edited:range:changeInLength:", 1, location, length, 0);
      }
    }
    else
    {
      int v24 = [(TTMergeableString *)self delegate];
      [v24 beginEditing];

      [(TTMergeableString *)self beginEditing];
      __p = 0;
      int v30 = 0;
      uint64_t v31 = 0;
      -[TTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, location, length);
      v25 = __p;
      uint64_t v26 = v30;
      while (v25 != v26)
        [(TTMergeableAttributedString *)self setAttributes:v13 substring:*v25++];
      [(TTMergeableString *)self endEditing];
      NSRange v27 = [(TTMergeableString *)self delegate];
      [v27 endEditing];

      if (__p)
      {
        int v30 = __p;
        operator delete(__p);
      }
    }
  }
  else
  {
    id v13 = v7;
  }
}

void __51__TTMergeableAttributedString_setAttributes_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_super v6 = [(id)objc_opt_class() allowlistedAttributesForModel];
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
  id v10 = [(TTMergeableString *)self attributedString];
  NSUInteger v11 = [v10 attributesAtIndex:location effectiveRange:v16];

  BOOL v15 = 0;
  if (v16[1] + v16[0] >= location + length)
  {
    BOOL v13 = [(TTMergeableAttributedString *)self attributesEqual:v9 to:v11 modelEqual:&v15];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  *a5 = 1;
  uint64_t v26 = v7;
  uint64_t v9 = [v7 count];
  if (v9 == [v8 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [v7 keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      int v13 = 1;
      id obj = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v15, obj);
          uint64_t v17 = [v8 objectForKeyedSubscript:v15];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            *a5 = 0;
LABEL_22:

            LOBYTE(v13) = 0;
            id v10 = obj;
            goto LABEL_23;
          }
          id v19 = [v26 objectForKeyedSubscript:v15];
          int v20 = [v19 isEqual:v16];
          if ([v19 conformsToProtocol:&unk_1F138A770])
          {
            int v21 = [v16 conformsToProtocol:&unk_1F138A770];
            int v22 = v20;
            if (v21) {
              int v22 = [v19 isEqualToModelComparable:v16];
            }
          }
          else
          {
            int v22 = v20;
          }
          if (*a5) {
            BOOL v23 = v22;
          }
          else {
            BOOL v23 = 0;
          }
          *a5 = v23;

          v13 &= v20;
          if (!(v13 | v23)) {
            goto LABEL_22;
          }
        }
        id v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
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
LABEL_23:
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
    char v39 = 0;
    BOOL v7 = -[TTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v6, *((unsigned int *)a4 + 10), *((unsigned int *)a4 + 4), &v39);
    if (!v39)
    {
      uint64_t v11 = [(TTMergeableString *)self delegate];
      if (v11)
      {
        uint64_t v12 = [(TTMergeableString *)self delegate];
        int v13 = [v12 wantsUndoCommands];

        if (v13)
        {
          objc_super v14 = objc_alloc_init(TTMergeableStringUndoAttributeCommand);
          if (*((unsigned char *)a4 + 44)) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = *((unsigned int *)a4 + 4);
          }
          uint64_t v25 = *((unsigned int *)a4 + 10);
          uint64_t v26 = [(TTMergeableString *)self attributedString];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __55__TTMergeableAttributedString_setAttributes_substring___block_invoke;
          v34[3] = &unk_1E61DE488;
          v36 = a4;
          uint64_t v37 = v25;
          uint64_t v38 = v15;
          long long v27 = v14;
          v35 = v27;
          objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", v25, v15, 0, v34);

          [(TTMergeableUndoString *)self addUndoCommand:v27];
        }
      }
    }
    if (!v7)
    {
      id v8 = [(TTMergeableString *)self attributedString];
      uint64_t v9 = v8;
      if (*((unsigned char *)a4 + 44)) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = *((unsigned int *)a4 + 4);
      }
      objc_msgSend(v8, "setAttributes:range:", v6, *((unsigned int *)a4 + 10), v10);
    }
    if (!v39)
    {
      uint64_t v16 = +[TTMergeableString unserialisedReplicaID];
      uint64_t v17 = (void *)*((void *)a4 + 3);
      *((void *)a4 + 3) = v16;

      BOOL v18 = [(TTMergeableString *)self delegate];

      if (v18)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        id v19 = operator new(8uLL);
        __p = v19;
        *id v19 = a4;
        long long v29 = v19 + 1;
        long long v30 = v19 + 1;
        [(TTMergeableString *)self getCharacterRanges:&v31 forSubstrings:&__p];
        int v20 = (uint64_t *)v31;
        int v21 = v32;
        while (v20 != v21)
        {
          uint64_t v22 = *v20;
          uint64_t v23 = v20[1];
          int v24 = [(TTMergeableString *)self delegate];
          objc_msgSend(v24, "edited:range:changeInLength:", 1, v22, v23, 0);

          v20 += 2;
        }
        if (__p)
        {
          long long v29 = __p;
          operator delete(__p);
        }
        if (v31)
        {
          uint64_t v32 = (uint64_t *)v31;
          operator delete(v31);
        }
      }
      [(TTMergeableString *)self setHasLocalChanges:1];
    }
  }
}

void __55__TTMergeableAttributedString_setAttributes_substring___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  LODWORD(a3) = TTBoundedCheckedCastNSUIntegerToUInt32(a3 - *(void *)(a1 + 48));
  int v9 = TTBoundedCheckedCastNSUIntegerToUInt32(a4);
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

@end