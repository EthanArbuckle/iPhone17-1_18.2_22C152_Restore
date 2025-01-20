@interface TTFont
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)fontName;
- (TTFont)initWithArchive:(const void *)a3;
- (TTFont)initWithCoder:(id)a3;
- (TTFont)initWithData:(id)a3;
- (TTFont)initWithName:(id)a3 size:(double)a4 hints:(unsigned int)a5;
- (double)pointSize;
- (id)description;
- (id)nativeFont;
- (id)serialize;
- (unint64_t)hash;
- (unsigned)fontHints;
- (void)encodeWithCoder:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setNativeFont:(id)a3;
@end

@implementation TTFont

- (TTFont)initWithName:(id)a3 size:(double)a4 hints:(unsigned int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTFont;
  v9 = [(TTFont *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    fontName = v9->_fontName;
    v9->_fontName = (NSString *)v10;

    v9->_pointSize = a4;
    v9->_fontHints = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(TTFont *)self fontName];
    v9 = [v7 fontName];
    if (v8 == v9
      || ([(TTFont *)self fontName],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v7 fontName],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      [(TTFont *)self pointSize];
      double v12 = v11;
      [v7 pointSize];
      if (v12 == v13)
      {
        unsigned int v14 = [(TTFont *)self fontHints];
        BOOL v10 = v14 == [v7 fontHints];
      }
      else
      {
        BOOL v10 = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(TTFont *)self fontName];
  uint64_t v4 = [v3 hash];
  [(TTFont *)self pointSize];
  unint64_t v6 = v4 ^ [(TTFont *)self fontHints] ^ (unint64_t)v5;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  unint64_t v6 = [(TTFont *)self fontName];
  [(TTFont *)self pointSize];
  uint64_t v8 = v7;
  if ([(TTFont *)self fontHints]) {
    v9 = @" bold";
  }
  else {
    v9 = &stru_1F1339A18;
  }
  char v10 = [(TTFont *)self fontHints];
  double v11 = @" italic";
  if ((v10 & 2) == 0) {
    double v11 = &stru_1F1339A18;
  }
  double v12 = [v3 stringWithFormat:@"<%@: %p %@ %0.1f%@%@>", v5, self, v6, v8, v9, v11];

  return v12;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (unsigned)fontHints
{
  return self->_fontHints;
}

- (id)nativeFont
{
  return self->_nativeFont;
}

- (void)setNativeFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nativeFont, 0);

  objc_storeStrong((id *)&self->_fontName, 0);
}

- (TTFont)initWithData:(id)a3
{
  id v4 = a3;
  topotext::Font::Font((topotext::Font *)v11);
  id v5 = v4;
  unint64_t v6 = (char *)[v5 bytes];
  int v7 = TTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(TTFont *)self initWithArchive:v11];
    uint64_t v8 = self;
  }
  else
  {
    v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) initWithData:](v9);
    }

    uint64_t v8 = 0;
  }
  topotext::Font::~Font((topotext::Font *)v11);

  return v8;
}

- (TTFont)initWithArchive:(const void *)a3
{
  int v5 = *((_DWORD *)a3 + 8);
  if (v5)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v8 + 23) < 0)
    {
      uint64_t v8 = (uint64_t *)*v8;
      uint64_t v9 = *(void *)(*((void *)a3 + 5) + 8);
    }
    else
    {
      uint64_t v9 = *((unsigned __int8 *)v8 + 23);
    }
    uint64_t v10 = [v7 initWithBytes:v8 length:v9 encoding:4];
    int v5 = *((_DWORD *)a3 + 8);
    unint64_t v6 = (void *)v10;
  }
  else
  {
    unint64_t v6 = 0;
  }
  float v11 = *((float *)a3 + 12);
  double v12 = [TTFont alloc];
  double v13 = v11;
  if ((v5 & 2) == 0) {
    double v13 = 0.0;
  }
  unsigned int v14 = [(TTFont *)v12 initWithName:v6 size:*((_DWORD *)a3 + 13) & ((int)(*((_DWORD *)a3 + 8) << 29) >> 31) hints:v13];

  return v14;
}

- (void)saveToArchive:(void *)a3
{
  int v5 = [(TTFont *)self fontName];

  if (v5)
  {
    id v6 = [(TTFont *)self fontName];
    [v6 UTF8String];
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 5) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1BA9DB480]();
  }
  [(TTFont *)self pointSize];
  if (v7 > 0.0)
  {
    [(TTFont *)self pointSize];
    *(float *)&double v8 = v8;
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 12) = LODWORD(v8);
  }
  if ([(TTFont *)self fontHints])
  {
    unsigned int v9 = [(TTFont *)self fontHints];
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 13) = v9;
  }
}

- (id)serialize
{
  topotext::Font::Font((topotext::Font *)v7);
  [(TTFont *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::Font::ByteSize((topotext::Font *)v7)];
  id v4 = (void *)[v3 mutableBytes];
  int v5 = TTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Font::~Font((topotext::Font *)v7);

  return v3;
}

- (TTFont)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufArchiveKey"];
  id v6 = [(TTFont *)self initWithData:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(TTFont *)self serialize];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"protobufArchiveKey"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end