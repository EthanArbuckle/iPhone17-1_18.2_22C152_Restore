@interface PEGASUSSchemaPEGASUSCrossIntentRankerResponse
- (BOOL)cirFallbackTriggered;
- (BOOL)hasCirAlerts;
- (BOOL)hasCirFallbackTriggered;
- (BOOL)hasCirPireneConfidenceDebug;
- (BOOL)hasDomainCards;
- (BOOL)hasSortedScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)crossDomainRankerScoreKeepers;
- (NSArray)crossIntentRankerScoreKeepers;
- (NSData)jsonData;
- (NSString)cirPireneConfidenceDebug;
- (PEGASUSSchemaPEGASUSCirAlerts)cirAlerts;
- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSDomainCards)domainCards;
- (PEGASUSSchemaPEGASUSSortedScore)sortedScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3;
- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)crossDomainRankerScoreKeeperCount;
- (unint64_t)crossIntentRankerScoreKeeperCount;
- (unint64_t)hash;
- (void)addCrossDomainRankerScoreKeeper:(id)a3;
- (void)addCrossIntentRankerScoreKeeper:(id)a3;
- (void)clearCrossDomainRankerScoreKeeper;
- (void)clearCrossIntentRankerScoreKeeper;
- (void)deleteCirAlerts;
- (void)deleteCirFallbackTriggered;
- (void)deleteCirPireneConfidenceDebug;
- (void)deleteDomainCards;
- (void)deleteSortedScore;
- (void)setCirAlerts:(id)a3;
- (void)setCirFallbackTriggered:(BOOL)a3;
- (void)setCirPireneConfidenceDebug:(id)a3;
- (void)setCrossDomainRankerScoreKeepers:(id)a3;
- (void)setCrossIntentRankerScoreKeepers:(id)a3;
- (void)setDomainCards:(id)a3;
- (void)setHasCirAlerts:(BOOL)a3;
- (void)setHasCirFallbackTriggered:(BOOL)a3;
- (void)setHasCirPireneConfidenceDebug:(BOOL)a3;
- (void)setHasDomainCards:(BOOL)a3;
- (void)setHasSortedScore:(BOOL)a3;
- (void)setSortedScore:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSCrossIntentRankerResponse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSCrossIntentRankerResponse;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self deleteDomainCards];
  }
  v9 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self deleteSortedScore];
  }
  v12 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self deleteCirAlerts];
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
  objc_storeStrong((id *)&self->_cirAlerts, 0);
  objc_storeStrong((id *)&self->_sortedScore, 0);
  objc_storeStrong((id *)&self->_cirPireneConfidenceDebug, 0);
  objc_storeStrong((id *)&self->_domainCards, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerScoreKeepers, 0);
  objc_storeStrong((id *)&self->_crossDomainRankerScoreKeepers, 0);
}

- (void)setHasCirAlerts:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasSortedScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasCirPireneConfidenceDebug:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 3) = a3;
}

- (void)setHasDomainCards:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 2) = a3;
}

- (BOOL)cirFallbackTriggered
{
  return self->_cirFallbackTriggered;
}

- (void)setCirAlerts:(id)a3
{
}

- (PEGASUSSchemaPEGASUSCirAlerts)cirAlerts
{
  return self->_cirAlerts;
}

- (void)setSortedScore:(id)a3
{
}

- (PEGASUSSchemaPEGASUSSortedScore)sortedScore
{
  return self->_sortedScore;
}

- (void)setCirPireneConfidenceDebug:(id)a3
{
}

- (NSString)cirPireneConfidenceDebug
{
  return self->_cirPireneConfidenceDebug;
}

- (void)setDomainCards:(id)a3
{
}

- (PEGASUSSchemaPEGASUSDomainCards)domainCards
{
  return self->_domainCards;
}

- (void)setCrossIntentRankerScoreKeepers:(id)a3
{
}

- (NSArray)crossIntentRankerScoreKeepers
{
  return self->_crossIntentRankerScoreKeepers;
}

- (void)setCrossDomainRankerScoreKeepers:(id)a3
{
}

