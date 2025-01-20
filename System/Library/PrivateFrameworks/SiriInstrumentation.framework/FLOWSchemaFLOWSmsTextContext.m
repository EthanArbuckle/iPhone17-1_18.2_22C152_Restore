@interface FLOWSchemaFLOWSmsTextContext
- (BOOL)hasSmsAttachmentMetadata;
- (BOOL)hasSmsTextContentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWSmsAttachmentMetadata)smsAttachmentMetadata;
- (FLOWSchemaFLOWSmsTextContentMetadata)smsTextContentMetadata;
- (FLOWSchemaFLOWSmsTextContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWSmsTextContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSmsAttachmentMetadata;
- (void)deleteSmsTextContentMetadata;
- (void)setHasSmsAttachmentMetadata:(BOOL)a3;
- (void)setHasSmsTextContentMetadata:(BOOL)a3;
- (void)setSmsAttachmentMetadata:(id)a3;
- (void)setSmsTextContentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWSmsTextContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWSmsTextContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWSmsTextContext *)self deleteSmsTextContentMetadata];
  }
  v9 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWSmsTextContext *)self deleteSmsAttachmentMetadata];
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
  objc_storeStrong((id *)&self->_smsAttachmentMetadata, 0);
  objc_storeStrong((id *)&self->_smsTextContentMetadata, 0);
}

- (void)setHasSmsAttachmentMetadata:(BOOL)a3
{
  self->_hasSmsAttachmentMetadata = a3;
}

- (void)setHasSmsTextContentMetadata:(BOOL)a3
{
  self->_hasSmsTextContentMetadata = a3;
}

- (void)setSmsAttachmentMetadata:(id)a3
{
}

- (FLOWSchemaFLOWSmsAttachmentMetadata)smsAttachmentMetadata
{
  return self->_smsAttachmentMetadata;
}

- (void)setSmsTextContentMetadata:(id)a3
{
}

- (FLOWSchemaFLOWSmsTextContentMetadata)smsTextContentMetadata
{
  return self->_smsTextContentMetadata;
}

- (FLOWSchemaFLOWSmsTextContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWSmsTextContext;
  v5 = [(FLOWSchemaFLOWSmsTextContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"smsTextContentMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWSmsTextContentMetadata alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWSmsTextContext *)v5 setSmsTextContentMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"smsAttachmentMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWSchemaFLOWSmsAttachmentMetadata alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWSmsTextContext *)v5 setSmsAttachmentMetadata:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWSmsTextContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWSmsTextContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWSmsTextContext *)self dictionaryRepresentation];
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
  if (self->_smsAttachmentMetadata)
  {
    id v4 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"smsAttachmentMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"smsAttachmentMetadata"];
    }
  }
  if (self->_smsTextContentMetadata)
  {
    uint64_t v7 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"smsTextContentMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"smsTextContentMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWSmsTextContentMetadata *)self->_smsTextContentMetadata hash];
  return [(FLOWSchemaFLOWSmsAttachmentMetadata *)self->_smsAttachmentMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
  v6 = [v4 smsTextContentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
    v10 = [v4 smsTextContentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
  v6 = [v4 smsAttachmentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
    v15 = [v4 smsAttachmentMetadata];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];

  if (v4)
  {
    v5 = [(FLOWSchemaFLOWSmsTextContext *)self smsTextContentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];

  if (v6)
  {
    uint64_t v7 = [(FLOWSchemaFLOWSmsTextContext *)self smsAttachmentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsTextContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSmsAttachmentMetadata
{
}

- (BOOL)hasSmsAttachmentMetadata
{
  return self->_smsAttachmentMetadata != 0;
}

- (void)deleteSmsTextContentMetadata
{
}

- (BOOL)hasSmsTextContentMetadata
{
  return self->_smsTextContentMetadata != 0;
}

@end