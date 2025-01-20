@interface ASRSchemaASRIntermediateUtteranceInfoTier1
- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithDictionary:(id)a3;
- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithJSON:(id)a3;
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasPhoneticMatchInput;
- (BOOL)hasPhoneticMatchOutput;
- (BOOL)hasUnrepairedPostItn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)loggableSharedUserId;
- (NSString)phoneticMatchInput;
- (NSString)phoneticMatchOutput;
- (NSString)unrepairedPostItn;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLoggableSharedUserId;
- (void)deletePhoneticMatchInput;
- (void)deletePhoneticMatchOutput;
- (void)deleteUnrepairedPostItn;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasPhoneticMatchInput:(BOOL)a3;
- (void)setHasPhoneticMatchOutput:(BOOL)a3;
- (void)setHasUnrepairedPostItn:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setPhoneticMatchInput:(id)a3;
- (void)setPhoneticMatchOutput:(id)a3;
- (void)setUnrepairedPostItn:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRIntermediateUtteranceInfoTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASRSchemaASRIntermediateUtteranceInfoTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteUnrepairedPostItn];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchInput];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchOutput];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteUnrepairedPostItn];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchInput];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchOutput];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteUnrepairedPostItn];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchInput];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchOutput];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteUnrepairedPostItn];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchInput];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchOutput];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteUnrepairedPostItn];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchInput];
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deletePhoneticMatchOutput];
  }
  if ([v4 isConditionSet:8]) {
    [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self deleteLoggableSharedUserId];
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
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_phoneticMatchOutput, 0);
  objc_storeStrong((id *)&self->_phoneticMatchInput, 0);
  objc_storeStrong((id *)&self->_unrepairedPostItn, 0);
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  self->_hasLoggableSharedUserId = a3;
}

- (void)setHasPhoneticMatchOutput:(BOOL)a3
{
  self->_hasPhoneticMatchOutput = a3;
}

- (void)setHasPhoneticMatchInput:(BOOL)a3
{
  self->_hasPhoneticMatchInput = a3;
}

- (void)setHasUnrepairedPostItn:(BOOL)a3
{
  self->_hasUnrepairedPostItn = a3;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setPhoneticMatchOutput:(id)a3
{
}

- (NSString)phoneticMatchOutput
{
  return self->_phoneticMatchOutput;
}

- (void)setPhoneticMatchInput:(id)a3
{
}

- (NSString)phoneticMatchInput
{
  return self->_phoneticMatchInput;
}

- (void)setUnrepairedPostItn:(id)a3
{
}

- (NSString)unrepairedPostItn
{
  return self->_unrepairedPostItn;
}

- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASRSchemaASRIntermediateUtteranceInfoTier1;
  v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"unrepairedPostItn"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)v5 setUnrepairedPostItn:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"phoneticMatchInput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)v5 setPhoneticMatchInput:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"phoneticMatchOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)v5 setPhoneticMatchOutput:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)v5 setLoggableSharedUserId:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (ASRSchemaASRIntermediateUtteranceInfoTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self dictionaryRepresentation];
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
  if (self->_loggableSharedUserId)
  {
    id v4 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self loggableSharedUserId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (self->_phoneticMatchInput)
  {
    v6 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchInput];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"phoneticMatchInput"];
  }
  if (self->_phoneticMatchOutput)
  {
    v8 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchOutput];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"phoneticMatchOutput"];
  }
  if (self->_unrepairedPostItn)
  {
    v10 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self unrepairedPostItn];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"unrepairedPostItn"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_unrepairedPostItn hash];
  NSUInteger v4 = [(NSString *)self->_phoneticMatchInput hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_phoneticMatchOutput hash];
  return v4 ^ v5 ^ [(NSString *)self->_loggableSharedUserId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self unrepairedPostItn];
  v6 = [v4 unrepairedPostItn];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self unrepairedPostItn];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self unrepairedPostItn];
    v10 = [v4 unrepairedPostItn];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchInput];
  v6 = [v4 phoneticMatchInput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchInput];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchInput];
    v15 = [v4 phoneticMatchInput];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchOutput];
  v6 = [v4 phoneticMatchOutput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchOutput];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchOutput];
    v20 = [v4 phoneticMatchOutput];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self loggableSharedUserId];
  v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self loggableSharedUserId];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self loggableSharedUserId];
    v25 = [v4 loggableSharedUserId];
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
  id v4 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self unrepairedPostItn];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchInput];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self phoneticMatchOutput];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self loggableSharedUserId];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRIntermediateUtteranceInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deletePhoneticMatchOutput
{
}

- (BOOL)hasPhoneticMatchOutput
{
  return self->_phoneticMatchOutput != 0;
}

- (void)deletePhoneticMatchInput
{
}

- (BOOL)hasPhoneticMatchInput
{
  return self->_phoneticMatchInput != 0;
}

- (void)deleteUnrepairedPostItn
{
}

- (BOOL)hasUnrepairedPostItn
{
  return self->_unrepairedPostItn != 0;
}

@end