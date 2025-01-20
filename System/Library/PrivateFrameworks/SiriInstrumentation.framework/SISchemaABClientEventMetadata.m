@interface SISchemaABClientEventMetadata
- (BOOL)hasSiriDeviceId;
- (BOOL)hasSpeechId;
- (BOOL)hasTimeIntervalSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaABClientEventMetadata)initWithDictionary:(id)a3;
- (SISchemaABClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)siriDeviceId;
- (SISchemaUUID)speechId;
- (double)timeIntervalSince1970;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSiriDeviceId;
- (void)deleteSpeechId;
- (void)deleteTimeIntervalSince1970;
- (void)setHasSiriDeviceId:(BOOL)a3;
- (void)setHasSpeechId:(BOOL)a3;
- (void)setHasTimeIntervalSince1970:(BOOL)a3;
- (void)setSiriDeviceId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaABClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8])
  {
    [(SISchemaABClientEventMetadata *)self deleteSiriDeviceId];
    [(SISchemaABClientEventMetadata *)self deleteSpeechId];
  }
  v6 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaABClientEventMetadata *)self deleteSiriDeviceId];
  }
  v9 = [(SISchemaABClientEventMetadata *)self speechId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaABClientEventMetadata *)self deleteSpeechId];
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
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
}

- (void)setHasSpeechId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setSpeechId:(id)a3
{
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setSiriDeviceId:(id)a3
{
}

- (SISchemaUUID)siriDeviceId
{
  return self->_siriDeviceId;
}

- (SISchemaABClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABClientEventMetadata;
  v5 = [(SISchemaABClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriDeviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaABClientEventMetadata *)v5 setSiriDeviceId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(SISchemaABClientEventMetadata *)v5 setSpeechId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"timeIntervalSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[SISchemaABClientEventMetadata setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    int v11 = v5;
  }
  return v5;
}

- (SISchemaABClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaABClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaABClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_siriDeviceId)
  {
    id v4 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"siriDeviceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"siriDeviceId"];
    }
  }
  if (self->_speechId)
  {
    uint64_t v7 = [(SISchemaABClientEventMetadata *)self speechId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"speechId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"speechId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = NSNumber;
    [(SISchemaABClientEventMetadata *)self timeIntervalSince1970];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"timeIntervalSince1970"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_siriDeviceId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_speechId hash];
  if (*(unsigned char *)&self->_has)
  {
    double timeIntervalSince1970 = self->_timeIntervalSince1970;
    double v7 = -timeIntervalSince1970;
    if (timeIntervalSince1970 >= 0.0) {
      double v7 = self->_timeIntervalSince1970;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
  v6 = [v4 siriDeviceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
    v10 = [v4 siriDeviceId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaABClientEventMetadata *)self speechId];
  v6 = [v4 speechId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaABClientEventMetadata *)self speechId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaABClientEventMetadata *)self speechId];
    v15 = [v4 speechId];
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
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (double timeIntervalSince1970 = self->_timeIntervalSince1970,
          [v4 timeIntervalSince1970],
          timeIntervalSince1970 == v20))
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
  unint64_t v4 = [(SISchemaABClientEventMetadata *)self siriDeviceId];

  if (v4)
  {
    unint64_t v5 = [(SISchemaABClientEventMetadata *)self siriDeviceId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaABClientEventMetadata *)self speechId];

  if (v6)
  {
    uint64_t v7 = [(SISchemaABClientEventMetadata *)self speechId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeIntervalSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double timeIntervalSince1970 = a3;
}

- (void)deleteSpeechId
{
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteSiriDeviceId
{
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

@end