@interface ICTTParagraphStyle
+ (BOOL)supportsSecureCoding;
+ (id)defaultParagraphStyle;
+ (id)paragraphStyleNamed:(unsigned int)a3;
+ (int)paragraphStyleAlignmentForTextAlignment:(int64_t)a3;
+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3;
- (BOOL)canIndent;
- (BOOL)isBlockQuote;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelComparable:(id)a3;
- (BOOL)isEqualToModelParagraphStyle:(id)a3;
- (BOOL)isEqualToParagraphStyle:(id)a3;
- (BOOL)isHeader;
- (BOOL)isHierarchicallyEqualToParagraphStyle:(id)a3;
- (BOOL)isList;
- (BOOL)isRTL;
- (BOOL)isUnknownStyle;
- (BOOL)needsListCleanup;
- (BOOL)needsParagraphCleanup;
- (BOOL)preferSingleLine;
- (BOOL)uniqueToLine;
- (BOOL)wantsFollowingNewLine;
- (ICTTParagraphStyle)init;
- (ICTTParagraphStyle)initWithArchive:(const void *)a3;
- (ICTTParagraphStyle)initWithCoder:(id)a3;
- (ICTTParagraphStyle)initWithData:(id)a3;
- (ICTTTodo)todo;
- (NSString)description;
- (NSUUID)todoTrackingUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)serialize;
- (int64_t)alignment;
- (int64_t)writingDirection;
- (unint64_t)blockQuoteLevel;
- (unint64_t)hash;
- (unint64_t)indent;
- (unint64_t)startingItemNumber;
- (unsigned)hints;
- (unsigned)style;
- (void)encodeWithCoder:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setBlockQuoteLevel:(unint64_t)a3;
- (void)setHints:(unsigned int)a3;
- (void)setIndent:(unint64_t)a3;
- (void)setNeedsListCleanup:(BOOL)a3;
- (void)setNeedsParagraphCleanup:(BOOL)a3;
- (void)setStartingItemNumber:(unint64_t)a3;
- (void)setStyle:(unsigned int)a3;
- (void)setTodo:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation ICTTParagraphStyle

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isBlockQuote
{
  return [(ICTTParagraphStyle *)self blockQuoteLevel] != 0;
}

