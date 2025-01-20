@interface IFTSchemaIFTClientEventMetadata
- (BOOL)hasClientApplicationId;
- (BOOL)hasClientTraceId;
- (BOOL)hasIfEventId;
- (BOOL)hasIfRequestId;
- (BOOL)hasIfSessionId;
- (BOOL)hasPostingSpanId;
- (BOOL)hasSender;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTClientEventMetadata)initWithDictionary:(id)a3;
- (IFTSchemaIFTClientEventMetadata)initWithJSON:(id)a3;
- (NSArray)initiatedSpans;
- (NSData)jsonData;
- (SISchemaUUID)clientTraceId;
- (SISchemaUUID)ifEventId;
- (SISchemaUUID)ifRequestId;
- (SISchemaUUID)ifSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)initiatedSpansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)clientApplicationId;
- (int)sender;
- (unint64_t)hash;
- (unint64_t)initiatedSpansCount;
- (unint64_t)postingSpanId;
- (void)addInitiatedSpans:(id)a3;
- (void)clearInitiatedSpans;
- (void)deleteClientApplicationId;
- (void)deleteClientTraceId;
- (void)deleteIfEventId;
- (void)deleteIfRequestId;
- (void)deleteIfSessionId;
- (void)deletePostingSpanId;
- (void)deleteSender;
- (void)setClientApplicationId:(int)a3;
- (void)setClientTraceId:(id)a3;
- (void)setHasClientApplicationId:(BOOL)a3;
- (void)setHasClientTraceId:(BOOL)a3;
- (void)setHasIfEventId:(BOOL)a3;
- (void)setHasIfRequestId:(BOOL)a3;
- (void)setHasIfSessionId:(BOOL)a3;
- (void)setHasPostingSpanId:(BOOL)a3;
- (void)setHasSender:(BOOL)a3;
- (void)setIfEventId:(id)a3;
- (void)setIfRequestId:(id)a3;
- (void)setIfSessionId:(id)a3;
- (void)setInitiatedSpans:(id)a3;
- (void)setPostingSpanId:(unint64_t)a3;
- (void)setSender:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IFTSchemaIFTClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v21 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTClientEventMetadata *)self deleteIfRequestId];
  }
  v9 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTClientEventMetadata *)self deleteIfEventId];
  }
  v12 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTClientEventMetadata *)self deleteIfSessionId];
  }
  v15 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTClientEventMetadata *)self deleteClientTraceId];
  }
  v18 = [(IFTSchemaIFTClientEventMetadata *)self initiatedSpans];
  v19 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v18 underConditions:v4];
  [(IFTSchemaIFTClientEventMetadata *)self setInitiatedSpans:v19];

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
  objc_storeStrong((id *)&self->_initiatedSpans, 0);
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
  objc_storeStrong((id *)&self->_ifEventId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasIfRequestId = a3;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasIfEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)clientApplicationId
{
  return self->_clientApplicationId;
}

- (void)setInitiatedSpans:(id)a3
{
}

- (NSArray)initiatedSpans
{
  return self->_initiatedSpans;
}

- (unint64_t)postingSpanId
{
  return self->_postingSpanId;
}

- (int)sender
{
  return self->_sender;
}

- (void)setClientTraceId:(id)a3
{
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setIfSessionId:(id)a3
{
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (void)setIfEventId:(id)a3
{
}

- (SISchemaUUID)ifEventId
{
  return self->_ifEventId;
}

- (void)setIfRequestId:(id)a3
{
}

- (SISchemaUUID)ifRequestId
{
  return self->_ifRequestId;
}

- (IFTSchemaIFTClientEventMetadata)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IFTSchemaIFTClientEventMetadata;
  v5 = [(IFTSchemaIFTClientEventMetadata *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(IFTSchemaIFTClientEventMetadata *)v5 setIfRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ifEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(IFTSchemaIFTClientEventMetadata *)v5 setIfEventId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ifSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(IFTSchemaIFTClientEventMetadata *)v5 setIfSessionId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"clientTraceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(IFTSchemaIFTClientEventMetadata *)v5 setClientTraceId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"sender"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTClientEventMetadata setSender:](v5, "setSender:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"postingSpanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", [v15 unsignedLongLongValue]);
    }
    v32 = v15;
    v16 = [v4 objectForKeyedSubscript:@"initiatedSpans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v14;
      v28 = v12;
      v29 = v10;
      v30 = v8;
      v31 = v6;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[IFTSchemaIFTInitiatedSpans alloc] initWithDictionary:v22];
              [(IFTSchemaIFTClientEventMetadata *)v5 addInitiatedSpans:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v19);
      }

      v6 = v31;
      v12 = v28;
      v10 = v29;
      int v14 = v27;
    }
    v24 = objc_msgSend(v4, "objectForKeyedSubscript:", @"clientApplicationId", v27, v28, v29, v30, v31);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTClientEventMetadata setClientApplicationId:](v5, "setClientApplicationId:", [v24 intValue]);
    }
    v25 = v5;
  }
  return v5;
}

