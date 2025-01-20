@interface FLOWSchemaFLOWMediaPlayerPlaybackContextTier1
- (BOOL)hasAdamId;
- (BOOL)hasAdamIdString;
- (BOOL)hasContentTitle;
- (BOOL)hasIsNlsContainerResult;
- (BOOL)hasIsNlsResult;
- (BOOL)hasLinkId;
- (BOOL)hasU2UsoGraph;
- (BOOL)hasU2UsoGraphTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNlsContainerResult;
- (BOOL)isNlsResult;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithJSON:(id)a3;
- (NSArray)searchResults;
- (NSData)jsonData;
- (NSString)adamIdString;
- (NSString)contentTitle;
- (SISchemaUUID)linkId;
- (USOSchemaUSOGraph)u2UsoGraph;
- (USOSchemaUSOGraphTier1)u2UsoGraphTier1;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)searchResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)searchResultsCount;
- (unsigned)adamId;
- (void)addSearchResults:(id)a3;
- (void)clearSearchResults;
- (void)deleteAdamId;
- (void)deleteAdamIdString;
- (void)deleteContentTitle;
- (void)deleteIsNlsContainerResult;
- (void)deleteIsNlsResult;
- (void)deleteLinkId;
- (void)deleteU2UsoGraph;
- (void)deleteU2UsoGraphTier1;
- (void)setAdamId:(unsigned int)a3;
- (void)setAdamIdString:(id)a3;
- (void)setContentTitle:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasAdamIdString:(BOOL)a3;
- (void)setHasContentTitle:(BOOL)a3;
- (void)setHasIsNlsContainerResult:(BOOL)a3;
- (void)setHasIsNlsResult:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasU2UsoGraph:(BOOL)a3;
- (void)setHasU2UsoGraphTier1:(BOOL)a3;
- (void)setIsNlsContainerResult:(BOOL)a3;
- (void)setIsNlsResult:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setU2UsoGraph:(id)a3;
- (void)setU2UsoGraphTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMediaPlayerPlaybackContextTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContextTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteContentTitle];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamId];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamIdString];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteSearchResults];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteContentTitle];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamId];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamIdString];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteSearchResults];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteContentTitle];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamId];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamIdString];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteSearchResults];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteContentTitle];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamId];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamIdString];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteSearchResults];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteContentTitle];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamId];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteAdamIdString];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteSearchResults];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
  }
  v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteLinkId];
  }
  v9 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self searchResults];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self setSearchResults:v10];

  v11 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraph];
  }
  v14 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self deleteU2UsoGraphTier1];
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
  objc_storeStrong((id *)&self->_u2UsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_u2UsoGraph, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_adamIdString, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasU2UsoGraphTier1:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasU2UsoGraph:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAdamIdString:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasContentTitle:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 2) = a3;
}

- (BOOL)isNlsContainerResult
{
  return self->_isNlsContainerResult;
}

- (BOOL)isNlsResult
{
  return self->_isNlsResult;
}

- (void)setU2UsoGraphTier1:(id)a3
{
}

- (USOSchemaUSOGraphTier1)u2UsoGraphTier1
{
  return self->_u2UsoGraphTier1;
}

- (void)setU2UsoGraph:(id)a3
{
}

- (USOSchemaUSOGraph)u2UsoGraph
{
  return self->_u2UsoGraph;
}

- (void)setSearchResults:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setAdamIdString:(id)a3
{
}

- (NSString)adamIdString
{
  return self->_adamIdString;
}

- (unsigned)adamId
{
  return self->_adamId;
}

