@interface NETSchemaNETError
- (BOOL)hasDescription;
- (BOOL)hasDomain;
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETError)initWithDictionary:(id)a3;
- (NETSchemaNETError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)description;
- (NSString)domain;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)deleteDescription;
- (void)deleteDomain;
- (void)deleteErrorCode;
- (void)setDescription:(id)a3;
- (void)setDomain:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setHasDescription:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETError

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasDescription:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setDescription:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NETSchemaNETError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETError;
  v5 = [(NETSchemaNETError *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NETSchemaNETError *)v5 setDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(NETSchemaNETError *)v5 setDescription:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETError setErrorCode:](v5, "setErrorCode:", [v10 longLongValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (NETSchemaNETError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETError *)self dictionaryRepresentation];
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
  if (self->_description)
  {
    id v4 = [(NETSchemaNETError *)self description];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"description"];
  }
  if (self->_domain)
  {
    v6 = [(NETSchemaNETError *)self domain];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NETSchemaNETError errorCode](self, "errorCode"));
    [v3 setObject:v8 forKeyedSubscript:@"errorCode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_description hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(NETSchemaNETError *)self domain];
  v6 = [v4 domain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NETSchemaNETError *)self domain];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(NETSchemaNETError *)self domain];
    v10 = [v4 domain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NETSchemaNETError *)self description];
  v6 = [v4 description];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(NETSchemaNETError *)self description];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(NETSchemaNETError *)self description];
    v15 = [v4 description];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0 || (int64_t errorCode = self->_errorCode, errorCode == [v4 errorCode]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(NETSchemaNETError *)self domain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(NETSchemaNETError *)self description];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETErrorReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t errorCode = a3;
}

- (void)deleteDescription
{
}

- (BOOL)hasDescription
{
  return self->_description != 0;
}

- (void)deleteDomain
{
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

@end