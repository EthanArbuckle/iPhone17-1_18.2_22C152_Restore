@interface SISchemaUUFRSaid
- (BOOL)hasAceViewClass;
- (BOOL)hasAceViewID;
- (BOOL)hasDialogIdentifier;
- (BOOL)hasResponseCategory;
- (BOOL)hasSiriResponseContext;
- (BOOL)hasSonicResponse;
- (BOOL)hasSubRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)aceViewClass;
- (NSString)aceViewID;
- (NSString)dialogIdentifier;
- (SISchemaSiriResponseContext)siriResponseContext;
- (SISchemaUUFRSaid)initWithDictionary:(id)a3;
- (SISchemaUUFRSaid)initWithJSON:(id)a3;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)responseCategory;
- (int)sonicResponse;
- (unint64_t)hash;
- (void)deleteAceViewClass;
- (void)deleteAceViewID;
- (void)deleteDialogIdentifier;
- (void)deleteResponseCategory;
- (void)deleteSiriResponseContext;
- (void)deleteSonicResponse;
- (void)deleteSubRequestId;
- (void)setAceViewClass:(id)a3;
- (void)setAceViewID:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setHasAceViewClass:(BOOL)a3;
- (void)setHasAceViewID:(BOOL)a3;
- (void)setHasDialogIdentifier:(BOOL)a3;
- (void)setHasResponseCategory:(BOOL)a3;
- (void)setHasSiriResponseContext:(BOOL)a3;
- (void)setHasSonicResponse:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setResponseCategory:(int)a3;
- (void)setSiriResponseContext:(id)a3;
- (void)setSonicResponse:(int)a3;
- (void)setSubRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRSaid

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRSaid;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(SISchemaUUFRSaid *)self deleteDialogIdentifier];
  }
  v6 = [(SISchemaUUFRSaid *)self siriResponseContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUUFRSaid *)self deleteSiriResponseContext];
  }
  v9 = [(SISchemaUUFRSaid *)self subRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUUFRSaid *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_aceViewClass, 0);
  objc_storeStrong((id *)&self->_aceViewID, 0);
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSiriResponseContext = a3;
}

- (void)setHasAceViewClass:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (void)setHasAceViewID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDialogIdentifier:(BOOL)a3
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

- (int)responseCategory
{
  return self->_responseCategory;
}

- (int)sonicResponse
{
  return self->_sonicResponse;
}

- (void)setAceViewClass:(id)a3
{
}

- (NSString)aceViewClass
{
  return self->_aceViewClass;
}

- (void)setAceViewID:(id)a3
{
}

- (NSString)aceViewID
{
  return self->_aceViewID;
}

