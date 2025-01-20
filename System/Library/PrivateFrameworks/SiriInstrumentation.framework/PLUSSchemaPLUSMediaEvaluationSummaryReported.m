@interface PLUSSchemaPLUSMediaEvaluationSummaryReported
- (BOOL)hasConfiguredState;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasPlayUserFeedback;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSuggestionEvaluation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)groundTruthSummaries;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (PLUSSchemaPLUSMediaConfiguredState)configuredState;
- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithJSON:(id)a3;
- (PLUSSchemaPLUSMediaSuggestionEvaluation)suggestionEvaluation;
- (SISchemaUUID)originalRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)groundTruthSummariesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)playUserFeedback;
- (unint64_t)groundTruthSummariesCount;
- (unint64_t)hash;
- (void)addGroundTruthSummaries:(id)a3;
- (void)clearGroundTruthSummaries;
- (void)deleteConfiguredState;
- (void)deleteOriginalRequestId;
- (void)deletePlayUserFeedback;
- (void)deleteResultCandidateId;
- (void)deleteSuggestionEvaluation;
- (void)setConfiguredState:(id)a3;
- (void)setGroundTruthSummaries:(id)a3;
- (void)setHasConfiguredState:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasPlayUserFeedback:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSuggestionEvaluation:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setPlayUserFeedback:(int)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSuggestionEvaluation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaEvaluationSummaryReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLUSSchemaPLUSMediaEvaluationSummaryReported;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self deleteOriginalRequestId];
  }
  v9 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self deleteSuggestionEvaluation];
  }
  v12 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self groundTruthSummaries];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self setGroundTruthSummaries:v13];

  v14 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self deleteConfiguredState];
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
  objc_storeStrong((id *)&self->_configuredState, 0);
  objc_storeStrong((id *)&self->_groundTruthSummaries, 0);
  objc_storeStrong((id *)&self->_suggestionEvaluation, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
}

- (void)setHasConfiguredState:(BOOL)a3
{
  self->_hasOriginalRequestId = a3;
}

- (void)setHasSuggestionEvaluation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setConfiguredState:(id)a3
{
}

- (PLUSSchemaPLUSMediaConfiguredState)configuredState
{
  return self->_configuredState;
}

- (void)setGroundTruthSummaries:(id)a3
{
}

- (NSArray)groundTruthSummaries
{
  return self->_groundTruthSummaries;
}

- (void)setSuggestionEvaluation:(id)a3
{
}

- (PLUSSchemaPLUSMediaSuggestionEvaluation)suggestionEvaluation
{
  return self->_suggestionEvaluation;
}

- (int)playUserFeedback
{
  return self->_playUserFeedback;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLUSSchemaPLUSMediaEvaluationSummaryReported;
  v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)v5 setOriginalRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"playUserFeedback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setPlayUserFeedback:](v5, "setPlayUserFeedback:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"suggestionEvaluation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[PLUSSchemaPLUSMediaSuggestionEvaluation alloc] initWithDictionary:v11];
      [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)v5 setSuggestionEvaluation:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"groundTruthSummaries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v11;
      v26 = v10;
      v27 = v8;
      v28 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[PLUSSchemaPLUSMediaGroundTruthSummary alloc] initWithDictionary:v19];
              [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)v5 addGroundTruthSummaries:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v16);
      }

      int v8 = v27;
      v6 = v28;
      int v11 = v25;
    }
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"configuredState", v25, v26, v27, v28, (void)v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[PLUSSchemaPLUSMediaConfiguredState alloc] initWithDictionary:v21];
      [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)v5 setConfiguredState:v22];
    }
    v23 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_configuredState)
  {
    id v4 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"configuredState"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"configuredState"];
    }
  }
  if ([(NSArray *)self->_groundTruthSummaries count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v8 = self->_groundTruthSummaries;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            id v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"groundTruthSummaries"];
  }
  if (self->_originalRequestId)
  {
    uint64_t v15 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v18 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self playUserFeedback] - 1;
    if (v18 > 6) {
      uint64_t v19 = @"PLUSMEDIAPLAYMEDIARESULT_UNKNOWN";
    }
    else {
      uint64_t v19 = off_1E5EBA728[v18];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, @"playUserFeedback", (void)v26);
  }
  if (self->_resultCandidateId)
  {
    v20 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self resultCandidateId];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_suggestionEvaluation)
  {
    v22 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"suggestionEvaluation"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"suggestionEvaluation"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalRequestId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_playUserFeedback;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self->_suggestionEvaluation hash];
  uint64_t v7 = [(NSArray *)self->_groundTruthSummaries hash];
  return v6 ^ v7 ^ [(PLUSSchemaPLUSMediaConfiguredState *)self->_configuredState hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
  unint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
    uint64_t v10 = [v4 originalRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self resultCandidateId];
    uint64_t v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
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
    int playUserFeedback = self->_playUserFeedback;
    if (playUserFeedback != [v4 playUserFeedback]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
  unint64_t v6 = [v4 suggestionEvaluation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
    v21 = [v4 suggestionEvaluation];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self groundTruthSummaries];
  unint64_t v6 = [v4 groundTruthSummaries];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self groundTruthSummaries];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self groundTruthSummaries];
    long long v26 = [v4 groundTruthSummaries];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
  unint64_t v6 = [v4 configuredState];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    long long v29 = (void *)v28;
    long long v30 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
    uint64_t v31 = [v4 configuredState];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];

  if (v5)
  {
    unint64_t v6 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self resultCandidateId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v8 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];

  if (v8)
  {
    uint64_t v9 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self suggestionEvaluation];
    PBDataWriterWriteSubmessage();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_groundTruthSummaries;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];

  if (v15)
  {
    int v16 = [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self configuredState];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaEvaluationSummaryReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteConfiguredState
{
}

- (BOOL)hasConfiguredState
{
  return self->_configuredState != 0;
}

- (id)groundTruthSummariesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_groundTruthSummaries objectAtIndexedSubscript:a3];
}

- (unint64_t)groundTruthSummariesCount
{
  return [(NSArray *)self->_groundTruthSummaries count];
}

- (void)addGroundTruthSummaries:(id)a3
{
  id v4 = a3;
  groundTruthSummaries = self->_groundTruthSummaries;
  id v8 = v4;
  if (!groundTruthSummaries)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_groundTruthSummaries;
    self->_groundTruthSummaries = v6;

    id v4 = v8;
    groundTruthSummaries = self->_groundTruthSummaries;
  }
  [(NSArray *)groundTruthSummaries addObject:v4];
}

- (void)clearGroundTruthSummaries
{
}

- (void)deleteSuggestionEvaluation
{
}

- (BOOL)hasSuggestionEvaluation
{
  return self->_suggestionEvaluation != 0;
}

- (void)deletePlayUserFeedback
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPlayUserFeedback:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlayUserFeedback
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlayUserFeedback:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int playUserFeedback = a3;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

@end