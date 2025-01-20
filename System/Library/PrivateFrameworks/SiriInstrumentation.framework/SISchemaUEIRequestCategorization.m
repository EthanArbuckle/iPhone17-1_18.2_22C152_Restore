@interface SISchemaUEIRequestCategorization
- (BOOL)hasRequestStatus;
- (BOOL)hasRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIRequestCategorization)initWithDictionary:(id)a3;
- (SISchemaUEIRequestCategorization)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)requestStatus;
- (int)requestType;
- (unint64_t)hash;
- (void)deleteRequestStatus;
- (void)deleteRequestType;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setRequestStatus:(int)a3;
- (void)setRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIRequestCategorization

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)requestStatus
{
  return self->_requestStatus;
}

- (int)requestType
{
  return self->_requestType;
}

- (SISchemaUEIRequestCategorization)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIRequestCategorization;
  v5 = [(SISchemaUEIRequestCategorization *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIRequestCategorization setRequestType:](v5, "setRequestType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIRequestCategorization setRequestStatus:](v5, "setRequestStatus:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaUEIRequestCategorization)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIRequestCategorization *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIRequestCategorization *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(SISchemaUEIRequestCategorization *)self requestStatus] - 1;
    if (v5 > 2) {
      v6 = @"UEIREQUESTSTATUS_UNKNOWN_END_REQUEST_STATUS";
    }
    else {
      v6 = off_1E5EB8798[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"requestStatus"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(SISchemaUEIRequestCategorization *)self requestType] - 1;
    if (v7 > 8) {
      v8 = @"UEIREQUESTTYPE_UNKNOWN_REQUEST_TYPE";
    }
    else {
      v8 = off_1E5EB87B0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"requestType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_requestType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_requestStatus;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $9077CB78F8E83AED54020D730E7F3C37 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int requestType = self->_requestType;
    if (requestType != [v4 requestType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $9077CB78F8E83AED54020D730E7F3C37 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int requestStatus = self->_requestStatus;
    if (requestStatus != [v4 requestStatus]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIRequestCategorizationReadFrom(self, (uint64_t)a3);
}

- (void)deleteRequestStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requestStatus = a3;
}

- (void)deleteRequestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int requestType = a3;
}

@end