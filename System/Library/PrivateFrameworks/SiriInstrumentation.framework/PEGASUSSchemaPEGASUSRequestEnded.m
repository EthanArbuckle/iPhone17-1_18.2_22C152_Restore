@interface PEGASUSSchemaPEGASUSRequestEnded
- (BOOL)exists;
- (BOOL)hasAlternateQuerySuggestion;
- (BOOL)hasAudioExecution;
- (BOOL)hasCrossIntentRankerResponse;
- (BOOL)hasEdge;
- (BOOL)hasExists;
- (BOOL)hasIntent;
- (BOOL)hasIsFollowupResponse;
- (BOOL)hasIsHandOffExecution;
- (BOOL)hasIsSnippetAnswerSeeking;
- (BOOL)hasKgQAExecution;
- (BOOL)hasLinkId;
- (BOOL)hasMapsExecution;
- (BOOL)hasPrimaryProvider;
- (BOOL)hasProductArea;
- (BOOL)hasQueryConfidenceScore;
- (BOOL)hasSportsExecution;
- (BOOL)hasVideoExecution;
- (BOOL)hasWebAnswerExecution;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFollowupResponse;
- (BOOL)isHandOffExecution;
- (BOOL)isSnippetAnswerSeeking;
- (BOOL)readFrom:(id)a3;
- (NSArray)otherProviders;
- (NSData)jsonData;
- (NSString)edge;
- (PEGASUSSchemaPEGASUSAlternateQuerySuggestion)alternateQuerySuggestion;
- (PEGASUSSchemaPEGASUSAudioExecution)audioExecution;
- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)crossIntentRankerResponse;
- (PEGASUSSchemaPEGASUSIntent)intent;
- (PEGASUSSchemaPEGASUSKGQAExecution)kgQAExecution;
- (PEGASUSSchemaPEGASUSMapsExecution)mapsExecution;
- (PEGASUSSchemaPEGASUSRequestEnded)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSRequestEnded)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSSportsExecution)sportsExecution;
- (PEGASUSSchemaPEGASUSVideoExecution)videoExecution;
- (PEGASUSSchemaPEGASUSWebAnswerExecution)webAnswerExecution;
- (SISchemaUUID)linkId;
- (float)queryConfidenceScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)otherProvidersAtIndex:(unint64_t)a3;
- (int)primaryProvider;
- (int)productArea;
- (unint64_t)hash;
- (unint64_t)otherProvidersCount;
- (void)addOtherProviders:(int)a3;
- (void)clearOtherProviders;
- (void)deleteAlternateQuerySuggestion;
- (void)deleteAudioExecution;
- (void)deleteCrossIntentRankerResponse;
- (void)deleteEdge;
- (void)deleteExists;
- (void)deleteIntent;
- (void)deleteIsFollowupResponse;
- (void)deleteIsHandOffExecution;
- (void)deleteIsSnippetAnswerSeeking;
- (void)deleteKgQAExecution;
- (void)deleteLinkId;
- (void)deleteMapsExecution;
- (void)deletePrimaryProvider;
- (void)deleteProductArea;
- (void)deleteQueryConfidenceScore;
- (void)deleteSportsExecution;
- (void)deleteVideoExecution;
- (void)deleteWebAnswerExecution;
- (void)setAlternateQuerySuggestion:(id)a3;
- (void)setAudioExecution:(id)a3;
- (void)setCrossIntentRankerResponse:(id)a3;
- (void)setEdge:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasAlternateQuerySuggestion:(BOOL)a3;
- (void)setHasAudioExecution:(BOOL)a3;
- (void)setHasCrossIntentRankerResponse:(BOOL)a3;
- (void)setHasEdge:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasIntent:(BOOL)a3;
- (void)setHasIsFollowupResponse:(BOOL)a3;
- (void)setHasIsHandOffExecution:(BOOL)a3;
- (void)setHasIsSnippetAnswerSeeking:(BOOL)a3;
- (void)setHasKgQAExecution:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMapsExecution:(BOOL)a3;
- (void)setHasPrimaryProvider:(BOOL)a3;
- (void)setHasProductArea:(BOOL)a3;
- (void)setHasQueryConfidenceScore:(BOOL)a3;
- (void)setHasSportsExecution:(BOOL)a3;
- (void)setHasVideoExecution:(BOOL)a3;
- (void)setHasWebAnswerExecution:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setIsFollowupResponse:(BOOL)a3;
- (void)setIsHandOffExecution:(BOOL)a3;
- (void)setIsSnippetAnswerSeeking:(BOOL)a3;
- (void)setKgQAExecution:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setMapsExecution:(id)a3;
- (void)setOtherProviders:(id)a3;
- (void)setPrimaryProvider:(int)a3;
- (void)setProductArea:(int)a3;
- (void)setQueryConfidenceScore:(float)a3;
- (void)setSportsExecution:(id)a3;
- (void)setVideoExecution:(id)a3;
- (void)setWebAnswerExecution:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PEGASUSSchemaPEGASUSRequestEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteLinkId];
  }
  v9 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteIntent];
  }
  v12 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteCrossIntentRankerResponse];
  }
  v15 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteKgQAExecution];
  }
  v18 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteWebAnswerExecution];
  }
  v21 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteSportsExecution];
  }
  v24 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteMapsExecution];
  }
  v27 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteAudioExecution];
  }
  v30 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteVideoExecution];
  }
  v33 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PEGASUSSchemaPEGASUSRequestEnded *)self deleteAlternateQuerySuggestion];
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
  objc_storeStrong((id *)&self->_alternateQuerySuggestion, 0);
  objc_storeStrong((id *)&self->_edge, 0);
  objc_storeStrong((id *)&self->_videoExecution, 0);
  objc_storeStrong((id *)&self->_audioExecution, 0);
  objc_storeStrong((id *)&self->_mapsExecution, 0);
  objc_storeStrong((id *)&self->_sportsExecution, 0);
  objc_storeStrong((id *)&self->_webAnswerExecution, 0);
  objc_storeStrong((id *)&self->_kgQAExecution, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_otherProviders, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasAlternateQuerySuggestion:(BOOL)a3
{
  self->_hasWebAnswerExecution = a3;
}

- (void)setHasEdge:(BOOL)a3
{
  self->_hasKgQAExecution = a3;
}

- (void)setHasVideoExecution:(BOOL)a3
{
  self->_hasCrossIntentRankerResponse = a3;
}

- (void)setHasAudioExecution:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (void)setHasMapsExecution:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasSportsExecution:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasWebAnswerExecution:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasKgQAExecution:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasCrossIntentRankerResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 3) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 2) = a3;
}

