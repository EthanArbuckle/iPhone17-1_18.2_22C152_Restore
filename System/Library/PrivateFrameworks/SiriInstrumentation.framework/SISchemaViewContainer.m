@interface SISchemaViewContainer
- (BOOL)hasDialogIdentifier;
- (BOOL)hasDialogPhase;
- (BOOL)hasSnippetClass;
- (BOOL)hasViewID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)dialogIdentifier;
- (NSString)dialogPhase;
- (NSString)snippetClass;
- (NSString)viewID;
- (SISchemaViewContainer)initWithDictionary:(id)a3;
- (SISchemaViewContainer)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDialogIdentifier;
- (void)deleteDialogPhase;
- (void)deleteSnippetClass;
- (void)deleteViewID;
- (void)setDialogIdentifier:(id)a3;
- (void)setDialogPhase:(id)a3;
- (void)setHasDialogIdentifier:(BOOL)a3;
- (void)setHasDialogPhase:(BOOL)a3;
- (void)setHasSnippetClass:(BOOL)a3;
- (void)setHasViewID:(BOOL)a3;
- (void)setSnippetClass:(id)a3;
- (void)setViewID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaViewContainer

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetClass, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

- (void)setHasDialogPhase:(BOOL)a3
{
  self->_hasDialogPhase = a3;
}

- (void)setHasDialogIdentifier:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (void)setHasSnippetClass:(BOOL)a3
{
  self->_hasSnippetClass = a3;
}

- (void)setHasViewID:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setDialogPhase:(id)a3
{
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (void)setDialogIdentifier:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (void)setSnippetClass:(id)a3
{
}

- (NSString)snippetClass
{
  return self->_snippetClass;
}

- (void)setViewID:(id)a3
{
}

- (NSString)viewID
{
  return self->_viewID;
}

- (SISchemaViewContainer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaViewContainer;
  v5 = [(SISchemaViewContainer *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaViewContainer *)v5 setViewID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"snippetClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaViewContainer *)v5 setSnippetClass:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dialogIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SISchemaViewContainer *)v5 setDialogIdentifier:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"dialogPhase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(SISchemaViewContainer *)v5 setDialogPhase:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (SISchemaViewContainer)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaViewContainer *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaViewContainer *)self dictionaryRepresentation];
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
  if (self->_dialogIdentifier)
  {
    id v4 = [(SISchemaViewContainer *)self dialogIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"dialogIdentifier"];
  }
  if (self->_dialogPhase)
  {
    v6 = [(SISchemaViewContainer *)self dialogPhase];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"dialogPhase"];
  }
  if (self->_snippetClass)
  {
    v8 = [(SISchemaViewContainer *)self snippetClass];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"snippetClass"];
  }
  if (self->_viewID)
  {
    v10 = [(SISchemaViewContainer *)self viewID];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"viewID"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_viewID hash];
  NSUInteger v4 = [(NSString *)self->_snippetClass hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_dialogIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_dialogPhase hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(SISchemaViewContainer *)self viewID];
  v6 = [v4 viewID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(SISchemaViewContainer *)self viewID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaViewContainer *)self viewID];
    v10 = [v4 viewID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaViewContainer *)self snippetClass];
  v6 = [v4 snippetClass];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(SISchemaViewContainer *)self snippetClass];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaViewContainer *)self snippetClass];
    v15 = [v4 snippetClass];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaViewContainer *)self dialogIdentifier];
  v6 = [v4 dialogIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(SISchemaViewContainer *)self dialogIdentifier];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaViewContainer *)self dialogIdentifier];
    v20 = [v4 dialogIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaViewContainer *)self dialogPhase];
  v6 = [v4 dialogPhase];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(SISchemaViewContainer *)self dialogPhase];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(SISchemaViewContainer *)self dialogPhase];
    v25 = [v4 dialogPhase];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(SISchemaViewContainer *)self viewID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(SISchemaViewContainer *)self snippetClass];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(SISchemaViewContainer *)self dialogIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SISchemaViewContainer *)self dialogPhase];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaViewContainerReadFrom(self, (uint64_t)a3);
}

- (void)deleteDialogPhase
{
}

- (BOOL)hasDialogPhase
{
  return self->_dialogPhase != 0;
}

- (void)deleteDialogIdentifier
{
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

- (void)deleteSnippetClass
{
}

- (BOOL)hasSnippetClass
{
  return self->_snippetClass != 0;
}

- (void)deleteViewID
{
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

@end