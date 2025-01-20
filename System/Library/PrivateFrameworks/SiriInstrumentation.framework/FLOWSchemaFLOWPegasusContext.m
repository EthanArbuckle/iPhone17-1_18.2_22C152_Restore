@interface FLOWSchemaFLOWPegasusContext
- (BOOL)hasCrossIntentRankerResponse;
- (BOOL)hasIntent;
- (BOOL)hasIsHandOffExecution;
- (BOOL)hasKgQAExecution;
- (BOOL)hasLinkId;
- (BOOL)hasMapsExecution;
- (BOOL)hasPrimaryProvider;
- (BOOL)hasProductArea;
- (BOOL)hasSportsExecution;
- (BOOL)hasWebAnswerExecution;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandOffExecution;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWCrossIntentRankerResponse)crossIntentRankerResponse;
- (FLOWSchemaFLOWKGQAExecution)kgQAExecution;
- (FLOWSchemaFLOWMapsExecution)mapsExecution;
- (FLOWSchemaFLOWPegasusContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWPegasusContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWSPORTSExecution)sportsExecution;
- (FLOWSchemaFLOWWebAnswerExecution)webAnswerExecution;
- (NSArray)otherProviders;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSIntent)intent;
- (SISchemaUUID)linkId;
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
- (void)deleteCrossIntentRankerResponse;
- (void)deleteIntent;
- (void)deleteIsHandOffExecution;
- (void)deleteKgQAExecution;
- (void)deleteLinkId;
- (void)deleteMapsExecution;
- (void)deletePrimaryProvider;
- (void)deleteProductArea;
- (void)deleteSportsExecution;
- (void)deleteWebAnswerExecution;
- (void)setCrossIntentRankerResponse:(id)a3;
- (void)setHasCrossIntentRankerResponse:(BOOL)a3;
- (void)setHasIntent:(BOOL)a3;
- (void)setHasIsHandOffExecution:(BOOL)a3;
- (void)setHasKgQAExecution:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMapsExecution:(BOOL)a3;
- (void)setHasPrimaryProvider:(BOOL)a3;
- (void)setHasProductArea:(BOOL)a3;
- (void)setHasSportsExecution:(BOOL)a3;
- (void)setHasWebAnswerExecution:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setIsHandOffExecution:(BOOL)a3;
- (void)setKgQAExecution:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setMapsExecution:(id)a3;
- (void)setOtherProviders:(id)a3;
- (void)setPrimaryProvider:(int)a3;
- (void)setProductArea:(int)a3;
- (void)setSportsExecution:(id)a3;
- (void)setWebAnswerExecution:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWPegasusContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FLOWSchemaFLOWPegasusContext;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteLinkId];
  }
  v9 = [(FLOWSchemaFLOWPegasusContext *)self intent];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteIntent];
  }
  v12 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteKgQAExecution];
  }
  v15 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteWebAnswerExecution];
  }
  v18 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteSportsExecution];
  }
  v21 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteCrossIntentRankerResponse];
  }
  v24 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(FLOWSchemaFLOWPegasusContext *)self deleteMapsExecution];
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
  objc_storeStrong((id *)&self->_mapsExecution, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerResponse, 0);
  objc_storeStrong((id *)&self->_sportsExecution, 0);
  objc_storeStrong((id *)&self->_webAnswerExecution, 0);
  objc_storeStrong((id *)&self->_kgQAExecution, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_otherProviders, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasMapsExecution:(BOOL)a3
{
  self->_hasWebAnswerExecution = a3;
}

- (void)setHasCrossIntentRankerResponse:(BOOL)a3
{
  self->_hasKgQAExecution = a3;
}

- (void)setHasSportsExecution:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (void)setHasWebAnswerExecution:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasKgQAExecution:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMapsExecution:(id)a3
{
}

- (FLOWSchemaFLOWMapsExecution)mapsExecution
{
  return self->_mapsExecution;
}

- (void)setCrossIntentRankerResponse:(id)a3
{
}

- (FLOWSchemaFLOWCrossIntentRankerResponse)crossIntentRankerResponse
{
  return self->_crossIntentRankerResponse;
}

- (void)setSportsExecution:(id)a3
{
}

- (FLOWSchemaFLOWSPORTSExecution)sportsExecution
{
  return self->_sportsExecution;
}

- (void)setWebAnswerExecution:(id)a3
{
}

- (FLOWSchemaFLOWWebAnswerExecution)webAnswerExecution
{
  return self->_webAnswerExecution;
}

- (void)setKgQAExecution:(id)a3
{
}

- (FLOWSchemaFLOWKGQAExecution)kgQAExecution
{
  return self->_kgQAExecution;
}

- (BOOL)isHandOffExecution
{
  return self->_isHandOffExecution;
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

- (FLOWSchemaFLOWPegasusContext)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FLOWSchemaFLOWPegasusContext;
  v5 = [(FLOWSchemaFLOWPegasusContext *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWPegasusContext *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"productArea"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPegasusContext setProductArea:](v5, "setProductArea:", [v8 intValue]);
    }
    v35 = (void *)v6;
    v9 = [v4 objectForKeyedSubscript:@"primaryProvider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPegasusContext setPrimaryProvider:](v5, "setPrimaryProvider:", [v9 intValue]);
    }
    v33 = v9;
    v34 = v8;
    v10 = [v4 objectForKeyedSubscript:@"otherProviders"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v37;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWPegasusContext addOtherProviders:](v5, "addOtherProviders:", [v16 intValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v13);
      }
    }
    int v17 = [v4 objectForKeyedSubscript:@"intent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[PEGASUSSchemaPEGASUSIntent alloc] initWithDictionary:v17];
      [(FLOWSchemaFLOWPegasusContext *)v5 setIntent:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"isHandOffExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWPegasusContext setIsHandOffExecution:](v5, "setIsHandOffExecution:", [v19 BOOLValue]);
    }
    int v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kgQAExecution", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[FLOWSchemaFLOWKGQAExecution alloc] initWithDictionary:v20];
      [(FLOWSchemaFLOWPegasusContext *)v5 setKgQAExecution:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"webAnswerExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[FLOWSchemaFLOWWebAnswerExecution alloc] initWithDictionary:v22];
      [(FLOWSchemaFLOWPegasusContext *)v5 setWebAnswerExecution:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"sportsExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[FLOWSchemaFLOWSPORTSExecution alloc] initWithDictionary:v24];
      [(FLOWSchemaFLOWPegasusContext *)v5 setSportsExecution:v25];
    }
    int v26 = [v4 objectForKeyedSubscript:@"crossIntentRankerResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[FLOWSchemaFLOWCrossIntentRankerResponse alloc] initWithDictionary:v26];
      [(FLOWSchemaFLOWPegasusContext *)v5 setCrossIntentRankerResponse:v27];
    }
    objc_super v28 = [v4 objectForKeyedSubscript:@"mapsExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[FLOWSchemaFLOWMapsExecution alloc] initWithDictionary:v28];
      [(FLOWSchemaFLOWPegasusContext *)v5 setMapsExecution:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWPegasusContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWPegasusContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWPegasusContext *)self dictionaryRepresentation];
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
  if (self->_crossIntentRankerResponse)
  {
    id v4 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"crossIntentRankerResponse"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"crossIntentRankerResponse"];
    }
  }
  if (self->_intent)
  {
    uint64_t v7 = [(FLOWSchemaFLOWPegasusContext *)self intent];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"intent"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"intent"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWPegasusContext isHandOffExecution](self, "isHandOffExecution"));
    [v3 setObject:v10 forKeyedSubscript:@"isHandOffExecution"];
  }
  if (self->_kgQAExecution)
  {
    id v11 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"kgQAExecution"];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"kgQAExecution"];
    }
  }
  if (self->_linkId)
  {
    uint64_t v14 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
    uint64_t v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_mapsExecution)
  {
    int v17 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"mapsExecution"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"mapsExecution"];
    }
  }
  if ([(NSArray *)self->_otherProviders count])
  {
    int v20 = [(FLOWSchemaFLOWPegasusContext *)self otherProviders];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"otherProviders"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v23 = [(FLOWSchemaFLOWPegasusContext *)self primaryProvider] - 1;
    if (v23 > 0xF) {
      v24 = @"FLOWPEGASUSPROVIDER_UNKNOWN";
    }
    else {
      v24 = off_1E5EAF878[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"primaryProvider"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v25 = [(FLOWSchemaFLOWPegasusContext *)self productArea] - 1;
    if (v25 > 0xE) {
      int v26 = @"FLOWPEGASUSPRODUCTAREA_UNKNOWN";
    }
    else {
      int v26 = off_1E5EAF8F8[v25];
    }
    [v3 setObject:v26 forKeyedSubscript:@"productArea"];
  }
  if (self->_sportsExecution)
  {
    v27 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
    objc_super v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"sportsExecution"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"sportsExecution"];
    }
  }
  if (self->_webAnswerExecution)
  {
    v30 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"webAnswerExecution"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"webAnswerExecution"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_productArea;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_primaryProvider;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = [(NSArray *)self->_otherProviders hash];
  unint64_t v7 = [(PEGASUSSchemaPEGASUSIntent *)self->_intent hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_isHandOffExecution;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(FLOWSchemaFLOWKGQAExecution *)self->_kgQAExecution hash];
  unint64_t v10 = [(FLOWSchemaFLOWWebAnswerExecution *)self->_webAnswerExecution hash];
  unint64_t v11 = v10 ^ [(FLOWSchemaFLOWSPORTSExecution *)self->_sportsExecution hash];
  unint64_t v12 = v11 ^ [(FLOWSchemaFLOWCrossIntentRankerResponse *)self->_crossIntentRankerResponse hash];
  return v9 ^ v12 ^ [(FLOWSchemaFLOWMapsExecution *)self->_mapsExecution hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
    unint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  $8397A9CCDF3DD6ADE4DE49315199B15E has = self->_has;
  unsigned int v13 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_52;
  }
  if (*(unsigned char *)&has)
  {
    int productArea = self->_productArea;
    if (productArea != [v4 productArea]) {
      goto LABEL_52;
    }
    $8397A9CCDF3DD6ADE4DE49315199B15E has = self->_has;
    unsigned int v13 = v4[88];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_52;
  }
  if (v15)
  {
    int primaryProvider = self->_primaryProvider;
    if (primaryProvider != [v4 primaryProvider]) {
      goto LABEL_52;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self otherProviders];
  uint64_t v6 = [v4 otherProviders];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v17 = [(FLOWSchemaFLOWPegasusContext *)self otherProviders];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(FLOWSchemaFLOWPegasusContext *)self otherProviders];
    int v20 = [v4 otherProviders];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self intent];
  uint64_t v6 = [v4 intent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v22 = [(FLOWSchemaFLOWPegasusContext *)self intent];
  if (v22)
  {
    unsigned int v23 = (void *)v22;
    v24 = [(FLOWSchemaFLOWPegasusContext *)self intent];
    unsigned int v25 = [v4 intent];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int v27 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v27 != ((v4[88] >> 2) & 1)) {
    goto LABEL_52;
  }
  if (v27)
  {
    int isHandOffExecution = self->_isHandOffExecution;
    if (isHandOffExecution != [v4 isHandOffExecution]) {
      goto LABEL_52;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
  uint64_t v6 = [v4 kgQAExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v29 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
    v32 = [v4 kgQAExecution];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
  uint64_t v6 = [v4 webAnswerExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v34 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
  if (v34)
  {
    v35 = (void *)v34;
    long long v36 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
    long long v37 = [v4 webAnswerExecution];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
  uint64_t v6 = [v4 sportsExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v39 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
  if (v39)
  {
    objc_super v40 = (void *)v39;
    v41 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
    uint64_t v42 = [v4 sportsExecution];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
  uint64_t v6 = [v4 crossIntentRankerResponse];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v44 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
    v47 = [v4 crossIntentRankerResponse];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
  uint64_t v6 = [v4 mapsExecution];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v49 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
  if (!v49)
  {

LABEL_55:
    BOOL v54 = 1;
    goto LABEL_53;
  }
  v50 = (void *)v49;
  v51 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
  v52 = [v4 mapsExecution];
  char v53 = [v51 isEqual:v52];

  if (v53) {
    goto LABEL_55;
  }
LABEL_52:
  BOOL v54 = 0;
LABEL_53:

  return v54;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLOWSchemaFLOWPegasusContext *)self linkId];

  if (v5)
  {
    uint64_t v6 = [(FLOWSchemaFLOWPegasusContext *)self linkId];
    PBDataWriterWriteSubmessage();
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = self->_otherProviders;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "intValue", (void)v25);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  unsigned int v13 = [(FLOWSchemaFLOWPegasusContext *)self intent];

  if (v13)
  {
    uint64_t v14 = [(FLOWSchemaFLOWPegasusContext *)self intent];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v15 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];

  if (v15)
  {
    v16 = [(FLOWSchemaFLOWPegasusContext *)self kgQAExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];

  if (v17)
  {
    v18 = [(FLOWSchemaFLOWPegasusContext *)self webAnswerExecution];
    PBDataWriterWriteSubmessage();
  }
  v19 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];

  if (v19)
  {
    int v20 = [(FLOWSchemaFLOWPegasusContext *)self sportsExecution];
    PBDataWriterWriteSubmessage();
  }
  int v21 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];

  if (v21)
  {
    uint64_t v22 = [(FLOWSchemaFLOWPegasusContext *)self crossIntentRankerResponse];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v23 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];

  if (v23)
  {
    v24 = [(FLOWSchemaFLOWPegasusContext *)self mapsExecution];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPegasusContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteMapsExecution
{
}

- (BOOL)hasMapsExecution
{
  return self->_mapsExecution != 0;
}

- (void)deleteCrossIntentRankerResponse
{
}

- (BOOL)hasCrossIntentRankerResponse
{
  return self->_crossIntentRankerResponse != 0;
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

- (void)deleteIsHandOffExecution
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsHandOffExecution:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsHandOffExecution
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsHandOffExecution:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isHandOffExecution = a3;
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_otherProviders;
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
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPrimaryProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrimaryProvider
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPrimaryProvider:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int primaryProvider = a3;
}

- (void)deleteProductArea
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProductArea:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProductArea
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProductArea:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int productArea = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end