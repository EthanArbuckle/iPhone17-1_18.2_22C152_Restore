@interface IFTSchemaIFTActionFailureDeveloperDefinedError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionFailureDeveloperDefinedError)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionFailureDeveloperDefinedError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)domain;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)code;
- (unint64_t)hash;
- (void)deleteCode;
- (void)deleteDomain;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionFailureDeveloperDefinedError

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

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)code
{
  return self->_code;
}

- (IFTSchemaIFTActionFailureDeveloperDefinedError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTActionFailureDeveloperDefinedError;
  v5 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"code"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureDeveloperDefinedError setCode:](v5, "setCode:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(IFTSchemaIFTActionFailureDeveloperDefinedError *)v5 setDomain:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionFailureDeveloperDefinedError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTActionFailureDeveloperDefinedError code](self, "code"));
    [v3 setObject:v4 forKeyedSubscript:@"code"];
  }
  if (self->_domain)
  {
    v5 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self domain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"domain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_code;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_domain hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (int64_t code = self->_code, code == [v4 code]))
      {
        v6 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self domain];
        uint64_t v7 = [v4 domain];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self domain];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self domain];
          v12 = [v4 domain];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self domain];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionFailureDeveloperDefinedErrorReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomain
{
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
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

- (void)setCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t code = a3;
}

@end