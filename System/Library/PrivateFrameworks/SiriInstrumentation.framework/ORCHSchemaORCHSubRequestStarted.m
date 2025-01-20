@interface ORCHSchemaORCHSubRequestStarted
- (BOOL)hasGenAIMetadata;
- (BOOL)hasSubRequestType;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHNLRouterDecisionGenAIMetadata)genAIMetadata;
- (ORCHSchemaORCHSubRequestStarted)initWithDictionary:(id)a3;
- (ORCHSchemaORCHSubRequestStarted)initWithJSON:(id)a3;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)subRequestType;
- (unint64_t)hash;
- (void)deleteGenAIMetadata;
- (void)deleteSubRequestType;
- (void)deleteTrpId;
- (void)setGenAIMetadata:(id)a3;
- (void)setHasGenAIMetadata:(BOOL)a3;
- (void)setHasSubRequestType:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setSubRequestType:(int)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHSubRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHSubRequestStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHSubRequestStarted *)self deleteTrpId];
  }
  v9 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHSubRequestStarted *)self deleteGenAIMetadata];
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
  objc_storeStrong((id *)&self->_genAIMetadata, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
}

- (void)setHasGenAIMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setGenAIMetadata:(id)a3
{
}

- (ORCHSchemaORCHNLRouterDecisionGenAIMetadata)genAIMetadata
{
  return self->_genAIMetadata;
}

- (int)subRequestType
{
  return self->_subRequestType;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (ORCHSchemaORCHSubRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHSubRequestStarted;
  v5 = [(ORCHSchemaORCHSubRequestStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHSubRequestStarted *)v5 setTrpId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"subRequestType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHSubRequestStarted setSubRequestType:](v5, "setSubRequestType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"genAIMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[ORCHSchemaORCHNLRouterDecisionGenAIMetadata alloc] initWithDictionary:v9];
      [(ORCHSchemaORCHSubRequestStarted *)v5 setGenAIMetadata:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHSubRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHSubRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHSubRequestStarted *)self dictionaryRepresentation];
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
  if (self->_genAIMetadata)
  {
    id v4 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"genAIMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"genAIMetadata"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(ORCHSchemaORCHSubRequestStarted *)self subRequestType] - 1;
    if (v7 > 0xA) {
      int v8 = @"SUBREQUESTTYPE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EBDD00[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"subRequestType"];
  }
  if (self->_trpId)
  {
    v9 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"trpId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_trpId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_subRequestType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(ORCHSchemaORCHNLRouterDecisionGenAIMetadata *)self->_genAIMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
  v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
    v10 = [v4 trpId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int subRequestType = self->_subRequestType;
    if (subRequestType != [v4 subRequestType]) {
      goto LABEL_15;
    }
  }
  v5 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
  v6 = [v4 genAIMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
    v16 = [v4 genAIMetadata];
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
  uint64_t v4 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];

  if (v4)
  {
    v5 = [(ORCHSchemaORCHSubRequestStarted *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(ORCHSchemaORCHSubRequestStarted *)self genAIMetadata];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHSubRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteGenAIMetadata
{
}

- (BOOL)hasGenAIMetadata
{
  return self->_genAIMetadata != 0;
}

- (void)deleteSubRequestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSubRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubRequestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSubRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int subRequestType = a3;
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

@end