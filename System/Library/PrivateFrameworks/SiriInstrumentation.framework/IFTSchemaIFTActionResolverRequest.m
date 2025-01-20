@interface IFTSchemaIFTActionResolverRequest
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasIsAuthenticated;
- (BOOL)hasIsClientAction;
- (BOOL)hasIsConfirmed;
- (BOOL)hasResolvedParameters;
- (BOOL)hasStatementId;
- (BOOL)hasToolId;
- (BOOL)isAuthenticated;
- (BOOL)isClientAction;
- (BOOL)isConfirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionResolverRequest)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionResolverRequest)initWithJSON:(id)a3;
- (IFTSchemaIFTParameterSet)resolvedParameters;
- (IFTSchemaIFTStatementId)statementId;
- (NSArray)unresolvedParameterSets;
- (NSData)jsonData;
- (NSString)toolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)unresolvedParameterSetsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)unresolvedParameterSetsCount;
- (void)addUnresolvedParameterSets:(id)a3;
- (void)clearUnresolvedParameterSets;
- (void)deleteExists;
- (void)deleteIsAuthenticated;
- (void)deleteIsClientAction;
- (void)deleteIsConfirmed;
- (void)deleteResolvedParameters;
- (void)deleteStatementId;
- (void)deleteToolId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasIsAuthenticated:(BOOL)a3;
- (void)setHasIsClientAction:(BOOL)a3;
- (void)setHasIsConfirmed:(BOOL)a3;
- (void)setHasResolvedParameters:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setIsClientAction:(BOOL)a3;
- (void)setIsConfirmed:(BOOL)a3;
- (void)setResolvedParameters:(id)a3;
- (void)setStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)setUnresolvedParameterSets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionResolverRequest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTActionResolverRequest;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTActionResolverRequest *)self deleteToolId];
  }
  v6 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTActionResolverRequest *)self deleteStatementId];
  }
  v9 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTActionResolverRequest *)self deleteResolvedParameters];
  }
  v12 = [(IFTSchemaIFTActionResolverRequest *)self unresolvedParameterSets];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(IFTSchemaIFTActionResolverRequest *)self setUnresolvedParameterSets:v13];

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
  objc_storeStrong((id *)&self->_unresolvedParameterSets, 0);
  objc_storeStrong((id *)&self->_resolvedParameters, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

- (void)setHasResolvedParameters:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUnresolvedParameterSets:(id)a3
{
}

- (NSArray)unresolvedParameterSets
{
  return self->_unresolvedParameterSets;
}

- (void)setResolvedParameters:(id)a3
{
}

- (IFTSchemaIFTParameterSet)resolvedParameters
{
  return self->_resolvedParameters;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (BOOL)isConfirmed
{
  return self->_isConfirmed;
}

- (BOOL)isClientAction
{
  return self->_isClientAction;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTActionResolverRequest)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)IFTSchemaIFTActionResolverRequest;
  v5 = [(IFTSchemaIFTActionResolverRequest *)&v39 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionResolverRequest setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaIFTActionResolverRequest *)v5 setStatementId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(IFTSchemaIFTActionResolverRequest *)v5 setToolId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"isClientAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionResolverRequest setIsClientAction:](v5, "setIsClientAction:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isConfirmed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionResolverRequest setIsConfirmed:](v5, "setIsConfirmed:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isAuthenticated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionResolverRequest setIsAuthenticated:](v5, "setIsAuthenticated:", [v13 BOOLValue]);
    }
    v34 = v13;
    v14 = [v4 objectForKeyedSubscript:@"resolvedParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v15 = [[IFTSchemaIFTParameterSet alloc] initWithDictionary:v14];
      v16 = v14;
      v17 = v12;
      v18 = v15;
      [(IFTSchemaIFTActionResolverRequest *)v5 setResolvedParameters:v15];

      v12 = v17;
      v14 = v16;
    }
    v19 = [v4 objectForKeyedSubscript:@"unresolvedParameterSets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = v14;
      v30 = v12;
      v31 = v11;
      v32 = v7;
      v33 = v6;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v26 = [[IFTSchemaIFTParameterSet alloc] initWithDictionary:v25];
              [(IFTSchemaIFTActionResolverRequest *)v5 addUnresolvedParameterSets:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v22);
      }

      v7 = v32;
      v6 = v33;
      int v11 = v31;
      v14 = v29;
      v12 = v30;
    }
    v27 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionResolverRequest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionResolverRequest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionResolverRequest *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionResolverRequest exists](self, "exists"));
    [v3 setObject:v8 forKeyedSubscript:@"exists"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isAuthenticated](self, "isAuthenticated"));
  [v3 setObject:v9 forKeyedSubscript:@"isAuthenticated"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isClientAction](self, "isClientAction"));
  [v3 setObject:v10 forKeyedSubscript:@"isClientAction"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isConfirmed](self, "isConfirmed"));
    [v3 setObject:v5 forKeyedSubscript:@"isConfirmed"];
  }
