@interface NLXSchemaCDMUserParse
- (BOOL)hasComparableProbability;
- (BOOL)hasCorrectionOutcome;
- (BOOL)hasId;
- (BOOL)hasParser;
- (BOOL)hasProbability;
- (BOOL)hasRepetitionResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMCorrectionOutcome)correctionOutcome;
- (NLXSchemaCDMParser)parser;
- (NLXSchemaCDMRepetitionResult)repetitionResult;
- (NLXSchemaCDMUserParse)initWithDictionary:(id)a3;
- (NLXSchemaCDMUserParse)initWithJSON:(id)a3;
- (NSArray)userDialogActs;
- (NSData)jsonData;
- (SISchemaUUID)id;
- (double)comparableProbability;
- (double)probability;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)userDialogActsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userDialogActsCount;
- (void)addUserDialogActs:(id)a3;
- (void)clearUserDialogActs;
- (void)deleteComparableProbability;
- (void)deleteCorrectionOutcome;
- (void)deleteId;
- (void)deleteParser;
- (void)deleteProbability;
- (void)deleteRepetitionResult;
- (void)setComparableProbability:(double)a3;
- (void)setCorrectionOutcome:(id)a3;
- (void)setHasComparableProbability:(BOOL)a3;
- (void)setHasCorrectionOutcome:(BOOL)a3;
- (void)setHasId:(BOOL)a3;
- (void)setHasParser:(BOOL)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setHasRepetitionResult:(BOOL)a3;
- (void)setId:(id)a3;
- (void)setParser:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRepetitionResult:(id)a3;
- (void)setUserDialogActs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMUserParse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NLXSchemaCDMUserParse;
  v5 = [(SISchemaInstrumentationMessage *)&v21 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMUserParse *)self id];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMUserParse *)self deleteId];
  }
  v9 = [(NLXSchemaCDMUserParse *)self userDialogActs];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(NLXSchemaCDMUserParse *)self setUserDialogActs:v10];

  v11 = [(NLXSchemaCDMUserParse *)self repetitionResult];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(NLXSchemaCDMUserParse *)self deleteRepetitionResult];
  }
  v14 = [(NLXSchemaCDMUserParse *)self parser];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(NLXSchemaCDMUserParse *)self deleteParser];
  }
  v17 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
  v18 = [v17 applySensitiveConditionsPolicy:v4];
  int v19 = [v18 suppressMessage];

  if (v19) {
    [(NLXSchemaCDMUserParse *)self deleteCorrectionOutcome];
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
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_userDialogActs, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setHasCorrectionOutcome:(BOOL)a3
{
  self->_hasId = a3;
}

- (void)setHasParser:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasRepetitionResult:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCorrectionOutcome:(id)a3
{
}

- (NLXSchemaCDMCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (double)comparableProbability
{
  return self->_comparableProbability;
}

- (void)setParser:(id)a3
{
}

- (NLXSchemaCDMParser)parser
{
  return self->_parser;
}

- (void)setRepetitionResult:(id)a3
{
}

- (NLXSchemaCDMRepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (double)probability
{
  return self->_probability;
}

- (void)setUserDialogActs:(id)a3
{
}

- (NSArray)userDialogActs
{
  return self->_userDialogActs;
}

- (void)setId:(id)a3
{
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (NLXSchemaCDMUserParse)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NLXSchemaCDMUserParse;
  v5 = [(NLXSchemaCDMUserParse *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMUserParse *)v5 setId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userDialogActs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[NLXSchemaCDMUserDialogAct alloc] initWithDictionary:v14];
              [(NLXSchemaCDMUserParse *)v5 addUserDialogActs:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v11);
      }

      v6 = v26;
    }
    int v16 = [v4 objectForKeyedSubscript:@"probability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 doubleValue];
      -[NLXSchemaCDMUserParse setProbability:](v5, "setProbability:");
    }
    v17 = [v4 objectForKeyedSubscript:@"repetitionResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[NLXSchemaCDMRepetitionResult alloc] initWithDictionary:v17];
      [(NLXSchemaCDMUserParse *)v5 setRepetitionResult:v18];
    }
    int v19 = [v4 objectForKeyedSubscript:@"parser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[NLXSchemaCDMParser alloc] initWithDictionary:v19];
      [(NLXSchemaCDMUserParse *)v5 setParser:v20];
    }
    objc_super v21 = [v4 objectForKeyedSubscript:@"comparableProbability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 doubleValue];
      -[NLXSchemaCDMUserParse setComparableProbability:](v5, "setComparableProbability:");
    }
    v22 = [v4 objectForKeyedSubscript:@"correctionOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[NLXSchemaCDMCorrectionOutcome alloc] initWithDictionary:v22];
      [(NLXSchemaCDMUserParse *)v5 setCorrectionOutcome:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (NLXSchemaCDMUserParse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMUserParse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMUserParse *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = NSNumber;
    [(NLXSchemaCDMUserParse *)self comparableProbability];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"comparableProbability"];
  }
  if (self->_correctionOutcome)
  {
    v6 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"correctionOutcome"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"correctionOutcome"];
    }
  }
  if (self->_id)
  {
    id v9 = [(NLXSchemaCDMUserParse *)self id];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"id"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"id"];
    }
  }
  if (self->_parser)
  {
    uint64_t v12 = [(NLXSchemaCDMUserParse *)self parser];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"parser"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"parser"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = NSNumber;
    [(NLXSchemaCDMUserParse *)self probability];
    int v16 = objc_msgSend(v15, "numberWithDouble:");
    [v3 setObject:v16 forKeyedSubscript:@"probability"];
  }
  if (self->_repetitionResult)
  {
    v17 = [(NLXSchemaCDMUserParse *)self repetitionResult];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"repetitionResult"];
    }
    else
    {
      int v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"repetitionResult"];
    }
  }
  if ([(NSArray *)self->_userDialogActs count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    objc_super v21 = self->_userDialogActs;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (void)v29);
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            long long v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"userDialogActs"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v29);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_id hash];
  uint64_t v4 = [(NSArray *)self->_userDialogActs hash];
  if (*(unsigned char *)&self->_has)
  {
    double probability = self->_probability;
    double v7 = -probability;
    if (probability >= 0.0) {
      double v7 = self->_probability;
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
  unint64_t v10 = [(NLXSchemaCDMRepetitionResult *)self->_repetitionResult hash];
  unint64_t v11 = [(NLXSchemaCDMParser *)self->_parser hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double comparableProbability = self->_comparableProbability;
    double v14 = -comparableProbability;
    if (comparableProbability >= 0.0) {
      double v14 = self->_comparableProbability;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ [(NLXSchemaCDMCorrectionOutcome *)self->_correctionOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self id];
  v6 = [v4 id];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v7 = [(NLXSchemaCDMUserParse *)self id];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(NLXSchemaCDMUserParse *)self id];
    unint64_t v10 = [v4 id];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self userDialogActs];
  v6 = [v4 userDialogActs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v12 = [(NLXSchemaCDMUserParse *)self userDialogActs];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    double v14 = [(NLXSchemaCDMUserParse *)self userDialogActs];
    long double v15 = [v4 userDialogActs];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[64] & 1)) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    double probability = self->_probability;
    [v4 probability];
    if (probability != v18) {
      goto LABEL_33;
    }
  }
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self repetitionResult];
  v6 = [v4 repetitionResult];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v19 = [(NLXSchemaCDMUserParse *)self repetitionResult];
  if (v19)
  {
    v20 = (void *)v19;
    objc_super v21 = [(NLXSchemaCDMUserParse *)self repetitionResult];
    uint64_t v22 = [v4 repetitionResult];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self parser];
  v6 = [v4 parser];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v24 = [(NLXSchemaCDMUserParse *)self parser];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(NLXSchemaCDMUserParse *)self parser];
    long long v27 = [v4 parser];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  int v29 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v29 != ((v4[64] >> 1) & 1)) {
    goto LABEL_33;
  }
  if (v29)
  {
    double comparableProbability = self->_comparableProbability;
    [v4 comparableProbability];
    if (comparableProbability != v31) {
      goto LABEL_33;
    }
  }
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
  v6 = [v4 correctionOutcome];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
    if (!v32)
    {

LABEL_36:
      BOOL v37 = 1;
      goto LABEL_34;
    }
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
    v35 = [v4 correctionOutcome];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_36;
    }
  }
  else
  {
LABEL_32:
  }
