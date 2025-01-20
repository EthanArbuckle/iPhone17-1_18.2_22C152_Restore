@interface NLXSchemaCDMRequestStarted
- (BOOL)hasCurrentTurnInput;
- (BOOL)hasLoggableSharedUserId;
- (BOOL)hasServiceGraphName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMRequestStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMRequestStarted)initWithJSON:(id)a3;
- (NLXSchemaCDMTurnInput)currentTurnInput;
- (NSData)jsonData;
- (NSString)loggableSharedUserId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)serviceGraphName;
- (unint64_t)hash;
- (void)deleteCurrentTurnInput;
- (void)deleteLoggableSharedUserId;
- (void)deleteServiceGraphName;
- (void)setCurrentTurnInput:(id)a3;
- (void)setHasCurrentTurnInput:(BOOL)a3;
- (void)setHasLoggableSharedUserId:(BOOL)a3;
- (void)setHasServiceGraphName:(BOOL)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setServiceGraphName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMRequestStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(NLXSchemaCDMRequestStarted *)self deleteLoggableSharedUserId];
  }
  v6 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMRequestStarted *)self deleteCurrentTurnInput];
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
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCurrentTurnInput:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

- (void)setCurrentTurnInput:(id)a3
{
}

- (NLXSchemaCDMTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
}

- (NLXSchemaCDMRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMRequestStarted;
  v5 = [(NLXSchemaCDMRequestStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentTurnInput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NLXSchemaCDMTurnInput alloc] initWithDictionary:v6];
      [(NLXSchemaCDMRequestStarted *)v5 setCurrentTurnInput:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"serviceGraphName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRequestStarted setServiceGraphName:](v5, "setServiceGraphName:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"loggableSharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = (void *)[v9 copy];
      [(NLXSchemaCDMRequestStarted *)v5 setLoggableSharedUserId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (NLXSchemaCDMRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMRequestStarted *)self dictionaryRepresentation];
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
  if (self->_currentTurnInput)
  {
    id v4 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"currentTurnInput"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"currentTurnInput"];
    }
  }
  if (self->_loggableSharedUserId)
  {
    uint64_t v7 = [(NLXSchemaCDMRequestStarted *)self loggableSharedUserId];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"loggableSharedUserId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(NLXSchemaCDMRequestStarted *)self serviceGraphName] - 1;
    if (v9 > 6) {
      objc_super v10 = @"CDMSERVICEGRAPHNAME_UNKNOWN";
    }
    else {
      objc_super v10 = off_1E5EB2E50[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"serviceGraphName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NLXSchemaCDMTurnInput *)self->_currentTurnInput hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_serviceGraphName;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_loggableSharedUserId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
  v6 = [v4 currentTurnInput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
  if (v7)
  {
    int v8 = (void *)v7;
    unsigned int v9 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
    objc_super v10 = [v4 currentTurnInput];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int serviceGraphName = self->_serviceGraphName;
    if (serviceGraphName != [v4 serviceGraphName]) {
      goto LABEL_15;
    }
  }
  v5 = [(NLXSchemaCDMRequestStarted *)self loggableSharedUserId];
  v6 = [v4 loggableSharedUserId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(NLXSchemaCDMRequestStarted *)self loggableSharedUserId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(NLXSchemaCDMRequestStarted *)self loggableSharedUserId];
    v16 = [v4 loggableSharedUserId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];

  if (v4)
  {
    v5 = [(NLXSchemaCDMRequestStarted *)self currentTurnInput];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(NLXSchemaCDMRequestStarted *)self loggableSharedUserId];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLoggableSharedUserId
{
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteServiceGraphName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceGraphName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServiceGraphName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int serviceGraphName = a3;
}

- (void)deleteCurrentTurnInput
{
}

- (BOOL)hasCurrentTurnInput
{
  return self->_currentTurnInput != 0;
}

@end