@interface INFERENCESchemaINFERENCEConfirmationPromptContext
- (BOOL)hasAnonymizedEntityPresented;
- (BOOL)hasResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEConfirmationPromptContext)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEConfirmationPromptContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)anonymizedEntityPresented;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)resolution;
- (unint64_t)hash;
- (void)deleteAnonymizedEntityPresented;
- (void)deleteResolution;
- (void)setAnonymizedEntityPresented:(id)a3;
- (void)setHasAnonymizedEntityPresented:(BOOL)a3;
- (void)setHasResolution:(BOOL)a3;
- (void)setResolution:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEConfirmationPromptContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAnonymizedEntityPresented:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)resolution
{
  return self->_resolution;
}

- (void)setAnonymizedEntityPresented:(id)a3
{
}

- (NSString)anonymizedEntityPresented
{
  return self->_anonymizedEntityPresented;
}

- (INFERENCESchemaINFERENCEConfirmationPromptContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFERENCESchemaINFERENCEConfirmationPromptContext;
  v5 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anonymizedEntityPresented"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCEConfirmationPromptContext *)v5 setAnonymizedEntityPresented:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"resolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEConfirmationPromptContext setResolution:](v5, "setResolution:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEConfirmationPromptContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self dictionaryRepresentation];
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
  if (self->_anonymizedEntityPresented)
  {
    id v4 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self anonymizedEntityPresented];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedEntityPresented"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self resolution] - 1;
    if (v6 > 3) {
      uint64_t v7 = @"INFERENCECONFIRMATIONRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB0DA8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"resolution"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_anonymizedEntityPresented hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_resolution;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self anonymizedEntityPresented];
  unsigned int v6 = [v4 anonymizedEntityPresented];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self anonymizedEntityPresented];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self anonymizedEntityPresented];
    objc_super v11 = [v4 anonymizedEntityPresented];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int resolution = self->_resolution;
    if (resolution != [v4 resolution]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(INFERENCESchemaINFERENCEConfirmationPromptContext *)self anonymizedEntityPresented];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEConfirmationPromptContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteResolution
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResolution:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResolution
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResolution:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resolution = a3;
}

- (void)deleteAnonymizedEntityPresented
{
}

- (BOOL)hasAnonymizedEntityPresented
{
  return self->_anonymizedEntityPresented != 0;
}

@end