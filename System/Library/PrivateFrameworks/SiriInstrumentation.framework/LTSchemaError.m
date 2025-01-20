@interface LTSchemaError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaError)initWithDictionary:(id)a3;
- (LTSchemaError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)domain;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)code;
- (void)deleteCode;
- (void)deleteDomain;
- (void)setCode:(unsigned int)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaError

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)code
{
  return self->_code;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (LTSchemaError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LTSchemaError;
  v5 = [(LTSchemaError *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaError *)v5 setDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"code"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaError setCode:](v5, "setCode:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (LTSchemaError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaError *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaError code](self, "code"));
    [v3 setObject:v4 forKeyedSubscript:@"code"];
  }
  if (self->_domain)
  {
    v5 = [(LTSchemaError *)self domain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"domain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(LTSchemaError *)self domain];
  v6 = [v4 domain];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(LTSchemaError *)self domain];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(LTSchemaError *)self domain];
    objc_super v11 = [v4 domain];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int code = self->_code;
    if (code != [v4 code]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(LTSchemaError *)self domain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaErrorReadFrom(self, (uint64_t)a3);
}

- (void)deleteCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int code = a3;
}

- (void)deleteDomain
{
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

@end