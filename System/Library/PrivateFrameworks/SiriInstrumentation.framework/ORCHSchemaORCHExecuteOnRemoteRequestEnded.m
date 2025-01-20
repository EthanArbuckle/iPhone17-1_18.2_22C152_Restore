@interface ORCHSchemaORCHExecuteOnRemoteRequestEnded
- (BOOL)hasAceCommandType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHExecuteOnRemoteRequestEnded)initWithDictionary:(id)a3;
- (ORCHSchemaORCHExecuteOnRemoteRequestEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)aceCommandType;
- (unint64_t)hash;
- (void)deleteAceCommandType;
- (void)setAceCommandType:(int)a3;
- (void)setHasAceCommandType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHExecuteOnRemoteRequestEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)aceCommandType
{
  return self->_aceCommandType;
}

- (ORCHSchemaORCHExecuteOnRemoteRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ORCHSchemaORCHExecuteOnRemoteRequestEnded;
  v5 = [(ORCHSchemaORCHExecuteOnRemoteRequestEnded *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aceCommandType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecuteOnRemoteRequestEnded setAceCommandType:](v5, "setAceCommandType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHExecuteOnRemoteRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHExecuteOnRemoteRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHExecuteOnRemoteRequestEnded *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ORCHSchemaORCHExecuteOnRemoteRequestEnded *)self aceCommandType] - 1;
    if (v4 > 4) {
      v5 = @"ORCHACECOMMANDTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBCE00[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"aceCommandType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_aceCommandType;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int aceCommandType = self->_aceCommandType, aceCommandType == [v4 aceCommandType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHExecuteOnRemoteRequestEndedReadFrom(self, (uint64_t)a3);
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

@end