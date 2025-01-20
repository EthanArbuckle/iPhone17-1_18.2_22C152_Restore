@interface SISchemaUUFRFatalError
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasSiriResponseContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (SISchemaSiriResponseContext)siriResponseContext;
- (SISchemaUUFRFatalError)initWithDictionary:(id)a3;
- (SISchemaUUFRFatalError)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteSiriResponseContext;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasSiriResponseContext:(BOOL)a3;
- (void)setSiriResponseContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRFatalError

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUUFRFatalError;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUUFRFatalError *)self siriResponseContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUUFRFatalError *)self deleteSiriResponseContext];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSiriResponseContext:(id)a3
{
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (SISchemaUUFRFatalError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRFatalError;
  v5 = [(SISchemaUUFRFatalError *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaUUFRFatalError *)v5 setErrorDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRFatalError setErrorCode:](v5, "setErrorCode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"siriResponseContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaSiriResponseContext alloc] initWithDictionary:v9];
      [(SISchemaUUFRFatalError *)v5 setSiriResponseContext:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaUUFRFatalError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRFatalError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRFatalError *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUUFRFatalError errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v5 = [(SISchemaUUFRFatalError *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  if (self->_siriResponseContext)
  {
    uint64_t v7 = [(SISchemaUUFRFatalError *)self siriResponseContext];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"siriResponseContext"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"siriResponseContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(SISchemaSiriResponseContext *)self->_siriResponseContext hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SISchemaUUFRFatalError *)self errorDomain];
  v6 = [v4 errorDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SISchemaUUFRFatalError *)self errorDomain];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaUUFRFatalError *)self errorDomain];
    v10 = [v4 errorDomain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_15;
    }
  }
  v5 = [(SISchemaUUFRFatalError *)self siriResponseContext];
  v6 = [v4 siriResponseContext];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SISchemaUUFRFatalError *)self siriResponseContext];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SISchemaUUFRFatalError *)self siriResponseContext];
    v16 = [v4 siriResponseContext];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaUUFRFatalError *)self errorDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SISchemaUUFRFatalError *)self siriResponseContext];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaUUFRFatalError *)self siriResponseContext];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRFatalErrorReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriResponseContext
{
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
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

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorCode = a3;
}

- (void)deleteErrorDomain
{
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

@end