- (unint64_t)blockQuoteLevel
{
  return self->_blockQuoteLevel;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (NSUUID)todoTrackingUUID
{
  v2 = [(ICTTParagraphStyle *)self todo];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (ICTTTodo)todo
{
  return self->_todo;
}

- (BOOL)uniqueToLine
{
  return [(ICTTParagraphStyle *)self style] == 103;
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(ICTTParagraphStyle *)self style];
  if (v7 == 101)
  {
    v11 = @"–";
  }
  else if (v7 == 102)
  {
    uint64_t v8 = [v6 attribute:TTPresentationAttributeNameItemNumber atIndex:a4 effectiveRange:0];
    v9 = (void *)v8;
    if (a4 && !v8)
    {
      v9 = [v6 attribute:TTPresentationAttributeNameItemNumber atIndex:a4 - 1 effectiveRange:0];
    }
    uint64_t v10 = [v9 unsignedIntegerValue];
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld.", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(&unk_1F1F62D18, "objectAtIndexedSubscript:", -[ICTTParagraphStyle indent](self, "indent") % objc_msgSend(&unk_1F1F62D18, "count"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)isHeader
{
  unsigned int v3 = [(ICTTParagraphStyle *)self style];
  if (v3 != 1) {
    LOBYTE(v3) = [(ICTTParagraphStyle *)self style] == 2 || [(ICTTParagraphStyle *)self style] == 0;
  }
  return v3;
}

- (BOOL)isList
{
  if ([(ICTTParagraphStyle *)self isUnknownStyle]) {
    return [(ICTTParagraphStyle *)self hints] & 1;
  }
  if ([(ICTTParagraphStyle *)self style] == 103
    || [(ICTTParagraphStyle *)self style] == 100
    || [(ICTTParagraphStyle *)self style] == 101)
  {
    return 1;
  }
  return [(ICTTParagraphStyle *)self style] == 102;
}

- (unsigned)style
{
  return self->_style;
}

- (BOOL)isUnknownStyle
{
  unsigned int style = self->_style;
  return style > 0x67 || style - 6 < 0x5E;
}

- (unint64_t)indent
{
  return self->_indent;
}

- (BOOL)isRTL
{
  return [(ICTTParagraphStyle *)self writingDirection] == 1;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(ICTTParagraphStyle *)self isEqualToParagraphStyle:a3];
}

- (BOOL)needsParagraphCleanup
{
  return self->_needsParagraphCleanup;
}

- (BOOL)needsListCleanup
{
  return self->_needsListCleanup;
}

- (unint64_t)hash
{
  int8x16_t v10 = (int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_indent, (uint64x2_t)xmmword_1C3DD39A0);
  int8x16_t v9 = (int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_alignment, (uint64x2_t)xmmword_1C3DD39B0);
  uint64_t style = self->_style;
  uint64_t hints = self->_hints;
  unint64_t v5 = [(ICTTTodo *)self->_todo hash];
  uint64_t v6 = [(NSUUID *)self->_uuid hash];
  int8x16_t v7 = veorq_s8(v9, v10);
  return *(void *)&veor_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) ^ style ^ v6 ^ hints ^ v5;
}

- (BOOL)isEqualToParagraphStyle:(id)a3
{
  if (a3)
  {
    BOOL v5 = -[ICTTParagraphStyle isEqualToModelParagraphStyle:](self, "isEqualToModelParagraphStyle:");
    if (v5) {
      LOBYTE(v5) = self->_needsListCleanup == *((unsigned __int8 *)a3 + 9)
    }
                && self->_needsParagraphCleanup == *((unsigned __int8 *)a3 + 8);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isEqualToModelParagraphStyle:(id)a3
{
  if (!a3
    || !-[ICTTParagraphStyle isHierarchicallyEqualToParagraphStyle:](self, "isHierarchicallyEqualToParagraphStyle:")
    || self->_writingDirection != *((void *)a3 + 4))
  {
    return 0;
  }
  uuid = self->_uuid;
  uint64_t v6 = (void *)*((void *)a3 + 9);
  int8x16_t v7 = (void *)*MEMORY[0x1E4F1D260];
  if ((NSUUID *)*MEMORY[0x1E4F1D260] == uuid) {
    uuid = 0;
  }
  id v8 = uuid;
  if (v7 == v6) {
    int8x16_t v9 = 0;
  }
  else {
    int8x16_t v9 = v6;
  }
  unint64_t v10 = v9;
  v11 = (void *)v10;
  if ((unint64_t)v8 | v10)
  {
    if (v8) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      char v14 = 0;
    }
    else {
      char v14 = [v8 isEqual:v10];
    }
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)isHierarchicallyEqualToParagraphStyle:(id)a3
{
  if (!a3
    || self->_style != *((_DWORD *)a3 + 3)
    || self->_alignment != *((void *)a3 + 3)
    || self->_indent != *((void *)a3 + 5)
    || self->_blockQuoteLevel != *((void *)a3 + 6)
    || self->_startingItemNumber != *((void *)a3 + 7)
    || self->_hints != *((_DWORD *)a3 + 4))
  {
    return 0;
  }
  todo = self->_todo;
  v4 = (void *)*((void *)a3 + 8);
  BOOL v5 = (void *)*MEMORY[0x1E4F1D260];
  if ((ICTTTodo *)*MEMORY[0x1E4F1D260] == todo) {
    todo = 0;
  }
  id v6 = todo;
  if (v5 == v4) {
    int8x16_t v7 = 0;
  }
  else {
    int8x16_t v7 = v4;
  }
  unint64_t v8 = v7;
  int8x16_t v9 = (void *)v8;
  if ((unint64_t)v6 | v8)
  {
    if (v6) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      char v12 = 0;
    }
    else {
      char v12 = [v6 isEqual:v8];
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (ICTTParagraphStyle)initWithArchive:(const void *)a3
{
  v4 = [(ICTTParagraphStyle *)self init];
  BOOL v5 = v4;
  if (v4)
  {
    if (*((_DWORD *)a3 + 8)) {
      uint64_t v6 = *((unsigned int *)a3 + 10);
    }
    else {
      uint64_t v6 = 3;
    }
    [(ICTTParagraphStyle *)v4 setStyle:v6];
    if ((*((unsigned char *)a3 + 32) & 2) != 0) {
      int64_t v7 = +[ICTTParagraphStyle textAlignmentForParagraphStyleAlignment:*((unsigned int *)a3 + 11)];
    }
    else {
      int64_t v7 = ICTTParagraphStyleAlignmentDefault;
    }
    [(ICTTParagraphStyle *)v5 setAlignment:v7];
    if ((*((unsigned char *)a3 + 32) & 4) != 0) {
      int64_t v8 = +[ICTTMergeableAttributedString writingDirectionForAttribute:*((unsigned int *)a3 + 12)];
    }
    else {
      int64_t v8 = -1;
    }
    [(ICTTParagraphStyle *)v5 setWritingDirection:v8];
    int v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 8) != 0)
    {
      [(ICTTParagraphStyle *)v5 setIndent:*((int *)a3 + 13)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x80) != 0)
    {
      [(ICTTParagraphStyle *)v5 setBlockQuoteLevel:*((unsigned int *)a3 + 20)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x40) != 0)
    {
      [(ICTTParagraphStyle *)v5 setStartingItemNumber:*((unsigned int *)a3 + 17)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x10) != 0)
    {
      BOOL v10 = [ICTTTodo alloc];
      v11 = v10;
      uint64_t v12 = *((void *)a3 + 7);
      if (!v12) {
        uint64_t v12 = *(void *)(topotext::ParagraphStyle::default_instance((topotext::ParagraphStyle *)v10) + 56);
      }
      v13 = [(ICTTTodo *)v11 initWithArchive:v12];
      [(ICTTParagraphStyle *)v5 setTodo:v13];

      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x20) != 0)
    {
      [(ICTTParagraphStyle *)v5 setHints:*((unsigned int *)a3 + 16)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x100) != 0)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      v15 = (uint64_t *)*((void *)a3 + 9);
      if (*((char *)v15 + 23) < 0) {
        v15 = (uint64_t *)*v15;
      }
      v16 = (void *)[v14 initWithUUIDBytes:v15];
      [(ICTTParagraphStyle *)v5 setUuid:v16];
    }
  }
  return v5;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (void)setUuid:(id)a3
{
}

- (void)setStyle:(unsigned int)a3
{
  self->_uint64_t style = a3;
  todo = self->_todo;
  if (a3 == 103)
  {
    if (todo) {
      return;
    }
    BOOL v5 = objc_alloc_init(ICTTTodo);
    todo = self->_todo;
  }
  else
  {
    BOOL v5 = 0;
  }
  self->_todo = v5;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (ICTTParagraphStyle)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICTTParagraphStyle;
  v2 = [(ICTTParagraphStyle *)&v7 init];
  unsigned int v3 = v2;
  if (v2)
  {
    v2->_uint64_t style = 3;
    v2->_alignment = ICTTParagraphStyleAlignmentDefault;
    v2->_writingDirection = -1;
    if (ICInternalSettingsIsCollapsibleSectionsEnabled())
    {
      uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
      uuid = v3->_uuid;
      v3->_uuid = (NSUUID *)v4;
    }
  }
  return v3;
}

+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3
{
  if (a3 >= 4) {
    return 4;
  }
  else {
    return a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_todo, 0);
}

+ (int)paragraphStyleAlignmentForTextAlignment:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 4;
  }
  else {
    return a3;
  }
}

