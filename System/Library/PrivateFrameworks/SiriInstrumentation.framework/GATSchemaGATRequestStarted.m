@interface GATSchemaGATRequestStarted
- (BOOL)hasAppIntentName;
- (BOOL)hasClientTraceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATRequestStarted)initWithDictionary:(id)a3;
- (GATSchemaGATRequestStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)clientTraceId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appIntentName;
- (unint64_t)hash;
- (void)deleteAppIntentName;
- (void)deleteClientTraceId;
- (void)setAppIntentName:(int)a3;
- (void)setClientTraceId:(id)a3;
- (void)setHasAppIntentName:(BOOL)a3;
- (void)setHasClientTraceId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GATSchemaGATRequestStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(GATSchemaGATRequestStarted *)self clientTraceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(GATSchemaGATRequestStarted *)self deleteClientTraceId];
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
}

- (void)setHasClientTraceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)appIntentName
{
  return self->_appIntentName;
}

- (void)setClientTraceId:(id)a3
{
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (GATSchemaGATRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GATSchemaGATRequestStarted;
  v5 = [(GATSchemaGATRequestStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clientTraceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(GATSchemaGATRequestStarted *)v5 setClientTraceId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"appIntentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GATSchemaGATRequestStarted setAppIntentName:](v5, "setAppIntentName:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (GATSchemaGATRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATRequestStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(GATSchemaGATRequestStarted *)self appIntentName] - 1;
    if (v4 > 2) {
      v5 = @"GATAPPINTENTNAME_UNKNOWN";
    }
    else {
      v5 = off_1E5EC1718[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"appIntentName"];
  }
  if (self->_clientTraceId)
  {
    v6 = [(GATSchemaGATRequestStarted *)self clientTraceId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"clientTraceId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"clientTraceId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clientTraceId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_appIntentName;
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
  v5 = [(GATSchemaGATRequestStarted *)self clientTraceId];
  v6 = [v4 clientTraceId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(GATSchemaGATRequestStarted *)self clientTraceId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(GATSchemaGATRequestStarted *)self clientTraceId];
    objc_super v11 = [v4 clientTraceId];
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
    int appIntentName = self->_appIntentName;
    if (appIntentName != [v4 appIntentName]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(GATSchemaGATRequestStarted *)self clientTraceId];

  if (v4)
  {
    v5 = [(GATSchemaGATRequestStarted *)self clientTraceId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GATSchemaGATRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppIntentName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAppIntentName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppIntentName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppIntentName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int appIntentName = a3;
}

- (void)deleteClientTraceId
{
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

@end