@interface ORCHSchemaORCHFlowOutputSubmitted
- (BOOL)flowCommandReceived;
- (BOOL)flowCommandResponseError;
- (BOOL)hasAceCommandId;
- (BOOL)hasFlowCommandReceived;
- (BOOL)hasFlowCommandResponseError;
- (BOOL)hasFlowOutputSubmissionId;
- (BOOL)hasSubRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)aceViewIds;
- (NSData)jsonData;
- (ORCHSchemaORCHFlowOutputSubmitted)initWithDictionary:(id)a3;
- (ORCHSchemaORCHFlowOutputSubmitted)initWithJSON:(id)a3;
- (SISchemaUUID)aceCommandId;
- (SISchemaUUID)subRequestId;
- (id)aceViewIdsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)flowOutputSubmissionId;
- (unint64_t)aceViewIdsCount;
- (unint64_t)hash;
- (void)addAceViewIds:(id)a3;
- (void)clearAceViewIds;
- (void)deleteAceCommandId;
- (void)deleteFlowCommandReceived;
- (void)deleteFlowCommandResponseError;
- (void)deleteFlowOutputSubmissionId;
- (void)deleteSubRequestId;
- (void)setAceCommandId:(id)a3;
- (void)setAceViewIds:(id)a3;
- (void)setFlowCommandReceived:(BOOL)a3;
- (void)setFlowCommandResponseError:(BOOL)a3;
- (void)setFlowOutputSubmissionId:(int)a3;
- (void)setHasAceCommandId:(BOOL)a3;
- (void)setHasFlowCommandReceived:(BOOL)a3;
- (void)setHasFlowCommandResponseError:(BOOL)a3;
- (void)setHasFlowOutputSubmissionId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setSubRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHFlowOutputSubmitted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ORCHSchemaORCHFlowOutputSubmitted;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHFlowOutputSubmitted *)self deleteAceCommandId];
  }
  v9 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceViewIds];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ORCHSchemaORCHFlowOutputSubmitted *)self setAceViewIds:v10];

  v11 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(ORCHSchemaORCHFlowOutputSubmitted *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_aceViewIds, 0);
  objc_storeStrong((id *)&self->_aceCommandId, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAceCommandId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setAceViewIds:(id)a3
{
}

- (NSArray)aceViewIds
{
  return self->_aceViewIds;
}

- (void)setAceCommandId:(id)a3
{
}

- (SISchemaUUID)aceCommandId
{
  return self->_aceCommandId;
}

- (BOOL)flowCommandResponseError
{
  return self->_flowCommandResponseError;
}

- (BOOL)flowCommandReceived
{
  return self->_flowCommandReceived;
}

- (int)flowOutputSubmissionId
{
  return self->_flowOutputSubmissionId;
}

- (ORCHSchemaORCHFlowOutputSubmitted)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ORCHSchemaORCHFlowOutputSubmitted;
  v5 = [(ORCHSchemaORCHFlowOutputSubmitted *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"flowOutputSubmissionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowOutputSubmissionId:](v5, "setFlowOutputSubmissionId:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"flowCommandReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandReceived:](v5, "setFlowCommandReceived:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"flowCommandResponseError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandResponseError:](v5, "setFlowCommandResponseError:", [v8 BOOLValue]);
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"aceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(ORCHSchemaORCHFlowOutputSubmitted *)v5 setAceCommandId:v10];
    }
    v26 = (void *)v9;
    v11 = [v4 objectForKeyedSubscript:@"aceViewIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v8;
      v24 = v7;
      v25 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[SISchemaUUID alloc] initWithDictionary:v17];
              [(ORCHSchemaORCHFlowOutputSubmitted *)v5 addAceViewIds:v18];
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v14);
      }

      v7 = v24;
      v6 = v25;
      int v8 = v23;
    }
    v19 = objc_msgSend(v4, "objectForKeyedSubscript:", @"subRequestId", v23, v24, v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[SISchemaUUID alloc] initWithDictionary:v19];
      [(ORCHSchemaORCHFlowOutputSubmitted *)v5 setSubRequestId:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHFlowOutputSubmitted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHFlowOutputSubmitted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHFlowOutputSubmitted *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_aceCommandId)
  {
    id v4 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aceCommandId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aceCommandId"];
    }
  }
  if ([(NSArray *)self->_aceViewIds count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v8 = self->_aceViewIds;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"aceViewIds"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHFlowOutputSubmitted flowCommandReceived](self, "flowCommandReceived"));
    [v3 setObject:v19 forKeyedSubscript:@"flowCommandReceived"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_20:
      if ((has & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_20;
  }
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHFlowOutputSubmitted flowCommandResponseError](self, "flowCommandResponseError", (void)v23));
  [v3 setObject:v20 forKeyedSubscript:@"flowCommandResponseError"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_21:
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[ORCHSchemaORCHFlowOutputSubmitted flowOutputSubmissionId](self, "flowOutputSubmissionId", (void)v23));
    [v3 setObject:v16 forKeyedSubscript:@"flowOutputSubmissionId"];
  }
