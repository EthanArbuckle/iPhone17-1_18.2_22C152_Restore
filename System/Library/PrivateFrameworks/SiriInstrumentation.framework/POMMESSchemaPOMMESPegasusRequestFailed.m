@interface POMMESSchemaPOMMESPegasusRequestFailed
- (BOOL)hasErrorCode;
- (BOOL)hasReason;
- (BOOL)hasRequestArguments;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments;
- (POMMESSchemaPOMMESPegasusRequestFailed)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusRequestFailed)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (unsigned)errorCode;
- (void)deleteErrorCode;
- (void)deleteReason;
- (void)deleteRequestArguments;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRequestArguments:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setRequestArguments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusRequestFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusRequestFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESPegasusRequestFailed *)self deleteRequestArguments];
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
}

- (void)setHasRequestArguments:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setRequestArguments:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments
{
  return self->_requestArguments;
}

- (int)reason
{
  return self->_reason;
}

- (POMMESSchemaPOMMESPegasusRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusRequestFailed;
  v5 = [(POMMESSchemaPOMMESPegasusRequestFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestArguments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[POMMESSchemaPOMMESPegasusRequestArguments alloc] initWithDictionary:v7];
      [(POMMESSchemaPOMMESPegasusRequestFailed *)v5 setRequestArguments:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestFailed setErrorCode:](v5, "setErrorCode:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusRequestFailed errorCode](self, "errorCode"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self reason] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"POMMESPEGASUSREQUESTFAILUREREASON_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB4310[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"reason"];
  }
  if (self->_requestArguments)
  {
    v8 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"requestArguments"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"requestArguments"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self->_requestArguments hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_15;
    }
  }
  unsigned int v6 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
  uint64_t v7 = [v4 requestArguments];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
    objc_super v12 = [v4 requestArguments];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    unsigned int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];

  if (v4)
  {
    uint64_t v5 = [(POMMESSchemaPOMMESPegasusRequestFailed *)self requestArguments];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestFailedReadFrom(self, (uint64_t)a3);
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

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int errorCode = a3;
}

- (void)deleteRequestArguments
{
}

- (BOOL)hasRequestArguments
{
  return self->_requestArguments != 0;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end