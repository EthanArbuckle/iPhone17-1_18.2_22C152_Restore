@interface DHTSchemaDHTDeleteTrigger
- (BOOL)hasDeleteTimestampMs;
- (BOOL)hasDeletionTriggerEvent;
- (BOOL)hasId;
- (BOOL)hasSiriDeviceId;
- (BOOL)hasSpeechId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DHTSchemaDHTDeleteTrigger)initWithDictionary:(id)a3;
- (DHTSchemaDHTDeleteTrigger)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)id;
- (SISchemaUUID)siriDeviceId;
- (SISchemaUUID)speechId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deletionTriggerEvent;
- (unint64_t)deleteTimestampMs;
- (unint64_t)hash;
- (void)deleteDeleteTimestampMs;
- (void)deleteDeletionTriggerEvent;
- (void)deleteId;
- (void)deleteSiriDeviceId;
- (void)deleteSpeechId;
- (void)setDeleteTimestampMs:(unint64_t)a3;
- (void)setDeletionTriggerEvent:(int)a3;
- (void)setHasDeleteTimestampMs:(BOOL)a3;
- (void)setHasDeletionTriggerEvent:(BOOL)a3;
- (void)setHasId:(BOOL)a3;
- (void)setHasSiriDeviceId:(BOOL)a3;
- (void)setHasSpeechId:(BOOL)a3;
- (void)setId:(id)a3;
- (void)setSiriDeviceId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DHTSchemaDHTDeleteTrigger

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DHTSchemaDHTDeleteTrigger;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
  }
  if ([v4 isConditionSet:4])
  {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
  }
  if ([v4 isConditionSet:5])
  {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
  }
  if ([v4 isConditionSet:6])
  {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
  }
  if ([v4 isConditionSet:7])
  {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
  }
  v6 = [(DHTSchemaDHTDeleteTrigger *)self id];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DHTSchemaDHTDeleteTrigger *)self deleteId];
  }
  v9 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSpeechId];
  }
  v12 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DHTSchemaDHTDeleteTrigger *)self deleteSiriDeviceId];
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
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSpeechId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)deletionTriggerEvent
{
  return self->_deletionTriggerEvent;
}

- (unint64_t)deleteTimestampMs
{
  return self->_deleteTimestampMs;
}

- (void)setSiriDeviceId:(id)a3
{
}

- (SISchemaUUID)siriDeviceId
{
  return self->_siriDeviceId;
}

- (void)setSpeechId:(id)a3
{
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setId:(id)a3
{
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (DHTSchemaDHTDeleteTrigger)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DHTSchemaDHTDeleteTrigger;
  v5 = [(DHTSchemaDHTDeleteTrigger *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DHTSchemaDHTDeleteTrigger *)v5 setId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(DHTSchemaDHTDeleteTrigger *)v5 setSpeechId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"siriDeviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(DHTSchemaDHTDeleteTrigger *)v5 setSiriDeviceId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"deleteTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DHTSchemaDHTDeleteTrigger setDeleteTimestampMs:](v5, "setDeleteTimestampMs:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"deletionTriggerEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DHTSchemaDHTDeleteTrigger setDeletionTriggerEvent:](v5, "setDeletionTriggerEvent:", [v13 intValue]);
    }
    int v14 = v5;
  }
  return v5;
}

- (DHTSchemaDHTDeleteTrigger)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DHTSchemaDHTDeleteTrigger *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DHTSchemaDHTDeleteTrigger *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DHTSchemaDHTDeleteTrigger deleteTimestampMs](self, "deleteTimestampMs"));
    [v3 setObject:v5 forKeyedSubscript:@"deleteTimestampMs"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v6 = [(DHTSchemaDHTDeleteTrigger *)self deletionTriggerEvent];
    uint64_t v7 = @"DHTTRIGGEREVENT_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"DHTTRIGGEREVENT_DESTROY_ASSISTANT";
    }
    if (v6 == 2) {
      int v8 = @"DHTTRIGGEREVENT_DELETE_ASSISTANT_HISTORY";
    }
    else {
      int v8 = v7;
    }
    [v3 setObject:v8 forKeyedSubscript:@"deletionTriggerEvent"];
  }
  if (self->_id)
  {
    v9 = [(DHTSchemaDHTDeleteTrigger *)self id];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"id"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"id"];
    }
  }
  if (self->_siriDeviceId)
  {
    v12 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"siriDeviceId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"siriDeviceId"];
    }
  }
  if (self->_speechId)
  {
    v15 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
    objc_super v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"speechId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"speechId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_id hash];
  unint64_t v4 = [(SISchemaUUID *)self->_speechId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_siriDeviceId hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_deleteTimestampMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_deletionTriggerEvent;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(DHTSchemaDHTDeleteTrigger *)self id];
  unint64_t v6 = [v4 id];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(DHTSchemaDHTDeleteTrigger *)self id];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(DHTSchemaDHTDeleteTrigger *)self id];
    v10 = [v4 id];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
  unint64_t v6 = [v4 speechId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
    v15 = [v4 speechId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
  unint64_t v6 = [v4 siriDeviceId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
    v20 = [v4 siriDeviceId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  $288D361F4B1DBFB15C083ABE2D422071 has = self->_has;
  unsigned int v25 = v4[44];
  if ((*(unsigned char *)&has & 1) == (v25 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unint64_t deleteTimestampMs = self->_deleteTimestampMs;
      if (deleteTimestampMs != [v4 deleteTimestampMs]) {
        goto LABEL_17;
      }
      $288D361F4B1DBFB15C083ABE2D422071 has = self->_has;
      unsigned int v25 = v4[44];
    }
    int v27 = (*(unsigned int *)&has >> 1) & 1;
    if (v27 == ((v25 >> 1) & 1))
    {
      if (!v27
        || (int deletionTriggerEvent = self->_deletionTriggerEvent,
            deletionTriggerEvent == [v4 deletionTriggerEvent]))
      {
        BOOL v22 = 1;
        goto LABEL_18;
      }
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(DHTSchemaDHTDeleteTrigger *)self id];

  if (v4)
  {
    unint64_t v5 = [(DHTSchemaDHTDeleteTrigger *)self id];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(DHTSchemaDHTDeleteTrigger *)self speechId];

  if (v6)
  {
    uint64_t v7 = [(DHTSchemaDHTDeleteTrigger *)self speechId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];

  if (v8)
  {
    v9 = [(DHTSchemaDHTDeleteTrigger *)self siriDeviceId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  int v11 = v12;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DHTSchemaDHTDeleteTriggerReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeletionTriggerEvent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDeletionTriggerEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeletionTriggerEvent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeletionTriggerEvent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int deletionTriggerEvent = a3;
}

- (void)deleteDeleteTimestampMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeleteTimestampMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeleteTimestampMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleteTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t deleteTimestampMs = a3;
}

- (void)deleteSiriDeviceId
{
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

- (void)deleteSpeechId
{
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteId
{
}

- (BOOL)hasId
{
  return self->_id != 0;
}

@end