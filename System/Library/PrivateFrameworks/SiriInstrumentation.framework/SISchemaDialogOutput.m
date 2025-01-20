@interface SISchemaDialogOutput
- (BOOL)hasDisplayedDialogOutput;
- (BOOL)hasSpokenDialogOutput;
- (BOOL)hasViewID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)viewID;
- (SISchemaDialogOutput)initWithDictionary:(id)a3;
- (SISchemaDialogOutput)initWithJSON:(id)a3;
- (SISchemaRedactableString)displayedDialogOutput;
- (SISchemaRedactableString)spokenDialogOutput;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDisplayedDialogOutput;
- (void)deleteSpokenDialogOutput;
- (void)deleteViewID;
- (void)setDisplayedDialogOutput:(id)a3;
- (void)setHasDisplayedDialogOutput:(BOOL)a3;
- (void)setHasSpokenDialogOutput:(BOOL)a3;
- (void)setHasViewID:(BOOL)a3;
- (void)setSpokenDialogOutput:(id)a3;
- (void)setViewID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDialogOutput

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDialogOutput;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDialogOutput *)self spokenDialogOutput];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaDialogOutput *)self deleteSpokenDialogOutput];
  }
  v9 = [(SISchemaDialogOutput *)self displayedDialogOutput];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaDialogOutput *)self deleteDisplayedDialogOutput];
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
  objc_storeStrong((id *)&self->_displayedDialogOutput, 0);
  objc_storeStrong((id *)&self->_spokenDialogOutput, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

- (void)setHasDisplayedDialogOutput:(BOOL)a3
{
  self->_hasDisplayedDialogOutput = a3;
}

- (void)setHasSpokenDialogOutput:(BOOL)a3
{
  self->_hasSpokenDialogOutput = a3;
}

- (void)setHasViewID:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setDisplayedDialogOutput:(id)a3
{
}

- (SISchemaRedactableString)displayedDialogOutput
{
  return self->_displayedDialogOutput;
}

- (void)setSpokenDialogOutput:(id)a3
{
}

- (SISchemaRedactableString)spokenDialogOutput
{
  return self->_spokenDialogOutput;
}

- (void)setViewID:(id)a3
{
}

- (NSString)viewID
{
  return self->_viewID;
}

- (SISchemaDialogOutput)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaDialogOutput;
  v5 = [(SISchemaDialogOutput *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaDialogOutput *)v5 setViewID:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"spokenDialogOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaRedactableString alloc] initWithDictionary:v8];
      [(SISchemaDialogOutput *)v5 setSpokenDialogOutput:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"displayedDialogOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaRedactableString alloc] initWithDictionary:v10];
      [(SISchemaDialogOutput *)v5 setDisplayedDialogOutput:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaDialogOutput)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDialogOutput *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDialogOutput *)self dictionaryRepresentation];
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
  if (self->_displayedDialogOutput)
  {
    id v4 = [(SISchemaDialogOutput *)self displayedDialogOutput];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"displayedDialogOutput"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"displayedDialogOutput"];
    }
  }
  if (self->_spokenDialogOutput)
  {
    uint64_t v7 = [(SISchemaDialogOutput *)self spokenDialogOutput];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"spokenDialogOutput"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"spokenDialogOutput"];
    }
  }
  if (self->_viewID)
  {
    v10 = [(SISchemaDialogOutput *)self viewID];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"viewID"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_viewID hash];
  unint64_t v4 = [(SISchemaRedactableString *)self->_spokenDialogOutput hash] ^ v3;
  return v4 ^ [(SISchemaRedactableString *)self->_displayedDialogOutput hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(SISchemaDialogOutput *)self viewID];
  v6 = [v4 viewID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaDialogOutput *)self viewID];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaDialogOutput *)self viewID];
    v10 = [v4 viewID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaDialogOutput *)self spokenDialogOutput];
  v6 = [v4 spokenDialogOutput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaDialogOutput *)self spokenDialogOutput];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    objc_super v14 = [(SISchemaDialogOutput *)self spokenDialogOutput];
    v15 = [v4 spokenDialogOutput];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaDialogOutput *)self displayedDialogOutput];
  v6 = [v4 displayedDialogOutput];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(SISchemaDialogOutput *)self displayedDialogOutput];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(SISchemaDialogOutput *)self displayedDialogOutput];
    v20 = [v4 displayedDialogOutput];
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
  id v4 = [(SISchemaDialogOutput *)self viewID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaDialogOutput *)self spokenDialogOutput];

  if (v5)
  {
    v6 = [(SISchemaDialogOutput *)self spokenDialogOutput];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(SISchemaDialogOutput *)self displayedDialogOutput];

  if (v7)
  {
    int v8 = [(SISchemaDialogOutput *)self displayedDialogOutput];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDialogOutputReadFrom(self, (uint64_t)a3);
}

- (void)deleteDisplayedDialogOutput
{
}

- (BOOL)hasDisplayedDialogOutput
{
  return self->_displayedDialogOutput != 0;
}

- (void)deleteSpokenDialogOutput
{
}

- (BOOL)hasSpokenDialogOutput
{
  return self->_spokenDialogOutput != 0;
}

- (void)deleteViewID
{
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

@end