LABEL_6:
  if (self->_resolvedParameters)
  {
    v6 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"resolvedParameters"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"resolvedParameters"];
    }
  }
  if (self->_statementId)
  {
    v12 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_toolId)
  {
    objc_super v15 = [(IFTSchemaIFTActionResolverRequest *)self toolId];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"toolId"];
  }
  if ([(NSArray *)self->_unresolvedParameterSets count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v18 = self->_unresolvedParameterSets;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"unresolvedParameterSets"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  NSUInteger v5 = [(NSString *)self->_toolId hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 2654435761 * self->_isClientAction;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isConfirmed;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_isAuthenticated;
LABEL_11:
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v10 = v7 ^ v8 ^ [(IFTSchemaIFTParameterSet *)self->_resolvedParameters hash];
  return v9 ^ v10 ^ [(NSArray *)self->_unresolvedParameterSets hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_36;
    }
  }
  uint64_t v6 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
  uint64_t v7 = [v4 statementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_35;
  }
  uint64_t v8 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
    int v11 = [v4 statementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFTSchemaIFTActionResolverRequest *)self toolId];
  uint64_t v7 = [v4 toolId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_35;
  }
  uint64_t v13 = [(IFTSchemaIFTActionResolverRequest *)self toolId];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(IFTSchemaIFTActionResolverRequest *)self toolId];
    v16 = [v4 toolId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  $8EDFC85E17A9C144CFCD513E35FF968D has = self->_has;
  int v19 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v20 = v4[56];
  if (v19 != ((v20 >> 1) & 1)) {
    goto LABEL_36;
  }
  if (v19)
  {
    int isClientAction = self->_isClientAction;
    if (isClientAction != [v4 isClientAction]) {
      goto LABEL_36;
    }
    $8EDFC85E17A9C144CFCD513E35FF968D has = self->_has;
    unsigned int v20 = v4[56];
  }
  int v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1)) {
    goto LABEL_36;
  }
  if (v22)
  {
    int isConfirmed = self->_isConfirmed;
    if (isConfirmed != [v4 isConfirmed]) {
      goto LABEL_36;
    }
    $8EDFC85E17A9C144CFCD513E35FF968D has = self->_has;
    unsigned int v20 = v4[56];
  }
  int v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v20 >> 3) & 1)) {
    goto LABEL_36;
  }
  if (v24)
  {
    int isAuthenticated = self->_isAuthenticated;
    if (isAuthenticated != [v4 isAuthenticated]) {
      goto LABEL_36;
    }
  }
  uint64_t v6 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
  uint64_t v7 = [v4 resolvedParameters];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_35;
  }
  uint64_t v26 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
  if (v26)
  {
    long long v27 = (void *)v26;
    long long v28 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
    long long v29 = [v4 resolvedParameters];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFTSchemaIFTActionResolverRequest *)self unresolvedParameterSets];
  uint64_t v7 = [v4 unresolvedParameterSets];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v31 = [(IFTSchemaIFTActionResolverRequest *)self unresolvedParameterSets];
  if (!v31)
  {

LABEL_39:
    BOOL v36 = 1;
    goto LABEL_37;
  }
  v32 = (void *)v31;
  v33 = [(IFTSchemaIFTActionResolverRequest *)self unresolvedParameterSets];
  v34 = [v4 unresolvedParameterSets];
  char v35 = [v33 isEqual:v34];

  if (v35) {
    goto LABEL_39;
  }
LABEL_36:
  BOOL v36 = 0;
LABEL_37:

  return v36;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v5 = [(IFTSchemaIFTActionResolverRequest *)self statementId];

  if (v5)
  {
    uint64_t v6 = [(IFTSchemaIFTActionResolverRequest *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(IFTSchemaIFTActionResolverRequest *)self toolId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  unint64_t v9 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];

  if (v9)
  {
    unint64_t v10 = [(IFTSchemaIFTActionResolverRequest *)self resolvedParameters];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_unresolvedParameterSets;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionResolverRequestReadFrom(self, (uint64_t)a3);
}

- (id)unresolvedParameterSetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_unresolvedParameterSets objectAtIndexedSubscript:a3];
}

- (unint64_t)unresolvedParameterSetsCount
{
  return [(NSArray *)self->_unresolvedParameterSets count];
}

- (void)addUnresolvedParameterSets:(id)a3
{
  id v4 = a3;
  unresolvedParameterSets = self->_unresolvedParameterSets;
  id v8 = v4;
  if (!unresolvedParameterSets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_unresolvedParameterSets;
    self->_unresolvedParameterSets = v6;

    id v4 = v8;
    unresolvedParameterSets = self->_unresolvedParameterSets;
  }
  [(NSArray *)unresolvedParameterSets addObject:v4];
}

- (void)clearUnresolvedParameterSets
{
}

- (void)deleteResolvedParameters
{
}

- (BOOL)hasResolvedParameters
{
  return self->_resolvedParameters != 0;
}

- (void)deleteIsAuthenticated
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsAuthenticated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsAuthenticated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isAuthenticated = a3;
}

- (void)deleteIsConfirmed
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsConfirmed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsConfirmed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsConfirmed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isConfirmed = a3;
}

- (void)deleteIsClientAction
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsClientAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsClientAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsClientAction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isClientAction = a3;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end