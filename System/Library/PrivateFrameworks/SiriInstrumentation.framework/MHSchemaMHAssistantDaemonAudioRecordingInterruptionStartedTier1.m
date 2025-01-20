@interface MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1
- (BOOL)hasAudioSessionCategory;
- (BOOL)hasAudioSessionMode;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithJSON:(id)a3;
- (NSArray)activeSessionDisplayIds;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)activeSessionDisplayIdsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioSessionCategory;
- (int)audioSessionMode;
- (unint64_t)activeSessionDisplayIdsCount;
- (unint64_t)hash;
- (void)addActiveSessionDisplayIds:(id)a3;
- (void)clearActiveSessionDisplayIds;
- (void)deleteAudioSessionCategory;
- (void)deleteAudioSessionMode;
- (void)deleteLinkId;
- (void)setActiveSessionDisplayIds:(id)a3;
- (void)setAudioSessionCategory:(int)a3;
- (void)setAudioSessionMode:(int)a3;
- (void)setHasAudioSessionCategory:(BOOL)a3;
- (void)setHasAudioSessionMode:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self deleteActiveSessionDisplayIds];
  }
  v6 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_activeSessionDisplayIds, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)audioSessionMode
{
  return self->_audioSessionMode;
}

- (int)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (void)setActiveSessionDisplayIds:(id)a3
{
}

- (NSArray)activeSessionDisplayIds
{
  return self->_activeSessionDisplayIds;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"activeSessionDisplayIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = objc_msgSend(v14, "copy", (void)v20);
              [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)v5 addActiveSessionDisplayIds:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"audioSessionCategory", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionCategory:](v5, "setAudioSessionCategory:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"audioSessionMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionMode:](v5, "setAudioSessionMode:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self dictionaryRepresentation];
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
  if (self->_activeSessionDisplayIds)
  {
    id v4 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self activeSessionDisplayIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeSessionDisplayIds"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v7 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self audioSessionCategory]- 1;
    if (v7 > 0x1A) {
      int v8 = @"MHAUDIOSESSIONCATEGORY_UNKNOWN";
    }
    else {
      int v8 = off_1E5EB1180[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"audioSessionCategory"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v9 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self audioSessionMode]
       - 1;
    if (v9 > 0x1C) {
      uint64_t v10 = @"MHAUDIOSESSIONMODE_UNKNOWN";
    }
    else {
      uint64_t v10 = off_1E5EB1258[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"audioSessionMode"];
  }
  if (self->_linkId)
  {
    uint64_t v11 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  uint64_t v4 = [(NSArray *)self->_activeSessionDisplayIds hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_audioSessionCategory;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_audioSessionMode;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    unsigned int v9 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self activeSessionDisplayIds];
  uint64_t v6 = [v4 activeSessionDisplayIds];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self activeSessionDisplayIds];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self activeSessionDisplayIds];
    v15 = [v4 activeSessionDisplayIds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $961204A90ACD32FF3BE5F34EDBEDA117 has = self->_has;
  unsigned int v20 = v4[32];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int audioSessionCategory = self->_audioSessionCategory;
      if (audioSessionCategory != [v4 audioSessionCategory]) {
        goto LABEL_12;
      }
      $961204A90ACD32FF3BE5F34EDBEDA117 has = self->_has;
      unsigned int v20 = v4[32];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (int audioSessionMode = self->_audioSessionMode,
            audioSessionMode == [v4 audioSessionMode]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];

  if (v5)
  {
    uint64_t v6 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_activeSessionDisplayIds;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioSessionMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioSessionMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioSessionMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioSessionMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int audioSessionMode = a3;
}

- (void)deleteAudioSessionCategory
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioSessionCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSessionCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioSessionCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioSessionCategory = a3;
}

- (id)activeSessionDisplayIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_activeSessionDisplayIds objectAtIndexedSubscript:a3];
}

- (unint64_t)activeSessionDisplayIdsCount
{
  return [(NSArray *)self->_activeSessionDisplayIds count];
}

- (void)addActiveSessionDisplayIds:(id)a3
{
  id v4 = a3;
  activeSessionDisplayIds = self->_activeSessionDisplayIds;
  id v8 = v4;
  if (!activeSessionDisplayIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activeSessionDisplayIds;
    self->_activeSessionDisplayIds = v6;

    id v4 = v8;
    activeSessionDisplayIds = self->_activeSessionDisplayIds;
  }
  [(NSArray *)activeSessionDisplayIds addObject:v4];
}

- (void)clearActiveSessionDisplayIds
{
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end