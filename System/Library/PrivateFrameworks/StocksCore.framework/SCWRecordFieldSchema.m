@interface SCWRecordFieldSchema
- (BOOL)isEncrypted;
- (BOOL)isRequired;
- (BOOL)isValidRecord:(id)a3;
- (Class)valueClass;
- (NSString)name;
- (SCWRecordFieldSchema)initWithName:(id)a3 valueClass:(Class)a4 required:(BOOL)a5 encrypted:(BOOL)a6;
- (void)setName:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setValueClass:(Class)a3;
@end

@implementation SCWRecordFieldSchema

- (BOOL)isValidRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 valuesByKey];
  v6 = [(SCWRecordFieldSchema *)self name];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  v8 = [v4 encryptedValues];

  v9 = [(SCWRecordFieldSchema *)self name];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v7 | v10)
  {
    if ((![(SCWRecordFieldSchema *)self isEncrypted] || v10)
      && ((BOOL v11 = [(SCWRecordFieldSchema *)self isEncrypted], v7) || v11))
    {
      [(SCWRecordFieldSchema *)self valueClass];
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        [(SCWRecordFieldSchema *)self valueClass];
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = ![(SCWRecordFieldSchema *)self isRequired];
  }

  return isKindOfClass & 1;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (SCWRecordFieldSchema)initWithName:(id)a3 valueClass:(Class)a4 required:(BOOL)a5 encrypted:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCWRecordFieldSchema;
  v12 = [(SCWRecordFieldSchema *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_valueClass, a4);
    v13->_required = a5;
    v13->_encrypted = a6;
  }

  return v13;
}

- (void)setName:(id)a3
{
}

- (void)setValueClass:(Class)a3
{
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClass, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end