@interface RGSiriSchemaRGRequestEndedTier1
- (BOOL)hasCatId;
- (BOOL)hasDisplayString;
- (BOOL)hasLinkId;
- (BOOL)hasSpokenString;
- (BOOL)hasStaticDialogId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)catId;
- (NSString)displayString;
- (NSString)spokenString;
- (NSString)staticDialogId;
- (RGSiriSchemaRGRequestEndedTier1)initWithDictionary:(id)a3;
- (RGSiriSchemaRGRequestEndedTier1)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCatId;
- (void)deleteDisplayString;
- (void)deleteLinkId;
- (void)deleteSpokenString;
- (void)deleteStaticDialogId;
- (void)setCatId:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setHasCatId:(BOOL)a3;
- (void)setHasDisplayString:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasSpokenString:(BOOL)a3;
- (void)setHasStaticDialogId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setSpokenString:(id)a3;
- (void)setStaticDialogId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGRequestEndedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RGSiriSchemaRGRequestEndedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteDisplayString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteSpokenString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteCatId];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:4])
  {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteDisplayString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteSpokenString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteCatId];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:5])
  {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteDisplayString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteSpokenString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteCatId];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:6])
  {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteDisplayString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteSpokenString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteCatId];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteStaticDialogId];
  }
  if ([v4 isConditionSet:7])
  {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteDisplayString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteSpokenString];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteCatId];
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteStaticDialogId];
  }
  v6 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RGSiriSchemaRGRequestEndedTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
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

- (void)setHasSpokenString:(BOOL)a3
{
  self->_hasSpokenString = a3;
}

- (void)setHasDisplayString:(BOOL)a3
{
  self->_hasDisplayString = a3;
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

- (void)setSpokenString:(id)a3
{
}

- (NSString)spokenString
{
  return self->_spokenString;
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (RGSiriSchemaRGRequestEndedTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RGSiriSchemaRGRequestEndedTier1;
  v5 = [(RGSiriSchemaRGRequestEndedTier1 *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(RGSiriSchemaRGRequestEndedTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"displayString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(RGSiriSchemaRGRequestEndedTier1 *)v5 setDisplayString:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"spokenString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(RGSiriSchemaRGRequestEndedTier1 *)v5 setSpokenString:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"catId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(RGSiriSchemaRGRequestEndedTier1 *)v5 setCatId:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"staticDialogId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(RGSiriSchemaRGRequestEndedTier1 *)v5 setStaticDialogId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGRequestEndedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGRequestEndedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGRequestEndedTier1 *)self dictionaryRepresentation];
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
    id v4 = [(RGSiriSchemaRGRequestEndedTier1 *)self catId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"catId"];
  }
  if (self->_displayString)
  {
    v6 = [(RGSiriSchemaRGRequestEndedTier1 *)self displayString];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"displayString"];
  }
  if (self->_linkId)
  {
    int v8 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
    else
    {
      objc_super v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_spokenString)
  {
    v11 = [(RGSiriSchemaRGRequestEndedTier1 *)self spokenString];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"spokenString"];
  }
  if (self->_staticDialogId)
  {
    v13 = [(RGSiriSchemaRGRequestEndedTier1 *)self staticDialogId];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"staticDialogId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_displayString hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_spokenString hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_catId hash];
  return v6 ^ [(NSString *)self->_staticDialogId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
  NSUInteger v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
    objc_super v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self displayString];
  NSUInteger v6 = [v4 displayString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(RGSiriSchemaRGRequestEndedTier1 *)self displayString];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(RGSiriSchemaRGRequestEndedTier1 *)self displayString];
    v15 = [v4 displayString];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self spokenString];
  NSUInteger v6 = [v4 spokenString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(RGSiriSchemaRGRequestEndedTier1 *)self spokenString];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(RGSiriSchemaRGRequestEndedTier1 *)self spokenString];
    v20 = [v4 spokenString];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self catId];
  NSUInteger v6 = [v4 catId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(RGSiriSchemaRGRequestEndedTier1 *)self catId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(RGSiriSchemaRGRequestEndedTier1 *)self catId];
    v25 = [v4 catId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self staticDialogId];
  NSUInteger v6 = [v4 staticDialogId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(RGSiriSchemaRGRequestEndedTier1 *)self staticDialogId];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(RGSiriSchemaRGRequestEndedTier1 *)self staticDialogId];
    v30 = [v4 staticDialogId];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];

  if (v4)
  {
    NSUInteger v5 = [(RGSiriSchemaRGRequestEndedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(RGSiriSchemaRGRequestEndedTier1 *)self displayString];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(RGSiriSchemaRGRequestEndedTier1 *)self spokenString];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(RGSiriSchemaRGRequestEndedTier1 *)self catId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(RGSiriSchemaRGRequestEndedTier1 *)self staticDialogId];

  objc_super v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    objc_super v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGRequestEndedTier1ReadFrom(self, (uint64_t)a3);
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

- (void)deleteSpokenString
{
}

- (BOOL)hasSpokenString
{
  return self->_spokenString != 0;
}

- (void)deleteDisplayString
{
}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end