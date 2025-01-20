@interface DIMSchemaDIMEphemeralIdentifiers
- (BOOL)hasHomeEphemeralId;
- (BOOL)hasSecondsSinceEphemeralIdCreation;
- (BOOL)hasUserEphemeralId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaDIMEphemeralIdentifiers)initWithDictionary:(id)a3;
- (DIMSchemaDIMEphemeralIdentifiers)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)homeEphemeralId;
- (SISchemaUUID)userEphemeralId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)secondsSinceEphemeralIdCreation;
- (void)deleteHomeEphemeralId;
- (void)deleteSecondsSinceEphemeralIdCreation;
- (void)deleteUserEphemeralId;
- (void)setHasHomeEphemeralId:(BOOL)a3;
- (void)setHasSecondsSinceEphemeralIdCreation:(BOOL)a3;
- (void)setHasUserEphemeralId:(BOOL)a3;
- (void)setHomeEphemeralId:(id)a3;
- (void)setSecondsSinceEphemeralIdCreation:(unint64_t)a3;
- (void)setUserEphemeralId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaDIMEphemeralIdentifiers

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIMSchemaDIMEphemeralIdentifiers;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DIMSchemaDIMEphemeralIdentifiers *)self deleteUserEphemeralId];
  }
  v9 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DIMSchemaDIMEphemeralIdentifiers *)self deleteHomeEphemeralId];
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
  objc_storeStrong((id *)&self->_homeEphemeralId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
}

- (void)setHasHomeEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasUserEphemeralId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)secondsSinceEphemeralIdCreation
{
  return self->_secondsSinceEphemeralIdCreation;
}

- (void)setHomeEphemeralId:(id)a3
{
}

- (SISchemaUUID)homeEphemeralId
{
  return self->_homeEphemeralId;
}

- (void)setUserEphemeralId:(id)a3
{
}

- (SISchemaUUID)userEphemeralId
{
  return self->_userEphemeralId;
}

- (DIMSchemaDIMEphemeralIdentifiers)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIMSchemaDIMEphemeralIdentifiers;
  v5 = [(DIMSchemaDIMEphemeralIdentifiers *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DIMSchemaDIMEphemeralIdentifiers *)v5 setUserEphemeralId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"homeEphemeralId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(DIMSchemaDIMEphemeralIdentifiers *)v5 setHomeEphemeralId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"secondsSinceEphemeralIdCreation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMEphemeralIdentifiers setSecondsSinceEphemeralIdCreation:](v5, "setSecondsSinceEphemeralIdCreation:", [v10 unsignedLongLongValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (DIMSchemaDIMEphemeralIdentifiers)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaDIMEphemeralIdentifiers *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaDIMEphemeralIdentifiers *)self dictionaryRepresentation];
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
  if (self->_homeEphemeralId)
  {
    id v4 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"homeEphemeralId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"homeEphemeralId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DIMSchemaDIMEphemeralIdentifiers secondsSinceEphemeralIdCreation](self, "secondsSinceEphemeralIdCreation"));
    [v3 setObject:v7 forKeyedSubscript:@"secondsSinceEphemeralIdCreation"];
  }
  if (self->_userEphemeralId)
  {
    int v8 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"userEphemeralId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"userEphemeralId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_userEphemeralId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_homeEphemeralId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_secondsSinceEphemeralIdCreation;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
  v6 = [v4 userEphemeralId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
    v10 = [v4 userEphemeralId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
  v6 = [v4 homeEphemeralId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
    v15 = [v4 homeEphemeralId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (unint64_t secondsSinceEphemeralIdCreation = self->_secondsSinceEphemeralIdCreation,
          secondsSinceEphemeralIdCreation == [v4 secondsSinceEphemeralIdCreation]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];

  if (v4)
  {
    unint64_t v5 = [(DIMSchemaDIMEphemeralIdentifiers *)self userEphemeralId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];

  if (v6)
  {
    uint64_t v7 = [(DIMSchemaDIMEphemeralIdentifiers *)self homeEphemeralId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMEphemeralIdentifiersReadFrom(self, (uint64_t)a3);
}

- (void)deleteSecondsSinceEphemeralIdCreation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSecondsSinceEphemeralIdCreation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsSinceEphemeralIdCreation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSecondsSinceEphemeralIdCreation:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t secondsSinceEphemeralIdCreation = a3;
}

- (void)deleteHomeEphemeralId
{
}

- (BOOL)hasHomeEphemeralId
{
  return self->_homeEphemeralId != 0;
}

- (void)deleteUserEphemeralId
{
}

- (BOOL)hasUserEphemeralId
{
  return self->_userEphemeralId != 0;
}

@end