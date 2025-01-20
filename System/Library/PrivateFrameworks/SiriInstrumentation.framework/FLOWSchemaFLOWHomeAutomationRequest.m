@interface FLOWSchemaFLOWHomeAutomationRequest
- (BOOL)hasHomeAutomationRequestDuration;
- (BOOL)hasHomeAutomationRequestId;
- (BOOL)hasHomeAutomationRequestMetadata;
- (BOOL)hasHomeAutomationRequestOutcome;
- (BOOL)hasHomeAutomationRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeAutomationRequest)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeAutomationRequest)initWithJSON:(id)a3;
- (FLOWSchemaFLOWHomeAutomationRequestMetadata)homeAutomationRequestMetadata;
- (NSArray)homeAutomationRequestErrorReasons;
- (NSData)jsonData;
- (SISchemaUUID)homeAutomationRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)homeAutomationRequestErrorReasonAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)homeAutomationRequestOutcome;
- (int)homeAutomationRequestType;
- (unint64_t)hash;
- (unint64_t)homeAutomationRequestErrorReasonCount;
- (unsigned)homeAutomationRequestDuration;
- (void)addHomeAutomationRequestErrorReason:(id)a3;
- (void)clearHomeAutomationRequestErrorReason;
- (void)deleteHomeAutomationRequestDuration;
- (void)deleteHomeAutomationRequestId;
- (void)deleteHomeAutomationRequestMetadata;
- (void)deleteHomeAutomationRequestOutcome;
- (void)deleteHomeAutomationRequestType;
- (void)setHasHomeAutomationRequestDuration:(BOOL)a3;
- (void)setHasHomeAutomationRequestId:(BOOL)a3;
- (void)setHasHomeAutomationRequestMetadata:(BOOL)a3;
- (void)setHasHomeAutomationRequestOutcome:(BOOL)a3;
- (void)setHasHomeAutomationRequestType:(BOOL)a3;
- (void)setHomeAutomationRequestDuration:(unsigned int)a3;
- (void)setHomeAutomationRequestErrorReasons:(id)a3;
- (void)setHomeAutomationRequestId:(id)a3;
- (void)setHomeAutomationRequestMetadata:(id)a3;
- (void)setHomeAutomationRequestOutcome:(int)a3;
- (void)setHomeAutomationRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeAutomationRequest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequest;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWHomeAutomationRequest *)self deleteHomeAutomationRequestId];
  }
  v9 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWHomeAutomationRequest *)self deleteHomeAutomationRequestMetadata];
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
  objc_storeStrong((id *)&self->_homeAutomationRequestMetadata, 0);
  objc_storeStrong((id *)&self->_homeAutomationRequestErrorReasons, 0);
  objc_storeStrong((id *)&self->_homeAutomationRequestId, 0);
}

- (void)setHasHomeAutomationRequestMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasHomeAutomationRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHomeAutomationRequestMetadata:(id)a3
{
}

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)homeAutomationRequestMetadata
{
  return self->_homeAutomationRequestMetadata;
}

- (unsigned)homeAutomationRequestDuration
{
  return self->_homeAutomationRequestDuration;
}

- (void)setHomeAutomationRequestErrorReasons:(id)a3
{
}

- (NSArray)homeAutomationRequestErrorReasons
{
  return self->_homeAutomationRequestErrorReasons;
}

- (int)homeAutomationRequestOutcome
{
  return self->_homeAutomationRequestOutcome;
}

- (int)homeAutomationRequestType
{
  return self->_homeAutomationRequestType;
}

- (void)setHomeAutomationRequestId:(id)a3
{
}

- (SISchemaUUID)homeAutomationRequestId
{
  return self->_homeAutomationRequestId;
}

