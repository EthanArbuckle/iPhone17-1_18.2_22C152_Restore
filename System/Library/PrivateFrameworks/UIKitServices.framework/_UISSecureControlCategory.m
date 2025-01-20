@interface _UISSecureControlCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)iconGlyph;
- (_UISSecureControlCategory)initWithCoder:(id)a3;
- (_UISSecureControlCategory)initWithType:(unint64_t)a3 iconIndex:(unint64_t)a4 labelIndex:(unint64_t)a5;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (unsigned)secureName;
- (unsigned)secureNameForDrawing;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISSecureControlCategory

- (_UISSecureControlCategory)initWithType:(unint64_t)a3 iconIndex:(unint64_t)a4 labelIndex:(unint64_t)a5
{
  __int16 v5 = a5;
  char v6 = a4;
  char v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISSecureControlCategory;
  result = [(_UISSecureControlCategory *)&v9 init];
  if (result) {
    result->_fields.all = v7 & 0x3F | ((v6 & 0x1F) << 6) | (v5 << 11);
  }
  return result;
}

- (_UISSecureControlCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UISSecureControlCategory;
  __int16 v5 = [(_UISSecureControlCategory *)&v7 init];
  if (v5) {
    v5->_fields.all = [v4 decodeInt32ForKey:@"all"];
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];
  __int16 v5 = &unk_1EE295868;
  if (v4 != 1) {
    __int16 v5 = 0;
  }
  if (v4) {
    char v6 = v5;
  }
  else {
    char v6 = &unk_1EE295850;
  }
  objc_super v7 = [v6 objectAtIndexedSubscript:self->_fields.all & 0x3FLL];
  unint64_t v8 = [v7 unsignedLongLongValue];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return +[_UISSecureControlCategory hash] ^ self->_fields.all;
}

- (NSString)iconGlyph
{
  v3 = [&unk_1EE2957D8 objectAtIndexedSubscript:self->_fields.all & 0x3FLL];
  uint64_t v4 = [v3 objectAtIndexedSubscript:((unint64_t)self->_fields.all >> 6) & 0x1F];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_fields.all == v4[4];

  return v5;
}

- (BOOL)isValid
{
  if ((self->_fields.all & 0x3F) != 1) {
    return 0;
  }
  v3 = [&unk_1EE295838 objectAtIndexedSubscript:1];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:(self->_fields.all >> 11) & 0xFFE0FFFF | (((self->_fields.all >> 6) & 0x1F) << 16)];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (unsigned)secureName
{
  v3 = [&unk_1EE295808 objectAtIndexedSubscript:self->_fields.all & 0x3FLL];
  uint64_t v4 = [v3 objectAtIndexedSubscript:(unint64_t)self->_fields.all >> 11];
  unsigned int v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (unsigned)secureNameForDrawing
{
  if (self->_fields.all >= 0x800u) {
    return [(_UISSecureControlCategory *)self secureName];
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)type
{
  return self->_fields.all & 0x3FLL;
}

@end