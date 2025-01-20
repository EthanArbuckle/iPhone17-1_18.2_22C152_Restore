@interface NLRouterSchemaNLRouterSubComponentHandleEnded
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasNlRouterSubComponentHandleEndedData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterSubComponentHandleEnded)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterSubComponentHandleEnded)initWithJSON:(id)a3;
- (NLRouterSchemaNLRouterSubComponentHandleEndedData)nlRouterSubComponentHandleEndedData;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteNlRouterSubComponentHandleEndedData;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasNlRouterSubComponentHandleEndedData:(BOOL)a3;
- (void)setNlRouterSubComponentHandleEndedData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterSubComponentHandleEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self deleteNlRouterSubComponentHandleEndedData];
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

- (void)setHasNlRouterSubComponentHandleEndedData:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNlRouterSubComponentHandleEndedData:(id)a3
{
}

- (NLRouterSchemaNLRouterSubComponentHandleEndedData)nlRouterSubComponentHandleEndedData
{
  return self->_nlRouterSubComponentHandleEndedData;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NLRouterSchemaNLRouterSubComponentHandleEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleEnded;
  v5 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterSubComponentHandleEnded setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"nlRouterSubComponentHandleEndedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[NLRouterSchemaNLRouterSubComponentHandleEndedData alloc] initWithDictionary:v7];
      [(NLRouterSchemaNLRouterSubComponentHandleEnded *)v5 setNlRouterSubComponentHandleEndedData:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterSubComponentHandleEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NLRouterSchemaNLRouterSubComponentHandleEnded exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_nlRouterSubComponentHandleEndedData)
  {
    v5 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"nlRouterSubComponentHandleEndedData"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"nlRouterSubComponentHandleEndedData"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NLRouterSchemaNLRouterSubComponentHandleEndedData *)self->_nlRouterSubComponentHandleEndedData hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int exists = self->_exists, exists == [v4 exists]))
      {
        v6 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
        uint64_t v7 = [v4 nlRouterSubComponentHandleEndedData];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
          v12 = [v4 nlRouterSubComponentHandleEndedData];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];

  v5 = v7;
  if (v4)
  {
    v6 = [(NLRouterSchemaNLRouterSubComponentHandleEnded *)self nlRouterSubComponentHandleEndedData];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentHandleEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNlRouterSubComponentHandleEndedData
{
}

- (BOOL)hasNlRouterSubComponentHandleEndedData
{
  return self->_nlRouterSubComponentHandleEndedData != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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