- (FLOWSchemaFLOWHomeAutomationRequest)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequest;
  v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeAutomationRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWHomeAutomationRequest *)v5 setHomeAutomationRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"homeAutomationRequestType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestType:](v5, "setHomeAutomationRequestType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"homeAutomationRequestOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestOutcome:](v5, "setHomeAutomationRequestOutcome:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"homeAutomationRequestErrorReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v8;
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = (void *)[v16 copy];
              [(FLOWSchemaFLOWHomeAutomationRequest *)v5 addHomeAutomationRequestErrorReason:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v13);
      }

      int v8 = v23;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"homeAutomationRequestDuration", v23, v24, (void)v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestDuration:](v5, "setHomeAutomationRequestDuration:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"homeAutomationRequestMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[FLOWSchemaFLOWHomeAutomationRequestMetadata alloc] initWithDictionary:v19];
      [(FLOWSchemaFLOWHomeAutomationRequest *)v5 setHomeAutomationRequestMetadata:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeAutomationRequest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeAutomationRequest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeAutomationRequest *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestDuration](self, "homeAutomationRequestDuration"));
    [v3 setObject:v4 forKeyedSubscript:@"homeAutomationRequestDuration"];
  }
  if (self->_homeAutomationRequestErrorReasons)
  {
    v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestErrorReasons];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"homeAutomationRequestErrorReason"];
  }
  if (self->_homeAutomationRequestId)
  {
    uint64_t v7 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"homeAutomationRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"homeAutomationRequestId"];
    }
  }
  if (self->_homeAutomationRequestMetadata)
  {
    v10 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
    id v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"homeAutomationRequestMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"homeAutomationRequestMetadata"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v14 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestOutcome] - 1;
    if (v14 > 2) {
      v15 = @"FLOWHOMEAUTOMATIONOUTCOME_UNKOWN";
    }
    else {
      v15 = off_1E5EAEC90[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"homeAutomationRequestOutcome"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v16 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestType] - 1;
    if (v16 > 9) {
      v17 = @"FLOWHOMEAUTOMATIONREQUESTTYPE_UNKNOWN";
    }
    else {
      v17 = off_1E5EAECA8[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"homeAutomationRequestType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_homeAutomationRequestId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_homeAutomationRequestType;
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
      uint64_t v5 = 2654435761 * self->_homeAutomationRequestOutcome;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = [(NSArray *)self->_homeAutomationRequestErrorReasons hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_homeAutomationRequestDuration;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(FLOWSchemaFLOWHomeAutomationRequestMetadata *)self->_homeAutomationRequestMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
  uint64_t v6 = [v4 homeAutomationRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
    v10 = [v4 homeAutomationRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $6C85C94BF71D36A64792A0F9B00A6C18 has = self->_has;
  unsigned int v13 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int homeAutomationRequestType = self->_homeAutomationRequestType;
    if (homeAutomationRequestType != [v4 homeAutomationRequestType]) {
      goto LABEL_27;
    }
    $6C85C94BF71D36A64792A0F9B00A6C18 has = self->_has;
    unsigned int v13 = v4[48];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    int homeAutomationRequestOutcome = self->_homeAutomationRequestOutcome;
    if (homeAutomationRequestOutcome != [v4 homeAutomationRequestOutcome]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestErrorReasons];
  uint64_t v6 = [v4 homeAutomationRequestErrorReasons];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestErrorReasons];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestErrorReasons];
    v20 = [v4 homeAutomationRequestErrorReasons];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  int v22 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v22 != ((v4[48] >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v22)
  {
    unsigned int homeAutomationRequestDuration = self->_homeAutomationRequestDuration;
    if (homeAutomationRequestDuration != [v4 homeAutomationRequestDuration]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
  uint64_t v6 = [v4 homeAutomationRequestMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v24 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
  if (!v24)
  {

LABEL_30:
    BOOL v29 = 1;
    goto LABEL_28;
  }
  long long v25 = (void *)v24;
  long long v26 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
  long long v27 = [v4 homeAutomationRequestMetadata];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v29 = 0;
LABEL_28:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];

  if (v5)
  {
    uint64_t v6 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestId];
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
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = self->_homeAutomationRequestErrorReasons;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  unsigned int v13 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];

  if (v13)
  {
    unsigned int v14 = [(FLOWSchemaFLOWHomeAutomationRequest *)self homeAutomationRequestMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationRequestReadFrom(self, (uint64_t)a3);
}

- (void)deleteHomeAutomationRequestMetadata
{
}

- (BOOL)hasHomeAutomationRequestMetadata
{
  return self->_homeAutomationRequestMetadata != 0;
}

- (void)deleteHomeAutomationRequestDuration
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHomeAutomationRequestDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeAutomationRequestDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHomeAutomationRequestDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int homeAutomationRequestDuration = a3;
}

- (id)homeAutomationRequestErrorReasonAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_homeAutomationRequestErrorReasons objectAtIndexedSubscript:a3];
}

- (unint64_t)homeAutomationRequestErrorReasonCount
{
  return [(NSArray *)self->_homeAutomationRequestErrorReasons count];
}

- (void)addHomeAutomationRequestErrorReason:(id)a3
{
  id v4 = a3;
  homeAutomationRequestErrorReasons = self->_homeAutomationRequestErrorReasons;
  id v8 = v4;
  if (!homeAutomationRequestErrorReasons)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_homeAutomationRequestErrorReasons;
    self->_homeAutomationRequestErrorReasons = v6;

    id v4 = v8;
    homeAutomationRequestErrorReasons = self->_homeAutomationRequestErrorReasons;
  }
  [(NSArray *)homeAutomationRequestErrorReasons addObject:v4];
}

- (void)clearHomeAutomationRequestErrorReason
{
}

- (void)deleteHomeAutomationRequestOutcome
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHomeAutomationRequestOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHomeAutomationRequestOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHomeAutomationRequestOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int homeAutomationRequestOutcome = a3;
}

- (void)deleteHomeAutomationRequestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHomeAutomationRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHomeAutomationRequestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHomeAutomationRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int homeAutomationRequestType = a3;
}

- (void)deleteHomeAutomationRequestId
{
}

- (BOOL)hasHomeAutomationRequestId
{
  return self->_homeAutomationRequestId != 0;
}

@end