- (void)setContentTitle:(id)a3
{
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContextTier1;
  v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"contentTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 setContentTitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setAdamId:](v5, "setAdamId:", [v10 unsignedIntValue]);
    }
    v32 = v10;
    v11 = [v4 objectForKeyedSubscript:@"adamIdString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 setAdamIdString:v12];
    }
    int v13 = [v4 objectForKeyedSubscript:@"searchResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = v11;
      v30 = v8;
      v31 = v6;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[FLOWSchemaFLOWMediaPlayerMediaItem alloc] initWithDictionary:v19];
              [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 addSearchResults:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v16);
      }

      int v8 = v30;
      v11 = v29;
    }
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"u2UsoGraph", v29, v30, v31);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[USOSchemaUSOGraph alloc] initWithDictionary:v21];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 setU2UsoGraph:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"u2UsoGraphTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[USOSchemaUSOGraphTier1 alloc] initWithDictionary:v23];
      [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)v5 setU2UsoGraphTier1:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"isNlsResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setIsNlsResult:](v5, "setIsNlsResult:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isNlsContainerResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setIsNlsContainerResult:](v5, "setIsNlsContainerResult:", [v26 BOOLValue]);
    }
    v27 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self dictionaryRepresentation];
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
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(&self->_isNlsContainerResult + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamId](self, "adamId"));
    [v3 setObject:v4 forKeyedSubscript:@"adamId"];
  }
  if (self->_adamIdString)
  {
    v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self adamIdString];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"adamIdString"];
  }
  if (self->_contentTitle)
  {
    uint64_t v7 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self contentTitle];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"contentTitle"];
  }
  char v9 = *(&self->_isNlsContainerResult + 1);
  if ((v9 & 4) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 isNlsContainerResult](self, "isNlsContainerResult"));
    [v3 setObject:v10 forKeyedSubscript:@"isNlsContainerResult"];

    char v9 = *(&self->_isNlsContainerResult + 1);
  }
  if ((v9 & 2) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 isNlsResult](self, "isNlsResult"));
    [v3 setObject:v11 forKeyedSubscript:@"isNlsResult"];
  }
  if (self->_linkId)
  {
    v12 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
    int v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_searchResults count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v16 = self->_searchResults;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (void)v30);
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"searchResults"];
  }
  if (self->_u2UsoGraph)
  {
    v23 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"u2UsoGraph"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"u2UsoGraph"];
    }
  }
  if (self->_u2UsoGraphTier1)
  {
    v26 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
    v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"u2UsoGraphTier1"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"u2UsoGraphTier1"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v30);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_contentTitle hash];
  if (*(&self->_isNlsContainerResult + 1)) {
    uint64_t v5 = 2654435761 * self->_adamId;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_adamIdString hash];
  uint64_t v7 = [(NSArray *)self->_searchResults hash];
  unint64_t v8 = [(USOSchemaUSOGraph *)self->_u2UsoGraph hash];
  unint64_t v9 = [(USOSchemaUSOGraphTier1 *)self->_u2UsoGraphTier1 hash];
  if ((*(&self->_isNlsContainerResult + 1) & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_isNlsResult;
    if ((*(&self->_isNlsContainerResult + 1) & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(&self->_isNlsContainerResult + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v11 = 2654435761 * self->_isNlsContainerResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
  NSUInteger v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v7 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self contentTitle];
  NSUInteger v6 = [v4 contentTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v12 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self contentTitle];
  if (v12)
  {
    int v13 = (void *)v12;
    id v14 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self contentTitle];
    uint64_t v15 = [v4 contentTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  if (*(&self->_isNlsContainerResult + 1) != (v4[66] & 1)) {
    goto LABEL_35;
  }
  if (*(&self->_isNlsContainerResult + 1))
  {
    unsigned int adamId = self->_adamId;
    if (adamId != [v4 adamId]) {
      goto LABEL_35;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self adamIdString];
  NSUInteger v6 = [v4 adamIdString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v18 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self adamIdString];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self adamIdString];
    v21 = [v4 adamIdString];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self searchResults];
  NSUInteger v6 = [v4 searchResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v23 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self searchResults];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self searchResults];
    v26 = [v4 searchResults];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
  NSUInteger v6 = [v4 u2UsoGraph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v28 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
  if (v28)
  {
    v29 = (void *)v28;
    long long v30 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
    long long v31 = [v4 u2UsoGraph];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
  NSUInteger v6 = [v4 u2UsoGraphTier1];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v33 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
  if (v33)
  {
    long long v34 = (void *)v33;
    uint64_t v35 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
    long long v36 = [v4 u2UsoGraphTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unsigned int v40 = *((unsigned __int8 *)&self->_isNlsContainerResult + 1);
  int v41 = (v40 >> 1) & 1;
  unsigned int v42 = v4[66];
  if (v41 == ((v42 >> 1) & 1))
  {
    if (v41)
    {
      int isNlsResult = self->_isNlsResult;
      if (isNlsResult != [v4 isNlsResult]) {
        goto LABEL_35;
      }
      unsigned int v40 = *((unsigned __int8 *)&self->_isNlsContainerResult + 1);
      unsigned int v42 = v4[66];
    }
    int v44 = (v40 >> 2) & 1;
    if (v44 == ((v42 >> 2) & 1))
    {
      if (!v44
        || (int isNlsContainerResult = self->_isNlsContainerResult,
            isNlsContainerResult == [v4 isNlsContainerResult]))
      {
        BOOL v38 = 1;
        goto LABEL_36;
      }
    }
  }
LABEL_35:
  BOOL v38 = 0;
LABEL_36:

  return v38;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];

  if (v5)
  {
    NSUInteger v6 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self contentTitle];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if (*(&self->_isNlsContainerResult + 1)) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v8 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self adamIdString];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v9 = self->_searchResults;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v14 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];

  if (v14)
  {
    uint64_t v15 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraph];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];

  if (v16)
  {
    uint64_t v17 = [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self u2UsoGraphTier1];
    PBDataWriterWriteSubmessage();
  }
  char v18 = *(&self->_isNlsContainerResult + 1);
  if ((v18 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v18 = *(&self->_isNlsContainerResult + 1);
  }
  if ((v18 & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerPlaybackContextTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsNlsContainerResult
{
  *(&self->_isNlsContainerResult + 1) &= ~4u;
}

- (void)setHasIsNlsContainerResult:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFB | v3;
}

- (BOOL)hasIsNlsContainerResult
{
  return (*((unsigned __int8 *)&self->_isNlsContainerResult + 1) >> 2) & 1;
}

- (void)setIsNlsContainerResult:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) |= 4u;
  self->_int isNlsContainerResult = a3;
}

- (void)deleteIsNlsResult
{
  *(&self->_isNlsContainerResult + 1) &= ~2u;
}

- (void)setHasIsNlsResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFD | v3;
}

- (BOOL)hasIsNlsResult
{
  return (*((unsigned __int8 *)&self->_isNlsContainerResult + 1) >> 1) & 1;
}

- (void)setIsNlsResult:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) |= 2u;
  self->_int isNlsResult = a3;
}

