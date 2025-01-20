@interface SISchemaServerGeneratedDismissal
- (BOOL)hasServerGeneratedDismissalReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaServerGeneratedDismissal)initWithDictionary:(id)a3;
- (SISchemaServerGeneratedDismissal)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)serverGeneratedDismissalReason;
- (unint64_t)hash;
- (void)deleteServerGeneratedDismissalReason;
- (void)setHasServerGeneratedDismissalReason:(BOOL)a3;
- (void)setServerGeneratedDismissalReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaServerGeneratedDismissal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)serverGeneratedDismissalReason
{
  return self->_serverGeneratedDismissalReason;
}

- (SISchemaServerGeneratedDismissal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaServerGeneratedDismissal;
  v5 = [(SISchemaServerGeneratedDismissal *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"serverGeneratedDismissalReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaServerGeneratedDismissal setServerGeneratedDismissalReason:](v5, "setServerGeneratedDismissalReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaServerGeneratedDismissal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaServerGeneratedDismissal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaServerGeneratedDismissal *)self dictionaryRepresentation];
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
    unsigned int v4 = [(SISchemaServerGeneratedDismissal *)self serverGeneratedDismissalReason] - 1;
    if (v4 > 4) {
      v5 = @"SERVERGENERATEDDISMISSALREASON_UNKNOWN";
    }
    else {
      v5 = off_1E5EB84D8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"serverGeneratedDismissalReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_serverGeneratedDismissalReason;
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
        || (int serverGeneratedDismissalReason = self->_serverGeneratedDismissalReason,
            serverGeneratedDismissalReason == [v4 serverGeneratedDismissalReason]))
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
  return SISchemaServerGeneratedDismissalReadFrom(self, (uint64_t)a3);
}

- (void)deleteServerGeneratedDismissalReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasServerGeneratedDismissalReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerGeneratedDismissalReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServerGeneratedDismissalReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int serverGeneratedDismissalReason = a3;
}

@end