@interface SCKRecordFieldSchema
- (BOOL)isEncrypted;
- (BOOL)isRequired;
- (BOOL)isValidRecord:(id)a3;
- (Class)valueClass;
- (NSString)name;
- (SCKRecordFieldSchema)initWithName:(id)a3 valueClass:(Class)a4 required:(BOOL)a5 encrypted:(BOOL)a6;
- (void)setName:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setValueClass:(Class)a3;
@end

@implementation SCKRecordFieldSchema

- (SCKRecordFieldSchema)initWithName:(id)a3 valueClass:(Class)a4 required:(BOOL)a5 encrypted:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCKRecordFieldSchema;
  v12 = [(SCKRecordFieldSchema *)&v15 init];
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

- (BOOL)isValidRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 valuesByKey];
  v6 = [(SCKRecordFieldSchema *)self name];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  v8 = [v4 encryptedValuesByKey];

  v9 = [(SCKRecordFieldSchema *)self name];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v7 | v10)
  {
    if ((![(SCKRecordFieldSchema *)self isEncrypted] || v10)
      && ((BOOL v11 = [(SCKRecordFieldSchema *)self isEncrypted], v7) || v11))
    {
      [(SCKRecordFieldSchema *)self valueClass];
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        [(SCKRecordFieldSchema *)self valueClass];
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
    char isKindOfClass = ![(SCKRecordFieldSchema *)self isRequired];
  }

  return isKindOfClass & 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (void)setValueClass:(Class)a3
{
}

- (BOOL)isRequired
{
  return self->_required;
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