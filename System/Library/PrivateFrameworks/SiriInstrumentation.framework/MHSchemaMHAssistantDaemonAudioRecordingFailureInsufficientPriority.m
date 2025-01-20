@interface MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority
- (BOOL)hasAudioSessionCategory;
- (BOOL)hasAudioSessionMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithJSON:(id)a3;
- (NSArray)activeSessionDisplayIds;
- (NSData)jsonData;
- (id)activeSessionDisplayIdsAtIndex:(unint64_t)a3;
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
- (void)setActiveSessionDisplayIds:(id)a3;
- (void)setAudioSessionCategory:(int)a3;
- (void)setAudioSessionMode:(int)a3;
- (void)setHasAudioSessionCategory:(BOOL)a3;
- (void)setHasAudioSessionMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
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

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority;
  v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"activeSessionDisplayIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v18);
              [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)v5 addActiveSessionDisplayIds:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"audioSessionCategory", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionCategory:](v5, "setAudioSessionCategory:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"audioSessionMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionMode:](v5, "setAudioSessionMode:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self dictionaryRepresentation];
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
    id v4 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self activeSessionDisplayIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeSessionDisplayIds"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v7 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self audioSessionCategory]- 1;
    if (v7 > 0x1A) {
      uint64_t v8 = @"MHAUDIOSESSIONCATEGORY_UNKNOWN";
    }
    else {
      uint64_t v8 = off_1E5EC0018[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"audioSessionCategory"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v9 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self audioSessionMode]- 1;
    if (v9 > 0x1C) {
      uint64_t v10 = @"MHAUDIOSESSIONMODE_UNKNOWN";
    }
    else {
      uint64_t v10 = off_1E5EC00F0[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"audioSessionMode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_activeSessionDisplayIds hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_audioSessionCategory;
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
  uint64_t v5 = 2654435761 * self->_audioSessionMode;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self activeSessionDisplayIds];
  v6 = [v4 activeSessionDisplayIds];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self activeSessionDisplayIds];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    uint64_t v10 = [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self activeSessionDisplayIds];
    uint64_t v11 = [v4 activeSessionDisplayIds];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $961204A90ACD32FF3BE5F34EDBEDA117 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int audioSessionCategory = self->_audioSessionCategory;
    if (audioSessionCategory == [v4 audioSessionCategory])
    {
      $961204A90ACD32FF3BE5F34EDBEDA117 has = self->_has;
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
    int audioSessionMode = self->_audioSessionMode;
    if (audioSessionMode != [v4 audioSessionMode]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_activeSessionDisplayIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
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
  return MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriorityReadFrom(self, (uint64_t)a3);
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

@end