- (IFTSchemaIFTClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTClientEventMetadata *)self dictionaryRepresentation];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v4 = [(IFTSchemaIFTClientEventMetadata *)self clientApplicationId] - 1;
    if (v4 > 2) {
      v5 = @"IFTCLIENTAPPLICATIONID_UNKNOWN";
    }
    else {
      v5 = off_1E5EBEA48[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"clientApplicationId"];
  }
  if (self->_clientTraceId)
  {
    v6 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"clientTraceId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"clientTraceId"];
    }
  }
  if (self->_ifEventId)
  {
    v9 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"ifEventId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"ifEventId"];
    }
  }
  if (self->_ifRequestId)
  {
    v12 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"ifRequestId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"ifRequestId"];
    }
  }
  if (self->_ifSessionId)
  {
    v15 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"ifSessionId"];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"ifSessionId"];
    }
  }
  if ([(NSArray *)self->_initiatedSpans count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = self->_initiatedSpans;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"initiatedSpans"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IFTSchemaIFTClientEventMetadata postingSpanId](self, "postingSpanId"));
    [v3 setObject:v27 forKeyedSubscript:@"postingSpanId"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v28 = [(IFTSchemaIFTClientEventMetadata *)self sender] - 1;
    if (v28 > 5) {
      v29 = @"IFPARTICIPANT_UNKNOWN";
    }
    else {
      v29 = off_1E5EBEA60[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"sender"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifRequestId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_ifEventId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_ifSessionId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_clientTraceId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_sender;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v8 = 2654435761u * self->_postingSpanId;
      goto LABEL_6;
    }
  }
  unint64_t v8 = 0;
LABEL_6:
  uint64_t v9 = [(NSArray *)self->_initiatedSpans hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_clientApplicationId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
  unint64_t v6 = [v4 ifRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
    uint64_t v10 = [v4 ifRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
  unint64_t v6 = [v4 ifEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
    v15 = [v4 ifEventId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
  unint64_t v6 = [v4 ifSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v17 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
    uint64_t v20 = [v4 ifSessionId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
  unint64_t v6 = [v4 clientTraceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
    v25 = [v4 clientTraceId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  $A945F946647D416E15B6BAE20D0E5368 has = self->_has;
  unsigned int v28 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v28 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int sender = self->_sender;
    if (sender != [v4 sender]) {
      goto LABEL_34;
    }
    $A945F946647D416E15B6BAE20D0E5368 has = self->_has;
    unsigned int v28 = v4[68];
  }
  int v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v30)
  {
    unint64_t postingSpanId = self->_postingSpanId;
    if (postingSpanId != [v4 postingSpanId]) {
      goto LABEL_34;
    }
  }
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self initiatedSpans];
  unint64_t v6 = [v4 initiatedSpans];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v32 = [(IFTSchemaIFTClientEventMetadata *)self initiatedSpans];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [(IFTSchemaIFTClientEventMetadata *)self initiatedSpans];
    long long v35 = [v4 initiatedSpans];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int v39 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v39 == ((v4[68] >> 2) & 1))
  {
    if (!v39
      || (int clientApplicationId = self->_clientApplicationId,
          clientApplicationId == [v4 clientApplicationId]))
    {
      BOOL v37 = 1;
      goto LABEL_35;
    }
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];

  if (v5)
  {
    unint64_t v6 = [(IFTSchemaIFTClientEventMetadata *)self ifRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];

  if (v7)
  {
    unint64_t v8 = [(IFTSchemaIFTClientEventMetadata *)self ifEventId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];

  if (v9)
  {
    uint64_t v10 = [(IFTSchemaIFTClientEventMetadata *)self ifSessionId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];

  if (v11)
  {
    uint64_t v12 = [(IFTSchemaIFTClientEventMetadata *)self clientTraceId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v14 = self->_initiatedSpans;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientApplicationId
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasClientApplicationId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClientApplicationId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClientApplicationId:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int clientApplicationId = a3;
}

- (id)initiatedSpansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_initiatedSpans objectAtIndexedSubscript:a3];
}

- (unint64_t)initiatedSpansCount
{
  return [(NSArray *)self->_initiatedSpans count];
}

- (void)addInitiatedSpans:(id)a3
{
  id v4 = a3;
  initiatedSpans = self->_initiatedSpans;
  id v8 = v4;
  if (!initiatedSpans)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_initiatedSpans;
    self->_initiatedSpans = v6;

    id v4 = v8;
    initiatedSpans = self->_initiatedSpans;
  }
  [(NSArray *)initiatedSpans addObject:v4];
}

- (void)clearInitiatedSpans
{
}

- (void)deletePostingSpanId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPostingSpanId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPostingSpanId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPostingSpanId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t postingSpanId = a3;
}

- (void)deleteSender
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSender:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSender
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSender:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sender = a3;
}

- (void)deleteClientTraceId
{
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

- (void)deleteIfSessionId
{
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteIfEventId
{
}

- (BOOL)hasIfEventId
{
  return self->_ifEventId != 0;
}

- (void)deleteIfRequestId
{
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

@end