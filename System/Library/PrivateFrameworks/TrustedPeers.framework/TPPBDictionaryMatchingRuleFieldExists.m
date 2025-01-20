@interface TPPBDictionaryMatchingRuleFieldExists
- (BOOL)hasFieldName;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRuleFieldExists

- (void).cxx_destruct
{
}

- (void)setFieldName:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[TPPBDictionaryMatchingRuleFieldExists setFieldName:](self, "setFieldName:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_fieldName hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    fieldName = self->_fieldName;
    if ((unint64_t)fieldName | v4[1]) {
      char v6 = -[NSString isEqual:](fieldName, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_fieldName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  fieldName = self->_fieldName;
  if (fieldName) {
    [a3 setFieldName:fieldName];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_fieldName) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldExistsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName) {
    [v3 setObject:fieldName forKey:@"fieldName"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBDictionaryMatchingRuleFieldExists;
  v4 = [(TPPBDictionaryMatchingRuleFieldExists *)&v8 description];
  v5 = [(TPPBDictionaryMatchingRuleFieldExists *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TPPBDictionaryMatchingRuleFieldExists *)self hasFieldName]
    && ([(TPPBDictionaryMatchingRuleFieldExists *)self fieldName],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    v9 = [(TPPBDictionaryMatchingRuleFieldExists *)self fieldName];
    v10 = [v6 objectForKeyedSubscript:v9];

    BOOL v11 = v10 != 0;
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"CKKSMatcherError" code:1 description:@"Rule missing field name"];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end