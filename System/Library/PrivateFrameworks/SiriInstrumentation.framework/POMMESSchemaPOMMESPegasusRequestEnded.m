@interface POMMESSchemaPOMMESPegasusRequestEnded
- (BOOL)hasClientDriven;
- (BOOL)hasConfidenceScore;
- (BOOL)hasIsRewrittenUtteranceUsed;
- (BOOL)hasKfedLatency;
- (BOOL)hasPayloadSizeInKB;
- (BOOL)hasPegasusDomain;
- (BOOL)hasRequestArguments;
- (BOOL)hasServerDriven;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRewrittenUtteranceUsed;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)pegasusDomain;
- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments;
- (POMMESSchemaPOMMESPegasusRequestEnded)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusRequestEnded)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESPegasusRequestKfedLatency)kfedLatency;
- (POMMESSchemaPOMMESPegasusResponseClientDrivenContext)clientDriven;
- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)serverDriven;
- (double)confidenceScore;
- (double)payloadSizeInKB;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteClientDriven;
- (void)deleteConfidenceScore;
- (void)deleteIsRewrittenUtteranceUsed;
- (void)deleteKfedLatency;
- (void)deletePayloadSizeInKB;
- (void)deletePegasusDomain;
- (void)deleteRequestArguments;
- (void)deleteServerDriven;
- (void)deleteStatus;
- (void)setClientDriven:(id)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setHasClientDriven:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasIsRewrittenUtteranceUsed:(BOOL)a3;
- (void)setHasKfedLatency:(BOOL)a3;
- (void)setHasPayloadSizeInKB:(BOOL)a3;
- (void)setHasPegasusDomain:(BOOL)a3;
- (void)setHasRequestArguments:(BOOL)a3;
- (void)setHasServerDriven:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsRewrittenUtteranceUsed:(BOOL)a3;
- (void)setKfedLatency:(id)a3;
- (void)setPayloadSizeInKB:(double)a3;
- (void)setPegasusDomain:(id)a3;
- (void)setRequestArguments:(id)a3;
- (void)setServerDriven:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)POMMESSchemaPOMMESPegasusRequestEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self deleteServerDriven];
  }
  v9 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self deleteClientDriven];
  }
  v12 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self deleteRequestArguments];
  }
  v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self deleteKfedLatency];
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
  objc_storeStrong((id *)&self->_kfedLatency, 0);
  objc_storeStrong((id *)&self->_requestArguments, 0);
  objc_storeStrong((id *)&self->_pegasusDomain, 0);
  objc_storeStrong((id *)&self->_clientDriven, 0);
  objc_storeStrong((id *)&self->_serverDriven, 0);
}

- (void)setHasKfedLatency:(BOOL)a3
{
  self->_hasClientDriven = a3;
}

- (void)setHasRequestArguments:(BOOL)a3
{
  self->_hasServerDriven = a3;
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasClientDriven:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasClientDriven
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasServerDriven:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasServerDriven
{
  return *((unsigned char *)&self->_has + 1);
}

- (void)setKfedLatency:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusRequestKfedLatency)kfedLatency
{
  return self->_kfedLatency;
}

- (void)setRequestArguments:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments
{
  return self->_requestArguments;
}

- (BOOL)isRewrittenUtteranceUsed
{
  return self->_isRewrittenUtteranceUsed;
}

