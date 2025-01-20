@interface IFTSchemaIFTStatementOutcome
- (BOOL)hasActionConfirmation;
- (BOOL)hasActionRequirement;
- (BOOL)hasFailure;
- (BOOL)hasParameterCandidatesNotFounds;
- (BOOL)hasParameterConfirmation;
- (BOOL)hasParameterDisambiguation;
- (BOOL)hasParameterNeedsValue;
- (BOOL)hasParameterNotAllowed;
- (BOOL)hasSuccess;
- (BOOL)hasToolDisambiguation;
- (BOOL)hasValueDisambiguation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionConfirmation)actionConfirmation;
- (IFTSchemaIFTActionFailure)failure;
- (IFTSchemaIFTActionRequirement)actionRequirement;
- (IFTSchemaIFTActionSuccess)success;
- (IFTSchemaIFTParameterCandidatesNotFound)parameterCandidatesNotFounds;
- (IFTSchemaIFTParameterConfirmation)parameterConfirmation;
- (IFTSchemaIFTParameterDisambiguation)parameterDisambiguation;
- (IFTSchemaIFTParameterNeedsValue)parameterNeedsValue;
- (IFTSchemaIFTParameterNotAllowed)parameterNotAllowed;
- (IFTSchemaIFTStatementOutcome)initWithDictionary:(id)a3;
- (IFTSchemaIFTStatementOutcome)initWithJSON:(id)a3;
- (IFTSchemaIFTToolDisambiguation)toolDisambiguation;
- (IFTSchemaIFTValueDisambiguation)valueDisambiguation;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Statementoutcome;
- (void)deleteActionConfirmation;
- (void)deleteActionRequirement;
- (void)deleteFailure;
- (void)deleteParameterCandidatesNotFounds;
- (void)deleteParameterConfirmation;
- (void)deleteParameterDisambiguation;
- (void)deleteParameterNeedsValue;
- (void)deleteParameterNotAllowed;
- (void)deleteSuccess;
- (void)deleteToolDisambiguation;
- (void)deleteValueDisambiguation;
- (void)setActionConfirmation:(id)a3;
- (void)setActionRequirement:(id)a3;
- (void)setFailure:(id)a3;
- (void)setHasActionConfirmation:(BOOL)a3;
- (void)setHasActionRequirement:(BOOL)a3;
- (void)setHasFailure:(BOOL)a3;
- (void)setHasParameterCandidatesNotFounds:(BOOL)a3;
- (void)setHasParameterConfirmation:(BOOL)a3;
- (void)setHasParameterDisambiguation:(BOOL)a3;
- (void)setHasParameterNeedsValue:(BOOL)a3;
- (void)setHasParameterNotAllowed:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasToolDisambiguation:(BOOL)a3;
- (void)setHasValueDisambiguation:(BOOL)a3;
- (void)setParameterCandidatesNotFounds:(id)a3;
- (void)setParameterConfirmation:(id)a3;
- (void)setParameterDisambiguation:(id)a3;
- (void)setParameterNeedsValue:(id)a3;
- (void)setParameterNotAllowed:(id)a3;
- (void)setSuccess:(id)a3;
- (void)setToolDisambiguation:(id)a3;
- (void)setValueDisambiguation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTStatementOutcome

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)IFTSchemaIFTStatementOutcome;
  v5 = [(SISchemaInstrumentationMessage *)&v40 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTStatementOutcome *)self success];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTStatementOutcome *)self deleteSuccess];
  }
  v9 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTStatementOutcome *)self deleteActionConfirmation];
  }
  v12 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTStatementOutcome *)self deleteParameterNeedsValue];
  }
  v15 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTStatementOutcome *)self deleteParameterConfirmation];
  }
  v18 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTStatementOutcome *)self deleteParameterDisambiguation];
  }
  v21 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTStatementOutcome *)self deleteParameterNotAllowed];
  }
  v24 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(IFTSchemaIFTStatementOutcome *)self deleteParameterCandidatesNotFounds];
  }
  v27 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(IFTSchemaIFTStatementOutcome *)self deleteActionRequirement];
  }
  v30 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(IFTSchemaIFTStatementOutcome *)self deleteToolDisambiguation];
  }
  v33 = [(IFTSchemaIFTStatementOutcome *)self failure];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(IFTSchemaIFTStatementOutcome *)self deleteFailure];
  }
  v36 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(IFTSchemaIFTStatementOutcome *)self deleteValueDisambiguation];
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
  objc_storeStrong((id *)&self->_valueDisambiguation, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_toolDisambiguation, 0);
  objc_storeStrong((id *)&self->_actionRequirement, 0);
  objc_storeStrong((id *)&self->_parameterCandidatesNotFounds, 0);
  objc_storeStrong((id *)&self->_parameterNotAllowed, 0);
  objc_storeStrong((id *)&self->_parameterDisambiguation, 0);
  objc_storeStrong((id *)&self->_parameterConfirmation, 0);
  objc_storeStrong((id *)&self->_parameterNeedsValue, 0);
  objc_storeStrong((id *)&self->_actionConfirmation, 0);
  objc_storeStrong((id *)&self->_success, 0);
}

