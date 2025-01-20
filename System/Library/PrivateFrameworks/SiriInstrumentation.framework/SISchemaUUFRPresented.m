@interface SISchemaUUFRPresented
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasViewContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (SISchemaUUFRPresented)initWithDictionary:(id)a3;
- (SISchemaUUFRPresented)initWithJSON:(id)a3;
- (SISchemaViewContainer)viewContainer;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteViewContainer;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasViewContainer:(BOOL)a3;
- (void)setViewContainer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRPresented

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUUFRPresented;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUUFRPresented *)self viewContainer];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUUFRPresented *)self deleteViewContainer];
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
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_viewContainer, 0);
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasViewContainer:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (void)setViewContainer:(id)a3
{
}

- (SISchemaViewContainer)viewContainer
{
  return self->_viewContainer;
}

- (SISchemaUUFRPresented)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRPresented;
  v5 = [(SISchemaUUFRPresented *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaViewContainer alloc] initWithDictionary:v6];
      [(SISchemaUUFRPresented *)v5 setViewContainer:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaUUFRPresented *)v5 setErrorDomain:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRPresented setErrorCode:](v5, "setErrorCode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaUUFRPresented)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRPresented *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRPresented *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUUFRPresented errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v5 = [(SISchemaUUFRPresented *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  if (self->_viewContainer)
  {
    uint64_t v7 = [(SISchemaUUFRPresented *)self viewContainer];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"viewContainer"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"viewContainer"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaViewContainer *)self->_viewContainer hash];
  NSUInteger v4 = [(NSString *)self->_errorDomain hash];
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
  uint64_t v5 = [(SISchemaUUFRPresented *)self viewContainer];
  v6 = [v4 viewContainer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaUUFRPresented *)self viewContainer];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaUUFRPresented *)self viewContainer];
    v10 = [v4 viewContainer];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaUUFRPresented *)self errorDomain];
  v6 = [v4 errorDomain];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaUUFRPresented *)self errorDomain];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaUUFRPresented *)self errorDomain];
    v15 = [v4 errorDomain];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
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
  id v8 = a3;
  NSUInteger v4 = [(SISchemaUUFRPresented *)self viewContainer];

  if (v4)
  {
    uint64_t v5 = [(SISchemaUUFRPresented *)self viewContainer];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaUUFRPresented *)self errorDomain];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRPresentedReadFrom(self, (uint64_t)a3);
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

- (void)deleteViewContainer
{
}

- (BOOL)hasViewContainer
{
  return self->_viewContainer != 0;
}

@end