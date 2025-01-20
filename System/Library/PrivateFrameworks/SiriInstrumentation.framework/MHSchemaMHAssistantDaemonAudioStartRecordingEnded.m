@interface MHSchemaMHAssistantDaemonAudioStartRecordingEnded
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioStartRecordingEnded)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioStartRecordingEnded)initWithJSON:(id)a3;
- (NSArray)activeSessionDisplayIds;
- (NSArray)fanInfos;
- (NSData)jsonData;
- (id)activeSessionDisplayIdsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)fanInfoAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)activeSessionDisplayIdsCount;
- (unint64_t)fanInfoCount;
- (unint64_t)hash;
- (void)addActiveSessionDisplayIds:(id)a3;
- (void)addFanInfo:(id)a3;
- (void)clearActiveSessionDisplayIds;
- (void)clearFanInfo;
- (void)setActiveSessionDisplayIds:(id)a3;
- (void)setFanInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioStartRecordingEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHAssistantDaemonAudioStartRecordingEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self fanInfos];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self setFanInfos:v7];
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
  objc_storeStrong((id *)&self->_fanInfos, 0);
  objc_storeStrong((id *)&self->_activeSessionDisplayIds, 0);
}

- (void)setFanInfos:(id)a3
{
}

- (NSArray)fanInfos
{
  return self->_fanInfos;
}

- (void)setActiveSessionDisplayIds:(id)a3
{
}

- (NSArray)activeSessionDisplayIds
{
  return self->_activeSessionDisplayIds;
}

- (MHSchemaMHAssistantDaemonAudioStartRecordingEnded)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MHSchemaMHAssistantDaemonAudioStartRecordingEnded;
  v5 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"activeSessionDisplayIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)v5 addActiveSessionDisplayIds:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"fanInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[MHSchemaMHAssistantDaemonAudioFanInfo alloc] initWithDictionary:v20];
              [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)v5 addFanInfo:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v17);
      }
    }
    v22 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioStartRecordingEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_activeSessionDisplayIds)
  {
    id v4 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self activeSessionDisplayIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeSessionDisplayIds"];
  }
  if ([(NSArray *)self->_fanInfos count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_fanInfos;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"fanInfo"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_activeSessionDisplayIds hash];
  return [(NSArray *)self->_fanInfos hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self activeSessionDisplayIds];
  v6 = [v4 activeSessionDisplayIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self activeSessionDisplayIds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self activeSessionDisplayIds];
    uint64_t v10 = [v4 activeSessionDisplayIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self fanInfos];
  v6 = [v4 fanInfos];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self fanInfos];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(MHSchemaMHAssistantDaemonAudioStartRecordingEnded *)self fanInfos];
    long long v15 = [v4 fanInfos];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_activeSessionDisplayIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_fanInfos;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioStartRecordingEndedReadFrom(self, (uint64_t)a3);
}

- (id)fanInfoAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_fanInfos objectAtIndexedSubscript:a3];
}

- (unint64_t)fanInfoCount
{
  return [(NSArray *)self->_fanInfos count];
}

- (void)addFanInfo:(id)a3
{
  id v4 = a3;
  fanInfos = self->_fanInfos;
  id v8 = v4;
  if (!fanInfos)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_fanInfos;
    self->_fanInfos = v6;

    id v4 = v8;
    fanInfos = self->_fanInfos;
  }
  [(NSArray *)fanInfos addObject:v4];
}

- (void)clearFanInfo
{
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