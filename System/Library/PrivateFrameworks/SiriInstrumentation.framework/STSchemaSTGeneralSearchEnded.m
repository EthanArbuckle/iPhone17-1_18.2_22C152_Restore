@interface STSchemaSTGeneralSearchEnded
- (BOOL)hasDialogFallbackReason;
- (BOOL)hasLinkId;
- (BOOL)hasResponseDialogSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (STSchemaSTGeneralSearchEnded)initWithDictionary:(id)a3;
- (STSchemaSTGeneralSearchEnded)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)dialogFallbackReason;
- (int)responseDialogSource;
- (unint64_t)hash;
- (unint64_t)resultCount;
- (void)addResult:(id)a3;
- (void)clearResult;
- (void)deleteDialogFallbackReason;
- (void)deleteLinkId;
- (void)deleteResponseDialogSource;
- (void)setDialogFallbackReason:(int)a3;
- (void)setHasDialogFallbackReason:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasResponseDialogSource:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setResponseDialogSource:(int)a3;
- (void)setResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTGeneralSearchEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STSchemaSTGeneralSearchEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(STSchemaSTGeneralSearchEnded *)self results];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(STSchemaSTGeneralSearchEnded *)self setResults:v7];

  v8 = [(STSchemaSTGeneralSearchEnded *)self linkId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(STSchemaSTGeneralSearchEnded *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (int)dialogFallbackReason
{
  return self->_dialogFallbackReason;
}

- (int)responseDialogSource
{
  return self->_responseDialogSource;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (STSchemaSTGeneralSearchEnded)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STSchemaSTGeneralSearchEnded;
  v5 = [(STSchemaSTGeneralSearchEnded *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [STSchemaSTGeneralSearchResult alloc];
              v14 = -[STSchemaSTGeneralSearchResult initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
              [(STSchemaSTGeneralSearchEnded *)v5 addResult:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"responseDialogSource", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTGeneralSearchEnded setResponseDialogSource:](v5, "setResponseDialogSource:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"dialogFallbackReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTGeneralSearchEnded setDialogFallbackReason:](v5, "setDialogFallbackReason:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[SISchemaUUID alloc] initWithDictionary:v17];
      [(STSchemaSTGeneralSearchEnded *)v5 setLinkId:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (STSchemaSTGeneralSearchEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTGeneralSearchEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTGeneralSearchEnded *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = [(STSchemaSTGeneralSearchEnded *)self dialogFallbackReason] - 1;
    if (v4 > 4) {
      v5 = @"STGENERALSEARCHRESPONSEDIALOGFALLBACKREASON_UNKNOWN";
    }
    else {
      v5 = off_1E5EC0CF0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"dialogFallbackReason"];
  }
  if (self->_linkId)
  {
    v6 = [(STSchemaSTGeneralSearchEnded *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(STSchemaSTGeneralSearchEnded *)self responseDialogSource] - 1;
    if (v9 > 4) {
      uint64_t v10 = @"STGENERALSEARCHRESPONSEDIALOGSOURCE_UNKNOWN";
    }
    else {
      uint64_t v10 = off_1E5EC0D18[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"responseDialogSource"];
  }
  if ([(NSArray *)self->_results count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = self->_results;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"result"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_results hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_responseDialogSource;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_linkId hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_dialogFallbackReason;
  return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(STSchemaSTGeneralSearchEnded *)self results];
  v6 = [v4 results];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(STSchemaSTGeneralSearchEnded *)self results];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unsigned int v9 = [(STSchemaSTGeneralSearchEnded *)self results];
    uint64_t v10 = [v4 results];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $9C33A2403E675F28FC435EE174799B98 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int responseDialogSource = self->_responseDialogSource;
    if (responseDialogSource != [v4 responseDialogSource]) {
      goto LABEL_19;
    }
    $9C33A2403E675F28FC435EE174799B98 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int dialogFallbackReason = self->_dialogFallbackReason;
    if (dialogFallbackReason != [v4 dialogFallbackReason]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(STSchemaSTGeneralSearchEnded *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(STSchemaSTGeneralSearchEnded *)self linkId];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(STSchemaSTGeneralSearchEnded *)self linkId];
  long long v20 = [v4 linkId];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
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
  int v11 = [(STSchemaSTGeneralSearchEnded *)self linkId];

  if (v11)
  {
    uint64_t v12 = [(STSchemaSTGeneralSearchEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTGeneralSearchEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteDialogFallbackReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDialogFallbackReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDialogFallbackReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDialogFallbackReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int dialogFallbackReason = a3;
}

- (void)deleteResponseDialogSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResponseDialogSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseDialogSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseDialogSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int responseDialogSource = a3;
}

- (id)resultAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResult
{
}

@end