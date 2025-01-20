@interface DODMLASRSchemaDODMLASRDecodingResult
- (BOOL)hasConfigName;
- (BOOL)hasDecodeDurationInNs;
- (BOOL)hasDecodingMetrics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRDecodingMetrics)decodingMetrics;
- (DODMLASRSchemaDODMLASRDecodingResult)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRDecodingResult)initWithJSON:(id)a3;
- (NSArray)alignments;
- (NSArray)tokens;
- (NSArray)utterances;
- (NSData)jsonData;
- (NSString)configName;
- (id)alignmentsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)tokensAtIndex:(unint64_t)a3;
- (id)utterancesAtIndex:(unint64_t)a3;
- (unint64_t)alignmentsCount;
- (unint64_t)decodeDurationInNs;
- (unint64_t)hash;
- (unint64_t)tokensCount;
- (unint64_t)utterancesCount;
- (void)addAlignments:(id)a3;
- (void)addTokens:(id)a3;
- (void)addUtterances:(id)a3;
- (void)clearAlignments;
- (void)clearTokens;
- (void)clearUtterances;
- (void)deleteConfigName;
- (void)deleteDecodeDurationInNs;
- (void)deleteDecodingMetrics;
- (void)setAlignments:(id)a3;
- (void)setConfigName:(id)a3;
- (void)setDecodeDurationInNs:(unint64_t)a3;
- (void)setDecodingMetrics:(id)a3;
- (void)setHasConfigName:(BOOL)a3;
- (void)setHasDecodeDurationInNs:(BOOL)a3;
- (void)setHasDecodingMetrics:(BOOL)a3;
- (void)setTokens:(id)a3;
- (void)setUtterances:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRDecodingResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DODMLASRSchemaDODMLASRDecodingResult;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRDecodingResult *)self tokens];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASRDecodingResult *)self setTokens:v7];

  v8 = [(DODMLASRSchemaDODMLASRDecodingResult *)self utterances];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(DODMLASRSchemaDODMLASRDecodingResult *)self setUtterances:v9];

  v10 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
  v11 = [v10 applySensitiveConditionsPolicy:v4];
  int v12 = [v11 suppressMessage];

  if (v12) {
    [(DODMLASRSchemaDODMLASRDecodingResult *)self deleteDecodingMetrics];
  }
  v13 = [(DODMLASRSchemaDODMLASRDecodingResult *)self alignments];
  v14 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v13 underConditions:v4];
  [(DODMLASRSchemaDODMLASRDecodingResult *)self setAlignments:v14];

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
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_decodingMetrics, 0);
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_configName, 0);
}

