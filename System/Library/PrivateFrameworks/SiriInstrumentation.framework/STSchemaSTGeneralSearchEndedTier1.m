@interface STSchemaSTGeneralSearchEndedTier1
- (BOOL)hasCatId;
- (BOOL)hasLinkId;
- (BOOL)hasStaticDialogId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)catId;
- (NSString)staticDialogId;
- (SISchemaUUID)linkId;
- (STSchemaSTGeneralSearchEndedTier1)initWithDictionary:(id)a3;
- (STSchemaSTGeneralSearchEndedTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCatId;
- (void)deleteLinkId;
- (void)deleteStaticDialogId;
- (void)setCatId:(id)a3;
- (void)setHasCatId:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasStaticDialogId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setStaticDialogId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTGeneralSearchEndedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSchemaSTGeneralSearchEndedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteCatId];
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:4])
  {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteCatId];
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:5])
  {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteCatId];
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:6])
  {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteCatId];
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:7])
  {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteCatId];
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteStaticDialogId];
  }
  v6 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTGeneralSearchEndedTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_staticDialogId, 0);
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasStaticDialogId:(BOOL)a3
{
  self->_hasStaticDialogId = a3;
}

- (void)setHasCatId:(BOOL)a3
{
  self->_hasCatId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setStaticDialogId:(id)a3
{
}

- (NSString)staticDialogId
{
  return self->_staticDialogId;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (STSchemaSTGeneralSearchEndedTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSchemaSTGeneralSearchEndedTier1;
  v5 = [(STSchemaSTGeneralSearchEndedTier1 *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(STSchemaSTGeneralSearchEndedTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"catId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(STSchemaSTGeneralSearchEndedTier1 *)v5 setCatId:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"staticDialogId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(STSchemaSTGeneralSearchEndedTier1 *)v5 setStaticDialogId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (STSchemaSTGeneralSearchEndedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTGeneralSearchEndedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTGeneralSearchEndedTier1 *)self dictionaryRepresentation];
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
  if (self->_catId)
  {
    id v4 = [(STSchemaSTGeneralSearchEndedTier1 *)self catId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"catId"];
  }
  if (self->_linkId)
  {
    v6 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_staticDialogId)
  {
    v9 = [(STSchemaSTGeneralSearchEndedTier1 *)self staticDialogId];
    objc_super v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"staticDialogId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_catId hash] ^ v3;
  return v4 ^ [(NSString *)self->_staticDialogId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
    objc_super v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(STSchemaSTGeneralSearchEndedTier1 *)self catId];
  v6 = [v4 catId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(STSchemaSTGeneralSearchEndedTier1 *)self catId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(STSchemaSTGeneralSearchEndedTier1 *)self catId];
    v15 = [v4 catId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(STSchemaSTGeneralSearchEndedTier1 *)self staticDialogId];
  v6 = [v4 staticDialogId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(STSchemaSTGeneralSearchEndedTier1 *)self staticDialogId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(STSchemaSTGeneralSearchEndedTier1 *)self staticDialogId];
    v20 = [v4 staticDialogId];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];

  if (v4)
  {
    v5 = [(STSchemaSTGeneralSearchEndedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(STSchemaSTGeneralSearchEndedTier1 *)self catId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(STSchemaSTGeneralSearchEndedTier1 *)self staticDialogId];

  int v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    int v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTGeneralSearchEndedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteStaticDialogId
{
}

- (BOOL)hasStaticDialogId
{
  return self->_staticDialogId != 0;
}

- (void)deleteCatId
{
}

- (BOOL)hasCatId
{
  return self->_catId != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end