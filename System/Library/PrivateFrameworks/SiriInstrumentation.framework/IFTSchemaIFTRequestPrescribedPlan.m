@interface IFTSchemaIFTRequestPrescribedPlan
- (BOOL)hasConvertTool;
- (BOOL)hasKnowledgeTool;
- (BOOL)hasOpenSuccessValueFromLatestRequestTool;
- (BOOL)hasOpenTool;
- (BOOL)hasSearchTool;
- (BOOL)hasTextTool;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlan)initWithDictionary:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlan)initWithJSON:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlanConvertTool)convertTool;
- (IFTSchemaIFTRequestPrescribedPlanKnowledgeTool)knowledgeTool;
- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)openSuccessValueFromLatestRequestTool;
- (IFTSchemaIFTRequestPrescribedPlanOpenTool)openTool;
- (IFTSchemaIFTRequestPrescribedPlanSearchTool)searchTool;
- (IFTSchemaIFTRequestPrescribedPlanTextTool)textTool;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Requestprescribedplan;
- (void)deleteConvertTool;
- (void)deleteKnowledgeTool;
- (void)deleteOpenSuccessValueFromLatestRequestTool;
- (void)deleteOpenTool;
- (void)deleteSearchTool;
- (void)deleteTextTool;
- (void)setConvertTool:(id)a3;
- (void)setHasConvertTool:(BOOL)a3;
- (void)setHasKnowledgeTool:(BOOL)a3;
- (void)setHasOpenSuccessValueFromLatestRequestTool:(BOOL)a3;
- (void)setHasOpenTool:(BOOL)a3;
- (void)setHasSearchTool:(BOOL)a3;
- (void)setHasTextTool:(BOOL)a3;
- (void)setKnowledgeTool:(id)a3;
- (void)setOpenSuccessValueFromLatestRequestTool:(id)a3;
- (void)setOpenTool:(id)a3;
- (void)setSearchTool:(id)a3;
- (void)setTextTool:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTRequestPrescribedPlan

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IFTSchemaIFTRequestPrescribedPlan;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteSearchTool];
  }
  v9 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteTextTool];
  }
  v12 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteConvertTool];
  }
  v15 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteKnowledgeTool];
  }
  v18 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteOpenTool];
  }
  v21 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTRequestPrescribedPlan *)self deleteOpenSuccessValueFromLatestRequestTool];
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
  objc_storeStrong((id *)&self->_openSuccessValueFromLatestRequestTool, 0);
  objc_storeStrong((id *)&self->_openTool, 0);
  objc_storeStrong((id *)&self->_knowledgeTool, 0);
  objc_storeStrong((id *)&self->_convertTool, 0);
  objc_storeStrong((id *)&self->_textTool, 0);
  objc_storeStrong((id *)&self->_searchTool, 0);
}

- (void)setHasOpenSuccessValueFromLatestRequestTool:(BOOL)a3
{
  self->_hasOpenSuccessValueFromLatestRequestTool = a3;
}

- (BOOL)hasOpenSuccessValueFromLatestRequestTool
{
  return self->_hasOpenSuccessValueFromLatestRequestTool;
}

- (void)setHasOpenTool:(BOOL)a3
{
  self->_hasOpenTool = a3;
}

- (BOOL)hasOpenTool
{
  return self->_hasOpenTool;
}

- (void)setHasKnowledgeTool:(BOOL)a3
{
  self->_hasKnowledgeTool = a3;
}

- (BOOL)hasKnowledgeTool
{
  return self->_hasKnowledgeTool;
}

- (void)setHasConvertTool:(BOOL)a3
{
  self->_hasConvertTool = a3;
}

- (BOOL)hasConvertTool
{
  return self->_hasConvertTool;
}

- (void)setHasTextTool:(BOOL)a3
{
  self->_hasTextTool = a3;
}

- (BOOL)hasTextTool
{
  return self->_hasTextTool;
}

- (void)setHasSearchTool:(BOOL)a3
{
  self->_hasSearchTool = a3;
}

- (BOOL)hasSearchTool
{
  return self->_hasSearchTool;
}

- (unint64_t)whichOneof_Requestprescribedplan
{
  return self->_whichOneof_Requestprescribedplan;
}

