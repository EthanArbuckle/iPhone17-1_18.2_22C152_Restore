@interface TTParagraphStyle
+ (BOOL)supportsSecureCoding;
+ (id)defaultParagraphStyle;
+ (id)paragraphStyleNamed:(unsigned int)a3;
+ (int)paragraphStyleAlignmentForTextAlignment:(int64_t)a3;
+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3;
- (BOOL)canIndent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelComparable:(id)a3;
- (BOOL)isEqualToModelParagraphStyle:(id)a3;
- (BOOL)isEqualToParagraphStyle:(id)a3;
- (BOOL)isHeader;
- (BOOL)isList;
- (BOOL)isUnknownStyle;
- (BOOL)needsListCleanup;
- (BOOL)needsParagraphCleanup;
- (BOOL)preferSingleLine;
- (BOOL)uniqueToLine;
- (BOOL)wantsFollowingNewLine;
- (NSString)description;
- (NSUUID)trackingUUID;
- (TTParagraphStyle)init;
- (TTParagraphStyle)initWithArchive:(const void *)a3;
- (TTParagraphStyle)initWithCoder:(id)a3;
- (TTParagraphStyle)initWithData:(id)a3;
- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)serialize;
- (int64_t)alignment;
- (int64_t)writingDirection;
- (unint64_t)hash;
- (unint64_t)indent;
- (unint64_t)startingItemNumber;
- (unsigned)hints;
- (unsigned)style;
- (void)encodeWithCoder:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setHints:(unsigned int)a3;
- (void)setIndent:(unint64_t)a3;
- (void)setNeedsListCleanup:(BOOL)a3;
- (void)setNeedsParagraphCleanup:(BOOL)a3;
- (void)setStartingItemNumber:(unint64_t)a3;
- (void)setStyle:(unsigned int)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation TTParagraphStyle

+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3
{
  if (a3 >= 4) {
    return 4;
  }
  else {
    return a3;
  }
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

- (TTParagraphStyle)initWithData:(id)a3
{
  id v4 = a3;
  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v11);
  id v5 = v4;
  v6 = (char *)[v5 bytes];
  int v7 = TTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(TTParagraphStyle *)self initWithArchive:v11];
    v8 = self;
  }
  else
  {
    v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) initWithData:](v9);
    }

    v8 = 0;
  }
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v11);

  return v8;
}

- (TTParagraphStyle)initWithArchive:(const void *)a3
{
  id v4 = [(TTParagraphStyle *)self init];
  id v5 = v4;
  if (v4)
  {
    if (*((_DWORD *)a3 + 8)) {
      uint64_t v6 = *((unsigned int *)a3 + 10);
    }
    else {
      uint64_t v6 = 3;
    }
    [(TTParagraphStyle *)v4 setStyle:v6];
    if ((*((unsigned char *)a3 + 32) & 2) != 0) {
      int64_t v7 = +[TTParagraphStyle textAlignmentForParagraphStyleAlignment:*((unsigned int *)a3 + 11)];
    }
    else {
      int64_t v7 = 4;
    }
    [(TTParagraphStyle *)v5 setAlignment:v7];
    if ((*((unsigned char *)a3 + 32) & 4) != 0) {
      int64_t v8 = +[TTMergeableAttributedString writingDirectionForAttribute:*((unsigned int *)a3 + 12)];
    }
    else {
      int64_t v8 = -1;
    }
    [(TTParagraphStyle *)v5 setWritingDirection:v8];
    int v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 8) != 0)
    {
      [(TTParagraphStyle *)v5 setIndent:*((int *)a3 + 13)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x40) != 0)
    {
      [(TTParagraphStyle *)v5 setStartingItemNumber:*((unsigned int *)a3 + 17)];
      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x20) != 0) {
      [(TTParagraphStyle *)v5 setHints:*((unsigned int *)a3 + 16)];
    }
  }
  return v5;
}

- (void)saveToArchive:(void *)a3
{
  if ([(TTParagraphStyle *)self style] != 3)
  {
    unsigned int v5 = [(TTParagraphStyle *)self style];
    *((_DWORD *)a3 + 8) |= 1u;
    *((_DWORD *)a3 + 10) = v5;
  }
  if ([(TTParagraphStyle *)self alignment] != 4)
  {
    uint64_t v6 = (topotext *)+[TTParagraphStyle paragraphStyleAlignmentForTextAlignment:[(TTParagraphStyle *)self alignment]];
    int v7 = (int)v6;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v6)) {
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) saveToArchive:]();
    }
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 11) = v7;
  }
  if ([(TTParagraphStyle *)self writingDirection] != -1)
  {
    int64_t v8 = (topotext *)+[TTMergeableAttributedString attributeForWritingDirection:[(TTParagraphStyle *)self writingDirection]];
    int v9 = (int)v8;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v8)) {
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) saveToArchive:]();
    }
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 12) = v9;
  }
  if ([(TTParagraphStyle *)self indent])
  {
    int v10 = [(TTParagraphStyle *)self indent];
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v10;
  }
  if ([(TTParagraphStyle *)self startingItemNumber])
  {
    int v11 = [(TTParagraphStyle *)self startingItemNumber];
    *((_DWORD *)a3 + 8) |= 0x40u;
    *((_DWORD *)a3 + 17) = v11;
  }
  if ([(TTParagraphStyle *)self hints])
  {
    unsigned int v12 = [(TTParagraphStyle *)self hints];
    *((_DWORD *)a3 + 8) |= 0x20u;
    *((_DWORD *)a3 + 16) = v12;
  }
}