- (BOOL)isSnippetAnswerSeeking
{
  return self->_isSnippetAnswerSeeking;
}

- (void)setAlternateQuerySuggestion:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAlternateQuerySuggestion)alternateQuerySuggestion
{
  return self->_alternateQuerySuggestion;
}

- (void)setEdge:(id)a3
{
}

- (NSString)edge
{
  return self->_edge;
}

- (void)setVideoExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSVideoExecution)videoExecution
{
  return self->_videoExecution;
}

- (void)setAudioExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioExecution)audioExecution
{
  return self->_audioExecution;
}

- (void)setMapsExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMapsExecution)mapsExecution
{
  return self->_mapsExecution;
}

- (void)setSportsExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSSportsExecution)sportsExecution
{
  return self->_sportsExecution;
}

- (void)setWebAnswerExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSWebAnswerExecution)webAnswerExecution
{
  return self->_webAnswerExecution;
}

- (void)setKgQAExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSKGQAExecution)kgQAExecution
{
  return self->_kgQAExecution;
}

- (void)setCrossIntentRankerResponse:(id)a3
{
}

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)crossIntentRankerResponse
{
  return self->_crossIntentRankerResponse;
}

- (BOOL)isHandOffExecution
{
  return self->_isHandOffExecution;
}

- (BOOL)isFollowupResponse
{
  return self->_isFollowupResponse;
}

- (float)queryConfidenceScore
{
  return self->_queryConfidenceScore;
}

- (void)setIntent:(id)a3
{
}

- (PEGASUSSchemaPEGASUSIntent)intent
{
  return self->_intent;
}

- (void)setOtherProviders:(id)a3
{
}

- (NSArray)otherProviders
{
  return self->_otherProviders;
}

- (int)primaryProvider
{
  return self->_primaryProvider;
}

