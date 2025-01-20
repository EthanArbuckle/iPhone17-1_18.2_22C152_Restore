@interface SISchemaUUFRSelected
- (BOOL)hasCasinoCardSelected;
- (BOOL)hasSnippetViewSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUFRCasinoCardSelected)casinoCardSelected;
- (SISchemaUUFRSelected)initWithDictionary:(id)a3;
- (SISchemaUUFRSelected)initWithJSON:(id)a3;
- (SISchemaUUFRSnippetViewSelected)snippetViewSelected;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichSelectionevent;
- (void)deleteCasinoCardSelected;
- (void)deleteSnippetViewSelected;
- (void)setCasinoCardSelected:(id)a3;
- (void)setHasCasinoCardSelected:(BOOL)a3;
- (void)setHasSnippetViewSelected:(BOOL)a3;
- (void)setSnippetViewSelected:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRSelected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRSelected;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUUFRSelected *)self casinoCardSelected];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUUFRSelected *)self deleteCasinoCardSelected];
  }
  v9 = [(SISchemaUUFRSelected *)self snippetViewSelected];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUUFRSelected *)self deleteSnippetViewSelected];
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
  objc_storeStrong((id *)&self->_snippetViewSelected, 0);
  objc_storeStrong((id *)&self->_casinoCardSelected, 0);
}

- (void)setHasSnippetViewSelected:(BOOL)a3
{
  self->_hasSnippetViewSelected = a3;
}

- (BOOL)hasSnippetViewSelected
{
  return self->_hasSnippetViewSelected;
}

- (void)setHasCasinoCardSelected:(BOOL)a3
{
  self->_hasCasinoCardSelected = a3;
}

- (BOOL)hasCasinoCardSelected
{
  return self->_hasCasinoCardSelected;
}

- (unint64_t)whichSelectionevent
{
  return self->_whichSelectionevent;
}

- (SISchemaUUFRSelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaUUFRSelected;
  v5 = [(SISchemaUUFRSelected *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"casinoCardSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUFRCasinoCardSelected alloc] initWithDictionary:v6];
      [(SISchemaUUFRSelected *)v5 setCasinoCardSelected:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"snippetViewSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUFRSnippetViewSelected alloc] initWithDictionary:v8];
      [(SISchemaUUFRSelected *)v5 setSnippetViewSelected:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaUUFRSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRSelected *)self dictionaryRepresentation];
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
  if (self->_casinoCardSelected)
  {
    id v4 = [(SISchemaUUFRSelected *)self casinoCardSelected];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"casinoCardSelected"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"casinoCardSelected"];
    }
  }
  if (self->_snippetViewSelected)
  {
    uint64_t v7 = [(SISchemaUUFRSelected *)self snippetViewSelected];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"snippetViewSelected"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"snippetViewSelected"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUFRCasinoCardSelected *)self->_casinoCardSelected hash];
  return [(SISchemaUUFRSnippetViewSelected *)self->_snippetViewSelected hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichSelectionevent = self->_whichSelectionevent;
  if (whichSelectionevent != [v4 whichSelectionevent]) {
    goto LABEL_13;
  }
  v6 = [(SISchemaUUFRSelected *)self casinoCardSelected];
  uint64_t v7 = [v4 casinoCardSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(SISchemaUUFRSelected *)self casinoCardSelected];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaUUFRSelected *)self casinoCardSelected];
    int v11 = [v4 casinoCardSelected];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUUFRSelected *)self snippetViewSelected];
  uint64_t v7 = [v4 snippetViewSelected];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SISchemaUUFRSelected *)self snippetViewSelected];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(SISchemaUUFRSelected *)self snippetViewSelected];
    v16 = [v4 snippetViewSelected];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(SISchemaUUFRSelected *)self casinoCardSelected];

  if (v4)
  {
    v5 = [(SISchemaUUFRSelected *)self casinoCardSelected];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaUUFRSelected *)self snippetViewSelected];

  if (v6)
  {
    uint64_t v7 = [(SISchemaUUFRSelected *)self snippetViewSelected];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSnippetViewSelected
{
  if (self->_whichSelectionevent == 2)
  {
    self->_unint64_t whichSelectionevent = 0;
    self->_snippetViewSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRSnippetViewSelected)snippetViewSelected
{
  if (self->_whichSelectionevent == 2) {
    v2 = self->_snippetViewSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSnippetViewSelected:(id)a3
{
  id v4 = (SISchemaUUFRSnippetViewSelected *)a3;
  casinoCardSelected = self->_casinoCardSelected;
  self->_casinoCardSelected = 0;

  self->_unint64_t whichSelectionevent = 2 * (v4 != 0);
  snippetViewSelected = self->_snippetViewSelected;
  self->_snippetViewSelected = v4;
}

- (void)deleteCasinoCardSelected
{
  if (self->_whichSelectionevent == 1)
  {
    self->_unint64_t whichSelectionevent = 0;
    self->_casinoCardSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRCasinoCardSelected)casinoCardSelected
{
  if (self->_whichSelectionevent == 1) {
    v2 = self->_casinoCardSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCasinoCardSelected:(id)a3
{
  id v4 = (SISchemaUUFRCasinoCardSelected *)a3;
  snippetViewSelected = self->_snippetViewSelected;
  self->_snippetViewSelected = 0;

  self->_unint64_t whichSelectionevent = v4 != 0;
  casinoCardSelected = self->_casinoCardSelected;
  self->_casinoCardSelected = v4;
}

@end