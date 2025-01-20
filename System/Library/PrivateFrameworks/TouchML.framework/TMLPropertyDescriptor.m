@interface TMLPropertyDescriptor
+ (id)decode:(const ProtobufCMessage *)a3;
- (BOOL)canMergeFromPropertyDescriptor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOptional;
- (BOOL)isReadonly;
- (NSString)description;
- (NSString)propertyName;
- (NSString)typeClassName;
- (TMLPropertyDescriptor)initWithName:(id)a3 type:(unint64_t)a4 attributes:(id)a5;
- (TMLPropertyDescriptor)initWithName:(id)a3 typeName:(id)a4 attributes:(id)a5;
- (unint64_t)type;
- (void)encode:(ProtobufCMessage *)a3;
@end

@implementation TMLPropertyDescriptor

- (TMLPropertyDescriptor)initWithName:(id)a3 type:(unint64_t)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v12 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, a4);
  v15 = (TMLPropertyDescriptor *)objc_msgSend_initWithName_typeName_attributes_(self, v13, v14, v9, v12, v8);

  return v15;
}

- (TMLPropertyDescriptor)initWithName:(id)a3 typeName:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TMLPropertyDescriptor;
  v12 = [(TMLPropertyDescriptor *)&v27 init];
  if (v12)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v11, v13);
    propertyName = v12->_propertyName;
    v12->_propertyName = (NSString *)v14;

    v12->_type = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v16, v17, v9);
    uint64_t v20 = objc_msgSend_copy(v9, v18, v19);
    propertyType = v12->_propertyType;
    v12->_propertyType = (NSString *)v20;

    v12->_readonly = objc_msgSend_containsObject_(v10, v22, v23, @"readonly");
    v12->_optional = objc_msgSend_containsObject_(v10, v24, v25, @"optional");
  }

  return v12;
}

- (NSString)typeClassName
{
  if (self->_type == 16)
  {
    v3 = self->_propertyType;
  }
  else
  {
    objc_msgSend_classNameForType_(TMLTypeRegistry, a2, v2);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)description
{
  return self->_propertyType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    propertyName = self->_propertyName;
    id v8 = objc_msgSend_propertyName(v4, v5, v6);
    if (objc_msgSend_isEqualToString_(propertyName, v9, v10, v8))
    {
      double v13 = objc_msgSend_typeClassName(self, v11, v12);
      v16 = objc_msgSend_typeClassName(v4, v14, v15);
      if (objc_msgSend_isEqualToString_(v13, v17, v18, v16)
        && (uint64_t v21 = objc_msgSend_type(self, v19, v20), v21 == objc_msgSend_type(v4, v22, v23))
        && (int readonly = self->_readonly, readonly == objc_msgSend_isReadonly(v4, v24, v25)))
      {
        int optional = self->_optional;
        BOOL v30 = optional == objc_msgSend_isOptional(v4, v27, v28);
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)canMergeFromPropertyDescriptor:(id)a3
{
  id v4 = a3;
  propertyName = self->_propertyName;
  id v8 = objc_msgSend_propertyName(v4, v6, v7);
  if (objc_msgSend_isEqualToString_(propertyName, v9, v10, v8))
  {
    double v13 = objc_msgSend_typeClassName(self, v11, v12);
    v16 = objc_msgSend_typeClassName(v4, v14, v15);
    if (objc_msgSend_isEqualToString_(v13, v17, v18, v16))
    {
      uint64_t v21 = objc_msgSend_type(self, v19, v20);
      if (v21 == objc_msgSend_type(v4, v22, v23))
      {
        int readonly = self->_readonly;
        if (readonly == objc_msgSend_isReadonly(v4, v24, v25)
          || self->_readonly && (objc_msgSend_isReadonly(v4, v27, v28) & 1) == 0)
        {
          int optional = self->_optional;
          if (optional == objc_msgSend_isOptional(v4, v27, v28))
          {
            LOBYTE(v32) = 1;
LABEL_13:

            goto LABEL_14;
          }
          if (self->_optional)
          {
            int v32 = objc_msgSend_isOptional(v4, v30, v31) ^ 1;
            goto LABEL_13;
          }
        }
      }
    }
    LOBYTE(v32) = 0;
    goto LABEL_13;
  }
  LOBYTE(v32) = 0;
LABEL_14:

  return v32;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239852E68(a3);
  double v7 = (const char *)objc_msgSend_UTF8String(self->_propertyName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  double v10 = (const char *)objc_msgSend_UTF8String(self->_propertyType, v8, v9);
  *(void *)&a3[1].var1 = strdup(v10);
  BOOL readonly = self->_readonly;
  BOOL optional = self->_optional;
  BOOL v13 = self->_optional;
  if (self->_readonly) {
    BOOL optional = 1;
  }
  LODWORD(a3[1].var2) = optional;
  HIDWORD(a3[1].var2) = readonly | (2 * v13);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v6 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  double v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, v8, *(void *)&a3[1].var1);
  if (LODWORD(a3[1].var2))
  {
    id v12 = objc_alloc(MEMORY[0x263EFF9C0]);
    double v15 = objc_msgSend_initWithCapacity_(v12, v13, v14, 2);
  }
  else
  {
    double v15 = 0;
  }
  int var2_high = HIDWORD(a3[1].var2);
  if ((var2_high & 2) != 0)
  {
    objc_msgSend_addObject_(v15, v9, v11, @"optional");
    int var2_high = HIDWORD(a3[1].var2);
  }
  if (var2_high) {
    objc_msgSend_addObject_(v15, v9, v11, @"readonly");
  }
  id v17 = objc_alloc((Class)a1);
  double v20 = objc_msgSend_initWithName_typeName_attributes_(v17, v18, v19, v6, v10, v15);

  return v20;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end