@interface NLXSchemaCDMMatchingSpanTier1
- (BOOL)hasInput;
- (BOOL)hasInternalSpanData;
- (BOOL)hasLinkId;
- (BOOL)hasSemanticValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMInternalSpanDataTier1)internalSpanData;
- (NLXSchemaCDMMatchingSpanTier1)initWithDictionary:(id)a3;
- (NLXSchemaCDMMatchingSpanTier1)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)input;
- (NSString)semanticValue;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteInput;
- (void)deleteInternalSpanData;
- (void)deleteLinkId;
- (void)deleteSemanticValue;
- (void)setHasInput:(BOOL)a3;
- (void)setHasInternalSpanData:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasSemanticValue:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInternalSpanData:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setSemanticValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMMatchingSpanTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMMatchingSpanTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInput];
  }
  if ([v4 isConditionSet:4]) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInput];
  }
  if ([v4 isConditionSet:5]) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInput];
  }
  if ([v4 isConditionSet:6]) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInput];
  }
  if ([v4 isConditionSet:7]) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInput];
  }
  v6 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteLinkId];
  }
  v9 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMMatchingSpanTier1 *)self deleteInternalSpanData];
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
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasSemanticValue:(BOOL)a3
{
  self->_hasSemanticValue = a3;
}

- (void)setHasInternalSpanData:(BOOL)a3
{
  self->_hasInternalSpanData = a3;
}

- (void)setHasInput:(BOOL)a3
{
  self->_hasInput = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setSemanticValue:(id)a3
{
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (void)setInternalSpanData:(id)a3
{
}

- (NLXSchemaCDMInternalSpanDataTier1)internalSpanData
{
  return self->_internalSpanData;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (NLXSchemaCDMMatchingSpanTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMMatchingSpanTier1;
  v5 = [(NLXSchemaCDMMatchingSpanTier1 *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMMatchingSpanTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"input"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(NLXSchemaCDMMatchingSpanTier1 *)v5 setInput:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"internalSpanData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaCDMInternalSpanDataTier1 alloc] initWithDictionary:v10];
      [(NLXSchemaCDMMatchingSpanTier1 *)v5 setInternalSpanData:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"semanticValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(NLXSchemaCDMMatchingSpanTier1 *)v5 setSemanticValue:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (NLXSchemaCDMMatchingSpanTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMMatchingSpanTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMMatchingSpanTier1 *)self dictionaryRepresentation];
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
  if (self->_input)
  {
    id v4 = [(NLXSchemaCDMMatchingSpanTier1 *)self input];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"input"];
  }
  if (self->_internalSpanData)
  {
    v6 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"internalSpanData"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"internalSpanData"];
    }
  }
  if (self->_linkId)
  {
    v9 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_semanticValue)
  {
    v12 = [(NLXSchemaCDMMatchingSpanTier1 *)self semanticValue];
    objc_super v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"semanticValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_input hash] ^ v3;
  unint64_t v5 = [(NLXSchemaCDMInternalSpanDataTier1 *)self->_internalSpanData hash];
  return v4 ^ v5 ^ [(NSString *)self->_semanticValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMMatchingSpanTier1 *)self input];
  v6 = [v4 input];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(NLXSchemaCDMMatchingSpanTier1 *)self input];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(NLXSchemaCDMMatchingSpanTier1 *)self input];
    v15 = [v4 input];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
  v6 = [v4 internalSpanData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
    v20 = [v4 internalSpanData];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMMatchingSpanTier1 *)self semanticValue];
  v6 = [v4 semanticValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(NLXSchemaCDMMatchingSpanTier1 *)self semanticValue];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(NLXSchemaCDMMatchingSpanTier1 *)self semanticValue];
    v25 = [v4 semanticValue];
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
  id v11 = a3;
  id v4 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaCDMMatchingSpanTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMMatchingSpanTier1 *)self input];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];

  if (v7)
  {
    int v8 = [(NLXSchemaCDMMatchingSpanTier1 *)self internalSpanData];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(NLXSchemaCDMMatchingSpanTier1 *)self semanticValue];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMatchingSpanTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteSemanticValue
{
}

- (BOOL)hasSemanticValue
{
  return self->_semanticValue != 0;
}

- (void)deleteInternalSpanData
{
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (void)deleteInput
{
}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end