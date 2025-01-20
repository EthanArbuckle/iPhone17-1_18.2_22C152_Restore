@interface POMMESSchemaPOMMESRequestEnded
- (BOOL)hasIsHandledByPreflight;
- (BOOL)hasPommesSearchReason;
- (BOOL)hasPreflightClientHandlerIdentifier;
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandledByPreflight;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)preflightClientHandlerIdentifier;
- (POMMESSchemaPOMMESRequestEnded)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESRequestEnded)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESRequestResult)result;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)pommesSearchReason;
- (void)deleteIsHandledByPreflight;
- (void)deletePommesSearchReason;
- (void)deletePreflightClientHandlerIdentifier;
- (void)deleteResult;
- (void)setHasIsHandledByPreflight:(BOOL)a3;
- (void)setHasPommesSearchReason:(BOOL)a3;
- (void)setHasPreflightClientHandlerIdentifier:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setIsHandledByPreflight:(BOOL)a3;
- (void)setPommesSearchReason:(unsigned int)a3;
- (void)setPreflightClientHandlerIdentifier:(id)a3;
- (void)setResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESRequestEnded *)self result];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESRequestEnded *)self deleteResult];
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
  objc_storeStrong((id *)&self->_preflightClientHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setHasPreflightClientHandlerIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)pommesSearchReason
{
  return self->_pommesSearchReason;
}

- (void)setPreflightClientHandlerIdentifier:(id)a3
{
}

- (NSString)preflightClientHandlerIdentifier
{
  return self->_preflightClientHandlerIdentifier;
}

- (void)setResult:(id)a3
{
}

- (POMMESSchemaPOMMESRequestResult)result
{
  return self->_result;
}

- (BOOL)isHandledByPreflight
{
  return self->_isHandledByPreflight;
}

- (POMMESSchemaPOMMESRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)POMMESSchemaPOMMESRequestEnded;
  v5 = [(POMMESSchemaPOMMESRequestEnded *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isHandledByPreflight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestEnded setIsHandledByPreflight:](v5, "setIsHandledByPreflight:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[POMMESSchemaPOMMESRequestResult alloc] initWithDictionary:v7];
      [(POMMESSchemaPOMMESRequestEnded *)v5 setResult:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"preflightClientHandlerIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(POMMESSchemaPOMMESRequestEnded *)v5 setPreflightClientHandlerIdentifier:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"pommesSearchReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestEnded setPommesSearchReason:](v5, "setPommesSearchReason:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESRequestEnded *)self dictionaryRepresentation];
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
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESRequestEnded isHandledByPreflight](self, "isHandledByPreflight"));
    [v3 setObject:v5 forKeyedSubscript:@"isHandledByPreflight"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESRequestEnded pommesSearchReason](self, "pommesSearchReason"));
    [v3 setObject:v6 forKeyedSubscript:@"pommesSearchReason"];
  }
  if (self->_preflightClientHandlerIdentifier)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESRequestEnded *)self preflightClientHandlerIdentifier];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"preflightClientHandlerIdentifier"];
  }
  if (self->_result)
  {
    objc_super v9 = [(POMMESSchemaPOMMESRequestEnded *)self result];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"result"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"result"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isHandledByPreflight;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(POMMESSchemaPOMMESRequestResult *)self->_result hash];
  NSUInteger v5 = [(NSString *)self->_preflightClientHandlerIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_pommesSearchReason;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isHandledByPreflight = self->_isHandledByPreflight;
    if (isHandledByPreflight != [v4 isHandledByPreflight]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(POMMESSchemaPOMMESRequestEnded *)self result];
  uint64_t v7 = [v4 result];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESRequestEnded *)self result];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(POMMESSchemaPOMMESRequestEnded *)self result];
    v11 = [v4 result];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = [(POMMESSchemaPOMMESRequestEnded *)self preflightClientHandlerIdentifier];
  uint64_t v7 = [v4 preflightClientHandlerIdentifier];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(POMMESSchemaPOMMESRequestEnded *)self preflightClientHandlerIdentifier];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(POMMESSchemaPOMMESRequestEnded *)self preflightClientHandlerIdentifier];
    v16 = [v4 preflightClientHandlerIdentifier];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20
      || (unsigned int pommesSearchReason = self->_pommesSearchReason,
          pommesSearchReason == [v4 pommesSearchReason]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(POMMESSchemaPOMMESRequestEnded *)self result];

  if (v4)
  {
    NSUInteger v5 = [(POMMESSchemaPOMMESRequestEnded *)self result];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(POMMESSchemaPOMMESRequestEnded *)self preflightClientHandlerIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deletePommesSearchReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPommesSearchReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPommesSearchReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPommesSearchReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int pommesSearchReason = a3;
}

- (void)deletePreflightClientHandlerIdentifier
{
}

- (BOOL)hasPreflightClientHandlerIdentifier
{
  return self->_preflightClientHandlerIdentifier != 0;
}

- (void)deleteResult
{
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteIsHandledByPreflight
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsHandledByPreflight:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsHandledByPreflight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsHandledByPreflight:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isHandledByPreflight = a3;
}

@end