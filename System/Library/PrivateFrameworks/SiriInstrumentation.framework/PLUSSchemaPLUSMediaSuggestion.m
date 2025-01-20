@interface PLUSSchemaPLUSMediaSuggestion
- (BOOL)hasLocality;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contributingGroundTruths;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaSuggestion)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaSuggestion)initWithJSON:(id)a3;
- (PLUSSchemaPLUSMediaSuggestionSource)source;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)contributingGroundTruthAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locality;
- (unint64_t)contributingGroundTruthCount;
- (unint64_t)hash;
- (void)addContributingGroundTruth:(id)a3;
- (void)clearContributingGroundTruth;
- (void)deleteLocality;
- (void)deleteSource;
- (void)setContributingGroundTruths:(id)a3;
- (void)setHasLocality:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setLocality:(int)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaSuggestion

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSMediaSuggestion;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSMediaSuggestion *)self deleteSource];
  }
  v9 = [(PLUSSchemaPLUSMediaSuggestion *)self contributingGroundTruths];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PLUSSchemaPLUSMediaSuggestion *)self setContributingGroundTruths:v10];

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
  objc_storeStrong((id *)&self->_contributingGroundTruths, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)setHasSource:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)locality
{
  return self->_locality;
}

- (void)setContributingGroundTruths:(id)a3
{
}

- (NSArray)contributingGroundTruths
{
  return self->_contributingGroundTruths;
}

- (void)setSource:(id)a3
{
}

- (PLUSSchemaPLUSMediaSuggestionSource)source
{
  return self->_source;
}

- (PLUSSchemaPLUSMediaSuggestion)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLUSSchemaPLUSMediaSuggestion;
  v5 = [(PLUSSchemaPLUSMediaSuggestion *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSMediaSuggestionSource alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSMediaSuggestion *)v5 setSource:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"contributingGroundTruth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v6;
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
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[PLUSSchemaPLUSMediaGroundTruthSummary alloc] initWithDictionary:v14];
              [(PLUSSchemaPLUSMediaSuggestion *)v5 addContributingGroundTruth:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v6 = v19;
    }
    v16 = [v4 objectForKeyedSubscript:@"locality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaSuggestion setLocality:](v5, "setLocality:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaSuggestion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaSuggestion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaSuggestion *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_contributingGroundTruths count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_contributingGroundTruths;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"contributingGroundTruth"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v12 = [(PLUSSchemaPLUSMediaSuggestion *)self locality] - 1;
    if (v12 > 2) {
      uint64_t v13 = @"PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN";
    }
    else {
      uint64_t v13 = off_1E5EBBA18[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, @"locality", (void)v18);
  }
  if (self->_source)
  {
    uint64_t v14 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"source"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"source"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSMediaSuggestionSource *)self->_source hash];
  uint64_t v4 = [(NSArray *)self->_contributingGroundTruths hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_locality;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
  uint64_t v6 = [v4 source];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
    uint64_t v10 = [v4 source];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaSuggestion *)self contributingGroundTruths];
  uint64_t v6 = [v4 contributingGroundTruths];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(PLUSSchemaPLUSMediaSuggestion *)self contributingGroundTruths];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PLUSSchemaPLUSMediaSuggestion *)self contributingGroundTruths];
    v15 = [v4 contributingGroundTruths];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int locality = self->_locality, locality == [v4 locality]))
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLUSSchemaPLUSMediaSuggestion *)self source];

  if (v5)
  {
    uint64_t v6 = [(PLUSSchemaPLUSMediaSuggestion *)self source];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_contributingGroundTruths;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocality
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLocality:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocality
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocality:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locality = a3;
}

- (id)contributingGroundTruthAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contributingGroundTruths objectAtIndexedSubscript:a3];
}

- (unint64_t)contributingGroundTruthCount
{
  return [(NSArray *)self->_contributingGroundTruths count];
}

- (void)addContributingGroundTruth:(id)a3
{
  id v4 = a3;
  contributingGroundTruths = self->_contributingGroundTruths;
  id v8 = v4;
  if (!contributingGroundTruths)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contributingGroundTruths;
    self->_contributingGroundTruths = v6;

    id v4 = v8;
    contributingGroundTruths = self->_contributingGroundTruths;
  }
  [(NSArray *)contributingGroundTruths addObject:v4];
}

- (void)clearContributingGroundTruth
{
}

- (void)deleteSource
{
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

@end