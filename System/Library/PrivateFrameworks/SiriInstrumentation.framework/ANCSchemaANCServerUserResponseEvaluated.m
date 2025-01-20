@interface ANCSchemaANCServerUserResponseEvaluated
- (ANCSchemaANCServerUserResponseEvaluated)initWithDictionary:(id)a3;
- (ANCSchemaANCServerUserResponseEvaluated)initWithJSON:(id)a3;
- (BOOL)hasUserResponseCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)userResponseCategory;
- (unint64_t)hash;
- (void)deleteUserResponseCategory;
- (void)setHasUserResponseCategory:(BOOL)a3;
- (void)setUserResponseCategory:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCServerUserResponseEvaluated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)userResponseCategory
{
  return self->_userResponseCategory;
}

- (ANCSchemaANCServerUserResponseEvaluated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANCSchemaANCServerUserResponseEvaluated;
  v5 = [(ANCSchemaANCServerUserResponseEvaluated *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userResponseCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCServerUserResponseEvaluated setUserResponseCategory:](v5, "setUserResponseCategory:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ANCSchemaANCServerUserResponseEvaluated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCServerUserResponseEvaluated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCServerUserResponseEvaluated *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ANCSchemaANCServerUserResponseEvaluated *)self userResponseCategory] - 1;
    if (v4 > 2) {
      v5 = @"ANCUSERRESPONSECATEGORY_UNKNOWN";
    }
    else {
      v5 = off_1E5EAC2F0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"userResponseCategory"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_userResponseCategory;
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
        || (int userResponseCategory = self->_userResponseCategory,
            userResponseCategory == [v4 userResponseCategory]))
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
  return ANCSchemaANCServerUserResponseEvaluatedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserResponseCategory
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserResponseCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserResponseCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserResponseCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userResponseCategory = a3;
}

@end