- (ICTTParagraphStyle)initWithData:(id)a3
{
  id v4 = a3;
  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v11);
  id v5 = v4;
  uint64_t v6 = (char *)[v5 bytes];
  int v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(ICTTParagraphStyle *)self initWithArchive:v11];
    int64_t v8 = self;
  }
  else
  {
    int v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) initWithData:](v9);
    }

    int64_t v8 = 0;
  }
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v11);

  return v8;
}

- (void)saveToArchive:(void *)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([(ICTTParagraphStyle *)self style] != 3)
  {
    unsigned int v5 = [(ICTTParagraphStyle *)self style];
    *((_DWORD *)a3 + 8) |= 1u;
    *((_DWORD *)a3 + 10) = v5;
  }
  int64_t v6 = [(ICTTParagraphStyle *)self alignment];
  if (v6 != ICTTParagraphStyleAlignmentDefault)
  {
    int v7 = (topotext *)+[ICTTParagraphStyle paragraphStyleAlignmentForTextAlignment:[(ICTTParagraphStyle *)self alignment]];
    int v8 = (int)v7;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v7)) {
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:]();
    }
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 11) = v8;
  }
  if ([(ICTTParagraphStyle *)self writingDirection] != -1)
  {
    int v9 = (topotext *)+[ICTTMergeableAttributedString attributeForWritingDirection:[(ICTTParagraphStyle *)self writingDirection]];
    int v10 = (int)v9;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v9)) {
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:]();
    }
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 12) = v10;
  }
  if ([(ICTTParagraphStyle *)self indent])
  {
    int v11 = [(ICTTParagraphStyle *)self indent];
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v11;
  }
  if ([(ICTTParagraphStyle *)self blockQuoteLevel])
  {
    int v12 = [(ICTTParagraphStyle *)self blockQuoteLevel];
    *((_DWORD *)a3 + 8) |= 0x80u;
    *((_DWORD *)a3 + 20) = v12;
  }
  if ([(ICTTParagraphStyle *)self startingItemNumber])
  {
    int v13 = [(ICTTParagraphStyle *)self startingItemNumber];
    *((_DWORD *)a3 + 8) |= 0x40u;
    *((_DWORD *)a3 + 17) = v13;
  }
  id v14 = [(ICTTParagraphStyle *)self todo];

  if (v14)
  {
    v15 = [(ICTTParagraphStyle *)self todo];
    *((_DWORD *)a3 + 8) |= 0x10u;
    uint64_t v16 = *((void *)a3 + 7);
    if (!v16) {
      operator new();
    }
    [v15 saveToArchive:v16];
  }
  if ([(ICTTParagraphStyle *)self hints])
  {
    unsigned int v17 = [(ICTTParagraphStyle *)self hints];
    *((_DWORD *)a3 + 8) |= 0x20u;
    *((_DWORD *)a3 + 16) = v17;
  }
  v18 = [(ICTTParagraphStyle *)self uuid];

  if (v18)
  {
    v20[0] = 0;
    v20[1] = 0;
    v19 = [(ICTTParagraphStyle *)self uuid];
    [v19 getUUIDBytes:v20];

    *((_DWORD *)a3 + 8) |= 0x100u;
    if (!google::protobuf::internal::empty_string_) {
      versioned_document::Version::SharedCtor();
    }
    if (*((void *)a3 + 9) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
}

- (id)serialize
{
  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v7);
  [(ICTTParagraphStyle *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::ParagraphStyle::ByteSize((topotext::ParagraphStyle *)v7)];
  id v4 = (void *)[v3 mutableBytes];
  int v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v7);
  return v3;
}

