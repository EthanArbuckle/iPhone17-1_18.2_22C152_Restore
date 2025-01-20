@interface ORCHSchemaORCHMultiUserScore
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasScore;
- (BOOL)hasUserEphemeralId;
- (BOOL)hasUserScoreIdHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)loggableSharedUserId;
- (ORCHSchemaORCHMultiUserScore)initWithDictionary:(id)a3;
- (ORCHSchemaORCHMultiUserScore)initWithJSON:(id)a3;
- (SISchemaUUID)userEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)score;
- (unsigned)userScoreIdHash;
- (void)deleteLoggableSharedUserId;
- (void)deleteScore;
- (void)deleteUserEphemeralId;
- (void)deleteUserScoreIdHash;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setHasUserScoreIdHash:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setScore:(unsigned int)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)setUserScoreIdHash:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHMultiUserScore

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHMultiUserScore;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(ORCHSchemaORCHMultiUserScore *)self deleteLoggableSharedUserId];
  }
  v6 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHMultiUserScore *)self deleteUserEphemeralId];
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

- (unsigned)userScoreIdHash
{
  return self->_userScoreIdHash;
}

- (void)setUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (unsigned)score
{
  return self->_score;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (ORCHSchemaORCHMultiUserScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORCHSchemaORCHMultiUserScore;
  v5 = [(ORCHSchemaORCHMultiUserScore *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ORCHSchemaORCHMultiUserScore *)v5 setLoggableSharedUserId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMultiUserScore setScore:](v5, "setScore:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(ORCHSchemaORCHMultiUserScore *)v5 setUserEphemeralId:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"userScoreIdHash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHMultiUserScore setUserScoreIdHash:](v5, "setUserScoreIdHash:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHMultiUserScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHMultiUserScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHMultiUserScore *)self dictionaryRepresentation];
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
  if (self->_loggableSharedUserId)
  {
    id v4 = [(ORCHSchemaORCHMultiUserScore *)self loggableSharedUserId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ORCHSchemaORCHMultiUserScore score](self, "score"));
    [v3 setObject:v6 forKeyedSubscript:@"score"];
  }
  if (self->_userEphemeralId)
  {
    uint64_t v7 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ORCHSchemaORCHMultiUserScore userScoreIdHash](self, "userScoreIdHash"));
    [v3 setObject:v10 forKeyedSubscript:@"userScoreIdHash"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_loggableSharedUserId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_score;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(SISchemaUUID *)self->_userEphemeralId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_userScoreIdHash;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  unint64_t v5 = [(ORCHSchemaORCHMultiUserScore *)self loggableSharedUserId];
  uint64_t v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(ORCHSchemaORCHMultiUserScore *)self loggableSharedUserId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ORCHSchemaORCHMultiUserScore *)self loggableSharedUserId];
    objc_super v10 = [v4 loggableSharedUserId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int score = self->_score;
    if (score != [v4 score]) {
      goto LABEL_15;
    }
  }
  unint64_t v5 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
  uint64_t v6 = [v4 userEphemeralId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
    v16 = [v4 userEphemeralId];
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
      || (unsigned int userScoreIdHash = self->_userScoreIdHash, userScoreIdHash == [v4 userScoreIdHash]))
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
  uint64_t v4 = [(ORCHSchemaORCHMultiUserScore *)self loggableSharedUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v5 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];

  if (v5)
  {
    uint64_t v6 = [(ORCHSchemaORCHMultiUserScore *)self userEphemeralId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMultiUserScoreReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserScoreIdHash
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserScoreIdHash:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserScoreIdHash
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserScoreIdHash:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int userScoreIdHash = a3;
}

- (void)deleteUserEphemeralId
{
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int score = a3;
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

@end