- (NSArray)crossDomainRankerScoreKeepers
{
  return self->_crossDomainRankerScoreKeepers;
}

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PEGASUSSchemaPEGASUSCrossIntentRankerResponse;
  v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)&v41 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"crossDomainRankerScoreKeeper"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v38;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 addCrossDomainRankerScoreKeeper:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v9);
      }
    }
    int v14 = [v4 objectForKeyedSubscript:@"crossIntentRankerScoreKeeper"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v33);
              [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 addCrossIntentRankerScoreKeeper:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"domainCards", (void)v33);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[PEGASUSSchemaPEGASUSDomainCards alloc] initWithDictionary:v22];
      [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 setDomainCards:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"cirPireneConfidenceDebug"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 setCirPireneConfidenceDebug:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"sortedScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[PEGASUSSchemaPEGASUSSortedScore alloc] initWithDictionary:v26];
      [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 setSortedScore:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"cirAlerts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[PEGASUSSchemaPEGASUSCirAlerts alloc] initWithDictionary:v28];
      [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)v5 setCirAlerts:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"cirFallbackTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirFallbackTriggered:](v5, "setCirFallbackTriggered:", [v30 BOOLValue]);
    }
    v31 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self dictionaryRepresentation];
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
  if (self->_cirAlerts)
  {
    id v4 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cirAlerts"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cirAlerts"];
    }
  }
  if (*(&self->_cirFallbackTriggered + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirFallbackTriggered](self, "cirFallbackTriggered"));
    [v3 setObject:v7 forKeyedSubscript:@"cirFallbackTriggered"];
  }
  if (self->_cirPireneConfidenceDebug)
  {
    uint64_t v8 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirPireneConfidenceDebug];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"cirPireneConfidenceDebug"];
  }
  if (self->_crossDomainRankerScoreKeepers)
  {
    uint64_t v10 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"crossDomainRankerScoreKeeper"];
  }
  if (self->_crossIntentRankerScoreKeepers)
  {
    v12 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"crossIntentRankerScoreKeeper"];
  }
  if (self->_domainCards)
  {
    int v14 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
    id v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"domainCards"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"domainCards"];
    }
  }
  if (self->_sortedScore)
  {
    uint64_t v17 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
    uint64_t v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"sortedScore"];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"sortedScore"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_crossDomainRankerScoreKeepers hash];
  uint64_t v4 = [(NSArray *)self->_crossIntentRankerScoreKeepers hash];
  unint64_t v5 = [(PEGASUSSchemaPEGASUSDomainCards *)self->_domainCards hash];
  NSUInteger v6 = [(NSString *)self->_cirPireneConfidenceDebug hash];
  unint64_t v7 = [(PEGASUSSchemaPEGASUSSortedScore *)self->_sortedScore hash];
  unint64_t v8 = [(PEGASUSSchemaPEGASUSCirAlerts *)self->_cirAlerts hash];
  if (*(&self->_cirFallbackTriggered + 1)) {
    uint64_t v9 = 2654435761 * self->_cirFallbackTriggered;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
  NSUInteger v6 = [v4 crossDomainRankerScoreKeepers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossDomainRankerScoreKeepers];
    uint64_t v10 = [v4 crossDomainRankerScoreKeepers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
  NSUInteger v6 = [v4 crossIntentRankerScoreKeepers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self crossIntentRankerScoreKeepers];
    id v15 = [v4 crossIntentRankerScoreKeepers];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
  NSUInteger v6 = [v4 domainCards];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
    v20 = [v4 domainCards];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirPireneConfidenceDebug];
  NSUInteger v6 = [v4 cirPireneConfidenceDebug];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirPireneConfidenceDebug];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirPireneConfidenceDebug];
    v25 = [v4 cirPireneConfidenceDebug];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
  NSUInteger v6 = [v4 sortedScore];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
    v30 = [v4 sortedScore];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
  NSUInteger v6 = [v4 cirAlerts];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
    long long v35 = [v4 cirAlerts];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  if (*(&self->_cirFallbackTriggered + 1) == (v4[57] & 1))
  {
    if (!*(&self->_cirFallbackTriggered + 1)
      || (int cirFallbackTriggered = self->_cirFallbackTriggered,
          cirFallbackTriggered == [v4 cirFallbackTriggered]))
    {
      BOOL v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = self->_crossDomainRankerScoreKeepers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = self->_crossIntentRankerScoreKeepers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }

  id v15 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];

  if (v15)
  {
    int v16 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self domainCards];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirPireneConfidenceDebug];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  uint64_t v18 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];

  if (v18)
  {
    uint64_t v19 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self sortedScore];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];

  if (v20)
  {
    int v21 = [(PEGASUSSchemaPEGASUSCrossIntentRankerResponse *)self cirAlerts];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_cirFallbackTriggered + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSCrossIntentRankerResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteCirFallbackTriggered
{
  *(&self->_cirFallbackTriggered + 1) &= ~1u;
}

- (void)setHasCirFallbackTriggered:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 1) = *(&self->_cirFallbackTriggered + 1) & 0xFE | a3;
}

- (BOOL)hasCirFallbackTriggered
{
  return *(&self->_cirFallbackTriggered + 1);
}

- (void)setCirFallbackTriggered:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 1) |= 1u;
  self->_int cirFallbackTriggered = a3;
}

- (void)deleteCirAlerts
{
}

- (BOOL)hasCirAlerts
{
  return self->_cirAlerts != 0;
}

- (void)deleteSortedScore
{
}

- (BOOL)hasSortedScore
{
  return self->_sortedScore != 0;
}

- (void)deleteCirPireneConfidenceDebug
{
}

- (BOOL)hasCirPireneConfidenceDebug
{
  return self->_cirPireneConfidenceDebug != 0;
}

- (void)deleteDomainCards
{
}

- (BOOL)hasDomainCards
{
  return self->_domainCards != 0;
}

- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_crossIntentRankerScoreKeepers objectAtIndexedSubscript:a3];
}

- (unint64_t)crossIntentRankerScoreKeeperCount
{
  return [(NSArray *)self->_crossIntentRankerScoreKeepers count];
}

- (void)addCrossIntentRankerScoreKeeper:(id)a3
{
  id v4 = a3;
  crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  id v8 = v4;
  if (!crossIntentRankerScoreKeepers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_crossIntentRankerScoreKeepers;
    self->_crossIntentRankerScoreKeepers = v6;

    id v4 = v8;
    crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  }
  [(NSArray *)crossIntentRankerScoreKeepers addObject:v4];
}

- (void)clearCrossIntentRankerScoreKeeper
{
}

- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_crossDomainRankerScoreKeepers objectAtIndexedSubscript:a3];
}

- (unint64_t)crossDomainRankerScoreKeeperCount
{
  return [(NSArray *)self->_crossDomainRankerScoreKeepers count];
}

- (void)addCrossDomainRankerScoreKeeper:(id)a3
{
  id v4 = a3;
  crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  id v8 = v4;
  if (!crossDomainRankerScoreKeepers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_crossDomainRankerScoreKeepers;
    self->_crossDomainRankerScoreKeepers = v6;

    id v4 = v8;
    crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  }
  [(NSArray *)crossDomainRankerScoreKeepers addObject:v4];
}

- (void)clearCrossDomainRankerScoreKeeper
{
}

@end