- (void)setHasValueDisambiguation:(BOOL)a3
{
  self->_hasValueDisambiguation = a3;
}

- (BOOL)hasValueDisambiguation
{
  return self->_hasValueDisambiguation;
}

- (void)setHasFailure:(BOOL)a3
{
  self->_hasFailure = a3;
}

- (BOOL)hasFailure
{
  return self->_hasFailure;
}

- (void)setHasToolDisambiguation:(BOOL)a3
{
  self->_hasToolDisambiguation = a3;
}

- (BOOL)hasToolDisambiguation
{
  return self->_hasToolDisambiguation;
}

- (void)setHasActionRequirement:(BOOL)a3
{
  self->_hasActionRequirement = a3;
}

- (BOOL)hasActionRequirement
{
  return self->_hasActionRequirement;
}

- (void)setHasParameterCandidatesNotFounds:(BOOL)a3
{
  self->_hasParameterCandidatesNotFounds = a3;
}

- (BOOL)hasParameterCandidatesNotFounds
{
  return self->_hasParameterCandidatesNotFounds;
}

- (void)setHasParameterNotAllowed:(BOOL)a3
{
  self->_hasParameterNotAllowed = a3;
}

- (BOOL)hasParameterNotAllowed
{
  return self->_hasParameterNotAllowed;
}

- (void)setHasParameterDisambiguation:(BOOL)a3
{
  self->_hasParameterDisambiguation = a3;
}

- (BOOL)hasParameterDisambiguation
{
  return self->_hasParameterDisambiguation;
}

- (void)setHasParameterConfirmation:(BOOL)a3
{
  self->_hasParameterConfirmation = a3;
}

- (BOOL)hasParameterConfirmation
{
  return self->_hasParameterConfirmation;
}

- (void)setHasParameterNeedsValue:(BOOL)a3
{
  self->_hasParameterNeedsValue = a3;
}

- (BOOL)hasParameterNeedsValue
{
  return self->_hasParameterNeedsValue;
}

- (void)setHasActionConfirmation:(BOOL)a3
{
  self->_hasActionConfirmation = a3;
}

- (BOOL)hasActionConfirmation
{
  return self->_hasActionConfirmation;
}

- (void)setHasSuccess:(BOOL)a3
{
  self->_hasSuccess = a3;
}

- (BOOL)hasSuccess
{
  return self->_hasSuccess;
}

- (unint64_t)whichOneof_Statementoutcome
{
  return self->_whichOneof_Statementoutcome;
}

