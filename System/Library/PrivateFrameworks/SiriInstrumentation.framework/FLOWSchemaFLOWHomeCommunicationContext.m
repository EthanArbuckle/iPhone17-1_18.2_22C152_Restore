@interface FLOWSchemaFLOWHomeCommunicationContext
- (BOOL)hasHomeContext;
- (BOOL)hasSendOrReplyContext;
- (BOOL)hasTaskType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeCommunicationContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeCommunicationContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWHomeCommunicationSendOrReply)sendOrReplyContext;
- (FLOWSchemaFLOWHomeContext)homeContext;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)whichTaskcontext;
- (void)deleteHomeContext;
- (void)deleteSendOrReplyContext;
- (void)deleteTaskType;
- (void)setHasHomeContext:(BOOL)a3;
- (void)setHasSendOrReplyContext:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setHomeContext:(id)a3;
- (void)setSendOrReplyContext:(id)a3;
- (void)setTaskType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeCommunicationContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWHomeCommunicationContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWHomeCommunicationContext *)self deleteHomeContext];
  }
  v9 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWHomeCommunicationContext *)self deleteSendOrReplyContext];
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
  objc_storeStrong((id *)&self->_sendOrReplyContext, 0);
  objc_storeStrong((id *)&self->_homeContext, 0);
}

- (void)setHasSendOrReplyContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasSendOrReplyContext
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasHomeContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)taskType
{
  return self->_taskType;
}

- (void)setHomeContext:(id)a3
{
}

- (FLOWSchemaFLOWHomeContext)homeContext
{
  return self->_homeContext;
}

- (unint64_t)whichTaskcontext
{
  return self->_whichTaskcontext;
}

- (FLOWSchemaFLOWHomeCommunicationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWHomeCommunicationContext;
  v5 = [(FLOWSchemaFLOWHomeCommunicationContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWHomeContext alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWHomeCommunicationContext *)v5 setHomeContext:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"taskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeCommunicationContext setTaskType:](v5, "setTaskType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"sendOrReplyContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[FLOWSchemaFLOWHomeCommunicationSendOrReply alloc] initWithDictionary:v9];
      [(FLOWSchemaFLOWHomeCommunicationContext *)v5 setSendOrReplyContext:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeCommunicationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeCommunicationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeCommunicationContext *)self dictionaryRepresentation];
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
  if (self->_homeContext)
  {
    id v4 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"homeContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"homeContext"];
    }
  }
  if (self->_sendOrReplyContext)
  {
    uint64_t v7 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"sendOrReplyContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"sendOrReplyContext"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = [(FLOWSchemaFLOWHomeCommunicationContext *)self taskType] - 1;
    if (v10 > 3) {
      int v11 = @"FLOWHOMECOMMUNICATIONTASKTYPE_UNKNOWN";
    }
    else {
      int v11 = off_1E5EAED40[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"taskType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWHomeContext *)self->_homeContext hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_taskType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(FLOWSchemaFLOWHomeCommunicationSendOrReply *)self->_sendOrReplyContext hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  unint64_t whichTaskcontext = self->_whichTaskcontext;
  if (whichTaskcontext != [v4 whichTaskcontext]) {
    goto LABEL_16;
  }
  v6 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
  uint64_t v7 = [v4 homeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_15;
  }
  uint64_t v8 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
  if (v8)
  {
    v9 = (void *)v8;
    unsigned int v10 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
    int v11 = [v4 homeContext];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    int taskType = self->_taskType;
    if (taskType != [v4 taskType]) {
      goto LABEL_16;
    }
  }
  v6 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
  uint64_t v7 = [v4 sendOrReplyContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v14 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
    v17 = [v4 sendOrReplyContext];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];

  if (v4)
  {
    v5 = [(FLOWSchemaFLOWHomeCommunicationContext *)self homeContext];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(FLOWSchemaFLOWHomeCommunicationContext *)self sendOrReplyContext];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeCommunicationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSendOrReplyContext
{
  if (self->_whichTaskcontext == 3)
  {
    self->_unint64_t whichTaskcontext = 0;
    self->_sendOrReplyContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWHomeCommunicationSendOrReply)sendOrReplyContext
{
  if (self->_whichTaskcontext == 3) {
    v2 = self->_sendOrReplyContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSendOrReplyContext:(id)a3
{
  unint64_t v3 = 3;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichTaskcontext = v3;
  objc_storeStrong((id *)&self->_sendOrReplyContext, a3);
}

- (void)deleteTaskType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int taskType = a3;
}

- (void)deleteHomeContext
{
}

- (BOOL)hasHomeContext
{
  return self->_homeContext != 0;
}

@end