- (void)setHasDecodingMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasConfigName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAlignments:(id)a3
{
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (unint64_t)decodeDurationInNs
{
  return self->_decodeDurationInNs;
}

- (void)setDecodingMetrics:(id)a3
{
}

- (DODMLASRSchemaDODMLASRDecodingMetrics)decodingMetrics
{
  return self->_decodingMetrics;
}

- (void)setUtterances:(id)a3
{
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setConfigName:(id)a3
{
}

- (NSString)configName
{
  return self->_configName;
}

- (DODMLASRSchemaDODMLASRDecodingResult)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DODMLASRSchemaDODMLASRDecodingResult;
  v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)&v53 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"configName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRDecodingResult *)v5 setConfigName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"tokens"];
    objc_opt_class();
    v40 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v50 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ASRSchemaASRToken alloc] initWithDictionary:v14];
              [(DODMLASRSchemaDODMLASRDecodingResult *)v5 addTokens:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
        }
        while (v11);
      }
    }
    objc_super v16 = [v4 objectForKeyedSubscript:@"utterances"];
    objc_opt_class();
    v39 = v16;
    if (objc_opt_isKindOfClass())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[DODMLASRSchemaDODMLASRUtteranceInfo alloc] initWithDictionary:v22];
              [(DODMLASRSchemaDODMLASRDecodingResult *)v5 addUtterances:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v19);
      }
    }
    v24 = [v4 objectForKeyedSubscript:@"decodingMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[DODMLASRSchemaDODMLASRDecodingMetrics alloc] initWithDictionary:v24];
      [(DODMLASRSchemaDODMLASRDecodingResult *)v5 setDecodingMetrics:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"decodeDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRDecodingResult setDecodeDurationInNs:](v5, "setDecodeDurationInNs:", [v26 unsignedLongLongValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"alignments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = v24;
      id v38 = v4;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [[DODMLASRSchemaDODMLASRAlignmentInfo alloc] initWithDictionary:v33];
              [(DODMLASRSchemaDODMLASRDecodingResult *)v5 addAlignments:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v30);
      }

      id v4 = v38;
      objc_super v16 = v39;
      v24 = v37;
    }
    v35 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRDecodingResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRDecodingResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRDecodingResult *)self dictionaryRepresentation];
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
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alignments count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v5 = self->_alignments;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alignments"];
  }
  if (self->_configName)
  {
    uint64_t v12 = [(DODMLASRSchemaDODMLASRDecodingResult *)self configName];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"configName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingResult decodeDurationInNs](self, "decodeDurationInNs"));
    [v3 setObject:v14 forKeyedSubscript:@"decodeDurationInNs"];
  }
  if (self->_decodingMetrics)
  {
    v15 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
    objc_super v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"decodingMetrics"];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"decodingMetrics"];
    }
  }
  if ([(NSArray *)self->_tokens count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v19 = self->_tokens;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
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
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"tokens"];
  }
  if ([(NSArray *)self->_utterances count])
  {
    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v27 = self->_utterances;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "dictionaryRepresentation", (void)v35);
          if (v32)
          {
            [v26 addObject:v32];
          }
          else
          {
            uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
            [v26 addObject:v33];
          }
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"utterances"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v35);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_configName hash];
  uint64_t v4 = [(NSArray *)self->_tokens hash];
  uint64_t v5 = [(NSArray *)self->_utterances hash];
  unint64_t v6 = [(DODMLASRSchemaDODMLASRDecodingMetrics *)self->_decodingMetrics hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_decodeDurationInNs;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSArray *)self->_alignments hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self configName];
  unint64_t v6 = [v4 configName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRDecodingResult *)self configName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(DODMLASRSchemaDODMLASRDecodingResult *)self configName];
    uint64_t v10 = [v4 configName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self tokens];
  unint64_t v6 = [v4 tokens];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(DODMLASRSchemaDODMLASRDecodingResult *)self tokens];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(DODMLASRSchemaDODMLASRDecodingResult *)self tokens];
    v15 = [v4 tokens];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self utterances];
  unint64_t v6 = [v4 utterances];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v17 = [(DODMLASRSchemaDODMLASRDecodingResult *)self utterances];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(DODMLASRSchemaDODMLASRDecodingResult *)self utterances];
    uint64_t v20 = [v4 utterances];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
  unint64_t v6 = [v4 decodingMetrics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v22 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
    v25 = [v4 decodingMetrics];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t decodeDurationInNs = self->_decodeDurationInNs;
    if (decodeDurationInNs != [v4 decodeDurationInNs]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self alignments];
  unint64_t v6 = [v4 alignments];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(DODMLASRSchemaDODMLASRDecodingResult *)self alignments];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [(DODMLASRSchemaDODMLASRDecodingResult *)self alignments];
    uint64_t v31 = [v4 alignments];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(DODMLASRSchemaDODMLASRDecodingResult *)self configName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v6 = self->_tokens;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v11 = self->_utterances;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  int v16 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];

  if (v16)
  {
    uint64_t v17 = [(DODMLASRSchemaDODMLASRDecodingResult *)self decodingMetrics];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v18 = self->_alignments;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRDecodingResultReadFrom(self, (uint64_t)a3);
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alignments objectAtIndexedSubscript:a3];
}

- (unint64_t)alignmentsCount
{
  return [(NSArray *)self->_alignments count];
}

- (void)addAlignments:(id)a3
{
  id v4 = a3;
  alignments = self->_alignments;
  id v8 = v4;
  if (!alignments)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alignments;
    self->_alignments = v6;

    id v4 = v8;
    alignments = self->_alignments;
  }
  [(NSArray *)alignments addObject:v4];
}

- (void)clearAlignments
{
}

- (void)deleteDecodeDurationInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDecodeDurationInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecodeDurationInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDecodeDurationInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t decodeDurationInNs = a3;
}

- (void)deleteDecodingMetrics
{
}

- (BOOL)hasDecodingMetrics
{
  return self->_decodingMetrics != 0;
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
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

- (id)tokensAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tokens objectAtIndexedSubscript:a3];
}

- (unint64_t)tokensCount
{
  return [(NSArray *)self->_tokens count];
}

- (void)addTokens:(id)a3
{
  id v4 = a3;
  tokens = self->_tokens;
  id v8 = v4;
  if (!tokens)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tokens;
    self->_tokens = v6;

    id v4 = v8;
    tokens = self->_tokens;
  }
  [(NSArray *)tokens addObject:v4];
}

- (void)clearTokens
{
}

- (void)deleteConfigName
{
}

- (BOOL)hasConfigName
{
  return self->_configName != 0;
}

@end