- (id)serialize
{
  -[TTParagraphStyle saveToArchive:](self, "saveToArchive:", v6, topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v6));
  id v2 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::ParagraphStyle::ByteSize((topotext::ParagraphStyle *)v6)];
  v3 = (void *)[v2 mutableBytes];
  int v4 = TTBoundedCheckedCastNSUIntegerToUInt32([v2 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v6);

  return v2;
}

- (TTParagraphStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufArchiveKey"];
  uint64_t v6 = [(TTParagraphStyle *)self initWithData:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(TTParagraphStyle *)self serialize];
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
    dispatch_once(&defaultParagraphStyle_onceToken, &__block_literal_global_46);
  }
  id v2 = (void *)defaultParagraphStyle_defaultParagraphStyle;

  return v2;
}

uint64_t __41__TTParagraphStyle_defaultParagraphStyle__block_invoke()
{
  defaultParagraphStyle_defaultParagraphStyle = objc_alloc_init(TTParagraphStyle);

  return MEMORY[0x1F41817F8]();
}

- (TTParagraphStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)TTParagraphStyle;
  result = [(TTParagraphStyle *)&v3 init];
  if (result)
  {
    result->_style = 3;
    *(_OWORD *)&result->_alignment = xmmword_1B9BF23D0;
  }
  return result;
}

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(TTParagraphStyle);
  [(TTParagraphStyle *)v4 setStyle:v3];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TTMutableParagraphStyle);
  [(TTParagraphStyle *)v4 setStyle:[(TTParagraphStyle *)self style]];
  [(TTParagraphStyle *)v4 setAlignment:self->_alignment];
  [(TTParagraphStyle *)v4 setWritingDirection:self->_writingDirection];
  [(TTParagraphStyle *)v4 setIndent:[(TTParagraphStyle *)self indent]];
  [(TTParagraphStyle *)v4 setStartingItemNumber:[(TTParagraphStyle *)self startingItemNumber]];
  [(TTParagraphStyle *)v4 setHints:[(TTParagraphStyle *)self hints]];
  [(TTParagraphStyle *)v4 setNeedsParagraphCleanup:[(TTParagraphStyle *)self needsParagraphCleanup]];
  [(TTParagraphStyle *)v4 setNeedsListCleanup:[(TTParagraphStyle *)self needsListCleanup]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TTParagraphStyle *)self isEqualToParagraphStyle:v4];

  return v5;
}

- (BOOL)isEqualToParagraphStyle:(id)a3
{
  id v4 = a3;
  if ([(TTParagraphStyle *)self isEqualToModelParagraphStyle:v4]
    && (int v5 = [(TTParagraphStyle *)self needsListCleanup],
        v5 == [v4 needsListCleanup]))
  {
    BOOL v7 = [(TTParagraphStyle *)self needsParagraphCleanup];
    int v6 = v7 ^ [v4 needsParagraphCleanup] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TTParagraphStyle *)self isEqualToModelParagraphStyle:v4];

  return v5;
}

- (BOOL)isEqualToModelParagraphStyle:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TTParagraphStyle *)self style];
  if (v5 == [v4 style]
    && (int64_t v6 = -[TTParagraphStyle alignment](self, "alignment"), v6 == [v4 alignment])
    && (int64_t v7 = -[TTParagraphStyle writingDirection](self, "writingDirection"), v7 == [v4 writingDirection])
    && (unint64_t v8 = -[TTParagraphStyle indent](self, "indent"), v8 == [v4 indent])
    && (unint64_t v9 = [(TTParagraphStyle *)self startingItemNumber],
        v9 == [v4 startingItemNumber]))
  {
    unsigned int v10 = [(TTParagraphStyle *)self hints];
    BOOL v11 = v10 == [v4 hints];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TTParagraphStyle *)self style];
  unint64_t v4 = v3 ^ (16 * [(TTParagraphStyle *)self indent]);
  int64_t v5 = v4 ^ ([(TTParagraphStyle *)self alignment] << 6);
  int64_t v6 = v5 ^ ([(TTParagraphStyle *)self writingDirection] << 8);
  return v6 ^ [(TTParagraphStyle *)self hints];
}

- (void)setStyle:(unsigned int)a3
{
  self->_style = a3;
}

