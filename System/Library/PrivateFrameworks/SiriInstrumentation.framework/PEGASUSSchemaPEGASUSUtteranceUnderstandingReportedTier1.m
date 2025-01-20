@interface PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1
- (BOOL)hasLinkId;
- (BOOL)hasMultiTurnListSelectionUnderstanding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)topKGSAIntents;
- (NSArray)topU2Intents;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)multiTurnListSelectionUnderstanding;
- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)topKGSAIntentsAtIndex:(unint64_t)a3;
- (id)topU2IntentsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topKGSAIntentsCount;
- (unint64_t)topU2IntentsCount;
- (void)addTopKGSAIntents:(id)a3;
- (void)addTopU2Intents:(id)a3;
- (void)clearTopKGSAIntents;
- (void)clearTopU2Intents;
- (void)deleteLinkId;
- (void)deleteMultiTurnListSelectionUnderstanding;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMultiTurnListSelectionUnderstanding:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setMultiTurnListSelectionUnderstanding:(id)a3;
- (void)setTopKGSAIntents:(id)a3;
- (void)setTopU2Intents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v17 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self deleteLinkId];
  }
  v9 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topU2Intents];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self setTopU2Intents:v10];

  v11 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topKGSAIntents];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self setTopKGSAIntents:v12];

  v13 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
  v14 = [v13 applySensitiveConditionsPolicy:v4];
  int v15 = [v14 suppressMessage];

  if (v15) {
    [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self deleteMultiTurnListSelectionUnderstanding];
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
  objc_storeStrong((id *)&self->_multiTurnListSelectionUnderstanding, 0);
  objc_storeStrong((id *)&self->_topKGSAIntents, 0);
  objc_storeStrong((id *)&self->_topU2Intents, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasMultiTurnListSelectionUnderstanding:(BOOL)a3
{
  self->_hasMultiTurnListSelectionUnderstanding = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setMultiTurnListSelectionUnderstanding:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)multiTurnListSelectionUnderstanding
{
  return self->_multiTurnListSelectionUnderstanding;
}

- (void)setTopKGSAIntents:(id)a3
{
}

- (NSArray)topKGSAIntents
{
  return self->_topKGSAIntents;
}

- (void)setTopU2Intents:(id)a3
{
}

- (NSArray)topU2Intents
{
  return self->_topU2Intents;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1;
  v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"topU2Intents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v9 = v8;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[PEGASUSSchemaPEGASUSIntentTier1 alloc] initWithDictionary:v15];
              [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)v5 addTopU2Intents:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v12);
      }

      int v8 = v9;
    }
    objc_super v17 = [v4 objectForKeyedSubscript:@"topKGSAIntents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = v8;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[PEGASUSSchemaPEGASUSIntentTier1 alloc] initWithDictionary:v23];
              [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)v5 addTopKGSAIntents:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v20);
      }

      int v8 = v29;
    }
    v25 = objc_msgSend(v4, "objectForKeyedSubscript:", @"multiTurnListSelectionUnderstanding", v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 alloc] initWithDictionary:v25];
      [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)v5 setMultiTurnListSelectionUnderstanding:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self dictionaryRepresentation];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_linkId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_multiTurnListSelectionUnderstanding)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"multiTurnListSelectionUnderstanding"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"multiTurnListSelectionUnderstanding"];
    }
  }
  if ([(NSArray *)self->_topKGSAIntents count])
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = self->_topKGSAIntents;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            objc_super v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"topKGSAIntents"];
  }
  if ([(NSArray *)self->_topU2Intents count])
  {
    id v18 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v19 = self->_topU2Intents;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (void)v27);
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"topU2Intents"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v27);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  uint64_t v4 = [(NSArray *)self->_topU2Intents hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_topKGSAIntents hash];
  return v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self->_multiTurnListSelectionUnderstanding hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
    id v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topU2Intents];
  v6 = [v4 topU2Intents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topU2Intents];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topU2Intents];
    uint64_t v15 = [v4 topU2Intents];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topKGSAIntents];
  v6 = [v4 topKGSAIntents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topKGSAIntents];
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self topKGSAIntents];
    uint64_t v20 = [v4 topKGSAIntents];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
  v6 = [v4 multiTurnListSelectionUnderstanding];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
    v25 = [v4 multiTurnListSelectionUnderstanding];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];

  if (v5)
  {
    v6 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = self->_topU2Intents;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_topKGSAIntents;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];

  if (v17)
  {
    id v18 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self multiTurnListSelectionUnderstanding];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteMultiTurnListSelectionUnderstanding
{
}

- (BOOL)hasMultiTurnListSelectionUnderstanding
{
  return self->_multiTurnListSelectionUnderstanding != 0;
}

- (id)topKGSAIntentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_topKGSAIntents objectAtIndexedSubscript:a3];
}

- (unint64_t)topKGSAIntentsCount
{
  return [(NSArray *)self->_topKGSAIntents count];
}

- (void)addTopKGSAIntents:(id)a3
{
  id v4 = a3;
  topKGSAIntents = self->_topKGSAIntents;
  id v8 = v4;
  if (!topKGSAIntents)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_topKGSAIntents;
    self->_topKGSAIntents = v6;

    id v4 = v8;
    topKGSAIntents = self->_topKGSAIntents;
  }
  [(NSArray *)topKGSAIntents addObject:v4];
}

- (void)clearTopKGSAIntents
{
}

- (id)topU2IntentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_topU2Intents objectAtIndexedSubscript:a3];
}

- (unint64_t)topU2IntentsCount
{
  return [(NSArray *)self->_topU2Intents count];
}

- (void)addTopU2Intents:(id)a3
{
  id v4 = a3;
  topU2Intents = self->_topU2Intents;
  id v8 = v4;
  if (!topU2Intents)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_topU2Intents;
    self->_topU2Intents = v6;

    id v4 = v8;
    topU2Intents = self->_topU2Intents;
  }
  [(NSArray *)topU2Intents addObject:v4];
}

- (void)clearTopU2Intents
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