- (IFTSchemaIFTStatementOutcome)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IFTSchemaIFTStatementOutcome;
  v5 = [(IFTSchemaIFTStatementOutcome *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"success"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTActionSuccess alloc] initWithDictionary:v6];
      [(IFTSchemaIFTStatementOutcome *)v5 setSuccess:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"actionConfirmation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTActionConfirmation alloc] initWithDictionary:v8];
      [(IFTSchemaIFTStatementOutcome *)v5 setActionConfirmation:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"parameterNeedsValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTParameterNeedsValue alloc] initWithDictionary:v10];
      [(IFTSchemaIFTStatementOutcome *)v5 setParameterNeedsValue:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"parameterConfirmation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTParameterConfirmation alloc] initWithDictionary:v12];
      [(IFTSchemaIFTStatementOutcome *)v5 setParameterConfirmation:v13];
    }
    int v32 = (void *)v12;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"parameterDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaIFTParameterDisambiguation alloc] initWithDictionary:v14];
      [(IFTSchemaIFTStatementOutcome *)v5 setParameterDisambiguation:v15];
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"parameterNotAllowed", v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTParameterNotAllowed alloc] initWithDictionary:v16];
      [(IFTSchemaIFTStatementOutcome *)v5 setParameterNotAllowed:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"parameterCandidatesNotFounds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[IFTSchemaIFTParameterCandidatesNotFound alloc] initWithDictionary:v18];
      [(IFTSchemaIFTStatementOutcome *)v5 setParameterCandidatesNotFounds:v19];
    }
    v33 = (void *)v10;
    v34 = (void *)v6;
    int v20 = [v4 objectForKeyedSubscript:@"actionRequirement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[IFTSchemaIFTActionRequirement alloc] initWithDictionary:v20];
      [(IFTSchemaIFTStatementOutcome *)v5 setActionRequirement:v21];
    }
    v22 = (void *)v8;
    int v23 = [v4 objectForKeyedSubscript:@"toolDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[IFTSchemaIFTToolDisambiguation alloc] initWithDictionary:v23];
      [(IFTSchemaIFTStatementOutcome *)v5 setToolDisambiguation:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"failure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[IFTSchemaIFTActionFailure alloc] initWithDictionary:v25];
      [(IFTSchemaIFTStatementOutcome *)v5 setFailure:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"valueDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[IFTSchemaIFTValueDisambiguation alloc] initWithDictionary:v27];
      [(IFTSchemaIFTStatementOutcome *)v5 setValueDisambiguation:v28];
    }
    int v29 = v5;
  }
  return v5;
}