- (void)setPegasusDomain:(id)a3
{
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (double)payloadSizeInKB
{
  return self->_payloadSizeInKB;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)whichContextevent
{
  return *(void *)&self->_hasKfedLatency;
}

- (POMMESSchemaPOMMESPegasusRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)POMMESSchemaPOMMESPegasusRequestEnded;
  v5 = [(POMMESSchemaPOMMESPegasusRequestEnded *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestEnded setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"confidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[POMMESSchemaPOMMESPegasusRequestEnded setConfidenceScore:](v5, "setConfidenceScore:");
    }
    int v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"payloadSizeInKB", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[POMMESSchemaPOMMESPegasusRequestEnded setPayloadSizeInKB:](v5, "setPayloadSizeInKB:");
    }
    v23 = v6;
    v9 = [v4 objectForKeyedSubscript:@"serverDriven"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[POMMESSchemaPOMMESPegasusResponseServerDrivenContext alloc] initWithDictionary:v9];
      [(POMMESSchemaPOMMESPegasusRequestEnded *)v5 setServerDriven:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"clientDriven"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[POMMESSchemaPOMMESPegasusResponseClientDrivenContext alloc] initWithDictionary:v11];
      [(POMMESSchemaPOMMESPegasusRequestEnded *)v5 setClientDriven:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"pegasusDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = (void *)[v13 copy];
      [(POMMESSchemaPOMMESPegasusRequestEnded *)v5 setPegasusDomain:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"isRewrittenUtteranceUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestEnded setIsRewrittenUtteranceUsed:](v5, "setIsRewrittenUtteranceUsed:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"requestArguments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[POMMESSchemaPOMMESPegasusRequestArguments alloc] initWithDictionary:v16];
      [(POMMESSchemaPOMMESPegasusRequestEnded *)v5 setRequestArguments:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"kfedLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v19 = [[POMMESSchemaPOMMESPegasusRequestKfedLatency alloc] initWithDictionary:v18];
      [(POMMESSchemaPOMMESPegasusRequestEnded *)v5 setKfedLatency:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self dictionaryRepresentation];
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
  if (self->_clientDriven)
  {
    id v4 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientDriven"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientDriven"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v8 = NSNumber;
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self confidenceScore];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"confidenceScore"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusRequestEnded isRewrittenUtteranceUsed](self, "isRewrittenUtteranceUsed"));
    [v3 setObject:v10 forKeyedSubscript:@"isRewrittenUtteranceUsed"];
  }
  if (self->_kfedLatency)
  {
    int v11 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"kfedLatency"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"kfedLatency"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v14 = NSNumber;
    [(POMMESSchemaPOMMESPegasusRequestEnded *)self payloadSizeInKB];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"payloadSizeInKB"];
  }
  if (self->_pegasusDomain)
  {
    v16 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self pegasusDomain];
    int v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"pegasusDomain"];
  }
  if (self->_requestArguments)
  {
    v18 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
    objc_super v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"requestArguments"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"requestArguments"];
    }
  }
  if (self->_serverDriven)
  {
    v21 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"serverDriven"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"serverDriven"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v24 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self status] - 1;
    if (v24 > 2) {
      v25 = @"POMMESPEGASUSRESPONSESTATUS_UNKNOWN";
    }
    else {
      v25 = off_1E5EB42F8[v24];
    }
    [v3 setObject:v25 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double confidenceScore = self->_confidenceScore;
  double v6 = -confidenceScore;
  if (confidenceScore >= 0.0) {
    double v6 = self->_confidenceScore;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double payloadSizeInKB = self->_payloadSizeInKB;
    double v12 = -payloadSizeInKB;
    if (payloadSizeInKB >= 0.0) {
      double v12 = self->_payloadSizeInKB;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v15 = [(POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)self->_serverDriven hash];
  unint64_t v16 = [(POMMESSchemaPOMMESPegasusResponseClientDrivenContext *)self->_clientDriven hash];
  NSUInteger v17 = [(NSString *)self->_pegasusDomain hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_isRewrittenUtteranceUsed;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v19 = v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v17;
  unint64_t v20 = v18 ^ [(POMMESSchemaPOMMESPegasusRequestArguments *)self->_requestArguments hash];
  return v19 ^ v20 ^ [(POMMESSchemaPOMMESPegasusRequestKfedLatency *)self->_kfedLatency hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  uint64_t v5 = *(void *)&self->_hasKfedLatency;
  if (v5 != [v4 whichContextevent]) {
    goto LABEL_42;
  }
  $E230000EE0E890308B0A9012095DAC39 has = self->_has;
  unsigned int v7 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    int status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_42;
    }
    $E230000EE0E890308B0A9012095DAC39 has = self->_has;
    unsigned int v7 = v4[80];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      double confidenceScore = self->_confidenceScore;
      [v4 confidenceScore];
      if (confidenceScore != v11) {
        goto LABEL_42;
      }
      $E230000EE0E890308B0A9012095DAC39 has = self->_has;
      unsigned int v7 = v4[80];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 != ((v7 >> 2) & 1)) {
      goto LABEL_42;
    }
    if (v12)
    {
      double payloadSizeInKB = self->_payloadSizeInKB;
      [v4 payloadSizeInKB];
      if (payloadSizeInKB != v14) {
        goto LABEL_42;
      }
    }
    unint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
    unint64_t v16 = [v4 serverDriven];
    if ((v15 == 0) == (v16 != 0)) {
      goto LABEL_41;
    }
    uint64_t v17 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      unint64_t v19 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
      unint64_t v20 = [v4 serverDriven];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_42;
      }
    }
    else
    {
    }
    unint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
    unint64_t v16 = [v4 clientDriven];
    if ((v15 == 0) == (v16 != 0)) {
      goto LABEL_41;
    }
    uint64_t v22 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
    if (v22)
    {
      v23 = (void *)v22;
      unsigned int v24 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
      v25 = [v4 clientDriven];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_42;
      }
    }
    else
    {
    }
    unint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self pegasusDomain];
    unint64_t v16 = [v4 pegasusDomain];
    if ((v15 == 0) == (v16 != 0)) {
      goto LABEL_41;
    }
    uint64_t v27 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self pegasusDomain];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self pegasusDomain];
      v30 = [v4 pegasusDomain];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_42;
      }
    }
    else
    {
    }
    int v32 = (*(unsigned char *)&self->_has >> 3) & 1;
    if (v32 != ((v4[80] >> 3) & 1)) {
      goto LABEL_42;
    }
    if (v32)
    {
      int isRewrittenUtteranceUsed = self->_isRewrittenUtteranceUsed;
      if (isRewrittenUtteranceUsed != [v4 isRewrittenUtteranceUsed]) {
        goto LABEL_42;
      }
    }
    unint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
    unint64_t v16 = [v4 requestArguments];
    if ((v15 == 0) == (v16 != 0)) {
      goto LABEL_41;
    }
    uint64_t v34 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
    if (v34)
    {
      v35 = (void *)v34;
      v36 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
      v37 = [v4 requestArguments];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_42;
      }
    }
    else
    {
    }
    unint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
    unint64_t v16 = [v4 kfedLatency];
    if ((v15 == 0) != (v16 != 0))
    {
      uint64_t v39 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
      if (!v39)
      {

LABEL_45:
        BOOL v44 = 1;
        goto LABEL_43;
      }
      v40 = (void *)v39;
      v41 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
      v42 = [v4 kfedLatency];
      char v43 = [v41 isEqual:v42];

      if (v43) {
        goto LABEL_45;
      }
    }
    else
    {
LABEL_41:
    }
  }
