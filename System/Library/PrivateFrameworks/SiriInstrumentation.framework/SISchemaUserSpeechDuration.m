@interface SISchemaUserSpeechDuration
- (BOOL)hasDurationMs;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUserSpeechDuration)initWithDictionary:(id)a3;
- (SISchemaUserSpeechDuration)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)durationMs;
- (unint64_t)hash;
- (void)deleteDurationMs;
- (void)deleteResultCandidateId;
- (void)setDurationMs:(int64_t)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUserSpeechDuration

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (int64_t)durationMs
{
  return self->_durationMs;
}

- (SISchemaUserSpeechDuration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUserSpeechDuration;
  v5 = [(SISchemaUserSpeechDuration *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"durationMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUserSpeechDuration setDurationMs:](v5, "setDurationMs:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SISchemaUserSpeechDuration *)v5 setResultCandidateId:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaUserSpeechDuration)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUserSpeechDuration *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUserSpeechDuration *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaUserSpeechDuration durationMs](self, "durationMs"));
    [v3 setObject:v4 forKeyedSubscript:@"durationMs"];
  }
  if (self->_resultCandidateId)
  {
    v5 = [(SISchemaUserSpeechDuration *)self resultCandidateId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_durationMs;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_resultCandidateId hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int64_t durationMs = self->_durationMs, durationMs == [v4 durationMs]))
      {
        v6 = [(SISchemaUserSpeechDuration *)self resultCandidateId];
        uint64_t v7 = [v4 resultCandidateId];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(SISchemaUserSpeechDuration *)self resultCandidateId];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(SISchemaUserSpeechDuration *)self resultCandidateId];
          v12 = [v4 resultCandidateId];
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
  id v4 = [(SISchemaUserSpeechDuration *)self resultCandidateId];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUserSpeechDurationReadFrom(self, (uint64_t)a3);
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteDurationMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDurationMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationMs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t durationMs = a3;
}

@end