- (BOOL)isUnknownStyle
{
  return self->_style - 6 < 0x5E;
}

- (BOOL)canIndent
{
  return [(TTParagraphStyle *)self isList] || [(TTParagraphStyle *)self style] == 3;
}

- (BOOL)isList
{
  if ([(TTParagraphStyle *)self isUnknownStyle]) {
    return [(TTParagraphStyle *)self hints] & 1;
  }
  if ([(TTParagraphStyle *)self style] == 100 || [(TTParagraphStyle *)self style] == 101) {
    return 1;
  }
  return [(TTParagraphStyle *)self style] == 102;
}

- (BOOL)isHeader
{
  unsigned int v3 = [(TTParagraphStyle *)self style];
  if (v3 != 1) {
    LOBYTE(v3) = [(TTParagraphStyle *)self style] == 2 || [(TTParagraphStyle *)self style] == 0;
  }
  return v3;
}

- (BOOL)preferSingleLine
{
  if ([(TTParagraphStyle *)self isUnknownStyle])
  {
    return ([(TTParagraphStyle *)self hints] >> 1) & 1;
  }
  else if ([(TTParagraphStyle *)self style] == 3 || [(TTParagraphStyle *)self style] == 4)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = ![(TTParagraphStyle *)self isList];
  }
  return v3;
}

- (BOOL)wantsFollowingNewLine
{
  return [(TTParagraphStyle *)self isList] || [(TTParagraphStyle *)self style] == 4;
}

- (BOOL)uniqueToLine
{
  return 0;
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(TTParagraphStyle *)self style];
  if (v7 == 101)
  {
    BOOL v11 = @"–";
  }
  else if (v7 == 102)
  {
    uint64_t v8 = [v6 attribute:TTPresentationAttributeNameItemNumber atIndex:a4 effectiveRange:0];
    unint64_t v9 = (void *)v8;
    if (a4 && !v8)
    {
      unint64_t v9 = [v6 attribute:TTPresentationAttributeNameItemNumber atIndex:a4 - 1 effectiveRange:0];
    }
    uint64_t v10 = [v9 unsignedIntegerValue];
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld.", v10);
    BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v12 = [(TTParagraphStyle *)self indent];
    if (v12 >= 2) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v12;
    }
    BOOL v11 = [&unk_1F136C248 objectAtIndexedSubscript:v13];
  }

  return v11;
}

- (NSUUID)trackingUUID
{
  return 0;
}

- (NSString)description
{
  if ([(TTParagraphStyle *)self writingDirection])
  {
    int64_t v3 = [(TTParagraphStyle *)self writingDirection];
    unint64_t v4 = @"Natural";
    if (v3 == 1) {
      unint64_t v4 = @"RTL";
    }
  }
  else
  {
    unint64_t v4 = @"LTR";
  }
  int64_t v5 = v4;
  BOOL v6 = [(TTParagraphStyle *)self needsParagraphCleanup];
  unsigned int v7 = @" needsParagraphCleanup";
  if (!v6) {
    unsigned int v7 = &stru_1F1339A18;
  }
  uint64_t v8 = NSString;
  unint64_t v9 = v7;
  uint64_t v10 = (objc_class *)objc_opt_class();
  BOOL v11 = NSStringFromClass(v10);
  uint64_t v12 = [(TTParagraphStyle *)self style];
  int64_t v13 = [(TTParagraphStyle *)self alignment];
  unint64_t v14 = [(TTParagraphStyle *)self indent];
  BOOL v15 = [(TTParagraphStyle *)self needsListCleanup];
  v16 = @" needsListCleanup";
  if (!v15) {
    v16 = &stru_1F1339A18;
  }
  v17 = [v8 stringWithFormat:@"<%@: %p style=%lu alignment=%lu indent=%ld %@%@%@%@>", v11, self, v12, v13, v14, v5, &stru_1F1339A18, v9, v16];

  return (NSString *)v17;
}

- (unsigned)style
{
  return self->_style;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (unint64_t)indent
{
  return self->_indent;
}

- (void)setIndent:(unint64_t)a3
{
  self->_indent = a3;
}

- (unint64_t)startingItemNumber
{
  return self->_startingItemNumber;
}

- (void)setStartingItemNumber:(unint64_t)a3
{
  self->_startingItemNumber = a3;
}

- (unsigned)hints
{
  return self->_hints;
}

- (void)setHints:(unsigned int)a3
{
  self->_hints = a3;
}

- (BOOL)needsParagraphCleanup
{
  return self->_needsParagraphCleanup;
}

- (void)setNeedsParagraphCleanup:(BOOL)a3
{
  self->_needsParagraphCleanup = a3;
}

- (BOOL)needsListCleanup
{
  return self->_needsListCleanup;
}

- (void)setNeedsListCleanup:(BOOL)a3
{
  self->_needsListCleanup = a3;
}

@end