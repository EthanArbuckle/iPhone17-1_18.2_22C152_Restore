@interface PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo
- (BOOL)hasHasSafetyMessage;
- (BOOL)hasIsSearchNoResults;
- (BOOL)hasModelVersion;
- (BOOL)hasPegasusSafetyStatus;
- (BOOL)hasSafetyMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSearchNoResults;
- (BOOL)readFrom:(id)a3;
- (NSArray)pegasusSafetyScores;
- (NSData)jsonData;
- (NSString)modelVersion;
- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)pegasusSafetyScoresAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)pegasusSafetyStatus;
- (unint64_t)hash;
- (unint64_t)pegasusSafetyScoresCount;
- (void)addPegasusSafetyScores:(id)a3;
- (void)clearPegasusSafetyScores;
- (void)deleteHasSafetyMessage;
- (void)deleteIsSearchNoResults;
- (void)deleteModelVersion;
- (void)deletePegasusSafetyStatus;
- (void)setHasHasSafetyMessage:(BOOL)a3;
- (void)setHasIsSearchNoResults:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasPegasusSafetyStatus:(BOOL)a3;
- (void)setHasSafetyMessage:(BOOL)a3;
- (void)setIsSearchNoResults:(BOOL)a3;
- (void)setModelVersion:(id)a3;
- (void)setPegasusSafetyScores:(id)a3;
- (void)setPegasusSafetyStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self pegasusSafetyScores];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self setPegasusSafetyScores:v7];
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
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_pegasusSafetyScores, 0);
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setPegasusSafetyScores:(id)a3
{
}

- (NSArray)pegasusSafetyScores
{
  return self->_pegasusSafetyScores;
}

- (int)pegasusSafetyStatus
{
  return self->_pegasusSafetyStatus;
}

- (BOOL)hasSafetyMessage
{
  return self->_hasSafetyMessage;
}

- (BOOL)isSearchNoResults
{
  return self->_isSearchNoResults;
}

- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo;
  v5 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSearchNoResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo setIsSearchNoResults:](v5, "setIsSearchNoResults:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasSafetyMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo setHasSafetyMessage:](v5, "setHasSafetyMessage:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"pegasusSafetyStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo setPegasusSafetyStatus:](v5, "setPegasusSafetyStatus:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"pegasusSafetyScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v8;
      v22 = v7;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[PEGASUSSchemaPEGASUSSafetyScore alloc] initWithDictionary:v15];
              [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)v5 addPegasusSafetyScores:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v12);
      }

      v7 = v22;
      v8 = v21;
    }
    v17 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)v5 setModelVersion:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo hasSafetyMessage](self, "hasSafetyMessage"));
    [v3 setObject:v5 forKeyedSubscript:@"hasSafetyMessage"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo isSearchNoResults](self, "isSearchNoResults"));
    [v3 setObject:v6 forKeyedSubscript:@"isSearchNoResults"];
  }
  if (self->_modelVersion)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self modelVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
  }
  if ([(NSArray *)self->_pegasusSafetyScores count])
  {
    objc_super v9 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = self->_pegasusSafetyScores;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"pegasusSafetyScores"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v17 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self pegasusSafetyStatus] - 1;
    if (v17 > 4) {
      v18 = @"PEGASUSSAFETYSTATUS_UNKNOWN";
    }
    else {
      v18 = off_1E5EC0C18[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"pegasusSafetyStatus"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_isSearchNoResults;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_hasSafetyMessage;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_pegasusSafetyStatus;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSArray *)self->_pegasusSafetyScores hash];
  return v6 ^ [(NSString *)self->_modelVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  $F971116AF0CBD22F5C29A544CB4953B1 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&has)
  {
    int isSearchNoResults = self->_isSearchNoResults;
    if (isSearchNoResults != [v4 isSearchNoResults]) {
      goto LABEL_23;
    }
    $F971116AF0CBD22F5C29A544CB4953B1 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int hasSafetyMessage = self->_hasSafetyMessage;
      if (hasSafetyMessage != [v4 hasSafetyMessage]) {
        goto LABEL_23;
      }
      $F971116AF0CBD22F5C29A544CB4953B1 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_23;
    }
    if (v10)
    {
      int pegasusSafetyStatus = self->_pegasusSafetyStatus;
      if (pegasusSafetyStatus != [v4 pegasusSafetyStatus]) {
        goto LABEL_23;
      }
    }
    uint64_t v12 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self pegasusSafetyScores];
    uint64_t v13 = [v4 pegasusSafetyScores];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_22;
    }
    uint64_t v14 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self pegasusSafetyScores];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v16 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self pegasusSafetyScores];
      unsigned int v17 = [v4 pegasusSafetyScores];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v12 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self modelVersion];
    uint64_t v13 = [v4 modelVersion];
    if ((v12 == 0) != (v13 != 0))
    {
      uint64_t v19 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self modelVersion];
      if (!v19)
      {

LABEL_26:
        BOOL v24 = 1;
        goto LABEL_24;
      }
      long long v20 = (void *)v19;
      long long v21 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self modelVersion];
      long long v22 = [v4 modelVersion];
      char v23 = [v21 isEqual:v22];

      if (v23) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_22:
    }
  }
LABEL_23:
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v6 = self->_pegasusSafetyScores;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self modelVersion];

  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAMPSafetyLoggingInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (id)pegasusSafetyScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pegasusSafetyScores objectAtIndexedSubscript:a3];
}

- (unint64_t)pegasusSafetyScoresCount
{
  return [(NSArray *)self->_pegasusSafetyScores count];
}

- (void)addPegasusSafetyScores:(id)a3
{
  id v4 = a3;
  pegasusSafetyScores = self->_pegasusSafetyScores;
  id v8 = v4;
  if (!pegasusSafetyScores)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pegasusSafetyScores;
    self->_pegasusSafetyScores = v6;

    id v4 = v8;
    pegasusSafetyScores = self->_pegasusSafetyScores;
  }
  [(NSArray *)pegasusSafetyScores addObject:v4];
}

- (void)clearPegasusSafetyScores
{
}

- (void)deletePegasusSafetyStatus
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPegasusSafetyStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPegasusSafetyStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPegasusSafetyStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int pegasusSafetyStatus = a3;
}

- (void)deleteHasSafetyMessage
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasSafetyMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasSafetyMessage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSafetyMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasSafetyMessage = a3;
}

- (void)deleteIsSearchNoResults
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSearchNoResults:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSearchNoResults
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSearchNoResults:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSearchNoResults = a3;
}

@end