- (IFTSchemaIFTRequestPrescribedPlan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IFTSchemaIFTRequestPrescribedPlan;
  v5 = [(IFTSchemaIFTRequestPrescribedPlan *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTRequestPrescribedPlanSearchTool alloc] initWithDictionary:v6];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setSearchTool:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"textTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTRequestPrescribedPlanTextTool alloc] initWithDictionary:v8];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setTextTool:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"convertTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTRequestPrescribedPlanConvertTool alloc] initWithDictionary:v10];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setConvertTool:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"knowledgeTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTRequestPrescribedPlanKnowledgeTool alloc] initWithDictionary:v12];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setKnowledgeTool:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"openTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaIFTRequestPrescribedPlanOpenTool alloc] initWithDictionary:v14];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setOpenTool:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"openSuccessValueFromLatestRequestTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool alloc] initWithDictionary:v16];
      [(IFTSchemaIFTRequestPrescribedPlan *)v5 setOpenSuccessValueFromLatestRequestTool:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (IFTSchemaIFTRequestPrescribedPlan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTRequestPrescribedPlan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTRequestPrescribedPlan *)self dictionaryRepresentation];
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
  if (self->_convertTool)
  {
    id v4 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"convertTool"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"convertTool"];
    }
  }
  if (self->_knowledgeTool)
  {
    uint64_t v7 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"knowledgeTool"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"knowledgeTool"];
    }
  }
  if (self->_openSuccessValueFromLatestRequestTool)
  {
    v10 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"openSuccessValueFromLatestRequestTool"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"openSuccessValueFromLatestRequestTool"];
    }
  }
  if (self->_openTool)
  {
    v13 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"openTool"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"openTool"];
    }
  }
  if (self->_searchTool)
  {
    v16 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"searchTool"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"searchTool"];
    }
  }
  if (self->_textTool)
  {
    v19 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"textTool"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"textTool"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTRequestPrescribedPlanSearchTool *)self->_searchTool hash];
  unint64_t v4 = [(IFTSchemaIFTRequestPrescribedPlanTextTool *)self->_textTool hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTRequestPrescribedPlanConvertTool *)self->_convertTool hash];
  unint64_t v6 = v4 ^ v5 ^ [(IFTSchemaIFTRequestPrescribedPlanKnowledgeTool *)self->_knowledgeTool hash];
  unint64_t v7 = [(IFTSchemaIFTRequestPrescribedPlanOpenTool *)self->_openTool hash];
  return v6 ^ v7 ^ [(IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool *)self->_openSuccessValueFromLatestRequestTool hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  unint64_t whichOneof_Requestprescribedplan = self->_whichOneof_Requestprescribedplan;
  if (whichOneof_Requestprescribedplan != objc_msgSend(v4, "whichOneof_Requestprescribedplan")) {
    goto LABEL_33;
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
  unint64_t v7 = [v4 searchTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
    int v11 = [v4 searchTool];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
  unint64_t v7 = [v4 textTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
    v16 = [v4 textTool];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
  unint64_t v7 = [v4 convertTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
  if (v18)
  {
    v19 = (void *)v18;
    objc_super v20 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
    v21 = [v4 convertTool];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
  unint64_t v7 = [v4 knowledgeTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
    v26 = [v4 knowledgeTool];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
  unint64_t v7 = [v4 openTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
    v31 = [v4 openTool];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
  unint64_t v7 = [v4 openSuccessValueFromLatestRequestTool];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
    if (!v33)
    {

LABEL_36:
      BOOL v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
    v36 = [v4 openSuccessValueFromLatestRequestTool];
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_36;
    }
  }
  else
  {
LABEL_32:
  }
LABEL_33:
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTRequestPrescribedPlan *)self searchTool];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];

  if (v6)
  {
    unint64_t v7 = [(IFTSchemaIFTRequestPrescribedPlan *)self textTool];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];

  if (v8)
  {
    v9 = [(IFTSchemaIFTRequestPrescribedPlan *)self convertTool];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];

  if (v10)
  {
    int v11 = [(IFTSchemaIFTRequestPrescribedPlan *)self knowledgeTool];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTRequestPrescribedPlan *)self openTool];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];

  if (v14)
  {
    v15 = [(IFTSchemaIFTRequestPrescribedPlan *)self openSuccessValueFromLatestRequestTool];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRequestPrescribedPlanReadFrom(self, (uint64_t)a3);
}

- (void)deleteOpenSuccessValueFromLatestRequestTool
{
  if (self->_whichOneof_Requestprescribedplan == 6)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_openSuccessValueFromLatestRequestTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)openSuccessValueFromLatestRequestTool
{
  if (self->_whichOneof_Requestprescribedplan == 6) {
    v2 = self->_openSuccessValueFromLatestRequestTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenSuccessValueFromLatestRequestTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool *)a3;
  searchTool = self->_searchTool;
  self->_searchTool = 0;

  textTool = self->_textTool;
  self->_textTool = 0;

  convertTool = self->_convertTool;
  self->_convertTool = 0;

  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = 0;

  openTool = self->_openTool;
  self->_openTool = 0;

  unint64_t v10 = 6;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichOneof_Requestprescribedplan = v10;
  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = v4;
}

- (void)deleteOpenTool
{
  if (self->_whichOneof_Requestprescribedplan == 5)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_openTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanOpenTool)openTool
{
  if (self->_whichOneof_Requestprescribedplan == 5) {
    v2 = self->_openTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanOpenTool *)a3;
  searchTool = self->_searchTool;
  self->_searchTool = 0;

  textTool = self->_textTool;
  self->_textTool = 0;

  convertTool = self->_convertTool;
  self->_convertTool = 0;

  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = 0;

  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = 0;

  unint64_t v10 = 5;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichOneof_Requestprescribedplan = v10;
  openTool = self->_openTool;
  self->_openTool = v4;
}

- (void)deleteKnowledgeTool
{
  if (self->_whichOneof_Requestprescribedplan == 4)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_knowledgeTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanKnowledgeTool)knowledgeTool
{
  if (self->_whichOneof_Requestprescribedplan == 4) {
    v2 = self->_knowledgeTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setKnowledgeTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanKnowledgeTool *)a3;
  searchTool = self->_searchTool;
  self->_searchTool = 0;

  textTool = self->_textTool;
  self->_textTool = 0;

  convertTool = self->_convertTool;
  self->_convertTool = 0;

  openTool = self->_openTool;
  self->_openTool = 0;

  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = 0;

  self->_unint64_t whichOneof_Requestprescribedplan = 4 * (v4 != 0);
  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = v4;
}

- (void)deleteConvertTool
{
  if (self->_whichOneof_Requestprescribedplan == 3)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_convertTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanConvertTool)convertTool
{
  if (self->_whichOneof_Requestprescribedplan == 3) {
    v2 = self->_convertTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConvertTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanConvertTool *)a3;
  searchTool = self->_searchTool;
  self->_searchTool = 0;

  textTool = self->_textTool;
  self->_textTool = 0;

  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = 0;

  openTool = self->_openTool;
  self->_openTool = 0;

  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = 0;

  unint64_t v10 = 3;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichOneof_Requestprescribedplan = v10;
  convertTool = self->_convertTool;
  self->_convertTool = v4;
}

- (void)deleteTextTool
{
  if (self->_whichOneof_Requestprescribedplan == 2)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_textTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanTextTool)textTool
{
  if (self->_whichOneof_Requestprescribedplan == 2) {
    v2 = self->_textTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTextTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanTextTool *)a3;
  searchTool = self->_searchTool;
  self->_searchTool = 0;

  convertTool = self->_convertTool;
  self->_convertTool = 0;

  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = 0;

  openTool = self->_openTool;
  self->_openTool = 0;

  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = 0;

  self->_unint64_t whichOneof_Requestprescribedplan = 2 * (v4 != 0);
  textTool = self->_textTool;
  self->_textTool = v4;
}

- (void)deleteSearchTool
{
  if (self->_whichOneof_Requestprescribedplan == 1)
  {
    self->_unint64_t whichOneof_Requestprescribedplan = 0;
    self->_searchTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestPrescribedPlanSearchTool)searchTool
{
  if (self->_whichOneof_Requestprescribedplan == 1) {
    v2 = self->_searchTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchTool:(id)a3
{
  id v4 = (IFTSchemaIFTRequestPrescribedPlanSearchTool *)a3;
  textTool = self->_textTool;
  self->_textTool = 0;

  convertTool = self->_convertTool;
  self->_convertTool = 0;

  knowledgeTool = self->_knowledgeTool;
  self->_knowledgeTool = 0;

  openTool = self->_openTool;
  self->_openTool = 0;

  openSuccessValueFromLatestRequestTool = self->_openSuccessValueFromLatestRequestTool;
  self->_openSuccessValueFromLatestRequestTool = 0;

  self->_unint64_t whichOneof_Requestprescribedplan = v4 != 0;
  searchTool = self->_searchTool;
  self->_searchTool = v4;
}

@end