- (int)productArea
{
  return self->_productArea;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (PEGASUSSchemaPEGASUSRequestEnded)initWithDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PEGASUSSchemaPEGASUSRequestEnded;
  v5 = [(PEGASUSSchemaPEGASUSRequestEnded *)&v60 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setLinkId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"productArea"];
    objc_opt_class();
    v55 = v9;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setProductArea:](v5, "setProductArea:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"primaryProvider"];
    objc_opt_class();
    v54 = v10;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setPrimaryProvider:](v5, "setPrimaryProvider:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"otherProviders"];
    objc_opt_class();
    v53 = v11;
    if (objc_opt_isKindOfClass())
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v57 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSRequestEnded addOtherProviders:](v5, "addOtherProviders:", [v17 intValue]);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v14);
      }
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"intent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PEGASUSSchemaPEGASUSIntent alloc] initWithDictionary:v18];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setIntent:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"queryConfidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[PEGASUSSchemaPEGASUSRequestEnded setQueryConfidenceScore:](v5, "setQueryConfidenceScore:");
    }
    v21 = [v4 objectForKeyedSubscript:@"isFollowupResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setIsFollowupResponse:](v5, "setIsFollowupResponse:", [v21 BOOLValue]);
    }
    v48 = v20;
    v22 = [v4 objectForKeyedSubscript:@"isHandOffExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setIsHandOffExecution:](v5, "setIsHandOffExecution:", [v22 BOOLValue]);
    }
    v46 = v22;
    uint64_t v23 = [v4 objectForKeyedSubscript:@"crossIntentRankerResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[PEGASUSSchemaPEGASUSCrossIntentRankerResponse alloc] initWithDictionary:v23];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setCrossIntentRankerResponse:v24];
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"kgQAExecution"];
    objc_opt_class();
    v52 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[PEGASUSSchemaPEGASUSKGQAExecution alloc] initWithDictionary:v25];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setKgQAExecution:v26];
    }
    v47 = v21;
    uint64_t v27 = [v4 objectForKeyedSubscript:@"webAnswerExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[PEGASUSSchemaPEGASUSWebAnswerExecution alloc] initWithDictionary:v27];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setWebAnswerExecution:v28];
    }
    v45 = (void *)v23;
    int v29 = objc_msgSend(v4, "objectForKeyedSubscript:", @"sportsExecution", v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[PEGASUSSchemaPEGASUSSportsExecution alloc] initWithDictionary:v29];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setSportsExecution:v30];
    }
    v51 = v6;
    v31 = [v4 objectForKeyedSubscript:@"mapsExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v32 = [[PEGASUSSchemaPEGASUSMapsExecution alloc] initWithDictionary:v31];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setMapsExecution:v32];
    }
    v50 = (void *)v7;
    v33 = [v4 objectForKeyedSubscript:@"audioExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[PEGASUSSchemaPEGASUSAudioExecution alloc] initWithDictionary:v33];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setAudioExecution:v34];
    }
    v49 = (void *)v18;
    int v35 = [v4 objectForKeyedSubscript:@"videoExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[PEGASUSSchemaPEGASUSVideoExecution alloc] initWithDictionary:v35];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setVideoExecution:v36];
    }
    objc_super v37 = [v4 objectForKeyedSubscript:@"edge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = (void *)[v37 copy];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setEdge:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"alternateQuerySuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[PEGASUSSchemaPEGASUSAlternateQuerySuggestion alloc] initWithDictionary:v39];
      [(PEGASUSSchemaPEGASUSRequestEnded *)v5 setAlternateQuerySuggestion:v40];
    }
    v41 = [v4 objectForKeyedSubscript:@"isSnippetAnswerSeeking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRequestEnded setIsSnippetAnswerSeeking:](v5, "setIsSnippetAnswerSeeking:", [v41 BOOLValue]);
    }
    v42 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSRequestEnded *)self dictionaryRepresentation];
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
  if (self->_alternateQuerySuggestion)
  {
    id v4 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"alternateQuerySuggestion"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"alternateQuerySuggestion"];
    }
  }
  if (self->_audioExecution)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"audioExecution"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"audioExecution"];
    }
  }
  if (self->_crossIntentRankerResponse)
  {
    v10 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"crossIntentRankerResponse"];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"crossIntentRankerResponse"];
    }
  }
  if (self->_edge)
  {
    uint64_t v13 = [(PEGASUSSchemaPEGASUSRequestEnded *)self edge];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"edge"];
  }
  if (*(&self->_isSnippetAnswerSeeking + 1))
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded exists](self, "exists"));
    [v3 setObject:v15 forKeyedSubscript:@"exists"];
  }
  if (self->_intent)
  {
    v16 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"intent"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"intent"];
    }
  }
  char v19 = *(&self->_isSnippetAnswerSeeking + 1);
  if ((v19 & 0x10) != 0)
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded isFollowupResponse](self, "isFollowupResponse"));
    [v3 setObject:v23 forKeyedSubscript:@"isFollowupResponse"];

    char v19 = *(&self->_isSnippetAnswerSeeking + 1);
    if ((v19 & 0x20) == 0)
    {
LABEL_27:
      if ((v19 & 0x40) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x20) == 0)
  {
    goto LABEL_27;
  }
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded isHandOffExecution](self, "isHandOffExecution"));
  [v3 setObject:v24 forKeyedSubscript:@"isHandOffExecution"];

  if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x40) != 0)
  {
LABEL_28:
    int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRequestEnded isSnippetAnswerSeeking](self, "isSnippetAnswerSeeking"));
    [v3 setObject:v20 forKeyedSubscript:@"isSnippetAnswerSeeking"];
  }
