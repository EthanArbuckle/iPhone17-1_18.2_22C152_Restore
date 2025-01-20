@interface SISchemaTRPRequestLink
- (BOOL)hasRequestId;
- (BOOL)hasSource;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaTRPRequestLink)initWithDictionary:(id)a3;
- (SISchemaTRPRequestLink)initWithJSON:(id)a3;
- (SISchemaUUID)requestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (int)source;
- (unint64_t)hash;
- (void)deleteRequestId;
- (void)deleteSource;
- (void)deleteTrpId;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setSource:(int)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaTRPRequestLink

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaTRPRequestLink;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaTRPRequestLink *)self trpId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaTRPRequestLink *)self deleteTrpId];
  }
  v9 = [(SISchemaTRPRequestLink *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaTRPRequestLink *)self deleteRequestId];
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
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
}

- (void)setHasRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (SISchemaTRPRequestLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaTRPRequestLink;
  v5 = [(SISchemaTRPRequestLink *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaTRPRequestLink *)v5 setTrpId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(SISchemaTRPRequestLink *)v5 setRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaTRPRequestLink setSource:](v5, "setSource:", [v10 intValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (SISchemaTRPRequestLink)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaTRPRequestLink *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaTRPRequestLink *)self dictionaryRepresentation];
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
  if (self->_requestId)
  {
    id v4 = [(SISchemaTRPRequestLink *)self requestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"requestId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v7 = [(SISchemaTRPRequestLink *)self source];
    int v8 = @"TRPREQUESTLINKSOURCE_UNKNOWN";
    if (v7 == 1) {
      int v8 = @"TRPREQUESTLINKSOURCE_TURN_TAKING_MANAGER";
    }
    if (v7 == 2) {
      v9 = @"TRPREQUESTLINKSOURCE_CORE_SPEECH";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"source"];
  }
  if (self->_trpId)
  {
    v10 = [(SISchemaTRPRequestLink *)self trpId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_trpId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_requestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_source;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaTRPRequestLink *)self trpId];
  v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaTRPRequestLink *)self trpId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaTRPRequestLink *)self trpId];
    v10 = [v4 trpId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaTRPRequestLink *)self requestId];
  v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaTRPRequestLink *)self requestId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaTRPRequestLink *)self requestId];
    v15 = [v4 requestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int source = self->_source, source == [v4 source]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(SISchemaTRPRequestLink *)self trpId];

  if (v4)
  {
    uint64_t v5 = [(SISchemaTRPRequestLink *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaTRPRequestLink *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(SISchemaTRPRequestLink *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTRPRequestLinkReadFrom(self, (uint64_t)a3);
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int source = a3;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.siri.common.TRPRequestLink";
}

- (int)getAnyEventType
{
  return 71;
}

@end