LABEL_22:
  if (self->_subRequestId)
  {
    uint64_t v17 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"subRequestId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v23);
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
  uint64_t v3 = 2654435761 * self->_flowOutputSubmissionId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_flowCommandReceived;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_flowCommandResponseError;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_aceCommandId hash];
  uint64_t v7 = [(NSArray *)self->_aceViewIds hash];
  return v6 ^ v7 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  $8CF3C99840CD6FD7472937E8AEAB16CE has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&has)
  {
    int flowOutputSubmissionId = self->_flowOutputSubmissionId;
    if (flowOutputSubmissionId != [v4 flowOutputSubmissionId]) {
      goto LABEL_28;
    }
    $8CF3C99840CD6FD7472937E8AEAB16CE has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int flowCommandReceived = self->_flowCommandReceived;
      if (flowCommandReceived != [v4 flowCommandReceived]) {
        goto LABEL_28;
      }
      $8CF3C99840CD6FD7472937E8AEAB16CE has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_28;
    }
    if (v10)
    {
      int flowCommandResponseError = self->_flowCommandResponseError;
      if (flowCommandResponseError != [v4 flowCommandResponseError]) {
        goto LABEL_28;
      }
    }
    id v12 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
    uint64_t v13 = [v4 aceCommandId];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_27;
    }
    uint64_t v14 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
      uint64_t v17 = [v4 aceCommandId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v12 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceViewIds];
    uint64_t v13 = [v4 aceViewIds];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_27;
    }
    uint64_t v19 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceViewIds];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceViewIds];
      v22 = [v4 aceViewIds];
      int v23 = [v21 isEqual:v22];

      if (!v23) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v12 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
    uint64_t v13 = [v4 subRequestId];
    if ((v12 == 0) != (v13 != 0))
    {
      uint64_t v24 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
      if (!v24)
      {

LABEL_31:
        BOOL v29 = 1;
        goto LABEL_29;
      }
      long long v25 = (void *)v24;
      long long v26 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
      long long v27 = [v4 subRequestId];
      char v28 = [v26 isEqual:v27];

      if (v28) {
        goto LABEL_31;
      }
    }
    else
    {
LABEL_27:
    }
  }
LABEL_28:
  BOOL v29 = 0;
LABEL_29:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
    PBDataWriterWriteBOOLField();
LABEL_5:
  unsigned int v6 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHFlowOutputSubmitted *)self aceCommandId];
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = self->_aceViewIds;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];

  if (v13)
  {
    uint64_t v14 = [(ORCHSchemaORCHFlowOutputSubmitted *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHFlowOutputSubmittedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (id)aceViewIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_aceViewIds objectAtIndexedSubscript:a3];
}

- (unint64_t)aceViewIdsCount
{
  return [(NSArray *)self->_aceViewIds count];
}

- (void)addAceViewIds:(id)a3
{
  id v4 = a3;
  aceViewIds = self->_aceViewIds;
  id v8 = v4;
  if (!aceViewIds)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_aceViewIds;
    self->_aceViewIds = v6;

    id v4 = v8;
    aceViewIds = self->_aceViewIds;
  }
  [(NSArray *)aceViewIds addObject:v4];
}

- (void)clearAceViewIds
{
}

- (void)deleteAceCommandId
{
}

- (BOOL)hasAceCommandId
{
  return self->_aceCommandId != 0;
}

- (void)deleteFlowCommandResponseError
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasFlowCommandResponseError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlowCommandResponseError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFlowCommandResponseError:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int flowCommandResponseError = a3;
}

- (void)deleteFlowCommandReceived
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFlowCommandReceived:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlowCommandReceived
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFlowCommandReceived:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int flowCommandReceived = a3;
}

- (void)deleteFlowOutputSubmissionId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFlowOutputSubmissionId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlowOutputSubmissionId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFlowOutputSubmissionId:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int flowOutputSubmissionId = a3;
}

@end