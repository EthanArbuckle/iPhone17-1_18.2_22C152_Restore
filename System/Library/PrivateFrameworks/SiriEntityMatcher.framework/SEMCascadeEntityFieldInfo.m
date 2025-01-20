@interface SEMCascadeEntityFieldInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCascadeEntityFieldInfo:(id)a3;
- (SEMCascadeEntityFieldInfo)init;
- (SEMCascadeEntityFieldInfo)initWithCoder:(id)a3;
- (SEMCascadeEntityFieldInfo)initWithFieldType:(unsigned __int16)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)toKVFieldType:(id *)a3;
- (unint64_t)hash;
- (unsigned)entityType;
- (unsigned)fieldType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMCascadeEntityFieldInfo

- (SEMCascadeEntityFieldInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMCascadeEntityFieldInfo)initWithFieldType:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SEMCascadeEntityFieldInfo;
  result = [(SEMCascadeEntityFieldInfo *)&v5 init];
  if (result) {
    result->_fieldType = a3;
  }
  return result;
}

- (unsigned)entityType
{
  return 1;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (int64_t)toKVFieldType:(id *)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  int64_t v7 = KVFieldTypeFromCascadeFieldType();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F07F80];
    v9 = NSString;
    v10 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v5, self->_fieldType, v6);
    v13 = objc_msgSend_stringWithFormat_(v9, v11, @"No conversion from Cascade fieldType: %@ to KVFieldType", v12, v10);
    v21[0] = v13;
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v21, (uint64_t)&v20, 1);
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(v8, v16, @"com.apple.siri.inference.SEMSpanMatcher", 2, v15);
    v18 = v17;
    if (a3 && v17) {
      *a3 = v17;
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_opt_class();
  id result = (id)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  *((_WORD *)result + 4) = self->_fieldType;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMCascadeEntityFieldInfo *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    char isEqualToCascadeEntityFieldInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToCascadeEntityFieldInfo = objc_msgSend_isEqualToCascadeEntityFieldInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToCascadeEntityFieldInfo = 0;
  }

  return isEqualToCascadeEntityFieldInfo;
}

- (BOOL)isEqualToCascadeEntityFieldInfo:(id)a3
{
  int fieldType = self->_fieldType;
  return fieldType == objc_msgSend_fieldType(a3, a2, (uint64_t)a3, v3);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)SEMCascadeEntityFieldInfo;
  uint64_t v3 = [(SEMCascadeEntityFieldInfo *)&v11 description];
  uint64_t v6 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v4, self->_fieldType, v5);
  v9 = objc_msgSend_stringByAppendingFormat_(v3, v7, @" fieldType: %@", v8, v6);

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_fieldType, v2);
  unint64_t v7 = objc_msgSend_hash(v3, v4, v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMCascadeEntityFieldInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SEMCascadeEntityFieldInfo;
  unint64_t v7 = [(SEMCascadeEntityFieldInfo *)&v9 init];
  if (v7) {
    v7->_int fieldType = objc_msgSend_decodeIntegerForKey_(v4, v5, @"fieldType", v6);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

@end