LABEL_29:
  if (self->_kgQAExecution)
  {
    v21 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"kgQAExecution"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"kgQAExecution"];
    }
  }
  if (self->_linkId)
  {
    int v26 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_mapsExecution)
  {
    int v29 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"mapsExecution"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"mapsExecution"];
    }
  }
  if ([(NSArray *)self->_otherProviders count])
  {
    int v32 = [(PEGASUSSchemaPEGASUSRequestEnded *)self otherProviders];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"otherProviders"];
  }
  char v34 = *(&self->_isSnippetAnswerSeeking + 1);
  if ((v34 & 4) != 0)
  {
    unsigned int v39 = [(PEGASUSSchemaPEGASUSRequestEnded *)self primaryProvider] - 1;
    if (v39 > 0xF) {
      v40 = @"PEGASUSPROVIDER_UNKNOWN";
    }
    else {
      v40 = off_1E5EB3BA0[v39];
    }
    [v3 setObject:v40 forKeyedSubscript:@"primaryProvider"];
    char v34 = *(&self->_isSnippetAnswerSeeking + 1);
    if ((v34 & 2) == 0)
    {
LABEL_51:
      if ((v34 & 8) == 0) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
  }
  else if ((*(&self->_isSnippetAnswerSeeking + 1) & 2) == 0)
  {
    goto LABEL_51;
  }
  unsigned int v44 = [(PEGASUSSchemaPEGASUSRequestEnded *)self productArea] - 1;
  if (v44 > 0xE) {
    v45 = @"PEGASUSPRODUCTAREA_UNKNOWN";
  }
  else {
    v45 = off_1E5EB3C20[v44];
  }
  [v3 setObject:v45 forKeyedSubscript:@"productArea"];
  if ((*(&self->_isSnippetAnswerSeeking + 1) & 8) != 0)
  {
LABEL_52:
    int v35 = NSNumber;
    [(PEGASUSSchemaPEGASUSRequestEnded *)self queryConfidenceScore];
    v36 = objc_msgSend(v35, "numberWithFloat:");
    [v3 setObject:v36 forKeyedSubscript:@"queryConfidenceScore"];
  }
LABEL_53:
  if (self->_sportsExecution)
  {
    objc_super v37 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
    v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"sportsExecution"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"sportsExecution"];
    }
  }
  if (self->_videoExecution)
  {
    v42 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"videoExecution"];
    }
    else
    {
      v46 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v46 forKeyedSubscript:@"videoExecution"];
    }
  }
  if (self->_webAnswerExecution)
  {
    v47 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
    v48 = [v47 dictionaryRepresentation];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"webAnswerExecution"];
    }
    else
    {
      v49 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v49 forKeyedSubscript:@"webAnswerExecution"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isSnippetAnswerSeeking + 1)) {
    uint64_t v28 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v28 = 0;
  }
  unint64_t v27 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(&self->_isSnippetAnswerSeeking + 1) & 2) != 0)
  {
    uint64_t v26 = 2654435761 * self->_productArea;
    if ((*(&self->_isSnippetAnswerSeeking + 1) & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(&self->_isSnippetAnswerSeeking + 1) & 4) != 0)
    {
LABEL_6:
      uint64_t v25 = 2654435761 * self->_primaryProvider;
      goto LABEL_9;
    }
  }
  uint64_t v25 = 0;