- (void)deleteU2UsoGraphTier1
{
}

- (BOOL)hasU2UsoGraphTier1
{
  return self->_u2UsoGraphTier1 != 0;
}

- (void)deleteU2UsoGraph
{
}

- (BOOL)hasU2UsoGraph
{
  return self->_u2UsoGraph != 0;
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_searchResults objectAtIndexedSubscript:a3];
}

- (unint64_t)searchResultsCount
{
  return [(NSArray *)self->_searchResults count];
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  searchResults = self->_searchResults;
  id v8 = v4;
  if (!searchResults)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_searchResults;
    self->_searchResults = v6;

    id v4 = v8;
    searchResults = self->_searchResults;
  }
  [(NSArray *)searchResults addObject:v4];
}

- (void)clearSearchResults
{
}

- (void)deleteAdamIdString
{
}

- (BOOL)hasAdamIdString
{
  return self->_adamIdString != 0;
}

- (void)deleteAdamId
{
  *(&self->_isNlsContainerResult + 1) &= ~1u;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(&self->_isNlsContainerResult + 1);
}

- (void)setAdamId:(unsigned int)a3
{
  *(&self->_isNlsContainerResult + 1) |= 1u;
  self->_unsigned int adamId = a3;
}

- (void)deleteContentTitle
{
}

- (BOOL)hasContentTitle
{
  return self->_contentTitle != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end