LABEL_42:
  BOOL v44 = 0;
LABEL_43:

  return v44;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  uint64_t v5 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];

  if (v5)
  {
    double v6 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self serverDriven];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v7 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];

  if (v7)
  {
    double v8 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self clientDriven];
    PBDataWriterWriteSubmessage();
  }
  int v9 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self pegasusDomain];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v10 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];

  if (v10)
  {
    double v11 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self requestArguments];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];

  long double v13 = v15;
  if (v12)
  {
    double v14 = [(POMMESSchemaPOMMESPegasusRequestEnded *)self kfedLatency];
    PBDataWriterWriteSubmessage();

    long double v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteKfedLatency
{
}

- (BOOL)hasKfedLatency
{
  return self->_kfedLatency != 0;
}

- (void)deleteRequestArguments
{
}

- (BOOL)hasRequestArguments
{
  return self->_requestArguments != 0;
}

- (void)deleteIsRewrittenUtteranceUsed
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsRewrittenUtteranceUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsRewrittenUtteranceUsed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsRewrittenUtteranceUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isRewrittenUtteranceUsed = a3;
}

- (void)deletePegasusDomain
{
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

- (void)deleteClientDriven
{
  if (*(void *)&self->_hasKfedLatency == 5)
  {
    *(void *)&self->_hasKfedLatency = 0;
    self->_clientDriven = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESPegasusResponseClientDrivenContext)clientDriven
{
  if (*(void *)&self->_hasKfedLatency == 5) {
    v2 = self->_clientDriven;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setClientDriven:(id)a3
{
  uint64_t v4 = (POMMESSchemaPOMMESPegasusResponseClientDrivenContext *)a3;
  serverDriven = self->_serverDriven;
  self->_serverDriven = 0;

  uint64_t v6 = 5;
  if (!v4) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_hasKfedLatency = v6;
  clientDriven = self->_clientDriven;
  self->_clientDriven = v4;
}

- (void)deleteServerDriven
{
  if (*(void *)&self->_hasKfedLatency == 4)
  {
    *(void *)&self->_hasKfedLatency = 0;
    self->_serverDriven = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)serverDriven
{
  if (*(void *)&self->_hasKfedLatency == 4) {
    v2 = self->_serverDriven;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerDriven:(id)a3
{
  uint64_t v4 = (POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)a3;
  clientDriven = self->_clientDriven;
  self->_clientDriven = 0;

  *(void *)&self->_hasKfedLatency = 4 * (v4 != 0);
  serverDriven = self->_serverDriven;
  self->_serverDriven = v4;
}

- (void)deletePayloadSizeInKB
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPayloadSizeInKB:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPayloadSizeInKB
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPayloadSizeInKB:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double payloadSizeInKB = a3;
}

- (void)deleteConfidenceScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidenceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double confidenceScore = a3;
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int status = a3;
}

@end