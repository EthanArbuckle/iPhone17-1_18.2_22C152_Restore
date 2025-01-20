@interface ASRSchemaASRAlternativeSelectionTextCategorized
- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithDictionary:(id)a3;
- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithJSON:(id)a3;
- (BOOL)hasFullCorrectedText;
- (BOOL)hasOriginalAsrId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)fullCorrectedText;
- (SISchemaUUID)originalAsrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFullCorrectedText;
- (void)deleteOriginalAsrId;
- (void)setFullCorrectedText:(id)a3;
- (void)setHasFullCorrectedText:(BOOL)a3;
- (void)setHasOriginalAsrId:(BOOL)a3;
- (void)setOriginalAsrId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRAlternativeSelectionTextCategorized

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRAlternativeSelectionTextCategorized;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:4]) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:5]) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:6]) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:7]) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteFullCorrectedText];
  }
  v6 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRAlternativeSelectionTextCategorized *)self deleteOriginalAsrId];
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
  objc_storeStrong((id *)&self->_fullCorrectedText, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

- (void)setHasFullCorrectedText:(BOOL)a3
{
  self->_hasFullCorrectedText = a3;
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  self->_hasOriginalAsrId = a3;
}

- (void)setFullCorrectedText:(id)a3
{
}

- (NSString)fullCorrectedText
{
  return self->_fullCorrectedText;
}

- (void)setOriginalAsrId:(id)a3
{
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRAlternativeSelectionTextCategorized;
  v5 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalAsrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRAlternativeSelectionTextCategorized *)v5 setOriginalAsrId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"fullCorrectedText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRAlternativeSelectionTextCategorized *)v5 setFullCorrectedText:v9];
    }
    objc_super v10 = v5;
  }
  return v5;
}

- (ASRSchemaASRAlternativeSelectionTextCategorized)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self dictionaryRepresentation];
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
  if (self->_fullCorrectedText)
  {
    id v4 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self fullCorrectedText];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"fullCorrectedText"];
  }
  if (self->_originalAsrId)
  {
    v6 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"originalAsrId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"originalAsrId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalAsrId hash];
  return [(NSString *)self->_fullCorrectedText hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
  v6 = [v4 originalAsrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
    objc_super v10 = [v4 originalAsrId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self fullCorrectedText];
  v6 = [v4 fullCorrectedText];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self fullCorrectedText];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self fullCorrectedText];
    v15 = [v4 fullCorrectedText];
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
  id v7 = a3;
  id v4 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];

  if (v4)
  {
    v5 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self originalAsrId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ASRSchemaASRAlternativeSelectionTextCategorized *)self fullCorrectedText];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAlternativeSelectionTextCategorizedReadFrom(self, (uint64_t)a3);
}

- (void)deleteFullCorrectedText
{
}

- (BOOL)hasFullCorrectedText
{
  return self->_fullCorrectedText != 0;
}

- (void)deleteOriginalAsrId
{
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

@end