LABEL_9:
  uint64_t v24 = [(NSArray *)self->_otherProviders hash];
  unint64_t v23 = [(PEGASUSSchemaPEGASUSIntent *)self->_intent hash];
  char v3 = *(&self->_isSnippetAnswerSeeking + 1);
  if ((v3 & 8) != 0)
  {
    float queryConfidenceScore = self->_queryConfidenceScore;
    double v6 = queryConfidenceScore;
    if (queryConfidenceScore < 0.0) {
      double v6 = -queryConfidenceScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((v3 & 0x10) != 0) {
    uint64_t v21 = 2654435761 * self->_isFollowupResponse;
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v22 = v4;
  if ((v3 & 0x20) != 0) {
    uint64_t v20 = 2654435761 * self->_isHandOffExecution;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v9 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self->_crossIntentRankerResponse hash];
  unint64_t v10 = [(PEGASUSSchemaPEGASUSKGQAExecution *)self->_kgQAExecution hash];
  unint64_t v11 = [(PEGASUSSchemaPEGASUSWebAnswerExecution *)self->_webAnswerExecution hash];
  unint64_t v12 = [(PEGASUSSchemaPEGASUSSportsExecution *)self->_sportsExecution hash];
  unint64_t v13 = [(PEGASUSSchemaPEGASUSMapsExecution *)self->_mapsExecution hash];
  unint64_t v14 = [(PEGASUSSchemaPEGASUSAudioExecution *)self->_audioExecution hash];
  unint64_t v15 = [(PEGASUSSchemaPEGASUSVideoExecution *)self->_videoExecution hash];
  NSUInteger v16 = [(NSString *)self->_edge hash];
  unint64_t v17 = [(PEGASUSSchemaPEGASUSAlternateQuerySuggestion *)self->_alternateQuerySuggestion hash];
  if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x40) != 0) {
    uint64_t v18 = 2654435761 * self->_isSnippetAnswerSeeking;
  }
  else {
    uint64_t v18 = 0;
  }
  return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  if (*(&self->_isSnippetAnswerSeeking + 1) != (v4[129] & 1)) {
    goto LABEL_83;
  }
  if (*(&self->_isSnippetAnswerSeeking + 1))
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_83;
    }
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
  long double v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v8 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
    unint64_t v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1);
  int v14 = (v13 >> 1) & 1;
  unsigned int v15 = v4[129];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_83;
  }
  if (v14)
  {
    int productArea = self->_productArea;
    if (productArea != [v4 productArea]) {
      goto LABEL_83;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1);
    unsigned int v15 = v4[129];
  }
  int v17 = (v13 >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1)) {
    goto LABEL_83;
  }
  if (v17)
  {
    int primaryProvider = self->_primaryProvider;
    if (primaryProvider != [v4 primaryProvider]) {
      goto LABEL_83;
    }
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self otherProviders];
  long double v7 = [v4 otherProviders];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v19 = [(PEGASUSSchemaPEGASUSRequestEnded *)self otherProviders];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [(PEGASUSSchemaPEGASUSRequestEnded *)self otherProviders];
    unint64_t v22 = [v4 otherProviders];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
  long double v7 = [v4 intent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v24 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    uint64_t v26 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
    unint64_t v27 = [v4 intent];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unsigned int v29 = *((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1);
  int v30 = (v29 >> 3) & 1;
  unsigned int v31 = v4[129];
  if (v30 != ((v31 >> 3) & 1)) {
    goto LABEL_83;
  }
  if (v30)
  {
    float queryConfidenceScore = self->_queryConfidenceScore;
    [v4 queryConfidenceScore];
    if (queryConfidenceScore != v33) {
      goto LABEL_83;
    }
    unsigned int v29 = *((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1);
    unsigned int v31 = v4[129];
  }
  int v34 = (v29 >> 4) & 1;
  if (v34 != ((v31 >> 4) & 1)) {
    goto LABEL_83;
  }
  if (v34)
  {
    int isFollowupResponse = self->_isFollowupResponse;
    if (isFollowupResponse != [v4 isFollowupResponse]) {
      goto LABEL_83;
    }
    unsigned int v29 = *((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1);
    unsigned int v31 = v4[129];
  }
  int v36 = (v29 >> 5) & 1;
  if (v36 != ((v31 >> 5) & 1)) {
    goto LABEL_83;
  }
  if (v36)
  {
    int isHandOffExecution = self->_isHandOffExecution;
    if (isHandOffExecution != [v4 isHandOffExecution]) {
      goto LABEL_83;
    }
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
  long double v7 = [v4 crossIntentRankerResponse];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v38 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
  if (v38)
  {
    unsigned int v39 = (void *)v38;
    v40 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
    v41 = [v4 crossIntentRankerResponse];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
  long double v7 = [v4 kgQAExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v43 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
  if (v43)
  {
    unsigned int v44 = (void *)v43;
    v45 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
    v46 = [v4 kgQAExecution];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
  long double v7 = [v4 webAnswerExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v48 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
    v51 = [v4 webAnswerExecution];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
  long double v7 = [v4 sportsExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v53 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
    long long v56 = [v4 sportsExecution];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
  long double v7 = [v4 mapsExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v58 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
  if (v58)
  {
    long long v59 = (void *)v58;
    objc_super v60 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
    v61 = [v4 mapsExecution];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
  long double v7 = [v4 audioExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v63 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
    v66 = [v4 audioExecution];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
  long double v7 = [v4 videoExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v68 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
    v71 = [v4 videoExecution];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self edge];
  long double v7 = [v4 edge];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v73 = [(PEGASUSSchemaPEGASUSRequestEnded *)self edge];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(PEGASUSSchemaPEGASUSRequestEnded *)self edge];
    v76 = [v4 edge];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
  long double v7 = [v4 alternateQuerySuggestion];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_82:

    goto LABEL_83;
  }
  uint64_t v78 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
    v81 = [v4 alternateQuerySuggestion];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  int v85 = (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 6) & 1;
  if (v85 == ((v4[129] >> 6) & 1))
  {
    if (!v85
      || (int isSnippetAnswerSeeking = self->_isSnippetAnswerSeeking,
          isSnippetAnswerSeeking == [v4 isSnippetAnswerSeeking]))
    {
      BOOL v83 = 1;
      goto LABEL_84;
    }
  }
LABEL_83:
  BOOL v83 = 0;
LABEL_84:

  return v83;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(&self->_isSnippetAnswerSeeking + 1)) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];

  if (v5)
  {
    double v6 = [(PEGASUSSchemaPEGASUSRequestEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char v7 = *(&self->_isSnippetAnswerSeeking + 1);
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v7 = *(&self->_isSnippetAnswerSeeking + 1);
  }
  if ((v7 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = self->_otherProviders;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "intValue", (void)v33);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  unsigned int v13 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];

  if (v13)
  {
    int v14 = [(PEGASUSSchemaPEGASUSRequestEnded *)self intent];
    PBDataWriterWriteSubmessage();
  }
  char v15 = *(&self->_isSnippetAnswerSeeking + 1);
  if ((v15 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char v15 = *(&self->_isSnippetAnswerSeeking + 1);
    if ((v15 & 0x10) == 0)
    {
LABEL_20:
      if ((v15 & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x10) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x20) != 0) {
LABEL_21:
  }
    PBDataWriterWriteBOOLField();
LABEL_22:
  NSUInteger v16 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];

  if (v16)
  {
    int v17 = [(PEGASUSSchemaPEGASUSRequestEnded *)self crossIntentRankerResponse];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];

  if (v18)
  {
    uint64_t v19 = [(PEGASUSSchemaPEGASUSRequestEnded *)self kgQAExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];

  if (v20)
  {
    uint64_t v21 = [(PEGASUSSchemaPEGASUSRequestEnded *)self webAnswerExecution];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v22 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];

  if (v22)
  {
    int v23 = [(PEGASUSSchemaPEGASUSRequestEnded *)self sportsExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v24 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];

  if (v24)
  {
    uint64_t v25 = [(PEGASUSSchemaPEGASUSRequestEnded *)self mapsExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];

  if (v26)
  {
    unint64_t v27 = [(PEGASUSSchemaPEGASUSRequestEnded *)self audioExecution];
    PBDataWriterWriteSubmessage();
  }
  int v28 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];

  if (v28)
  {
    unsigned int v29 = [(PEGASUSSchemaPEGASUSRequestEnded *)self videoExecution];
    PBDataWriterWriteSubmessage();
  }
  int v30 = [(PEGASUSSchemaPEGASUSRequestEnded *)self edge];

  if (v30) {
    PBDataWriterWriteStringField();
  }
  unsigned int v31 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];

  if (v31)
  {
    int v32 = [(PEGASUSSchemaPEGASUSRequestEnded *)self alternateQuerySuggestion];
    PBDataWriterWriteSubmessage();
  }
  if ((*(&self->_isSnippetAnswerSeeking + 1) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSRequestEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteIsSnippetAnswerSeeking
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~0x40u;
}

- (void)setHasIsSnippetAnswerSeeking:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xBF | v3;
}

- (BOOL)hasIsSnippetAnswerSeeking
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 6) & 1;
}

- (void)setIsSnippetAnswerSeeking:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 0x40u;
  self->_int isSnippetAnswerSeeking = a3;
}

- (void)deleteAlternateQuerySuggestion
{
}

- (BOOL)hasAlternateQuerySuggestion
{
  return self->_alternateQuerySuggestion != 0;
}

- (void)deleteEdge
{
}

- (BOOL)hasEdge
{
  return self->_edge != 0;
}

- (void)deleteVideoExecution
{
}

- (BOOL)hasVideoExecution
{
  return self->_videoExecution != 0;
}

- (void)deleteAudioExecution
{
}

- (BOOL)hasAudioExecution
{
  return self->_audioExecution != 0;
}

- (void)deleteMapsExecution
{
}

- (BOOL)hasMapsExecution
{
  return self->_mapsExecution != 0;
}

- (void)deleteSportsExecution
{
}

- (BOOL)hasSportsExecution
{
  return self->_sportsExecution != 0;
}

- (void)deleteWebAnswerExecution
{
}

- (BOOL)hasWebAnswerExecution
{
  return self->_webAnswerExecution != 0;
}

- (void)deleteKgQAExecution
{
}

- (BOOL)hasKgQAExecution
{
  return self->_kgQAExecution != 0;
}

- (void)deleteCrossIntentRankerResponse
{
}

- (BOOL)hasCrossIntentRankerResponse
{
  return self->_crossIntentRankerResponse != 0;
}

- (void)deleteIsHandOffExecution
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~0x20u;
}

- (void)setHasIsHandOffExecution:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xDF | v3;
}

- (BOOL)hasIsHandOffExecution
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 5) & 1;
}

- (void)setIsHandOffExecution:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 0x20u;
  self->_int isHandOffExecution = a3;
}

- (void)deleteIsFollowupResponse
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~0x10u;
}

- (void)setHasIsFollowupResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xEF | v3;
}

- (BOOL)hasIsFollowupResponse
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 4) & 1;
}

- (void)setIsFollowupResponse:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 0x10u;
  self->_int isFollowupResponse = a3;
}

