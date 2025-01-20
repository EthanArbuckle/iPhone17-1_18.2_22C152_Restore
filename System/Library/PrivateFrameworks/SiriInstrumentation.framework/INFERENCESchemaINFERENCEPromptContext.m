@interface INFERENCESchemaINFERENCEPromptContext
- (BOOL)hasConfirmationPromptContext;
- (BOOL)hasDisambiguationPromptContext;
- (BOOL)hasTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEConfirmationPromptContext)confirmationPromptContext;
- (INFERENCESchemaINFERENCEDisambiguationPromptContext)disambiguationPromptContext;
- (INFERENCESchemaINFERENCEPromptContext)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEPromptContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)tag;
- (unint64_t)hash;
- (unint64_t)whichPromptcontext;
- (void)deleteConfirmationPromptContext;
- (void)deleteDisambiguationPromptContext;
- (void)deleteTag;
- (void)setConfirmationPromptContext:(id)a3;
- (void)setDisambiguationPromptContext:(id)a3;
- (void)setHasConfirmationPromptContext:(BOOL)a3;
- (void)setHasDisambiguationPromptContext:(BOOL)a3;
- (void)setHasTag:(BOOL)a3;
- (void)setTag:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEPromptContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEPromptContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEPromptContext *)self deleteConfirmationPromptContext];
  }
  v9 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEPromptContext *)self deleteDisambiguationPromptContext];
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
  objc_storeStrong((id *)&self->_disambiguationPromptContext, 0);
  objc_storeStrong((id *)&self->_confirmationPromptContext, 0);
}

- (void)setHasDisambiguationPromptContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasDisambiguationPromptContext
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasConfirmationPromptContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasConfirmationPromptContext
{
  return *((unsigned char *)&self->_has + 1);
}

- (int)tag
{
  return self->_tag;
}

- (unint64_t)whichPromptcontext
{
  return self->_whichPromptcontext;
}

- (INFERENCESchemaINFERENCEPromptContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEPromptContext;
  v5 = [(INFERENCESchemaINFERENCEPromptContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPromptContext setTag:](v5, "setTag:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"confirmationPromptContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[INFERENCESchemaINFERENCEConfirmationPromptContext alloc] initWithDictionary:v7];
      [(INFERENCESchemaINFERENCEPromptContext *)v5 setConfirmationPromptContext:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"disambiguationPromptContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[INFERENCESchemaINFERENCEDisambiguationPromptContext alloc] initWithDictionary:v9];
      [(INFERENCESchemaINFERENCEPromptContext *)v5 setDisambiguationPromptContext:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEPromptContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEPromptContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEPromptContext *)self dictionaryRepresentation];
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
  if (self->_confirmationPromptContext)
  {
    id v4 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"confirmationPromptContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"confirmationPromptContext"];
    }
  }
  if (self->_disambiguationPromptContext)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"disambiguationPromptContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"disambiguationPromptContext"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = [(INFERENCESchemaINFERENCEPromptContext *)self tag] - 1;
    if (v10 > 2) {
      int v11 = @"INFERENCEPROMPTTAG_UNKNOWN";
    }
    else {
      int v11 = off_1E5EB0EC8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"tag"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_tag;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self->_confirmationPromptContext hash] ^ v3;
  return v4 ^ [(INFERENCESchemaINFERENCEDisambiguationPromptContext *)self->_disambiguationPromptContext hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  unint64_t whichPromptcontext = self->_whichPromptcontext;
  if (whichPromptcontext != [v4 whichPromptcontext]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    int tag = self->_tag;
    if (tag != [v4 tag]) {
      goto LABEL_16;
    }
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
  int v8 = [v4 confirmationPromptContext];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
  if (v9)
  {
    unsigned int v10 = (void *)v9;
    int v11 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
    v12 = [v4 confirmationPromptContext];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
  int v8 = [v4 disambiguationPromptContext];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
    v17 = [v4 disambiguationPromptContext];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];

  if (v4)
  {
    v5 = [(INFERENCESchemaINFERENCEPromptContext *)self confirmationPromptContext];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(INFERENCESchemaINFERENCEPromptContext *)self disambiguationPromptContext];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPromptContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteDisambiguationPromptContext
{
  if (self->_whichPromptcontext == 3)
  {
    self->_unint64_t whichPromptcontext = 0;
    self->_disambiguationPromptContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)disambiguationPromptContext
{
  if (self->_whichPromptcontext == 3) {
    v2 = self->_disambiguationPromptContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDisambiguationPromptContext:(id)a3
{
  unint64_t v4 = (INFERENCESchemaINFERENCEDisambiguationPromptContext *)a3;
  confirmationPromptContext = self->_confirmationPromptContext;
  self->_confirmationPromptContext = 0;

  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichPromptcontext = v6;
  disambiguationPromptContext = self->_disambiguationPromptContext;
  self->_disambiguationPromptContext = v4;
}

- (void)deleteConfirmationPromptContext
{
  if (self->_whichPromptcontext == 2)
  {
    self->_unint64_t whichPromptcontext = 0;
    self->_confirmationPromptContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEConfirmationPromptContext)confirmationPromptContext
{
  if (self->_whichPromptcontext == 2) {
    v2 = self->_confirmationPromptContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConfirmationPromptContext:(id)a3
{
  unint64_t v4 = (INFERENCESchemaINFERENCEConfirmationPromptContext *)a3;
  disambiguationPromptContext = self->_disambiguationPromptContext;
  self->_disambiguationPromptContext = 0;

  self->_unint64_t whichPromptcontext = 2 * (v4 != 0);
  confirmationPromptContext = self->_confirmationPromptContext;
  self->_confirmationPromptContext = v4;
}

- (void)deleteTag
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTag:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTag
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTag:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int tag = a3;
}

@end