@interface ORCHSchemaORCHExecuteOnRemoteRequestStarted
- (BOOL)hasAceCommandName;
- (BOOL)hasAceCommandType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)aceCommandName;
- (ORCHSchemaORCHExecuteOnRemoteRequestStarted)initWithDictionary:(id)a3;
- (ORCHSchemaORCHExecuteOnRemoteRequestStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)aceCommandType;
- (unint64_t)hash;
- (void)deleteAceCommandName;
- (void)deleteAceCommandType;
- (void)setAceCommandName:(id)a3;
- (void)setAceCommandType:(int)a3;
- (void)setHasAceCommandName:(BOOL)a3;
- (void)setHasAceCommandType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHExecuteOnRemoteRequestStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAceCommandName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)aceCommandType
{
  return self->_aceCommandType;
}

- (void)setAceCommandName:(id)a3
{
}

- (NSString)aceCommandName
{
  return self->_aceCommandName;
}

- (ORCHSchemaORCHExecuteOnRemoteRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHExecuteOnRemoteRequestStarted;
  v5 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aceCommandName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)v5 setAceCommandName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"aceCommandType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecuteOnRemoteRequestStarted setAceCommandType:](v5, "setAceCommandType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHExecuteOnRemoteRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self dictionaryRepresentation];
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
  if (self->_aceCommandName)
  {
    id v4 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceCommandName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandType] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"ORCHACECOMMANDTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBCE50[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"aceCommandType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_aceCommandName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_aceCommandType;
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
  v5 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandName];
  unsigned int v6 = [v4 aceCommandName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandName];
    objc_super v11 = [v4 aceCommandName];
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
    int aceCommandType = self->_aceCommandType;
    if (aceCommandType != [v4 aceCommandType]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(ORCHSchemaORCHExecuteOnRemoteRequestStarted *)self aceCommandName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHExecuteOnRemoteRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAceCommandType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAceCommandType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAceCommandType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAceCommandType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int aceCommandType = a3;
}

- (void)deleteAceCommandName
{
}

- (BOOL)hasAceCommandName
{
  return self->_aceCommandName != 0;
}

@end