- (IFTSchemaIFTStatementOutcome)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTStatementOutcome *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTStatementOutcome *)self dictionaryRepresentation];
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
  if (self->_actionConfirmation)
  {
    id v4 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionConfirmation"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionConfirmation"];
    }
  }
  if (self->_actionRequirement)
  {
    uint64_t v7 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"actionRequirement"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"actionRequirement"];
    }
  }
  if (self->_failure)
  {
    uint64_t v10 = [(IFTSchemaIFTStatementOutcome *)self failure];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"failure"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"failure"];
    }
  }
  if (self->_parameterCandidatesNotFounds)
  {
    v13 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"parameterCandidatesNotFounds"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"parameterCandidatesNotFounds"];
    }
  }
  if (self->_parameterConfirmation)
  {
    v16 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"parameterConfirmation"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"parameterConfirmation"];
    }
  }
  if (self->_parameterDisambiguation)
  {
    v19 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"parameterDisambiguation"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"parameterDisambiguation"];
    }
  }
  if (self->_parameterNeedsValue)
  {
    v22 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"parameterNeedsValue"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"parameterNeedsValue"];
    }
  }
  if (self->_parameterNotAllowed)
  {
    v25 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"parameterNotAllowed"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"parameterNotAllowed"];
    }
  }
  if (self->_success)
  {
    v28 = [(IFTSchemaIFTStatementOutcome *)self success];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"success"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"success"];
    }
  }
  if (self->_toolDisambiguation)
  {
    v31 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"toolDisambiguation"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"toolDisambiguation"];
    }
  }
  if (self->_valueDisambiguation)
  {
    v34 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
    objc_super v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"valueDisambiguation"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"valueDisambiguation"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTActionSuccess *)self->_success hash];
  unint64_t v4 = [(IFTSchemaIFTActionConfirmation *)self->_actionConfirmation hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTParameterNeedsValue *)self->_parameterNeedsValue hash];
  unint64_t v6 = v4 ^ v5 ^ [(IFTSchemaIFTParameterConfirmation *)self->_parameterConfirmation hash];
  unint64_t v7 = [(IFTSchemaIFTParameterDisambiguation *)self->_parameterDisambiguation hash];
  unint64_t v8 = v7 ^ [(IFTSchemaIFTParameterNotAllowed *)self->_parameterNotAllowed hash];
  unint64_t v9 = v6 ^ v8 ^ [(IFTSchemaIFTParameterCandidatesNotFound *)self->_parameterCandidatesNotFounds hash];
  unint64_t v10 = [(IFTSchemaIFTActionRequirement *)self->_actionRequirement hash];
  unint64_t v11 = v10 ^ [(IFTSchemaIFTToolDisambiguation *)self->_toolDisambiguation hash];
  unint64_t v12 = v11 ^ [(IFTSchemaIFTActionFailure *)self->_failure hash];
  return v9 ^ v12 ^ [(IFTSchemaIFTValueDisambiguation *)self->_valueDisambiguation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  unint64_t whichOneof_Statementoutcome = self->_whichOneof_Statementoutcome;
  if (whichOneof_Statementoutcome != objc_msgSend(v4, "whichOneof_Statementoutcome")) {
    goto LABEL_58;
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self success];
  unint64_t v7 = [v4 success];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v8 = [(IFTSchemaIFTStatementOutcome *)self success];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(IFTSchemaIFTStatementOutcome *)self success];
    unint64_t v11 = [v4 success];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
  unint64_t v7 = [v4 actionConfirmation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v13 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
    v16 = [v4 actionConfirmation];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
  unint64_t v7 = [v4 parameterNeedsValue];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v18 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
    v21 = [v4 parameterNeedsValue];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
  unint64_t v7 = [v4 parameterConfirmation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v23 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
    int v26 = [v4 parameterConfirmation];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
  unint64_t v7 = [v4 parameterDisambiguation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v28 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
    v31 = [v4 parameterDisambiguation];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
  unint64_t v7 = [v4 parameterNotAllowed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v33 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
  if (v33)
  {
    v34 = (void *)v33;
    objc_super v35 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
    v36 = [v4 parameterNotAllowed];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
  unint64_t v7 = [v4 parameterCandidatesNotFounds];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v38 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
  if (v38)
  {
    v39 = (void *)v38;
    objc_super v40 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
    v41 = [v4 parameterCandidatesNotFounds];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
  unint64_t v7 = [v4 actionRequirement];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v43 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
    v46 = [v4 actionRequirement];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
  unint64_t v7 = [v4 toolDisambiguation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v48 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
    v51 = [v4 toolDisambiguation];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self failure];
  unint64_t v7 = [v4 failure];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v53 = [(IFTSchemaIFTStatementOutcome *)self failure];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(IFTSchemaIFTStatementOutcome *)self failure];
    v56 = [v4 failure];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
  unint64_t v7 = [v4 valueDisambiguation];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v58 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
    if (!v58)
    {

LABEL_61:
      BOOL v63 = 1;
      goto LABEL_59;
    }
    v59 = (void *)v58;
    v60 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
    v61 = [v4 valueDisambiguation];
    char v62 = [v60 isEqual:v61];

    if (v62) {
      goto LABEL_61;
    }
  }
  else
  {
LABEL_57:
  }
LABEL_58:
  BOOL v63 = 0;
LABEL_59:

  return v63;
}

- (void)writeTo:(id)a3
{
  id v26 = a3;
  id v4 = [(IFTSchemaIFTStatementOutcome *)self success];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTStatementOutcome *)self success];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];

  if (v6)
  {
    unint64_t v7 = [(IFTSchemaIFTStatementOutcome *)self actionConfirmation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];

  if (v8)
  {
    unint64_t v9 = [(IFTSchemaIFTStatementOutcome *)self parameterNeedsValue];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];

  if (v10)
  {
    unint64_t v11 = [(IFTSchemaIFTStatementOutcome *)self parameterConfirmation];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTStatementOutcome *)self parameterDisambiguation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];

  if (v14)
  {
    v15 = [(IFTSchemaIFTStatementOutcome *)self parameterNotAllowed];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];

  if (v16)
  {
    int v17 = [(IFTSchemaIFTStatementOutcome *)self parameterCandidatesNotFounds];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];

  if (v18)
  {
    v19 = [(IFTSchemaIFTStatementOutcome *)self actionRequirement];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];

  if (v20)
  {
    v21 = [(IFTSchemaIFTStatementOutcome *)self toolDisambiguation];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(IFTSchemaIFTStatementOutcome *)self failure];

  if (v22)
  {
    uint64_t v23 = [(IFTSchemaIFTStatementOutcome *)self failure];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];

  if (v24)
  {
    v25 = [(IFTSchemaIFTStatementOutcome *)self valueDisambiguation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTStatementOutcomeReadFrom(self, (uint64_t)a3);
}

- (void)deleteValueDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 11)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_valueDisambiguation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTValueDisambiguation)valueDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 11) {
    v2 = self->_valueDisambiguation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setValueDisambiguation:(id)a3
{
  id v4 = (IFTSchemaIFTValueDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  unint64_t v15 = 11;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = v4;
}

- (void)deleteFailure
{
  if (self->_whichOneof_Statementoutcome == 10)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_failure = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionFailure)failure
{
  if (self->_whichOneof_Statementoutcome == 10) {
    v2 = self->_failure;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailure:(id)a3
{
  id v4 = (IFTSchemaIFTActionFailure *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 10;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  failure = self->_failure;
  self->_failure = v4;
}

- (void)deleteToolDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 9)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_toolDisambiguation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTToolDisambiguation)toolDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 9) {
    v2 = self->_toolDisambiguation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setToolDisambiguation:(id)a3
{
  id v4 = (IFTSchemaIFTToolDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 9;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = v4;
}

- (void)deleteActionRequirement
{
  if (self->_whichOneof_Statementoutcome == 8)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_actionRequirement = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionRequirement)actionRequirement
{
  if (self->_whichOneof_Statementoutcome == 8) {
    v2 = self->_actionRequirement;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionRequirement:(id)a3
{
  id v4 = (IFTSchemaIFTActionRequirement *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_unint64_t whichOneof_Statementoutcome = 8 * (v4 != 0);
  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = v4;
}

- (void)deleteParameterCandidatesNotFounds
{
  if (self->_whichOneof_Statementoutcome == 7)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_parameterCandidatesNotFounds = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTParameterCandidatesNotFound)parameterCandidatesNotFounds
{
  if (self->_whichOneof_Statementoutcome == 7) {
    v2 = self->_parameterCandidatesNotFounds;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameterCandidatesNotFounds:(id)a3
{
  id v4 = (IFTSchemaIFTParameterCandidatesNotFound *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 7;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = v4;
}

- (void)deleteParameterNotAllowed
{
  if (self->_whichOneof_Statementoutcome == 6)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_parameterNotAllowed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTParameterNotAllowed)parameterNotAllowed
{
  if (self->_whichOneof_Statementoutcome == 6) {
    v2 = self->_parameterNotAllowed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameterNotAllowed:(id)a3
{
  id v4 = (IFTSchemaIFTParameterNotAllowed *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 6;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = v4;
}

- (void)deleteParameterDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 5)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_parameterDisambiguation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTParameterDisambiguation)parameterDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 5) {
    v2 = self->_parameterDisambiguation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameterDisambiguation:(id)a3
{
  id v4 = (IFTSchemaIFTParameterDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 5;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = v4;
}

- (void)deleteParameterConfirmation
{
  if (self->_whichOneof_Statementoutcome == 4)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_parameterConfirmation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTParameterConfirmation)parameterConfirmation
{
  if (self->_whichOneof_Statementoutcome == 4) {
    v2 = self->_parameterConfirmation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameterConfirmation:(id)a3
{
  id v4 = (IFTSchemaIFTParameterConfirmation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_unint64_t whichOneof_Statementoutcome = 4 * (v4 != 0);
  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = v4;
}

- (void)deleteParameterNeedsValue
{
  if (self->_whichOneof_Statementoutcome == 3)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_parameterNeedsValue = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTParameterNeedsValue)parameterNeedsValue
{
  if (self->_whichOneof_Statementoutcome == 3) {
    v2 = self->_parameterNeedsValue;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setParameterNeedsValue:(id)a3
{
  id v4 = (IFTSchemaIFTParameterNeedsValue *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  unint64_t v15 = 3;
  if (!v4) {
    unint64_t v15 = 0;
  }
  self->_unint64_t whichOneof_Statementoutcome = v15;
  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = v4;
}

- (void)deleteActionConfirmation
{
  if (self->_whichOneof_Statementoutcome == 2)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_actionConfirmation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionConfirmation)actionConfirmation
{
  if (self->_whichOneof_Statementoutcome == 2) {
    v2 = self->_actionConfirmation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionConfirmation:(id)a3
{
  id v4 = (IFTSchemaIFTActionConfirmation *)a3;
  success = self->_success;
  self->_success = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_unint64_t whichOneof_Statementoutcome = 2 * (v4 != 0);
  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = v4;
}

- (void)deleteSuccess
{
  if (self->_whichOneof_Statementoutcome == 1)
  {
    self->_unint64_t whichOneof_Statementoutcome = 0;
    self->_success = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionSuccess)success
{
  if (self->_whichOneof_Statementoutcome == 1) {
    v2 = self->_success;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSuccess:(id)a3
{
  id v4 = (IFTSchemaIFTActionSuccess *)a3;
  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_unint64_t whichOneof_Statementoutcome = v4 != 0;
  success = self->_success;
  self->_success = v4;
}

@end