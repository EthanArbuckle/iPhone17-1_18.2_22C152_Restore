@interface SEMFieldMatch
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanMatchField:(id)a3;
- (SEMFieldMatch)init;
- (SEMFieldMatch)initWithCoder:(id)a3;
- (SEMFieldMatch)initWithSpanInfo:(id)a3 entityFieldInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entityFieldInfo;
- (id)fieldSpanInfo;
- (id)fieldSpanValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMFieldMatch

- (SEMFieldMatch)initWithSpanInfo:(id)a3 entityFieldInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SEMFieldMatch;
  v9 = [(SEMFieldMatch *)&v22 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v9->_spanInfo, a3);
  if (!v10->_spanInfo)
  {
    uint64_t v15 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v24 = "-[SEMFieldMatch initWithSpanInfo:entityFieldInfo:]";
    v16 = "%s Cannot initialize span match field with nil span info.";
    v17 = v15;
    uint32_t v18 = 12;
LABEL_11:
    _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_entityFieldInfo, a4);
  if (objc_msgSend_entityType(v10->_entityFieldInfo, v11, v12, v13) != 1)
  {
    uint64_t v19 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    entityFieldInfo = v10->_entityFieldInfo;
    *(_DWORD *)buf = 136315394;
    v24 = "-[SEMFieldMatch initWithSpanInfo:entityFieldInfo:]";
    __int16 v25 = 2112;
    v26 = entityFieldInfo;
    v16 = "%s Cannot initalize span match field with invalid entityFieldInfo: %@";
    v17 = v19;
    uint32_t v18 = 22;
    goto LABEL_11;
  }
LABEL_4:
  v14 = v10;
LABEL_9:

  return v14;
}

- (SEMFieldMatch)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)entityFieldInfo
{
  return self->_entityFieldInfo;
}

- (id)fieldSpanInfo
{
  return self->_spanInfo;
}

- (id)fieldSpanValue
{
  return (id)objc_msgSend_value(self->_spanInfo, a2, v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_spanInfo, v9, (uint64_t)a3, v10);
  uint64_t v12 = (void *)v8[1];
  v8[1] = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_entityFieldInfo, v13, (uint64_t)a3, v14);
  v16 = (void *)v8[2];
  v8[2] = v15;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMFieldMatch *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanMatchField = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanMatchField = objc_msgSend_isEqualToSpanMatchField_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToSpanMatchField = 0;
  }

  return isEqualToSpanMatchField;
}

- (BOOL)isEqualToSpanMatchField:(id)a3
{
  id v4 = a3;
  spanInfo = self->_spanInfo;
  v9 = objc_msgSend_fieldSpanInfo(v4, v6, v7, v8);
  if (objc_msgSend_isEqual_(spanInfo, v10, (uint64_t)v9, v11))
  {
    entityFieldInfo = self->_entityFieldInfo;
    v16 = objc_msgSend_entityFieldInfo(v4, v12, v13, v14);
    char isEqual = objc_msgSend_isEqual_(entityFieldInfo, v17, (uint64_t)v16, v18);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMFieldMatch;
  uint64_t v3 = [(SEMFieldMatch *)&v8 description];
  v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" spanInfo: %@, entityFieldInfo: %@", v5, self->_spanInfo, self->_entityFieldInfo);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_spanInfo, a2, v2, v3);
  return objc_msgSend_hash(self->_entityFieldInfo, v6, v7, v8) ^ v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMFieldMatch)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SEMFieldMatch;
  uint64_t v5 = [(SEMFieldMatch *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"spanInfo");
    spanInfo = v5->_spanInfo;
    v5->_spanInfo = (SEMSpanInfo *)v8;

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v21, 1);
    uint64_t v15 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12, v14);
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, @"entityFieldInfo");
    entityFieldInfo = v5->_entityFieldInfo;
    v5->_entityFieldInfo = (SEMEntityFieldInfo *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  spanInfo = self->_spanInfo;
  id v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)spanInfo, @"spanInfo");
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_entityFieldInfo, @"entityFieldInfo");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFieldInfo, 0);
  objc_storeStrong((id *)&self->_spanInfo, 0);
}

@end