- (ICTTParagraphStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufArchiveKey"];
  int64_t v6 = [(ICTTParagraphStyle *)self initWithData:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ICTTParagraphStyle *)self serialize];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"protobufArchiveKey"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultParagraphStyle
{
  if (defaultParagraphStyle_onceToken != -1) {
    dispatch_once(&defaultParagraphStyle_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)defaultParagraphStyle_defaultParagraphStyle;
  return v2;
}

void __43__ICTTParagraphStyle_defaultParagraphStyle__block_invoke()
{
  v0 = objc_alloc_init(ICTTParagraphStyle);
  v1 = (void *)defaultParagraphStyle_defaultParagraphStyle;
  defaultParagraphStyle_defaultParagraphStyle = (uint64_t)v0;
}

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(ICTTParagraphStyle);
  [(ICTTParagraphStyle *)v4 setStyle:v3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ICTTParagraphStyle allocWithZone:](ICTTParagraphStyle, "allocWithZone:") init];
  int64_t v6 = [(ICTTParagraphStyle *)self todo];
  int v7 = (void *)[v6 copyWithZone:a3];
  [(ICTTParagraphStyle *)v5 setTodo:v7];

  [(ICTTParagraphStyle *)v5 setStyle:[(ICTTParagraphStyle *)self style]];
  [(ICTTParagraphStyle *)v5 setAlignment:self->_alignment];
  [(ICTTParagraphStyle *)v5 setWritingDirection:self->_writingDirection];
  [(ICTTParagraphStyle *)v5 setIndent:[(ICTTParagraphStyle *)self indent]];
  [(ICTTParagraphStyle *)v5 setBlockQuoteLevel:[(ICTTParagraphStyle *)self blockQuoteLevel]];
  [(ICTTParagraphStyle *)v5 setStartingItemNumber:[(ICTTParagraphStyle *)self startingItemNumber]];
  [(ICTTParagraphStyle *)v5 setHints:[(ICTTParagraphStyle *)self hints]];
  [(ICTTParagraphStyle *)v5 setNeedsParagraphCleanup:[(ICTTParagraphStyle *)self needsParagraphCleanup]];
  [(ICTTParagraphStyle *)v5 setNeedsListCleanup:[(ICTTParagraphStyle *)self needsListCleanup]];
  int v8 = [(ICTTParagraphStyle *)self uuid];
  int v9 = (void *)[v8 copyWithZone:a3];
  [(ICTTParagraphStyle *)v5 setUuid:v9];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(ICTTParagraphStyle *)+[ICTTMutableParagraphStyle allocWithZone:](ICTTMutableParagraphStyle, "allocWithZone:") init];
  int64_t v6 = [(ICTTParagraphStyle *)self todo];
  int v7 = (void *)[v6 copyWithZone:a3];
  [(ICTTParagraphStyle *)v5 setTodo:v7];

  [(ICTTParagraphStyle *)v5 setStyle:[(ICTTParagraphStyle *)self style]];
  [(ICTTParagraphStyle *)v5 setAlignment:self->_alignment];
  [(ICTTParagraphStyle *)v5 setWritingDirection:self->_writingDirection];
  [(ICTTParagraphStyle *)v5 setIndent:[(ICTTParagraphStyle *)self indent]];
  [(ICTTParagraphStyle *)v5 setBlockQuoteLevel:[(ICTTParagraphStyle *)self blockQuoteLevel]];
  [(ICTTParagraphStyle *)v5 setStartingItemNumber:[(ICTTParagraphStyle *)self startingItemNumber]];
  [(ICTTParagraphStyle *)v5 setHints:[(ICTTParagraphStyle *)self hints]];
  [(ICTTParagraphStyle *)v5 setNeedsParagraphCleanup:[(ICTTParagraphStyle *)self needsParagraphCleanup]];
  [(ICTTParagraphStyle *)v5 setNeedsListCleanup:[(ICTTParagraphStyle *)self needsListCleanup]];
  int v8 = [(ICTTParagraphStyle *)self uuid];
  int v9 = (void *)[v8 copyWithZone:a3];
  [(ICTTParagraphStyle *)v5 setUuid:v9];

  return v5;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(ICTTParagraphStyle *)self isEqualToModelParagraphStyle:a3];
}