- (void)deleteQueryConfidenceScore
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~8u;
}

- (void)setHasQueryConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xF7 | v3;
}

- (BOOL)hasQueryConfidenceScore
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 3) & 1;
}

- (void)setQueryConfidenceScore:(float)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 8u;
  self->_float queryConfidenceScore = a3;
}

- (void)deleteIntent
{
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (int)otherProvidersAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_otherProviders objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)otherProvidersCount
{
  return [(NSArray *)self->_otherProviders count];
}

- (void)addOtherProviders:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  otherProviders = self->_otherProviders;
  if (!otherProviders)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    char v7 = self->_otherProviders;
    self->_otherProviders = v6;

    otherProviders = self->_otherProviders;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)otherProviders addObject:v8];
}

- (void)clearOtherProviders
{
}

- (void)deletePrimaryProvider
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~4u;
}

- (void)setHasPrimaryProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xFB | v3;
}

- (BOOL)hasPrimaryProvider
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 2) & 1;
}

- (void)setPrimaryProvider:(int)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 4u;
  self->_int primaryProvider = a3;
}

- (void)deleteProductArea
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~2u;
}

- (void)setHasProductArea:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xFD | v3;
}

- (BOOL)hasProductArea
{
  return (*((unsigned __int8 *)&self->_isSnippetAnswerSeeking + 1) >> 1) & 1;
}

- (void)setProductArea:(int)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 2u;
  self->_int productArea = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteExists
{
  *(&self->_isSnippetAnswerSeeking + 1) &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) = *(&self->_isSnippetAnswerSeeking + 1) & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(&self->_isSnippetAnswerSeeking + 1);
}

- (void)setExists:(BOOL)a3
{
  *(&self->_isSnippetAnswerSeeking + 1) |= 1u;
  self->_int exists = a3;
}

@end