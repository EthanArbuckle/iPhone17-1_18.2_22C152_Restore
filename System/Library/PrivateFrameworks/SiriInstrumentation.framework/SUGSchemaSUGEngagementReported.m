@interface SUGSchemaSUGEngagementReported
- (BOOL)hasInteraction;
- (BOOL)hasPerformedTimeSince1970InMs;
- (BOOL)hasUserStatistics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SUGSchemaSUGEngagementReported)initWithDictionary:(id)a3;
- (SUGSchemaSUGEngagementReported)initWithJSON:(id)a3;
- (SUGSchemaSUGInteraction)interaction;
- (SUGSchemaSUGUserStatistics)userStatistics;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)performedTimeSince1970InMs;
- (void)deleteInteraction;
- (void)deletePerformedTimeSince1970InMs;
- (void)deleteUserStatistics;
- (void)setHasInteraction:(BOOL)a3;
- (void)setHasPerformedTimeSince1970InMs:(BOOL)a3;
- (void)setHasUserStatistics:(BOOL)a3;
- (void)setInteraction:(id)a3;
- (void)setPerformedTimeSince1970InMs:(unint64_t)a3;
- (void)setUserStatistics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGEngagementReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUGSchemaSUGEngagementReported;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SUGSchemaSUGEngagementReported *)self deleteUserStatistics];
  }
  v9 = [(SUGSchemaSUGEngagementReported *)self interaction];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SUGSchemaSUGEngagementReported *)self deleteInteraction];
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
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_userStatistics, 0);
}

- (void)setHasInteraction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasUserStatistics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setInteraction:(id)a3
{
}

- (SUGSchemaSUGInteraction)interaction
{
  return self->_interaction;
}

- (void)setUserStatistics:(id)a3
{
}

- (SUGSchemaSUGUserStatistics)userStatistics
{
  return self->_userStatistics;
}

- (unint64_t)performedTimeSince1970InMs
{
  return self->_performedTimeSince1970InMs;
}

- (SUGSchemaSUGEngagementReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUGSchemaSUGEngagementReported;
  v5 = [(SUGSchemaSUGEngagementReported *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"performedTimeSince1970InMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGEngagementReported setPerformedTimeSince1970InMs:](v5, "setPerformedTimeSince1970InMs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"userStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SUGSchemaSUGUserStatistics alloc] initWithDictionary:v7];
      [(SUGSchemaSUGEngagementReported *)v5 setUserStatistics:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"interaction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SUGSchemaSUGInteraction alloc] initWithDictionary:v9];
      [(SUGSchemaSUGEngagementReported *)v5 setInteraction:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (SUGSchemaSUGEngagementReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGEngagementReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGEngagementReported *)self dictionaryRepresentation];
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
  if (self->_interaction)
  {
    id v4 = [(SUGSchemaSUGEngagementReported *)self interaction];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"interaction"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"interaction"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUGSchemaSUGEngagementReported performedTimeSince1970InMs](self, "performedTimeSince1970InMs"));
    [v3 setObject:v7 forKeyedSubscript:@"performedTimeSince1970InMs"];
  }
  if (self->_userStatistics)
  {
    int v8 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"userStatistics"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"userStatistics"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_performedTimeSince1970InMs;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(SUGSchemaSUGUserStatistics *)self->_userStatistics hash] ^ v3;
  return v4 ^ [(SUGSchemaSUGInteraction *)self->_interaction hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t performedTimeSince1970InMs = self->_performedTimeSince1970InMs;
    if (performedTimeSince1970InMs != [v4 performedTimeSince1970InMs]) {
      goto LABEL_15;
    }
  }
  v6 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
  uint64_t v7 = [v4 userStatistics];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
    int v11 = [v4 userStatistics];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(SUGSchemaSUGEngagementReported *)self interaction];
  uint64_t v7 = [v4 interaction];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SUGSchemaSUGEngagementReported *)self interaction];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SUGSchemaSUGEngagementReported *)self interaction];
    v16 = [v4 interaction];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v4 = [(SUGSchemaSUGEngagementReported *)self userStatistics];

  if (v4)
  {
    v5 = [(SUGSchemaSUGEngagementReported *)self userStatistics];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SUGSchemaSUGEngagementReported *)self interaction];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(SUGSchemaSUGEngagementReported *)self interaction];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGEngagementReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteInteraction
{
}

- (BOOL)hasInteraction
{
  return self->_interaction != 0;
}

- (void)deleteUserStatistics
{
}

- (BOOL)hasUserStatistics
{
  return self->_userStatistics != 0;
}

- (void)deletePerformedTimeSince1970InMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPerformedTimeSince1970InMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPerformedTimeSince1970InMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPerformedTimeSince1970InMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t performedTimeSince1970InMs = a3;
}

@end