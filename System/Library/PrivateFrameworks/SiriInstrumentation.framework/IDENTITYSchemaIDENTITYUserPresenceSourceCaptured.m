@interface IDENTITYSchemaIDENTITYUserPresenceSourceCaptured
- (BOOL)hasUserPresenceSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)userPresenceSource;
- (unint64_t)hash;
- (void)deleteUserPresenceSource;
- (void)setHasUserPresenceSource:(BOOL)a3;
- (void)setUserPresenceSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYUserPresenceSourceCaptured

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)userPresenceSource
{
  return self->_userPresenceSource;
}

- (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDENTITYSchemaIDENTITYUserPresenceSourceCaptured;
  v5 = [(IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userPresenceSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYUserPresenceSourceCaptured setUserPresenceSource:](v5, "setUserPresenceSource:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)self dictionaryRepresentation];
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
    int v4 = [(IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)self userPresenceSource];
    v5 = @"IDENTITYUSERPRESENCESOURCE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"IDENTITYUSERPRESENCESOURCE_GEO_FENCE";
    }
    if (v4 == 2) {
      v6 = @"IDENTITYUSERPRESENCESOURCE_DEVICE_DISCOVERY";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"userPresenceSource"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_userPresenceSource;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int userPresenceSource = self->_userPresenceSource,
            userPresenceSource == [v4 userPresenceSource]))
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
  return IDENTITYSchemaIDENTITYUserPresenceSourceCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserPresenceSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserPresenceSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserPresenceSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserPresenceSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userPresenceSource = a3;
}

@end