@interface IFTSchemaASTFlatExprSearchVariant
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasIsLowConfidenceKnowledge;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidenceKnowledge;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTFlatExprSearchVariant)initWithDictionary:(id)a3;
- (IFTSchemaASTFlatExprSearchVariant)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteIsLowConfidenceKnowledge;
- (void)deleteLinkId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasIsLowConfidenceKnowledge:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setIsLowConfidenceKnowledge:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaASTFlatExprSearchVariant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaASTFlatExprSearchVariant;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaASTFlatExprSearchVariant *)self deleteLinkId];
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
}

- (void)setHasLinkId:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 2) = a3;
}

- (BOOL)isLowConfidenceKnowledge
{
  return self->_isLowConfidenceKnowledge;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaASTFlatExprSearchVariant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaASTFlatExprSearchVariant;
  v5 = [(IFTSchemaASTFlatExprSearchVariant *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprSearchVariant setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(IFTSchemaASTFlatExprSearchVariant *)v5 setLinkId:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isLowConfidenceKnowledge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprSearchVariant setIsLowConfidenceKnowledge:](v5, "setIsLowConfidenceKnowledge:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (IFTSchemaASTFlatExprSearchVariant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaASTFlatExprSearchVariant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaASTFlatExprSearchVariant *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isLowConfidenceKnowledge + 1);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTFlatExprSearchVariant exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];

    char v4 = *(&self->_isLowConfidenceKnowledge + 1);
  }
  if ((v4 & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTFlatExprSearchVariant isLowConfidenceKnowledge](self, "isLowConfidenceKnowledge"));
    [v3 setObject:v6 forKeyedSubscript:@"isLowConfidenceKnowledge"];
  }
  if (self->_linkId)
  {
    uint64_t v7 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isLowConfidenceKnowledge + 1)) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(&self->_isLowConfidenceKnowledge + 1) & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_isLowConfidenceKnowledge;
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
    goto LABEL_15;
  }
  if (*(&self->_isLowConfidenceKnowledge + 1) != (v4[25] & 1)) {
    goto LABEL_15;
  }
  if (*(&self->_isLowConfidenceKnowledge + 1))
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  v6 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
  uint64_t v7 = [v4 linkId];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
    objc_super v12 = [v4 linkId];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*((unsigned __int8 *)&self->_isLowConfidenceKnowledge + 1) >> 1) & 1;
  if (v14 != ((v4[25] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    int isLowConfidenceKnowledge = self->_isLowConfidenceKnowledge;
    if (isLowConfidenceKnowledge != [v4 isLowConfidenceKnowledge]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(&self->_isLowConfidenceKnowledge + 1)) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(IFTSchemaASTFlatExprSearchVariant *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(&self->_isLowConfidenceKnowledge + 1) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTFlatExprSearchVariantReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsLowConfidenceKnowledge
{
  *(&self->_isLowConfidenceKnowledge + 1) &= ~2u;
}

- (void)setHasIsLowConfidenceKnowledge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLowConfidenceKnowledge + 1) = *(&self->_isLowConfidenceKnowledge + 1) & 0xFD | v3;
}

- (BOOL)hasIsLowConfidenceKnowledge
{
  return (*((unsigned __int8 *)&self->_isLowConfidenceKnowledge + 1) >> 1) & 1;
}

- (void)setIsLowConfidenceKnowledge:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) |= 2u;
  self->_int isLowConfidenceKnowledge = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteExists
{
  *(&self->_isLowConfidenceKnowledge + 1) &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) = *(&self->_isLowConfidenceKnowledge + 1) & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(&self->_isLowConfidenceKnowledge + 1);
}

- (void)setExists:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledge + 1) |= 1u;
  self->_int exists = a3;
}

@end