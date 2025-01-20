@interface IDENTITYSchemaIDENTITYResultCandidateReceived
- (BOOL)hasIdentityScoreCard;
- (BOOL)hasIsSelected;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard;
- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIdentityScoreCard;
- (void)deleteIsSelected;
- (void)deleteResultCandidateId;
- (void)setHasIdentityScoreCard:(BOOL)a3;
- (void)setHasIsSelected:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setIdentityScoreCard:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYResultCandidateReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDENTITYSchemaIDENTITYResultCandidateReceived;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self deleteIdentityScoreCard];
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
  objc_storeStrong((id *)&self->_identityScoreCard, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
}

- (void)setHasIdentityScoreCard:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setIdentityScoreCard:(id)a3
{
}

- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard
{
  return self->_identityScoreCard;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDENTITYSchemaIDENTITYResultCandidateReceived;
  v5 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IDENTITYSchemaIDENTITYResultCandidateReceived *)v5 setResultCandidateId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYResultCandidateReceived setIsSelected:](v5, "setIsSelected:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"identityScoreCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IDENTITYSchemaIDENTITYIDScoreCard alloc] initWithDictionary:v9];
      [(IDENTITYSchemaIDENTITYResultCandidateReceived *)v5 setIdentityScoreCard:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self dictionaryRepresentation];
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
  if (self->_identityScoreCard)
  {
    id v4 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"identityScoreCard"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"identityScoreCard"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IDENTITYSchemaIDENTITYResultCandidateReceived isSelected](self, "isSelected"));
    [v3 setObject:v7 forKeyedSubscript:@"isSelected"];
  }
  if (self->_resultCandidateId)
  {
    v8 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self resultCandidateId];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isSelected;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(IDENTITYSchemaIDENTITYIDScoreCard *)self->_identityScoreCard hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self resultCandidateId];
  v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self resultCandidateId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self resultCandidateId];
    v10 = [v4 resultCandidateId];
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
    int isSelected = self->_isSelected;
    if (isSelected != [v4 isSelected]) {
      goto LABEL_15;
    }
  }
  v5 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
  v6 = [v4 identityScoreCard];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
    v16 = [v4 identityScoreCard];
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
  id v8 = a3;
  uint64_t v4 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self resultCandidateId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IDENTITYSchemaIDENTITYResultCandidateReceived *)self identityScoreCard];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYResultCandidateReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIdentityScoreCard
{
}

- (BOOL)hasIdentityScoreCard
{
  return self->_identityScoreCard != 0;
}

- (void)deleteIsSelected
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSelected
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSelected = a3;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

@end