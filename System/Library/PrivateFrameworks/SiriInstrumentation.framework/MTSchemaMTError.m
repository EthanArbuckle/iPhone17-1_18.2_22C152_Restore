@interface MTSchemaMTError
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTError)initWithDictionary:(id)a3;
- (MTSchemaMTError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (NSString)errorMessage;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteErrorMessage;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTError

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (MTSchemaMTError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTSchemaMTError;
  v5 = [(MTSchemaMTError *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MTSchemaMTError *)v5 setErrorDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(MTSchemaMTError *)v5 setErrorMessage:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTError setErrorCode:](v5, "setErrorCode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (MTSchemaMTError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTError *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[MTSchemaMTError errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v5 = [(MTSchemaMTError *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  if (self->_errorMessage)
  {
    uint64_t v7 = [(MTSchemaMTError *)self errorMessage];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"errorMessage"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  NSUInteger v4 = [(NSString *)self->_errorMessage hash];
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
  uint64_t v5 = [(MTSchemaMTError *)self errorDomain];
  v6 = [v4 errorDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MTSchemaMTError *)self errorDomain];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(MTSchemaMTError *)self errorDomain];
    v10 = [v4 errorDomain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(MTSchemaMTError *)self errorMessage];
  v6 = [v4 errorMessage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(MTSchemaMTError *)self errorMessage];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(MTSchemaMTError *)self errorMessage];
    v15 = [v4 errorMessage];
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
  id v7 = a3;
  NSUInteger v4 = [(MTSchemaMTError *)self errorDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(MTSchemaMTError *)self errorMessage];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTErrorReadFrom(self, (uint64_t)a3);
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

- (void)deleteErrorMessage
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorDomain
{
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

@end