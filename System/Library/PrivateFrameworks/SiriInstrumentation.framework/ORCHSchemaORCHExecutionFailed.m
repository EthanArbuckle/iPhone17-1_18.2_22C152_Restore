@interface ORCHSchemaORCHExecutionFailed
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasErrorString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorString;
- (ORCHSchemaORCHExecutionFailed)initWithDictionary:(id)a3;
- (ORCHSchemaORCHExecutionFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)errorDomain;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteErrorString;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(int)a3;
- (void)setErrorString:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasErrorString:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHExecutionFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasErrorString:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorString:(id)a3
{
}

- (NSString)errorString
{
  return self->_errorString;
}

- (ORCHSchemaORCHExecutionFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHExecutionFailed;
  v5 = [(ORCHSchemaORCHExecutionFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ORCHSchemaORCHExecutionFailed *)v5 setErrorString:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecutionFailed setErrorDomain:](v5, "setErrorDomain:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecutionFailed setErrorCode:](v5, "setErrorCode:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHExecutionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHExecutionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHExecutionFailed *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[ORCHSchemaORCHExecutionFailed errorCode](self, "errorCode"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(ORCHSchemaORCHExecutionFailed *)self errorDomain] - 1;
    if (v6 > 0xE) {
      uint64_t v7 = @"ORCHERRORDOMAIN_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB3928[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"errorDomain"];
  }
  if (self->_errorString)
  {
    v8 = [(ORCHSchemaORCHExecutionFailed *)self errorString];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"errorString"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorString hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_errorDomain;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(ORCHSchemaORCHExecutionFailed *)self errorString];
  unsigned int v6 = [v4 errorString];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(ORCHSchemaORCHExecutionFailed *)self errorString];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHExecutionFailed *)self errorString];
    v11 = [v4 errorString];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $EEF5D83BDC1038D82D17C816D898FA8B has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int errorDomain = self->_errorDomain;
    if (errorDomain == [v4 errorDomain])
    {
      $EEF5D83BDC1038D82D17C816D898FA8B has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(ORCHSchemaORCHExecutionFailed *)self errorString];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  unsigned int v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHExecutionFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int errorCode = a3;
}

- (void)deleteErrorDomain
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorDomain = a3;
}

- (void)deleteErrorString
{
}

- (BOOL)hasErrorString
{
  return self->_errorString != 0;
}

@end