@interface ASRSchemaASRRecognitionResult
- (ASRSchemaASRRecognitionResult)initWithDictionary:(id)a3;
- (ASRSchemaASRRecognitionResult)initWithJSON:(id)a3;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)phrases;
- (NSArray)utterances;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)phrasesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (id)utterancesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)phrasesCount;
- (unint64_t)utterancesCount;
- (void)addPhrases:(id)a3;
- (void)addUtterances:(id)a3;
- (void)clearPhrases;
- (void)clearUtterances;
- (void)deleteLinkId;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setPhrases:(id)a3;
- (void)setUtterances:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRecognitionResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRRecognitionResult;
  v5 = [(SISchemaInstrumentationMessage *)&v14 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRRecognitionResult *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRRecognitionResult *)self deleteLinkId];
  }
  v9 = [(ASRSchemaASRRecognitionResult *)self phrases];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ASRSchemaASRRecognitionResult *)self setPhrases:v10];

  v11 = [(ASRSchemaASRRecognitionResult *)self utterances];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(ASRSchemaASRRecognitionResult *)self setUtterances:v12];

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
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setUtterances:(id)a3
{
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (void)setPhrases:(id)a3
{
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (ASRSchemaASRRecognitionResult)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)ASRSchemaASRRecognitionResult;
  v5 = [(ASRSchemaASRRecognitionResult *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRRecognitionResult *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"phrases"];
    objc_opt_class();
    v28 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v9 = v8;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[ASRSchemaASRPhrase alloc] initWithDictionary:v15];
              [(ASRSchemaASRRecognitionResult *)v5 addPhrases:v16];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v12);
      }

      v6 = v28;
      int v8 = v9;
    }
    v17 = [v4 objectForKeyedSubscript:@"utterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v8;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[ASRSchemaASRUtterance alloc] initWithDictionary:v23];
              [(ASRSchemaASRRecognitionResult *)v5 addUtterances:v24];
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v20);
      }

      int v8 = v27;
      v6 = v28;
    }
    v25 = v5;
  }
  return v5;
}

- (ASRSchemaASRRecognitionResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRecognitionResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRecognitionResult *)self dictionaryRepresentation];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_linkId)
  {
    id v4 = [(ASRSchemaASRRecognitionResult *)self linkId];
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
  if ([(NSArray *)self->_phrases count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    int v8 = self->_phrases;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"phrases"];
  }
  if ([(NSArray *)self->_utterances count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v16 = self->_utterances;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"utterances"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v24);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  uint64_t v4 = [(NSArray *)self->_phrases hash] ^ v3;
  return v4 ^ [(NSArray *)self->_utterances hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ASRSchemaASRRecognitionResult *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ASRSchemaASRRecognitionResult *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRRecognitionResult *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRecognitionResult *)self phrases];
  v6 = [v4 phrases];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ASRSchemaASRRecognitionResult *)self phrases];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ASRSchemaASRRecognitionResult *)self phrases];
    uint64_t v15 = [v4 phrases];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRecognitionResult *)self utterances];
  v6 = [v4 utterances];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ASRSchemaASRRecognitionResult *)self utterances];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(ASRSchemaASRRecognitionResult *)self utterances];
    uint64_t v20 = [v4 utterances];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ASRSchemaASRRecognitionResult *)self linkId];

  if (v5)
  {
    v6 = [(ASRSchemaASRRecognitionResult *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_phrases;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_utterances;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRecognitionResultReadFrom(self, (uint64_t)a3);
}

- (id)utterancesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_utterances objectAtIndexedSubscript:a3];
}

- (unint64_t)utterancesCount
{
  return [(NSArray *)self->_utterances count];
}

- (void)addUtterances:(id)a3
{
  id v4 = a3;
  utterances = self->_utterances;
  id v8 = v4;
  if (!utterances)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_utterances;
    self->_utterances = v6;

    id v4 = v8;
    utterances = self->_utterances;
  }
  [(NSArray *)utterances addObject:v4];
}

- (void)clearUtterances
{
}

- (id)phrasesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_phrases objectAtIndexedSubscript:a3];
}

- (unint64_t)phrasesCount
{
  return [(NSArray *)self->_phrases count];
}

- (void)addPhrases:(id)a3
{
  id v4 = a3;
  phrases = self->_phrases;
  id v8 = v4;
  if (!phrases)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_phrases;
    self->_phrases = v6;

    id v4 = v8;
    phrases = self->_phrases;
  }
  [(NSArray *)phrases addObject:v4];
}

- (void)clearPhrases
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