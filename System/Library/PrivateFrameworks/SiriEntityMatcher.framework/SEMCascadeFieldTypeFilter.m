@interface SEMCascadeFieldTypeFilter
+ (id)filterFromKVFieldTypeNumber:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCascadeFieldTypeFilter:(id)a3;
- (SEMCascadeFieldTypeFilter)initWithFieldType:(unsigned __int16)a3 error:(id *)a4;
- (id)description;
- (unint64_t)hash;
- (unsigned)entityType;
- (unsigned)fieldType;
@end

@implementation SEMCascadeFieldTypeFilter

+ (id)filterFromKVFieldTypeNumber:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  KVFieldTypeFromNumber();
  uint64_t v4 = KVFieldTypeToCascadeFieldType();
  if (v4 == (unsigned __int16)*MEMORY[0x263F316D0])
  {
    v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[SEMCascadeFieldTypeFilter filterFromKVFieldTypeNumber:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_ERROR, "%s Ignoring unsupported KVFieldType filter: %@", buf, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    uint64_t v7 = v4;
    id v8 = objc_alloc((Class)objc_opt_class());
    id v13 = 0;
    v6 = objc_msgSend_initWithFieldType_error_(v8, v9, v7, (uint64_t)&v13);
    id v10 = v13;
    if (!v6)
    {
      v11 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "+[SEMCascadeFieldTypeFilter filterFromKVFieldTypeNumber:]";
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_error_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
    }
  }
  return v6;
}

- (SEMCascadeFieldTypeFilter)initWithFieldType:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  v27[1] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SEMCascadeFieldTypeFilter;
  v6 = [(SEMCascadeFieldTypeFilter *)&v25 init];
  v9 = v6;
  if (v6 && (v6->_fieldType = v5, (objc_msgSend_isValidFieldType_(MEMORY[0x263F50070], v7, v5, v8) & 1) == 0))
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F07F80];
    v14 = NSString;
    v15 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v10, v5, v11);
    uint64_t v18 = objc_msgSend_stringWithFormat_(v14, v16, @"Cannot create filter with invalid itemType: %@", v17, v15);
    v27[0] = v18;
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v27, (uint64_t)&v26, 1);
    v22 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v21, @"com.apple.siri.inference.SEMSpanMatcher", 8, v20);
    v23 = v22;
    if (a4 && v22) {
      *a4 = v22;
    }

    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (unsigned)entityType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SEMCascadeFieldTypeFilter *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToCascadeFieldTypeFilter = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToCascadeFieldTypeFilter = objc_msgSend_isEqualToCascadeFieldTypeFilter_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToCascadeFieldTypeFilter = 0;
  }

  return isEqualToCascadeFieldTypeFilter;
}

- (BOOL)isEqualToCascadeFieldTypeFilter:(id)a3
{
  int fieldType = self->_fieldType;
  return fieldType == objc_msgSend_fieldType(a3, a2, (uint64_t)a3, v3);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)SEMCascadeFieldTypeFilter;
  uint64_t v3 = [(SEMCascadeFieldTypeFilter *)&v11 description];
  v6 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v4, self->_fieldType, v5);
  v9 = objc_msgSend_stringByAppendingFormat_(v3, v7, @" fieldType: %@", v8, v6);

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_fieldType, v2);
  unint64_t v7 = objc_msgSend_hash(v3, v4, v5, v6);

  return v7;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

@end