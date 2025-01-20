@interface PLUSSchemaPLUSContactSuggestion
- (BOOL)hasConfidence;
- (BOOL)hasSource;
- (BOOL)hasSuggestionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contributingGroundTruths;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestion)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestion)initWithJSON:(id)a3;
- (SISchemaUUID)suggestionId;
- (double)confidence;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)contributingGroundTruthAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)source;
- (unint64_t)contributingGroundTruthCount;
- (unint64_t)hash;
- (void)addContributingGroundTruth:(id)a3;
- (void)clearContributingGroundTruth;
- (void)deleteConfidence;
- (void)deleteSource;
- (void)deleteSuggestionId;
- (void)setConfidence:(double)a3;
- (void)setContributingGroundTruths:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestion

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggestion;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSContactSuggestion *)self deleteSuggestionId];
  }
  v9 = [(PLUSSchemaPLUSContactSuggestion *)self contributingGroundTruths];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PLUSSchemaPLUSContactSuggestion *)self setContributingGroundTruths:v10];

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
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setContributingGroundTruths:(id)a3
{
}

- (NSArray)contributingGroundTruths
{
  return self->_contributingGroundTruths;
}

- (double)confidence
{
  return self->_confidence;
}

- (int)source
{
  return self->_source;
}

- (void)setSuggestionId:(id)a3
{
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (PLUSSchemaPLUSContactSuggestion)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLUSSchemaPLUSContactSuggestion;
  v5 = [(PLUSSchemaPLUSContactSuggestion *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggestion *)v5 setSuggestionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestion setSource:](v5, "setSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[PLUSSchemaPLUSContactSuggestion setConfidence:](v5, "setConfidence:");
    }
    v10 = [v4 objectForKeyedSubscript:@"contributingGroundTruth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v9;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[PLUSSchemaPLUSContactGroundTruthSourceSummary alloc] initWithDictionary:v16];
              [(PLUSSchemaPLUSContactSuggestion *)v5 addContributingGroundTruth:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v6 = v21;
      v9 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestion *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = NSNumber;
    [(PLUSSchemaPLUSContactSuggestion *)self confidence];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"confidence"];
  }
  if ([(NSArray *)self->_contributingGroundTruths count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_contributingGroundTruths;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"contributingGroundTruth"];
  }
  if (*(unsigned char *)&self->_has)
  {
    if ([(PLUSSchemaPLUSContactSuggestion *)self source] == 1) {
      uint64_t v14 = @"PLUSCONTACTSUGGESTIONSOURCE_PLUS_INFERRED_CONTACT_SUGGESTER";
    }
    else {
      uint64_t v14 = @"PLUSCONTACTSUGGESTIONSOURCE_UNKNOWN";
    }
    [v3 setObject:v14 forKeyedSubscript:@"source"];
  }
  if (self->_suggestionId)
  {
    v15 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"suggestionId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"suggestionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_suggestionId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_source;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(NSArray *)self->_contributingGroundTruths hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double confidence = self->_confidence;
  double v6 = -confidence;
  if (confidence >= 0.0) {
    double v6 = self->_confidence;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(NSArray *)self->_contributingGroundTruths hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  v5 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
  double v6 = [v4 suggestionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
    uint64_t v10 = [v4 suggestionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $90470D085CA6FB62232A2BC1221F8C73 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int source = self->_source;
    if (source != [v4 source]) {
      goto LABEL_19;
    }
    $90470D085CA6FB62232A2BC1221F8C73 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    double confidence = self->_confidence;
    [v4 confidence];
    if (confidence != v17) {
      goto LABEL_19;
    }
  }
  v5 = [(PLUSSchemaPLUSContactSuggestion *)self contributingGroundTruths];
  double v6 = [v4 contributingGroundTruths];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v18 = [(PLUSSchemaPLUSContactSuggestion *)self contributingGroundTruths];
  if (!v18)
  {

LABEL_22:
    BOOL v23 = 1;
    goto LABEL_20;
  }
  long long v19 = (void *)v18;
  long long v20 = [(PLUSSchemaPLUSContactSuggestion *)self contributingGroundTruths];
  long long v21 = [v4 contributingGroundTruths];
  char v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];

  if (v5)
  {
    double v6 = [(PLUSSchemaPLUSContactSuggestion *)self suggestionId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = self->_contributingGroundTruths;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionReadFrom(self, (uint64_t)a3);
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
    double v6 = [MEMORY[0x1E4F1CA48] array];
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

- (void)deleteConfidence
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double confidence = a3;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int source = a3;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end