- (void)setSiriResponseContext:(id)a3
{
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setDialogIdentifier:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (SISchemaUUFRSaid)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaUUFRSaid;
  v5 = [(SISchemaUUFRSaid *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dialogIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaUUFRSaid *)v5 setDialogIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriResponseContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaSiriResponseContext alloc] initWithDictionary:v8];
      [(SISchemaUUFRSaid *)v5 setSiriResponseContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"aceViewID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(SISchemaUUFRSaid *)v5 setAceViewID:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"aceViewClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(SISchemaUUFRSaid *)v5 setAceViewClass:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"sonicResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRSaid setSonicResponse:](v5, "setSonicResponse:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"responseCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRSaid setResponseCategory:](v5, "setResponseCategory:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(SISchemaUUFRSaid *)v5 setSubRequestId:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (SISchemaUUFRSaid)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRSaid *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRSaid *)self dictionaryRepresentation];
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
  if (self->_aceViewClass)
  {
    id v4 = [(SISchemaUUFRSaid *)self aceViewClass];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceViewClass"];
  }
  if (self->_aceViewID)
  {
    v6 = [(SISchemaUUFRSaid *)self aceViewID];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"aceViewID"];
  }
  if (self->_dialogIdentifier)
  {
    int v8 = [(SISchemaUUFRSaid *)self dialogIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"dialogIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v10 = [(SISchemaUUFRSaid *)self responseCategory] - 1;
    if (v10 > 0xC) {
      int v11 = @"RESPONSECATEGORY_UNKNOWN";
    }
    else {
      int v11 = off_1E5EB8C50[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"responseCategory"];
  }
  if (self->_siriResponseContext)
  {
    v12 = [(SISchemaUUFRSaid *)self siriResponseContext];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"siriResponseContext"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"siriResponseContext"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v15 = [(SISchemaUUFRSaid *)self sonicResponse] - 1;
    if (v15 > 3) {
      v16 = @"UEISONICRESPONSE_UNKNOWN";
    }
    else {
      v16 = off_1E5EB8CB8[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"sonicResponse"];
  }
  if (self->_subRequestId)
  {
    v17 = [(SISchemaUUFRSaid *)self subRequestId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"subRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dialogIdentifier hash];
  unint64_t v4 = [(SISchemaSiriResponseContext *)self->_siriResponseContext hash];
  NSUInteger v5 = [(NSString *)self->_aceViewID hash];
  NSUInteger v6 = [(NSString *)self->_aceViewClass hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_sonicResponse;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(SISchemaUUID *)self->_subRequestId hash];
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_responseCategory;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self dialogIdentifier];
  NSUInteger v6 = [v4 dialogIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(SISchemaUUFRSaid *)self dialogIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(SISchemaUUFRSaid *)self dialogIdentifier];
    unsigned int v10 = [v4 dialogIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self siriResponseContext];
  NSUInteger v6 = [v4 siriResponseContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(SISchemaUUFRSaid *)self siriResponseContext];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaUUFRSaid *)self siriResponseContext];
    unsigned int v15 = [v4 siriResponseContext];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self aceViewID];
  NSUInteger v6 = [v4 aceViewID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v17 = [(SISchemaUUFRSaid *)self aceViewID];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaUUFRSaid *)self aceViewID];
    objc_super v20 = [v4 aceViewID];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self aceViewClass];
  NSUInteger v6 = [v4 aceViewClass];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(SISchemaUUFRSaid *)self aceViewClass];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(SISchemaUUFRSaid *)self aceViewClass];
    v25 = [v4 aceViewClass];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  $9311C121FD5B727C6808945B96CF5D73 has = self->_has;
  unsigned int v28 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v28 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int sonicResponse = self->_sonicResponse;
    if (sonicResponse != [v4 sonicResponse]) {
      goto LABEL_34;
    }
    $9311C121FD5B727C6808945B96CF5D73 has = self->_has;
    unsigned int v28 = v4[56];
  }
  int v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v30)
  {
    int responseCategory = self->_responseCategory;
    if (responseCategory != [v4 responseCategory]) {
      goto LABEL_34;
    }
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self subRequestId];
  NSUInteger v6 = [v4 subRequestId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v32 = [(SISchemaUUFRSaid *)self subRequestId];
  if (!v32)
  {

LABEL_37:
    BOOL v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  v34 = [(SISchemaUUFRSaid *)self subRequestId];
  v35 = [v4 subRequestId];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_37;
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(SISchemaUUFRSaid *)self dialogIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(SISchemaUUFRSaid *)self siriResponseContext];

  if (v5)
  {
    NSUInteger v6 = [(SISchemaUUFRSaid *)self siriResponseContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(SISchemaUUFRSaid *)self aceViewID];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = [(SISchemaUUFRSaid *)self aceViewClass];

  if (v8) {
    PBDataWriterWriteStringField();
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
  unsigned int v10 = [(SISchemaUUFRSaid *)self subRequestId];

  int v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(SISchemaUUFRSaid *)self subRequestId];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRSaidReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteResponseCategory
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int responseCategory = a3;
}

- (void)deleteSonicResponse
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSonicResponse:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSonicResponse
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSonicResponse:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sonicResponse = a3;
}

- (void)deleteAceViewClass
{
}

- (BOOL)hasAceViewClass
{
  return self->_aceViewClass != 0;
}

- (void)deleteAceViewID
{
}

- (BOOL)hasAceViewID
{
  return self->_aceViewID != 0;
}

- (void)deleteSiriResponseContext
{
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (void)deleteDialogIdentifier
{
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

@end