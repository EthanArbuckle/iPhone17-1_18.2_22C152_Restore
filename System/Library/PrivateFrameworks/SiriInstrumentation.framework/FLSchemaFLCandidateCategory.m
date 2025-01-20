@interface FLSchemaFLCandidateCategory
- (BOOL)hasParameter;
- (BOOL)hasTool;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLCandidateCategory)initWithDictionary:(id)a3;
- (FLSchemaFLCandidateCategory)initWithJSON:(id)a3;
- (FLSchemaFLParameterCandidateCategory)parameter;
- (FLSchemaFLToolCandidateCategory)tool;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichCategory;
- (void)deleteParameter;
- (void)deleteTool;
- (void)setHasParameter:(BOOL)a3;
- (void)setHasTool:(BOOL)a3;
- (void)setParameter:(id)a3;
- (void)setTool:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLCandidateCategory

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLSchemaFLCandidateCategory;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLCandidateCategory *)self tool];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLCandidateCategory *)self deleteTool];
  }
  v9 = [(FLSchemaFLCandidateCategory *)self parameter];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLSchemaFLCandidateCategory *)self deleteParameter];
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
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_tool, 0);
}

- (void)setHasParameter:(BOOL)a3
{
  self->_hasParameter = a3;
}

- (BOOL)hasParameter
{
  return self->_hasParameter;
}

- (void)setHasTool:(BOOL)a3
{
  self->_hasTool = a3;
}

- (BOOL)hasTool
{
  return self->_hasTool;
}

- (unint64_t)whichCategory
{
  return self->_whichCategory;
}

- (FLSchemaFLCandidateCategory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLSchemaFLCandidateCategory;
  v5 = [(FLSchemaFLCandidateCategory *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLSchemaFLToolCandidateCategory alloc] initWithDictionary:v6];
      [(FLSchemaFLCandidateCategory *)v5 setTool:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"parameter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLSchemaFLParameterCandidateCategory alloc] initWithDictionary:v8];
      [(FLSchemaFLCandidateCategory *)v5 setParameter:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (FLSchemaFLCandidateCategory)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLCandidateCategory *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLCandidateCategory *)self dictionaryRepresentation];
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
  if (self->_parameter)
  {
    id v4 = [(FLSchemaFLCandidateCategory *)self parameter];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"parameter"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"parameter"];
    }
  }
  if (self->_tool)
  {
    uint64_t v7 = [(FLSchemaFLCandidateCategory *)self tool];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"tool"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"tool"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLSchemaFLToolCandidateCategory *)self->_tool hash];
  return [(FLSchemaFLParameterCandidateCategory *)self->_parameter hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichCategory = self->_whichCategory;
  if (whichCategory != [v4 whichCategory]) {
    goto LABEL_13;
  }
  v6 = [(FLSchemaFLCandidateCategory *)self tool];
  uint64_t v7 = [v4 tool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(FLSchemaFLCandidateCategory *)self tool];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(FLSchemaFLCandidateCategory *)self tool];
    int v11 = [v4 tool];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(FLSchemaFLCandidateCategory *)self parameter];
  uint64_t v7 = [v4 parameter];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(FLSchemaFLCandidateCategory *)self parameter];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(FLSchemaFLCandidateCategory *)self parameter];
    v16 = [v4 parameter];
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
  id v4 = [(FLSchemaFLCandidateCategory *)self tool];

  if (v4)
  {
    v5 = [(FLSchemaFLCandidateCategory *)self tool];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(FLSchemaFLCandidateCategory *)self parameter];

  if (v6)
  {
    uint64_t v7 = [(FLSchemaFLCandidateCategory *)self parameter];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLCandidateCategoryReadFrom(self, (uint64_t)a3);
}

- (void)deleteParameter
{
  if (self->_whichCategory == 2)
  {
    self->_unint64_t whichCategory = 0;
    self->_parameter = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLSchemaFLParameterCandidateCategory)parameter
{
  if (self->_whichCategory == 2) {
    v2 = self->_parameter;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameter:(id)a3
{
  id v4 = (FLSchemaFLParameterCandidateCategory *)a3;
  tool = self->_tool;
  self->_tool = 0;

  self->_unint64_t whichCategory = 2 * (v4 != 0);
  parameter = self->_parameter;
  self->_parameter = v4;
}

- (void)deleteTool
{
  if (self->_whichCategory == 1)
  {
    self->_unint64_t whichCategory = 0;
    self->_tool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLSchemaFLToolCandidateCategory)tool
{
  if (self->_whichCategory == 1) {
    v2 = self->_tool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTool:(id)a3
{
  id v4 = (FLSchemaFLToolCandidateCategory *)a3;
  parameter = self->_parameter;
  self->_parameter = 0;

  self->_unint64_t whichCategory = v4 != 0;
  tool = self->_tool;
  self->_tool = v4;
}

@end