- (BOOL)canIndent
{
  return [(ICTTParagraphStyle *)self isList] || [(ICTTParagraphStyle *)self style] == 3;
}

- (void)setIndent:(unint64_t)a3
{
  uint64_t v3 = ICTTParagraphStyleMaximumIndent;
  if (ICTTParagraphStyleMaximumIndent >= a3) {
    uint64_t v3 = a3;
  }
  self->_indent = v3;
}

- (void)setBlockQuoteLevel:(unint64_t)a3
{
  self->_blockQuoteLevel = a3;
}

- (BOOL)preferSingleLine
{
  if ([(ICTTParagraphStyle *)self isUnknownStyle])
  {
    return ([(ICTTParagraphStyle *)self hints] >> 1) & 1;
  }
  else if ([(ICTTParagraphStyle *)self style] == 3 || [(ICTTParagraphStyle *)self style] == 4)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = ![(ICTTParagraphStyle *)self isList];
  }
  return v3;
}

- (BOOL)wantsFollowingNewLine
{
  if ([(ICTTParagraphStyle *)self isList] || [(ICTTParagraphStyle *)self style] == 4) {
    return 1;
  }
  return [(ICTTParagraphStyle *)self isBlockQuote];
}

- (NSString)description
{
  BOOL v3 = [(ICTTParagraphStyle *)self todo];
  if (v3)
  {
    id v4 = NSString;
    id v5 = [(ICTTParagraphStyle *)self todo];
    int64_t v6 = [v5 description];
    [v4 stringWithFormat:@" todo=%@", v6];
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = &stru_1F1F2FFF8;
  }

  if ([(ICTTParagraphStyle *)self writingDirection])
  {
    int64_t v7 = [(ICTTParagraphStyle *)self writingDirection];
    int v8 = @"Natural";
    if (v7 == 1) {
      int v8 = @"RTL";
    }
  }
  else
  {
    int v8 = @"LTR";
  }
  int v9 = v8;
  BOOL v10 = [(ICTTParagraphStyle *)self needsParagraphCleanup];
  int v11 = @" needsParagraphCleanup";
  if (!v10) {
    int v11 = &stru_1F1F2FFF8;
  }
  v24 = NSString;
  int v12 = v11;
  int v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  uint64_t v15 = [(ICTTParagraphStyle *)self style];
  int64_t v16 = [(ICTTParagraphStyle *)self alignment];
  unint64_t v17 = [(ICTTParagraphStyle *)self indent];
  unint64_t v18 = [(ICTTParagraphStyle *)self blockQuoteLevel];
  v19 = [(ICTTParagraphStyle *)self uuid];
  BOOL v20 = [(ICTTParagraphStyle *)self needsListCleanup];
  v21 = @" needsListCleanup";
  if (!v20) {
    v21 = &stru_1F1F2FFF8;
  }
  v22 = [v24 stringWithFormat:@"<%@: %p style=%lu alignment=%lu indent=%ld blockQuoteLevel=%ld uuid=%@ %@%@%@%@>", v14, self, v15, v16, v17, v18, v19, v9, v25, v12, v21];

  return (NSString *)v22;
}

- (unint64_t)startingItemNumber
{
  return self->_startingItemNumber;
}

- (void)setStartingItemNumber:(unint64_t)a3
{
  self->_startingItemNumber = a3;
}

- (void)setTodo:(id)a3
{
}

- (unsigned)hints
{
  return self->_hints;
}

- (void)setHints:(unsigned int)a3
{
  self->_uint64_t hints = a3;
}

- (void)setNeedsParagraphCleanup:(BOOL)a3
{
  self->_needsParagraphCleanup = a3;
}

- (void)setNeedsListCleanup:(BOOL)a3
{
  self->_needsListCleanup = a3;
}

@end