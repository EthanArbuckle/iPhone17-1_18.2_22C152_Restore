@interface TPPBDictionaryMatchingRuleFieldRegexMatch
- (BOOL)hasFieldName;
- (BOOL)hasRegex;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (NSString)regex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setRegex:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRuleFieldRegexMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (void)setRegex:(id)a3
{
}

- (NSString)regex
{
  return self->_regex;
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
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setFieldName:](self, "setFieldName:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setRegex:](self, "setRegex:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fieldName hash];
  return [(NSString *)self->_regex hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((fieldName = self->_fieldName, !((unint64_t)fieldName | v4[1]))
     || -[NSString isEqual:](fieldName, "isEqual:")))
  {
    regex = self->_regex;
    if ((unint64_t)regex | v4[2]) {
      char v7 = -[NSString isEqual:](regex, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_fieldName copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_regex copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    objc_msgSend(v4, "setFieldName:");
    id v4 = v5;
  }
  if (self->_regex)
  {
    objc_msgSend(v5, "setRegex:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_regex)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldRegexMatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName) {
    [v3 setObject:fieldName forKey:@"fieldName"];
  }
  regex = self->_regex;
  if (regex) {
    [v4 setObject:regex forKey:@"regex"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBDictionaryMatchingRuleFieldRegexMatch;
  id v4 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)&v8 description];
  id v5 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRegex
{
  return self->_regex != 0;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TPPBDictionaryMatchingRuleFieldRegexMatch *)self hasFieldName])
  {
    char v7 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self fieldName];
    [v7 length];
  }
  id v8 = objc_alloc(MEMORY[0x263F08AE8]);
  v9 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self regex];
  id v17 = 0;
  v10 = (void *)[v8 initWithPattern:v9 options:0 error:&v17];
  id v11 = v17;

  if (v10)
  {
    v12 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self fieldName];
    v13 = [v6 objectForKeyedSubscript:v12];

    if (v13)
    {
      v14 = [NSString stringWithFormat:@"%@", v13];
      BOOL v15 = objc_msgSend(v10, "numberOfMatchesInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length")) != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
    if (a4 && v11)
    {
      BOOL v15 = 0;
      *a4 = v11;
    }
  }

  return v15;
}

@end