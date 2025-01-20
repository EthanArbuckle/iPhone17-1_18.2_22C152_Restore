@interface IDENTITYSchemaIDENTITYScoreTuple
- (BOOL)hasConfidenceScore;
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasUserEphemeralId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYScoreTuple)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYScoreTuple)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)loggableSharedUserId;
- (SISchemaUUID)userEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)confidenceScore;
- (void)deleteConfidenceScore;
- (void)deleteLoggableSharedUserId;
- (void)deleteUserEphemeralId;
- (void)setConfidenceScore:(unsigned int)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYScoreTuple

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDENTITYSchemaIDENTITYScoreTuple;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(IDENTITYSchemaIDENTITYScoreTuple *)self deleteLoggableSharedUserId];
  }
  v6 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IDENTITYSchemaIDENTITYScoreTuple *)self deleteUserEphemeralId];
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
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (unsigned)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (IDENTITYSchemaIDENTITYScoreTuple)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDENTITYSchemaIDENTITYScoreTuple;
  v5 = [(IDENTITYSchemaIDENTITYScoreTuple *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IDENTITYSchemaIDENTITYScoreTuple *)v5 setLoggableSharedUserId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"confidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYScoreTuple setConfidenceScore:](v5, "setConfidenceScore:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(IDENTITYSchemaIDENTITYScoreTuple *)v5 setUserEphemeralId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYScoreTuple)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYScoreTuple *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYScoreTuple *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[IDENTITYSchemaIDENTITYScoreTuple confidenceScore](self, "confidenceScore"));
    [v3 setObject:v4 forKeyedSubscript:@"confidenceScore"];
  }
  if (self->_loggableSharedUserId)
  {
    v5 = [(IDENTITYSchemaIDENTITYScoreTuple *)self loggableSharedUserId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (self->_userEphemeralId)
  {
    uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"userEphemeralId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"userEphemeralId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_loggableSharedUserId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_confidenceScore;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(SISchemaUUID *)self->_userEphemeralId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(IDENTITYSchemaIDENTITYScoreTuple *)self loggableSharedUserId];
  v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreTuple *)self loggableSharedUserId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IDENTITYSchemaIDENTITYScoreTuple *)self loggableSharedUserId];
    objc_super v10 = [v4 loggableSharedUserId];
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
    unsigned int confidenceScore = self->_confidenceScore;
    if (confidenceScore != [v4 confidenceScore]) {
      goto LABEL_15;
    }
  }
  v5 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
  v6 = [v4 userEphemeralId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
    v16 = [v4 userEphemeralId];
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
  uint64_t v4 = [(IDENTITYSchemaIDENTITYScoreTuple *)self loggableSharedUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreTuple *)self userEphemeralId];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYScoreTupleReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserEphemeralId
{
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteConfidenceScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidenceScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfidenceScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int confidenceScore = a3;
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

@end