LABEL_33:
  BOOL v37 = 0;
LABEL_34:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NLXSchemaCDMUserParse *)self id];

  if (v5)
  {
    v6 = [(NLXSchemaCDMUserParse *)self id];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_userDialogActs;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v12 = [(NLXSchemaCDMUserParse *)self repetitionResult];

  if (v12)
  {
    uint64_t v13 = [(NLXSchemaCDMUserParse *)self repetitionResult];
    PBDataWriterWriteSubmessage();
  }
  double v14 = [(NLXSchemaCDMUserParse *)self parser];

  if (v14)
  {
    long double v15 = [(NLXSchemaCDMUserParse *)self parser];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  int v16 = [(NLXSchemaCDMUserParse *)self correctionOutcome];

  if (v16)
  {
    v17 = [(NLXSchemaCDMUserParse *)self correctionOutcome];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMUserParseReadFrom(self, (uint64_t)a3);
}

- (void)deleteCorrectionOutcome
{
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (void)deleteComparableProbability
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasComparableProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasComparableProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setComparableProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double comparableProbability = a3;
}

- (void)deleteParser
{
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (void)deleteRepetitionResult
{
}

- (BOOL)hasRepetitionResult
{
  return self->_repetitionResult != 0;
}

- (void)deleteProbability
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProbability:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProbability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double probability = a3;
}

- (id)userDialogActsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userDialogActs objectAtIndexedSubscript:a3];
}

- (unint64_t)userDialogActsCount
{
  return [(NSArray *)self->_userDialogActs count];
}

- (void)addUserDialogActs:(id)a3
{
  id v4 = a3;
  userDialogActs = self->_userDialogActs;
  id v8 = v4;
  if (!userDialogActs)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userDialogActs;
    self->_userDialogActs = v6;

    id v4 = v8;
    userDialogActs = self->_userDialogActs;
  }
  [(NSArray *)userDialogActs addObject:v4];
}

- (void)clearUserDialogActs
{
}

- (void)deleteId
{
}

- (BOOL)hasId
{
  return self->_id != 0;
}

@end